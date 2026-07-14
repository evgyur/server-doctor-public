from __future__ import annotations

import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCANNER = ROOT / "scripts" / "privacy_gate.py"


class PrivacyGateTests(unittest.TestCase):
    def run_gate(self, root: Path, *extra: str) -> subprocess.CompletedProcess[str]:
        return subprocess.run(
            [sys.executable, str(SCANNER), "--root", str(root), "--json", *extra],
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=False,
        )

    def test_clean_fixture_passes(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "SKILL.md").write_text("# Generic server operations\n", encoding="utf-8")
            result = self.run_gate(root)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            self.assertTrue(json.loads(result.stdout)["ok"])

    def test_git_filename_with_newline_is_not_split(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            subprocess.run(["git", "init", "-q"], cwd=root, check=True)
            unusual = root / "line\nbreak.md"
            unusual.write_text("public fixture\n", encoding="utf-8")
            subprocess.run(["git", "add", "--", unusual.name], cwd=root, check=True)
            result = self.run_gate(root)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            self.assertEqual(json.loads(result.stdout)["files_scanned"], 1)

    def test_git_ignored_file_is_outside_publishable_scope(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            subprocess.run(["git", "init", "-q"], cwd=root, check=True)
            (root / ".gitignore").write_text("*.local-secret\n", encoding="utf-8")
            ignored = root / "runtime.local-secret"
            ignored.write_text("-100" + "1234567890", encoding="utf-8")
            result = self.run_gate(root)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            self.assertIn("non-ignored publishable", json.loads(result.stdout)["scope"])

    def test_chat_id_and_operator_path_fail(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            chat_id = "-100" + "1234567890"
            operator_path = "/" + "home" + "/private-user/config.yaml"
            (root / "note.md").write_text(
                f"chat={chat_id}\npath={operator_path}\n",
                encoding="utf-8",
            )
            result = self.run_gate(root)
            self.assertEqual(result.returncode, 1)
            rules = {item["rule"] for item in json.loads(result.stdout)["findings"]}
            self.assertTrue({"telegram-chat-id", "operator-path"} <= rules)

    def test_nested_reference_directory_is_scanned(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            nested = root / "references" / "third-party" / "current"
            nested.mkdir(parents=True)
            chat_id = "-100" + "1234567890"
            (nested / "fixture.md").write_text(chat_id, encoding="utf-8")
            self.assertEqual(self.run_gate(root).returncode, 1)

    def test_private_marker_overlay_uses_synthetic_fixture(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            marker = "acme-internal-fleet"
            (root / "note.md").write_text(f"owner={marker}\n", encoding="utf-8")
            overlay = root.parent / f"{root.name}-markers.txt"
            overlay.write_text(f"# private local overlay\n{marker}\n", encoding="utf-8")
            try:
                result = self.run_gate(root, "--private-markers-file", str(overlay))
            finally:
                overlay.unlink(missing_ok=True)
            self.assertEqual(result.returncode, 1)
            payload = json.loads(result.stdout)
            self.assertEqual(payload["private_overlay_marker_count"], 1)
            self.assertEqual(payload["findings"][0]["rule"], "private-overlay-marker")

    def test_private_marker_in_publishable_filename_is_blocked_and_redacted(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            marker = "acme-private-fleet"
            subprocess.run(["git", "init", "-q"], cwd=root, check=True)
            marked_path = root / f"notes-{marker}.md"
            marked_path.write_text("generic content\n", encoding="utf-8")
            subprocess.run(["git", "add", "--", marked_path.name], cwd=root, check=True)
            overlay = root.parent / f"{root.name}-markers.txt"
            overlay.write_text(f"{marker}\n", encoding="utf-8")
            try:
                result = self.run_gate(root, "--private-markers-file", str(overlay))
            finally:
                overlay.unlink(missing_ok=True)
            self.assertEqual(result.returncode, 1)
            payload = json.loads(result.stdout)
            self.assertTrue(any(item["rule"] == "path-private-overlay-marker" for item in payload["findings"]))
            self.assertNotIn(marker, result.stdout.lower())
            self.assertTrue(all(item["path"] == "<redacted-sensitive-path>" for item in payload["findings"]))

    def test_prefixed_secret_names_and_secret_file_suffixes_fail(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            secret_name = "_".join(("OPENAI", "API", "KEY"))
            secret_value = "-".join(("live", "looking", "value"))
            (root / ".env.example").write_text(
                f"{secret_name}={secret_value}\n",
                encoding="utf-8",
            )
            private_key_header = " ".join(("-----BEGIN", "PRIVATE", "KEY-----"))
            (root / "identity.pem").write_text(
                f"{private_key_header}\nnot-real-material\n",
                encoding="utf-8",
            )
            result = self.run_gate(root)
            self.assertEqual(result.returncode, 1)
            rules = {item["rule"] for item in json.loads(result.stdout)["findings"]}
            self.assertTrue({"secret-assignment", "private-key"} <= rules)

    def test_test_prefix_does_not_exempt_secret_assignment(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            secret_name = "_".join(("TELEGRAM", "BOT", "TOKEN"))
            secret_value = "-".join(("test", "realistic", "value"))
            (root / "config.txt").write_text(
                f"{secret_name}={secret_value}\n",
                encoding="utf-8",
            )
            result = self.run_gate(root)
            self.assertEqual(result.returncode, 1)
            self.assertIn("secret-assignment", result.stdout)

    def test_symlink_target_is_scanned_without_following_it(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            operator_path = "/" + "home" + "/private-user/secret.txt"
            (root / "link.txt").symlink_to(operator_path)
            result = self.run_gate(root)
            self.assertEqual(result.returncode, 1)
            findings = json.loads(result.stdout)["findings"]
            self.assertTrue(any(item["rule"] == "operator-path" for item in findings))

    def test_terminal_operator_home_path_without_trailing_slash_fails(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            operator_home = "/" + "home" + "/private-user"
            (root / "note.md").write_text(operator_home, encoding="utf-8")
            result = self.run_gate(root)
            self.assertEqual(result.returncode, 1)
            self.assertIn("operator-path", result.stdout)

    def test_non_utf8_publishable_file_fails_closed(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / "opaque.bin").write_bytes(b"\xff\xfe\x00\x80")
            result = self.run_gate(root)
            self.assertEqual(result.returncode, 1)
            payload = json.loads(result.stdout)
            self.assertTrue(
                any(item["rule"] == "unreadable-publishable-file" for item in payload["findings"])
            )

    def test_real_email_and_non_documentation_ip_fail(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            email = "person" + "@" + "private.example"
            address = ".".join(("10", "2", "3", "4"))
            (root / "inventory.md").write_text(f"{email}\n{address}\n", encoding="utf-8")
            result = self.run_gate(root)
            self.assertEqual(result.returncode, 1)
            rules = {item["rule"] for item in json.loads(result.stdout)["findings"]}
            self.assertTrue({"email", "ipv4-address"} <= rules)

    def test_example_email_loopback_and_documentation_ip_pass(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            documentation_ip = ".".join(("192", "0", "2", "10"))
            (root / "examples.md").write_text(
                f"test@example.com\n127.0.0.1\n{documentation_ip}\n",
                encoding="utf-8",
            )
            self.assertEqual(self.run_gate(root).returncode, 0)


if __name__ == "__main__":
    unittest.main()
