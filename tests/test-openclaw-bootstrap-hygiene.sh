#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
helper="$repo_root/scripts/openclaw-bootstrap-hygiene.sh"

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

operator_root="$tmpdir/operator-workspace"
mkdir -p "$operator_root"

cat > "$operator_root/AGENTS.md" <<'EOF'
# AGENTS.md - Your Workspace

## Heartbeats - Be Proactive!

Read HEARTBEAT.md if it exists.

## /shaw Workflow Enforcement

Read a private workflow file.

## Gateway Restart Pre-flight Check

Restart carefully.
EOF

cat > "$operator_root/TOOLS.md" <<'EOF'
## Host-specific SSH / Runtime

- Host: `operator@example-host`
- Пароль fallback: `example-password`

## SKILLS Yellow Pages

- `$WORKSPACE_ROOT/SKILLS.md`

## Workflow Enforcement Tools

- `$WORKSPACE_ROOT/workflow-circuit-breakers.md`

## Project-specific Video Pipeline

Use a project-only command.
EOF

bash "$helper" --dry-run-local --root "$operator_root" > "$tmpdir/operator-dry-run.json"

python3 - "$tmpdir/operator-dry-run.json" <<'PY'
import json
import sys

report = json.load(open(sys.argv[1], encoding="utf-8"))
assert report["status"] == "drift", report
assert report["agentsNeedsRewrite"] is True, report
assert report["toolsNeedsRewrite"] is True, report
assert "Heartbeats - Be Proactive!" in report["agentsForbiddenHits"], report
assert "Gateway Restart Pre-flight Check" in report["agentsForbiddenHits"], report
assert "Workflow Enforcement Tools" in report["toolsForbiddenHits"], report
PY

bash "$helper" --apply-local --root "$operator_root" > "$tmpdir/operator-apply.json"

python3 - "$operator_root" "$tmpdir/operator-apply.json" <<'PY'
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
assert "Gateway Restart Pre-flight Check" not in agents, agents
assert "Workflow Enforcement Tools" not in tools, tools
assert "Use server-doctor owned runbooks" in agents, agents
assert "safe relative workspace path like `MEDIA:./out/file.pdf`" in agents, agents
assert "private overlay" in tools, tools
assert "Health-check a dependency" in tools, tools
assert "MEDIA:./relative/path/to/file.pdf" in tools, tools
assert len(agents) < 1800, len(agents)
assert len(tools) < 1200, len(tools)
PY

bash "$helper" --validate-local --root "$operator_root" > "$tmpdir/operator-validate.json"

python3 - "$tmpdir/operator-validate.json" <<'PY'
import json
import sys

report = json.load(open(sys.argv[1], encoding="utf-8"))
assert report["status"] == "ok", report
assert report["agentsNeedsRewrite"] is False, report
assert report["toolsNeedsRewrite"] is False, report
PY

echo "ok operator"

agent_root="$tmpdir/user-home/.openclaw/workspace"
mkdir -p "$agent_root"

cat > "$agent_root/AGENTS.md" <<'EOF'
# AGENTS.md - Your Workspace

## Runtime Guardrails

- Do not edit runtime config without approval.

## LOCAL CHAT ROUTE POLICY

Use only one local route.

## BROWSER POLICY (MANDATORY)

Use one browser implementation.
EOF

cat > "$agent_root/TOOLS.md" <<'EOF'
# TOOLS.md - Local Notes

Incomplete local notes.
EOF

bash "$helper" --dry-run-local --root "$agent_root" > "$tmpdir/agent-dry-run.json"
bash "$helper" --apply-local --root "$agent_root" > "$tmpdir/agent-apply.json"
bash "$helper" --validate-local --root "$agent_root" > "$tmpdir/agent-validate.json"

python3 - "$agent_root" "$tmpdir/agent-apply.json" "$tmpdir/agent-validate.json" <<'PY'
import json
import pathlib
import sys

root = pathlib.Path(sys.argv[1])
apply_report = json.load(open(sys.argv[2], encoding="utf-8"))
validate_report = json.load(open(sys.argv[3], encoding="utf-8"))
assert apply_report["status"] == "updated", apply_report
assert validate_report["status"] == "ok", validate_report

agents = (root / "AGENTS.md").read_text(encoding="utf-8")
tools = (root / "TOOLS.md").read_text(encoding="utf-8")
assert "Runtime Guardrails" in agents, agents
assert "safe relative `MEDIA:` path" in agents, agents
assert "LOCAL CHAT ROUTE POLICY" not in agents, agents
assert "BROWSER POLICY" not in agents, agents
assert "Local Notes" in tools, tools
assert "What Goes Here" in tools, tools
assert "MEDIA:./relative/path/to/file.pdf" in tools, tools
assert "Do not use absolute `MEDIA:/...` paths" in tools, tools
PY

echo "ok agent"

if bash "$helper" --dry-run --host '-oProxyCommand=unexpected' --workspace-root /tmp >/dev/null 2>&1; then
  echo "expected option-shaped host rejection" >&2
  exit 1
fi

echo "ok host-validation"

duplicate_root="$tmpdir/duplicate-root"
mkdir -p "$duplicate_root"
printf 'ORIGINAL DRIFT\n' > "$duplicate_root/AGENTS.md"
printf 'ORIGINAL TOOLS DRIFT\n' > "$duplicate_root/TOOLS.md"
bash "$helper" --apply-local --root "$duplicate_root" --root "$duplicate_root" > "$tmpdir/duplicate-apply.json"

python3 - "$tmpdir/duplicate-apply.json" <<'PY'
import json
import pathlib
import sys

report = json.load(open(sys.argv[1], encoding="utf-8"))
assert len(report["roots"]) == 1, report
backup = pathlib.Path(report["roots"][0]["backupDir"])
assert "ORIGINAL DRIFT" in (backup / "AGENTS.md.bak").read_text(encoding="utf-8")
assert "ORIGINAL TOOLS DRIFT" in (backup / "TOOLS.md.bak").read_text(encoding="utf-8")
PY

echo "ok duplicate-root"
