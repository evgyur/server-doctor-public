from __future__ import annotations

import re
import subprocess
import sys
import unittest
from pathlib import Path
from urllib.parse import unquote

ROOT = Path(__file__).resolve().parents[1]


class PublicHygieneTests(unittest.TestCase):
    def test_authored_layer_privacy_gate(self) -> None:
        result = subprocess.run(
            [sys.executable, str(ROOT / "scripts" / "privacy_gate.py"), "--root", str(ROOT)],
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=False,
        )
        self.assertEqual(result.returncode, 0, result.stdout + result.stderr)

    def test_public_package_has_no_private_submodule_contract(self) -> None:
        self.assertFalse((ROOT / ".gitmodules").exists())

    def test_skill_frontmatter_and_public_assets(self) -> None:
        skill = (ROOT / "SKILL.md").read_text(encoding="utf-8")
        self.assertTrue(skill.startswith("---\n"))
        self.assertRegex(skill, r"(?m)^name:\s*server-doctor\s*$")
        description = re.search(r"(?m)^description:\s*(.+)$", skill)
        self.assertIsNotNone(description)
        self.assertLessEqual(len(description.group(1)), 1024)
        for relative in (
            "references/hermes-agent-operations.md",
            "references/hermes-fork-update-workflow.md",
            "references/hermes-telegram-delivery-regressions.md",
            "incidents/patterns/auth-store-permission-mismatch.md",
            "incidents/patterns/partial-module-extraction-after-merge.md",
            "scripts/hermes-fork-update.py",
            "scripts/privacy_gate.py",
        ):
            self.assertTrue((ROOT / relative).is_file(), relative)
            self.assertIn(relative, skill)

    def test_relative_markdown_links_resolve(self) -> None:
        tracked = subprocess.run(
            ["git", "ls-files", "*.md"],
            cwd=ROOT,
            text=True,
            capture_output=True,
            check=False,
        )
        markdown_files = (
            [ROOT / relative for relative in tracked.stdout.splitlines()]
            if tracked.returncode == 0
            else sorted(ROOT.rglob("*.md"))
        )
        link_re = re.compile(r"\[[^\]]*\]\(([^)]+)\)")
        missing: list[str] = []
        for source in markdown_files:
            relative = source.relative_to(ROOT)
            text = source.read_text(encoding="utf-8")
            for raw_target in link_re.findall(text):
                target = raw_target.strip().split()[0].strip("<>")
                if target.startswith(("http://", "https://", "mailto:", "#")):
                    continue
                clean = unquote(target.split("#", 1)[0])
                if clean and not (source.parent / clean).resolve().exists():
                    missing.append(f"{relative} -> {target}")
        self.assertEqual(missing, [])


if __name__ == "__main__":
    unittest.main()
