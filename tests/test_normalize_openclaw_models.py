import importlib.util
import json
import tempfile
import unittest
from pathlib import Path


SCRIPT = (
    Path(__file__).resolve().parents[1]
    / "scripts"
    / "normalize-openclaw-models.py"
)


def load_module():
    spec = importlib.util.spec_from_file_location(
        "normalize_openclaw_models",
        SCRIPT,
    )
    module = importlib.util.module_from_spec(spec)
    assert spec.loader is not None
    spec.loader.exec_module(module)
    return module


class NormalizeOpenClawModelsTests(unittest.TestCase):
    def setUp(self):
        self.module = load_module()

    def test_normalizes_defaults_and_selected_agents(self):
        payload = {
            "agents": {
                "defaults": {
                    "model": {
                        "primary": "openai-codex/gpt-5.3-codex",
                        "fallbacks": ["minimax/MiniMax-M2.7-highspeed"],
                    },
                    "models": {
                        "openai-codex/gpt-5.3-codex": {"alias": "codex"},
                        "minimax/MiniMax-M2.7-highspeed": {"alias": "mmfast"},
                    },
                },
                "list": [
                    {"id": "main"},
                    {"id": "ops", "model": "openai-codex/gpt-5.3-codex"},
                    {"id": "digest", "model": "minimax/MiniMax-M2.7-highspeed"},
                    {"id": "lab", "model": "anthropic/claude-opus-4-6"},
                ],
            }
        }

        changed = self.module.normalize_config(
            payload,
            primary="openai-codex/gpt-5.4",
            fallbacks=["minimax/MiniMax-M2.7-highspeed"],
            alias="gptt",
            agent_ids={"ops", "digest"},
        )

        self.assertTrue(changed)
        defaults = payload["agents"]["defaults"]
        self.assertEqual(defaults["model"]["primary"], "openai-codex/gpt-5.4")
        self.assertEqual(
            defaults["model"]["fallbacks"],
            ["minimax/MiniMax-M2.7-highspeed"],
        )
        self.assertEqual(defaults["models"]["openai-codex/gpt-5.4"]["alias"], "gptt")

        models_by_id = {
            agent["id"]: agent.get("model")
            for agent in payload["agents"]["list"]
        }
        self.assertIsNone(models_by_id["main"])
        self.assertEqual(models_by_id["ops"], "openai-codex/gpt-5.4")
        self.assertEqual(models_by_id["digest"], "openai-codex/gpt-5.4")
        self.assertEqual(models_by_id["lab"], "anthropic/claude-opus-4-6")

    def test_cli_updates_file_and_prints_changed(self):
        payload = {
            "agents": {
                "defaults": {
                    "model": {
                        "primary": "openai-codex/gpt-5.3-codex",
                        "fallbacks": ["minimax/MiniMax-M2.7-highspeed"],
                    }
                },
                "list": [
                    {"id": "digest", "model": "minimax/MiniMax-M2.7-highspeed"}
                ],
            }
        }

        with tempfile.TemporaryDirectory() as tmp_dir:
            config_path = Path(tmp_dir) / "openclaw.json"
            config_path.write_text(
                json.dumps(payload, ensure_ascii=False, indent=2) + "\n",
                encoding="utf-8",
            )

            status = self.module.run(
                config_path,
                primary="openai-codex/gpt-5.4",
                fallbacks=["minimax/MiniMax-M2.7-highspeed"],
                alias="gptt",
                agent_ids={"digest"},
                dry_run=False,
            )
            updated = json.loads(config_path.read_text(encoding="utf-8"))

        self.assertEqual(status, "changed")
        self.assertEqual(
            updated["agents"]["defaults"]["model"]["primary"],
            "openai-codex/gpt-5.4",
        )
        self.assertEqual(
            updated["agents"]["list"][0]["model"],
            "openai-codex/gpt-5.4",
        )


if __name__ == "__main__":
    unittest.main()
