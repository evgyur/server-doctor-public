from __future__ import annotations

import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts" / "check-public-safety.py"


class PublicSafetyScannerTests(unittest.TestCase):
    def run_scan(self, text: str) -> subprocess.CompletedProcess[str]:
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "fixture.md"
            path.write_text(text, encoding="utf-8")
            return subprocess.run(
                ["python3", str(SCRIPT), "--paths", str(path)],
                cwd=ROOT,
                text=True,
                capture_output=True,
                check=False,
            )

    def test_clean_placeholders_pass(self) -> None:
        proc = self.run_scan(
            "Host: <host>\nUser: <runtime-user>\nToken: <redacted>\n"
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
