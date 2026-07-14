from __future__ import annotations

import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts" / "check-public-safety.py"


class PublicSafetyScannerTests(unittest.TestCase):
    def run_scan(self, text: str, filename: str = "fixture.md") -> subprocess.CompletedProcess[str]:
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / filename
            path.write_text(text, encoding="utf-8")
            return subprocess.run(
                ["python3", str(SCRIPT), "--paths", str(path)],
                cwd=ROOT,
                text=True,
                capture_output=True,
                check=False,
            )

    def run_scan_bytes(self, content: bytes) -> subprocess.CompletedProcess[str]:
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "fixture.bin"
            path.write_bytes(content)
            return subprocess.run(
                ["python3", str(SCRIPT), "--paths", str(path)],
                cwd=ROOT,
                text=True,
                capture_output=True,
                check=False,
            )

    def test_clean_placeholders_pass(self) -> None:
        proc = self.run_scan(
            "Host: <host>\nUser: <runtime-user>\nHome: `/home/<runtime-user>`\nToken: <redacted>\n"
            "Health: http://127.0.0.1:<port>/health\n"
        )
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
        self.assertIn("public-safety: PASS", proc.stdout)

    def test_private_shaped_values_fail_without_echoing_values(self) -> None:
        sensitive = "secret-owner" + "@" + "private.invalid"
        proc = self.run_scan(f"Owner: {sensitive}\n")
        self.assertNotEqual(proc.returncode, 0)
        self.assertIn("blocked by email-address", proc.stdout)
        self.assertNotIn(sensitive, proc.stdout)
        self.assertIn("values suppressed", proc.stdout)

    def test_chat_ids_and_private_paths_fail(self) -> None:
        chat_id = "-100" + "9876543210"
        private_path = "/" + "home" + "/operator/private/config.yaml"
        proc = self.run_scan(f"Chat: {chat_id}\nPath: {private_path}\n")
        self.assertNotEqual(proc.returncode, 0)
        self.assertIn("blocked by telegram-chat-id", proc.stdout)
        self.assertIn("blocked by absolute-user-home", proc.stdout)


    def test_every_ipv4_match_is_checked(self) -> None:
        private_ip = "10." + "23.45.67"
        proc = self.run_scan(f"Loopback: 127.0.0.1; target: {private_ip}\n")
        self.assertNotEqual(proc.returncode, 0)
        self.assertIn("blocked by ipv4-address", proc.stdout)
        self.assertNotIn(private_ip, proc.stdout)

    def test_home_without_trailing_slash_and_root_path_fail(self) -> None:
        home = "/" + "home" + "/privateoperator"
        root_path = "/" + "root" + "/private/config"
        proc = self.run_scan(f"Home: {home}\nRoot: {root_path}\n")
        self.assertNotEqual(proc.returncode, 0)
        self.assertGreaterEqual(proc.stdout.count("blocked by absolute-user-home"), 2)

    def test_sensitive_email_in_tracked_path_shape_fails(self) -> None:
        sensitive_name = "owner" + "@" + "private.invalid.md"
        proc = self.run_scan("portable content\n", filename=sensitive_name)
        self.assertNotEqual(proc.returncode, 0)
        self.assertIn("blocked by tracked-path-email-address", proc.stdout)
        self.assertNotIn(sensitive_name, proc.stdout)

    def test_non_utf8_input_fails_closed(self) -> None:
        proc = self.run_scan_bytes(b"\xff\xfe\x00")
        self.assertNotEqual(proc.returncode, 0)
        self.assertIn("blocked by unreadable-or-non-utf8-file", proc.stdout)

    def test_staged_binary_file_fails_closed(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            repo = Path(tmp)
            scripts = repo / "scripts"
            scripts.mkdir()
            scanner = scripts / "check-public-safety.py"
            shutil.copy2(SCRIPT, scanner)
            subprocess.run(["git", "init", "-q"], cwd=repo, check=True)
            binary = repo / "artifact.bin"
            binary.write_bytes(b"\xff\xfe\x00")
            subprocess.run(["git", "add", "artifact.bin"], cwd=repo, check=True)
            binary.write_text("working tree is text now\n", encoding="utf-8")
            proc = subprocess.run(
                ["python3", str(scanner), "--staged"],
                cwd=repo,
                text=True,
                capture_output=True,
                check=False,
            )
        self.assertNotEqual(proc.returncode, 0)
        self.assertIn("blocked by unreadable-or-non-utf8-file", proc.stdout)

    def test_staged_rename_checks_destination_path_without_content_change(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            repo = Path(tmp)
            scripts = repo / "scripts"
            scripts.mkdir()
            scanner = scripts / "check-public-safety.py"
            shutil.copy2(SCRIPT, scanner)
            subprocess.run(["git", "init", "-q"], cwd=repo, check=True)
            subprocess.run(["git", "config", "user.email", "test@example.com"], cwd=repo, check=True)
            subprocess.run(["git", "config", "user.name", "Test"], cwd=repo, check=True)
            source = repo / "portable.md"
            source.write_text("portable content\n", encoding="utf-8")
            subprocess.run(["git", "add", "portable.md"], cwd=repo, check=True)
            subprocess.run(["git", "commit", "-qm", "base"], cwd=repo, check=True)
            sensitive_name = "owner" + "@" + "private.invalid.md"
            subprocess.run(["git", "mv", "portable.md", sensitive_name], cwd=repo, check=True)
            proc = subprocess.run(
                ["python3", str(scanner), "--staged"],
                cwd=repo,
                text=True,
                capture_output=True,
                check=False,
            )
        self.assertNotEqual(proc.returncode, 0)
        self.assertIn("blocked by tracked-path-email-address", proc.stdout)
        self.assertNotIn(sensitive_name, proc.stdout)

    def test_sensitive_non_utf8_path_is_suppressed_for_every_finding(self) -> None:
        sensitive_name = "owner" + "@" + "private.invalid.bin"
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / sensitive_name
            path.write_bytes(b"\xff\xfe\x00")
            proc = subprocess.run(
                ["python3", str(SCRIPT), "--paths", str(path)],
                cwd=ROOT,
                text=True,
                capture_output=True,
                check=False,
            )
        self.assertNotEqual(proc.returncode, 0)
        self.assertIn("blocked by tracked-path-email-address", proc.stdout)
        self.assertIn("blocked by unreadable-or-non-utf8-file", proc.stdout)
        self.assertNotIn(sensitive_name, proc.stdout)

    def test_tracked_authored_tree_passes(self) -> None:
        proc = subprocess.run(
            ["python3", str(SCRIPT), "--authored"],
            cwd=ROOT,
            text=True,
            capture_output=True,
            check=False,
        )
        self.assertEqual(proc.returncode, 0, proc.stdout + proc.stderr)
        self.assertIn("authored tree", proc.stdout)


if __name__ == "__main__":
    unittest.main()
