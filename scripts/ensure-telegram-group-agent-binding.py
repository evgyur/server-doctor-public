#!/usr/bin/env python3
"""Public-safe helper: ensure one Telegram group routes to one OpenClaw agent/skill.

This script is intentionally parameterized. Do not hard-code private chat ids,
usernames, paths, or workflow prompts in the public repo.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from tempfile import NamedTemporaryFile
from typing import Any


def ensure_list_contains(value: Any, item: str) -> tuple[list[str], bool]:
    if not isinstance(value, list):
        return [item], True
    result = [str(v) for v in value]
    if item in result:
        return result, False
    result.append(item)
    return result, True


def routing_guard(agent_id: str, skill_id: str, skill_source: str) -> str:
    return (
        f"CANONICAL SKILL ROUTING: this Telegram group must route through "
        f"agent `{agent_id}` with skill `{skill_id}`. The canonical procedural "
        f"source of truth is `{skill_source}`. Keep this prompt as a short "
        f"routing guard only; do not duplicate or override the skill workflow here."
    )


def normalize_config(data: dict[str, Any], args: argparse.Namespace) -> bool:
    changed = False

    agents = data.setdefault("agents", {})
    if not isinstance(agents, dict):
        data["agents"] = agents = {}
        changed = True

    agent_list = agents.setdefault("list", [])
    if not isinstance(agent_list, list):
        agents["list"] = agent_list = []
        changed = True

    target_agent = None
    for agent in agent_list:
        if isinstance(agent, dict) and agent.get("id") == args.agent_id:
            target_agent = agent
            break

    if target_agent is None:
        target_agent = {
            "id": args.agent_id,
            "name": args.agent_name,
            "workspace": args.agent_workspace,
            "skills": [args.skill_id],
        }
        agent_list.append(target_agent)
        changed = True
    else:
        if args.agent_name and target_agent.get("name") != args.agent_name:
            target_agent["name"] = args.agent_name
            changed = True
        if args.agent_workspace and target_agent.get("workspace") != args.agent_workspace:
            target_agent["workspace"] = args.agent_workspace
            changed = True
        skills, skills_changed = ensure_list_contains(target_agent.get("skills"), args.skill_id)
        if skills_changed:
            target_agent["skills"] = skills
            changed = True

    bindings = data.setdefault("bindings", [])
    if not isinstance(bindings, list):
        data["bindings"] = bindings = []
        changed = True

    has_binding = any(
        isinstance(binding, dict)
        and binding.get("agentId") == args.agent_id
        and isinstance(binding.get("match"), dict)
        and binding["match"].get("channel") == "telegram"
        and isinstance(binding["match"].get("peer"), dict)
        and binding["match"]["peer"].get("kind") == "group"
        and str(binding["match"]["peer"].get("id")) == args.chat_id
        for binding in bindings
    )
    if not has_binding:
        bindings.append(
            {
                "agentId": args.agent_id,
                "match": {
                    "channel": "telegram",
                    "peer": {"kind": "group", "id": args.chat_id},
                },
            }
        )
        changed = True

    channels = data.setdefault("channels", {})
    if not isinstance(channels, dict):
        data["channels"] = channels = {}
        changed = True
    telegram = channels.setdefault("telegram", {})
    if not isinstance(telegram, dict):
        channels["telegram"] = telegram = {}
        changed = True
    groups = telegram.setdefault("groups", {})
    if not isinstance(groups, dict):
        telegram["groups"] = groups = {}
        changed = True
    group_cfg = groups.setdefault(args.chat_id, {})
    if not isinstance(group_cfg, dict):
        groups[args.chat_id] = group_cfg = {}
        changed = True

    if group_cfg.get("enabled") is not True:
        group_cfg["enabled"] = True
        changed = True
    if args.no_require_mention and group_cfg.get("requireMention") is not False:
        group_cfg["requireMention"] = False
        changed = True
    group_skills, group_skills_changed = ensure_list_contains(group_cfg.get("skills"), args.skill_id)
    if group_skills_changed:
        group_cfg["skills"] = group_skills
        changed = True

    wanted_prompt = routing_guard(args.agent_id, args.skill_id, args.skill_source)
    prompt = group_cfg.get("systemPrompt")
    marker = "CANONICAL SKILL ROUTING"
    if args.rewrite_prompt and (not isinstance(prompt, str) or marker not in prompt or args.skill_source not in prompt):
        group_cfg["systemPrompt"] = wanted_prompt
        changed = True

    return changed


def write_json_atomic(path: Path, data: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with NamedTemporaryFile("w", encoding="utf-8", dir=path.parent, delete=False) as tmp_file:
        json.dump(data, tmp_file, ensure_ascii=False, indent=2)
        tmp_file.write("\n")
        tmp_path = Path(tmp_file.name)
    tmp_path.replace(path)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--config", type=Path, default=Path.home() / ".openclaw" / "openclaw.json")
    parser.add_argument("--chat-id", required=True, help="Telegram group chat id, e.g. -100...")
    parser.add_argument("--agent-id", required=True)
    parser.add_argument("--skill-id", required=True)
    parser.add_argument("--agent-name", default="")
    parser.add_argument("--agent-workspace", default="")
    parser.add_argument("--skill-source", required=True, help="Canonical skill path or public docs location")
    parser.add_argument("--no-require-mention", action="store_true", help="Set group requireMention=false")
    parser.add_argument("--rewrite-prompt", action="store_true", help="Install a short routing-only system prompt if missing/drifted")
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    data = json.loads(args.config.read_text(encoding="utf-8"))
    changed = normalize_config(data, args)
    if changed and not args.dry_run:
        write_json_atomic(args.config, data)
    print("changed" if changed else "unchanged")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
