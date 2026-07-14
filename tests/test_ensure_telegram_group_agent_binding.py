import json
import subprocess
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "scripts" / "ensure-telegram-group-agent-binding.py"
SYNTHETIC_CHAT_ID = "-100" + "1234567890"


class EnsureTelegramGroupAgentBindingTest(unittest.TestCase):
    def run_script(self, config: Path, *extra: str) -> subprocess.CompletedProcess[str]:
        return subprocess.run(
            [
                "python3",
                str(SCRIPT),
                "--config",
                str(config),
                "--chat-id",
                SYNTHETIC_CHAT_ID,
                "--agent-id",
                "tg-agent",
                "--skill-id",
                "tg-skill",
                "--agent-name",
                "TG Agent",
                "--agent-workspace",
                "/workspace/tg-agent",
                "--skill-source",
                "/skills/example/tg/SKILL.md",
                *extra,
            ],
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=True,
        )

    def test_dry_run_does_not_write(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "openclaw.json"
            path.write_text("{}\n", encoding="utf-8")
            result = self.run_script(path, "--dry-run", "--rewrite-prompt", "--no-require-mention")
            self.assertEqual(result.stdout.strip(), "changed")
            self.assertEqual(json.loads(path.read_text(encoding="utf-8")), {})

    def test_apply_adds_binding_agent_and_group_config(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = Path(tmp) / "openclaw.json"
            path.write_text("{}\n", encoding="utf-8")
            result = self.run_script(path, "--rewrite-prompt", "--no-require-mention")
            self.assertEqual(result.stdout.strip(), "changed")
            data = json.loads(path.read_text(encoding="utf-8"))
            self.assertEqual(data["agents"]["list"][0]["id"], "tg-agent")
            self.assertEqual(data["bindings"][0]["agentId"], "tg-agent")
            group = data["channels"]["telegram"]["groups"][SYNTHETIC_CHAT_ID]
            self.assertTrue(group["enabled"])
            self.assertFalse(group["requireMention"])
            self.assertIn("tg-skill", group["skills"])
            self.assertIn("CANONICAL SKILL ROUTING", group["systemPrompt"])
            self.assertIn("/skills/example/tg/SKILL.md", group["systemPrompt"])

            again = self.run_script(path, "--rewrite-prompt", "--no-require-mention")
            self.assertEqual(again.stdout.strip(), "unchanged")


if __name__ == "__main__":
    unittest.main()
