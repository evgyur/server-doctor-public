#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
helper="$repo_root/scripts/openclaw-auth-profile-sync.sh"
profile_id="openai-codex:default"

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

state_root="$tmpdir/.openclaw"
mkdir -p \
  "$state_root/agents/main/agent" \
  "$state_root/agents/ops/agent" \
  "$state_root/agents/task/agent"

cat > "$state_root/agents/main/agent/auth-profiles.json" <<'EOF'
{
  "version": 1,
  "profiles": {
    "openai-codex:default": {
      "type": "oauth",
      "provider": "openai-codex",
      "access": "stale-access",
      "refresh": "stale-refresh",
      "accountId": "acct"
    }
  },
  "usageStats": {
    "openai-codex:default": {
      "lastUsed": 1773852019468,
      "errorCount": 1,
      "lastFailureAt": 1774010654054,
      "failureCounts": {
        "auth": 1
      },
      "cooldownUntil": 1774010714054
    }
  }
}
EOF

cat > "$state_root/agents/ops/agent/auth-profiles.json" <<'EOF'
{
  "version": 1,
  "profiles": {
    "openai-codex:default": {
      "type": "oauth",
      "provider": "openai-codex",
      "access": "fresh-access",
      "refresh": "fresh-refresh",
      "expires": 1774811864918,
      "accountId": "acct"
    }
  },
  "usageStats": {
    "openai-codex:default": {
      "lastUsed": 1774011436449,
      "errorCount": 0,
      "lastFailureAt": 1773947092685
    }
  }
}
EOF

cat > "$state_root/agents/task/agent/auth-profiles.json" <<'EOF'
{
  "version": 1,
  "profiles": {
    "openai-codex:default": {
      "type": "oauth",
      "provider": "openai-codex",
      "access": "stale-access",
      "refresh": "stale-refresh",
      "accountId": "acct"
    }
  },
  "usageStats": {
    "openai-codex:default": {
      "lastUsed": 1773846011004,
      "errorCount": 1,
      "lastFailureAt": 1774009721528,
      "failureCounts": {
        "auth": 1
      },
      "cooldownUntil": 1774009781528
    }
  }
}
EOF

"$helper" --dry-run-local --root "$state_root" --profile-id "$profile_id" > "$tmpdir/dry-run.json"

python3 - "$tmpdir/dry-run.json" <<'PY'
import json
import sys

report = json.load(open(sys.argv[1], encoding="utf-8"))
assert report["status"] == "drift", report
assert report["canonicalAgent"] == "ops", report
assert sorted(report["agentsNeedingSync"]) == ["main", "task"], report
assert report["uniqueProfileCount"] == 2, report
PY

"$helper" --apply-local --root "$state_root" --profile-id "$profile_id" > "$tmpdir/apply.json"

python3 - "$state_root" "$tmpdir/apply.json" <<'PY'
import json
import pathlib
import sys

state_root = pathlib.Path(sys.argv[1])
report = json.load(open(sys.argv[2], encoding="utf-8"))
assert report["status"] == "updated", report
assert sorted(report["updatedAgents"]) == ["main", "task"], report
backup_dir = pathlib.Path(report["backupDir"])
assert backup_dir.is_dir(), report
assert (backup_dir / "main.auth-profiles.json.bak").exists(), report
assert (backup_dir / "task.auth-profiles.json.bak").exists(), report

def load(agent):
    return json.loads((state_root / "agents" / agent / "agent" / "auth-profiles.json").read_text(encoding="utf-8"))

main = load("main")
ops = load("ops")
task = load("task")

for agent in (main, ops, task):
    profile = agent["profiles"]["openai-codex:default"]
    assert profile["access"] == "fresh-access", profile
    assert profile["refresh"] == "fresh-refresh", profile
    assert profile["expires"] == 1774811864918, profile

for agent in (main, task):
    stats = agent["usageStats"]["openai-codex:default"]
    assert stats["errorCount"] == 0, stats
    assert "cooldownUntil" not in stats, stats
    assert "disabledUntil" not in stats, stats
    assert "disabledReason" not in stats, stats
    assert stats.get("failureCounts", {}) == {}, stats
PY

"$helper" --validate-local --root "$state_root" --profile-id "$profile_id" > "$tmpdir/validate.json"

python3 - "$tmpdir/validate.json" <<'PY'
import json
import sys

report = json.load(open(sys.argv[1], encoding="utf-8"))
assert report["status"] == "ok", report
assert report["uniqueProfileCount"] == 1, report
PY

echo "ok"
