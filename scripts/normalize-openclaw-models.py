#!/usr/bin/env python3
"""Normalize OpenClaw model defaults and optional per-agent bindings."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from tempfile import NamedTemporaryFile


def normalize_config(
    data: dict,
    *,
    primary: str,
    fallbacks: list[str],
    alias: str | None,
    agent_ids: set[str],
) -> bool:
    agents = data.setdefault("agents", {})
    defaults = agents.setdefault("defaults", {})
    changed = False

    model_cfg = defaults.setdefault("model", {})
    if model_cfg.get("primary") != primary:
        model_cfg["primary"] = primary
        changed = True
    if model_cfg.get("fallbacks") != fallbacks:
        model_cfg["fallbacks"] = list(fallbacks)
        changed = True

    if alias:
        models_cfg = defaults.setdefault("models", {})
        target_entry = models_cfg.setdefault(primary, {})
        if target_entry.get("alias") != alias:
            target_entry["alias"] = alias
            changed = True

    for agent in agents.get("list", []):
        if not isinstance(agent, dict):
            continue
        agent_id = agent.get("id")
        if agent_id not in agent_ids:
            continue
        if agent.get("model") != primary:
            agent["model"] = primary
            changed = True

    return changed


def write_json_atomic(path: Path, data: dict) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with NamedTemporaryFile(
        "w",
        encoding="utf-8",
        dir=path.parent,
        delete=False,
    ) as tmp_file:
        json.dump(data, tmp_file, ensure_ascii=False, indent=2)
        tmp_file.write("\n")
        tmp_path = Path(tmp_file.name)
    tmp_path.replace(path)


def run(
    config_path: Path,
    *,
    primary: str,
    fallbacks: list[str],
    alias: str | None,
    agent_ids: set[str],
    dry_run: bool,
) -> str:
    data = json.loads(config_path.read_text(encoding="utf-8"))
    changed = normalize_config(
        data,
        primary=primary,
        fallbacks=fallbacks,
        alias=alias,
        agent_ids=agent_ids,
    )
    if changed and not dry_run:
        write_json_atomic(config_path, data)
    return "changed" if changed else "unchanged"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "config_path",
        type=Path,
        nargs="?",
        default=Path.home() / ".openclaw" / "openclaw.json",
    )
    parser.add_argument(
        "--primary",
        required=True,
        help="Canonical primary model id to set under agents.defaults.model.primary.",
    )
    parser.add_argument(
        "--fallback",
        dest="fallbacks",
        action="append",
        default=[],
        help="Fallback model id. Repeat to set multiple fallbacks.",
    )
    parser.add_argument(
        "--alias",
        help="Optional alias to assign to the primary model entry.",
    )
    parser.add_argument(
        "--agent-id",
        dest="agent_ids",
        action="append",
        default=[],
        help="Agent id to pin to the primary model. Repeat for multiple agents.",
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Report whether a change would be made without writing the file.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    print(
        run(
            args.config_path,
            primary=args.primary,
            fallbacks=list(args.fallbacks),
            alias=args.alias,
            agent_ids=set(args.agent_ids),
            dry_run=args.dry_run,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
