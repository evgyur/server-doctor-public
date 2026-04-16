#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
helper="$repo_root/scripts/openclaw-bootstrap-hygiene.sh"

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

workspace_root="$tmpdir/workspace"
mkdir -p "$workspace_root"

cat > "$workspace_root/AGENTS.md" <<'EOF'
# AGENTS.md - Your Workspace

## Every Session

1. Read `SOUL.md`
2. Read `USER.md`
3. Read `memory/YYYY-MM-DD.md`
4. Read recent pending learnings
5. **If in MAIN SESSION** read `MEMORY.md`

## 💓 Heartbeats - Be Proactive!

Default heartbeat prompt:
`Read HEARTBEAT.md if it exists (workspace context). Follow it strictly.`

## ✅ UI/Frontend Prod Fix Checklist (mandatory)

Build, restart, verify runtime artifact.

## 🥷 /shaw Workflow Enforcement (MANDATORY)

Read `skills/secret/shaw/SKILL.md`.
Read `memory/workflows/config-changes.md`.

## 🎨 AGENTS.md — Правила генерации контента (из плана Человек 2.0)

Anti-slop and CTA rules live here.

## 🔄 Gateway Restart Pre-flight Check (incident 2026-03-03)

Run `openclaw gateway restart` carefully.
EOF

cat > "$workspace_root/TOOLS.md" <<'EOF'
## 🖥️ Mac mini (chip) — SSH / Runtime

- VPN (Amnezia): `ssh operator@example-host`
- Пароль fallback (если ключ не сработал): `placeholder-password`

## 📒 SKILLS Yellow Pages

- `/opt/clawd-workspace/SKILLS.md`

## 📎 Telegram Attachment SOP (Do not break)

Send via inbound path and confirm with edit.

## 🚫 Telethon Policy (MANDATORY)

Use only `telegram-chip`.

## 🔒 Workflow Enforcement Tools

read /opt/clawd-workspace/memory/workflows/workflow-circuit-breakers.md
python3 /opt/clawd-workspace/memory/workflows/workflow-check.py

## 🎬 Human20 Video Pipeline (WSL) — фиксированный формат

Use the fixed WSL command.

## ✅ Promise Tracker (anti-hang watchdog)

Use `task_promises.py`.
EOF

bash "$helper" --dry-run-local --root "$workspace_root" > "$tmpdir/dry-run.json"

python3 - "$tmpdir/dry-run.json" <<'PY'
import json
import sys

report = json.load(open(sys.argv[1], encoding="utf-8"))
assert report["status"] == "drift", report
assert report["agentsNeedsRewrite"] is True, report
assert report["toolsNeedsRewrite"] is True, report
assert "Heartbeats - Be Proactive!" in report["agentsForbiddenHits"], report
assert "Gateway Restart Pre-flight Check" in report["agentsForbiddenHits"], report
assert "Workflow Enforcement Tools" in report["toolsForbiddenHits"], report
assert "workflow-circuit-breakers.md" in report["toolsForbiddenHits"], report
PY

bash "$helper" --apply-local --root "$workspace_root" > "$tmpdir/apply.json"

python3 - "$workspace_root" "$tmpdir/apply.json" <<'PY'
import json
import pathlib
import sys

root = pathlib.Path(sys.argv[1])
report = json.load(open(sys.argv[2], encoding="utf-8"))
assert report["status"] == "updated", report
backup_dir = pathlib.Path(report["backupDir"])
assert backup_dir.is_dir(), report
assert (backup_dir / "AGENTS.md.bak").exists(), report
assert (backup_dir / "TOOLS.md.bak").exists(), report

agents = (root / "AGENTS.md").read_text(encoding="utf-8")
tools = (root / "TOOLS.md").read_text(encoding="utf-8")

assert "Heartbeats - Be Proactive!" not in agents, agents
assert "Правила генерации контента" not in agents, agents
assert "Gateway Restart Pre-flight Check" not in agents, agents
assert "workflow-circuit-breakers.md" not in agents, agents
assert "workflow-circuit-breakers.md" not in tools, tools
assert "Workflow Enforcement Tools" not in tools, tools
assert "Пароль fallback" not in tools, tools
assert "Use server-doctor" in agents, agents
assert "safe relative workspace path like `MEDIA:./out/file.pdf`" in agents, agents
assert "MEDIA:/absolute/path/..." in agents, agents
assert "Do not claim that chat attachment delivery is impossible" in agents, agents
assert "Use /opt/clawd-workspace/SKILLS.md" in tools, tools
assert "MEDIA:./relative/path/to/file.pdf" in tools, tools
assert "avoid `MEDIA:/absolute/path/...`" in tools, tools
assert len(agents) < 1800, len(agents)
assert len(tools) < 1600, len(tools)
PY

bash "$helper" --validate-local --root "$workspace_root" > "$tmpdir/validate.json"

python3 - "$tmpdir/validate.json" <<'PY'
import json
import sys

report = json.load(open(sys.argv[1], encoding="utf-8"))
assert report["status"] == "ok", report
assert report["agentsNeedsRewrite"] is False, report
assert report["toolsNeedsRewrite"] is False, report
PY

echo "ok"

mac_tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir" "$mac_tmpdir"' EXIT

mac_opt_root="$mac_tmpdir/opt/clawd-workspace"
mac_agent_root="$mac_tmpdir/Users/claw/.openclaw/workspace"
mkdir -p "$mac_opt_root" "$mac_agent_root"

cat > "$mac_opt_root/AGENTS.md" <<'EOF'
# AGENTS.md - Your Workspace

## 💓 Heartbeats - Be Proactive!

Read HEARTBEAT.md if it exists.

## Runtime Guardrails

- Do not edit runtime config without approval.

## 📒 SKILLS Yellow Pages

- /opt/clawd-workspace/SKILLS.md
EOF

cat > "$mac_opt_root/TOOLS.md" <<'EOF'
## 📒 SKILLS Yellow Pages

- /opt/clawd-workspace/SKILLS.md

## 🚫 TELEGRAM-CHIP POLICY (LOCAL ONLY)

Use only local telegram-chip.
EOF

cat > "$mac_agent_root/AGENTS.md" <<'EOF'
# AGENTS.md - Your Workspace

This folder is home. Treat it that way.

## Runtime Guardrails

- Do not edit runtime config without approval.

## 🚫 TELEGRAM-CHIP POLICY (LOCAL ONLY)

Use only local telegram-chip on Mac mini.

## 🚫 BROWSER POLICY (MANDATORY)

Use Chromium only.
EOF

cat > "$mac_agent_root/TOOLS.md" <<'EOF'
# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that’s unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Why Separate?

Skills are shared. Your setup is yours.
EOF

bash "$helper" --dry-run-local --root "$mac_opt_root" --root "$mac_agent_root" > "$mac_tmpdir/mac-dry-run.json"

python3 - "$mac_tmpdir/mac-dry-run.json" "$mac_opt_root" "$mac_agent_root" <<'PY'
import json
import sys

report = json.load(open(sys.argv[1], encoding="utf-8"))
opt_root = sys.argv[2]
agent_root = sys.argv[3]

assert report["status"] == "drift", report
assert len(report["roots"]) == 2, report

opt_report = next(item for item in report["roots"] if item["root"] == opt_root)
agent_report = next(item for item in report["roots"] if item["root"] == agent_root)

assert opt_report["agentsNeedsRewrite"] is True, opt_report
assert opt_report["toolsNeedsRewrite"] is True, opt_report
assert agent_report["agentsNeedsRewrite"] is True, agent_report
assert agent_report["toolsNeedsRewrite"] is True, agent_report
PY

bash "$helper" --apply-local --root "$mac_opt_root" --root "$mac_agent_root" > "$mac_tmpdir/mac-apply.json"

python3 - "$mac_tmpdir/mac-apply.json" "$mac_opt_root" "$mac_agent_root" <<'PY'
import json
import pathlib
import sys

report = json.load(open(sys.argv[1], encoding="utf-8"))
opt_root = pathlib.Path(sys.argv[2])
agent_root = pathlib.Path(sys.argv[3])

assert report["status"] == "updated", report
assert len(report["roots"]) == 2, report

opt_agents = (opt_root / "AGENTS.md").read_text(encoding="utf-8")
opt_tools = (opt_root / "TOOLS.md").read_text(encoding="utf-8")
agent_agents = (agent_root / "AGENTS.md").read_text(encoding="utf-8")
agent_tools = (agent_root / "TOOLS.md").read_text(encoding="utf-8")

assert "Use server-doctor owned runbooks" in opt_agents, opt_agents
assert "`telegram-chip` API base" in opt_tools, opt_tools
assert "TELEGRAM-CHIP POLICY" not in opt_tools, opt_tools

assert "Runtime Guardrails" in agent_agents, agent_agents
assert "safe relative `MEDIA:` path" in agent_agents, agent_agents
assert "TELEGRAM-CHIP POLICY" not in agent_agents, agent_agents
assert "BROWSER POLICY" not in agent_agents, agent_agents
assert "Local Notes" in agent_tools, agent_tools
assert "What Goes Here" in agent_tools, agent_tools
assert "MEDIA:./relative/path/to/file.pdf" in agent_tools, agent_tools
assert "Do not use absolute `MEDIA:/...` paths" in agent_tools, agent_tools
PY

bash "$helper" --validate-local --root "$mac_opt_root" --root "$mac_agent_root" > "$mac_tmpdir/mac-validate.json"

python3 - "$mac_tmpdir/mac-validate.json" <<'PY'
import json
import sys

report = json.load(open(sys.argv[1], encoding="utf-8"))
assert report["status"] == "ok", report
assert len(report["roots"]) == 2, report
for root_report in report["roots"]:
    assert root_report["agentsNeedsRewrite"] is False, root_report
    assert root_report["toolsNeedsRewrite"] is False, root_report
PY

echo "ok mac"
