#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  openclaw-auth-profile-sync.sh --dry-run --host <ssh-host> --profile-id <provider:profile>
  openclaw-auth-profile-sync.sh --apply --host <ssh-host> --profile-id <provider:profile>
  openclaw-auth-profile-sync.sh --validate --host <ssh-host> --profile-id <provider:profile>
  openclaw-auth-profile-sync.sh --dry-run-local --root <state-root> --profile-id <provider:profile>
  openclaw-auth-profile-sync.sh --apply-local --root <state-root> --profile-id <provider:profile>
  openclaw-auth-profile-sync.sh --validate-local --root <state-root> --profile-id <provider:profile>

Public modes:
  --dry-run   Inspect a remote ~/.openclaw tree and report whether per-agent auth drift exists.
  --apply     Sync drifted per-agent auth profiles on a remote host.
  --validate  Fail unless all inspected agents share one consistent profile payload.

Test/helper modes:
  --dry-run-local --root <state-root>
  --apply-local --root <state-root>
  --validate-local --root <state-root>
              Run against a local OpenClaw state root without SSH.
EOF
}

die() {
  echo "error: $*" >&2
  exit 1
}

run_python_sync() {
  local mode="$1"
  local root="$2"
  local profile_id="$3"

  python3 - "$mode" "$root" "$profile_id" <<'PY'
from __future__ import annotations

import hashlib
import json
import re
import shutil
import sys
from datetime import datetime, timezone
from pathlib import Path
from tempfile import NamedTemporaryFile


MODE = sys.argv[1]
ROOT_ARG = sys.argv[2]
PROFILE_ID = sys.argv[3]
AUTH_FAILURE_KEYS = {"auth", "auth_permanent"}


def resolve_root(root_arg: str) -> Path:
    if root_arg == "__DEFAULT_OPENCLAW__":
        return Path.home() / ".openclaw"
    return Path(root_arg)


ROOT = resolve_root(ROOT_ARG)
AGENTS_DIR = ROOT / "agents"


def fail(message: str, code: int = 1) -> None:
    print(json.dumps({"status": "error", "error": message}, indent=2))
    raise SystemExit(code)


def slugify(value: str) -> str:
    return re.sub(r"[^A-Za-z0-9._-]+", "-", value).strip("-") or "profile"


def hash_text(value: str) -> str:
    return hashlib.sha256(value.encode("utf-8")).hexdigest()[:16]


def hash_profile(profile: dict | None) -> str:
    if not isinstance(profile, dict):
        return "-"
    return hash_text(json.dumps(profile, sort_keys=True, separators=(",", ":")))


def iso_from_millis(value: int | float | None) -> str | None:
    if not isinstance(value, (int, float)):
        return None
    return datetime.fromtimestamp(value / 1000, timezone.utc).isoformat()


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


def load_entries() -> list[dict]:
    if not AGENTS_DIR.is_dir():
        fail(f"missing agents directory: {AGENTS_DIR}")

    entries: list[dict] = []
    for path in sorted(AGENTS_DIR.glob("*/agent/auth-profiles.json")):
        data = json.loads(path.read_text(encoding="utf-8"))
        profile = data.get("profiles", {}).get(PROFILE_ID)
        if not isinstance(profile, dict):
            continue
        stats = data.get("usageStats", {}).get(PROFILE_ID, {})
        expires = profile.get("expires")
        last_used = stats.get("lastUsed", 0)
        entry = {
            "agent": path.parent.parent.name,
            "path": path,
            "data": data,
            "profile": profile,
            "stats": stats if isinstance(stats, dict) else {},
            "expires": expires if isinstance(expires, (int, float)) else None,
            "lastUsed": last_used if isinstance(last_used, (int, float)) else 0,
            "profileHash": hash_profile(profile),
        }
        entry["signature"] = (
            entry["profileHash"],
            entry["expires"],
        )
        entry["score"] = (
            1 if profile.get("refresh") else 0,
            1 if isinstance(expires, (int, float)) else 0,
            entry["expires"] or -1,
            entry["lastUsed"],
        )
        entries.append(entry)
    if not entries:
        fail(f"no {PROFILE_ID} entries found under {AGENTS_DIR}")
    return entries


def clear_auth_state(stats: dict) -> bool:
    changed = False
    if stats.get("errorCount") != 0:
        stats["errorCount"] = 0
        changed = True
    for key in ("cooldownUntil", "disabledUntil", "disabledReason"):
        if key in stats:
            stats.pop(key, None)
            changed = True
    failure_counts = stats.get("failureCounts")
    if isinstance(failure_counts, dict):
        for key in AUTH_FAILURE_KEYS:
            if key in failure_counts:
                failure_counts.pop(key, None)
                changed = True
        if not failure_counts:
            stats.pop("failureCounts", None)
    return changed


def summarize(entries: list[dict], canonical: dict) -> tuple[list[str], int]:
    agents_needing_sync: list[str] = []
    unique_profile_count = len({entry["signature"] for entry in entries})
    for entry in entries:
        needs_sync = entry["signature"] != canonical["signature"]
        stats_copy = dict(entry["stats"])
        if clear_auth_state(stats_copy):
            needs_sync = True
        if needs_sync:
            agents_needing_sync.append(entry["agent"])
    return sorted(agents_needing_sync), unique_profile_count


def build_report(entries: list[dict], canonical: dict) -> dict:
    agents_needing_sync, unique_profile_count = summarize(entries, canonical)
    return {
        "root": str(ROOT),
        "status": "drift" if agents_needing_sync else "ok",
        "profileId": PROFILE_ID,
        "canonicalAgent": canonical["agent"],
        "canonicalExpires": canonical["expires"],
        "canonicalExpiresUtc": iso_from_millis(canonical["expires"]),
        "canonicalProfileHash": canonical["profileHash"],
        "inspectedAgents": [entry["agent"] for entry in entries],
        "agentsNeedingSync": agents_needing_sync,
        "uniqueProfileCount": unique_profile_count,
    }


def apply_sync(entries: list[dict], canonical: dict) -> dict:
    report = build_report(entries, canonical)
    agents_needing_sync = report["agentsNeedingSync"]
    if not agents_needing_sync:
        report["status"] = "unchanged"
        report["updatedAgents"] = []
        return report

    timestamp = datetime.now(timezone.utc).strftime("%Y%m%d-%H%M%S")
    backup_dir = ROOT / "backups" / f"{slugify(PROFILE_ID)}-auth-sync-{timestamp}"
    backup_dir.mkdir(parents=True, exist_ok=True)

    canonical_profile = dict(canonical["profile"])
    canonical_stats = dict(canonical["stats"])
    updated_agents: list[str] = []

    for entry in entries:
        if entry["agent"] not in agents_needing_sync:
            continue

        path = entry["path"]
        shutil.copy2(path, backup_dir / f"{entry['agent']}.auth-profiles.json.bak")

        data = entry["data"]
        data.setdefault("profiles", {})[PROFILE_ID] = dict(canonical_profile)
        stats = data.setdefault("usageStats", {}).setdefault(PROFILE_ID, {})
        clear_auth_state(stats)
        stats["errorCount"] = 0
        if canonical_stats.get("lastFailureAt") is not None:
            stats["lastFailureAt"] = canonical_stats["lastFailureAt"]

        write_json_atomic(path, data)
        updated_agents.append(entry["agent"])

    report["status"] = "updated"
    report["backupDir"] = str(backup_dir)
    report["updatedAgents"] = sorted(updated_agents)
    return report


entries = load_entries()
canonical = max(entries, key=lambda entry: entry["score"])
report = build_report(entries, canonical)

if MODE == "dry-run":
    print(json.dumps(report, indent=2))
    raise SystemExit(0)

if MODE == "apply":
    print(json.dumps(apply_sync(entries, canonical), indent=2))
    raise SystemExit(0)

if MODE == "validate":
    if report["agentsNeedingSync"] or report["uniqueProfileCount"] != 1 or canonical["profileHash"] == "-":
        print(json.dumps(report, indent=2))
        raise SystemExit(1)
    print(json.dumps(report, indent=2))
    raise SystemExit(0)

fail(f"unsupported mode: {MODE}")
PY
}

run_remote_mode() {
  local mode="$1"
  local host="$2"
  local profile_id="$3"

  ssh "$host" "python3 - '$mode' '__DEFAULT_OPENCLAW__' '$profile_id'" <<'PY'
from __future__ import annotations

import hashlib
import json
import re
import shutil
import sys
from datetime import datetime, timezone
from pathlib import Path
from tempfile import NamedTemporaryFile


MODE = sys.argv[1]
ROOT_ARG = sys.argv[2]
PROFILE_ID = sys.argv[3]
AUTH_FAILURE_KEYS = {"auth", "auth_permanent"}


def resolve_root(root_arg: str) -> Path:
    if root_arg == "__DEFAULT_OPENCLAW__":
        return Path.home() / ".openclaw"
    return Path(root_arg)


ROOT = resolve_root(ROOT_ARG)
AGENTS_DIR = ROOT / "agents"


def fail(message: str, code: int = 1) -> None:
    print(json.dumps({"status": "error", "error": message}, indent=2))
    raise SystemExit(code)


def slugify(value: str) -> str:
    return re.sub(r"[^A-Za-z0-9._-]+", "-", value).strip("-") or "profile"


def hash_text(value: str) -> str:
    return hashlib.sha256(value.encode("utf-8")).hexdigest()[:16]


def hash_profile(profile: dict | None) -> str:
    if not isinstance(profile, dict):
        return "-"
    return hash_text(json.dumps(profile, sort_keys=True, separators=(",", ":")))


def iso_from_millis(value: int | float | None) -> str | None:
    if not isinstance(value, (int, float)):
        return None
    return datetime.fromtimestamp(value / 1000, timezone.utc).isoformat()


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


def load_entries() -> list[dict]:
    if not AGENTS_DIR.is_dir():
        fail(f"missing agents directory: {AGENTS_DIR}")

    entries: list[dict] = []
    for path in sorted(AGENTS_DIR.glob("*/agent/auth-profiles.json")):
        data = json.loads(path.read_text(encoding="utf-8"))
        profile = data.get("profiles", {}).get(PROFILE_ID)
        if not isinstance(profile, dict):
            continue
        stats = data.get("usageStats", {}).get(PROFILE_ID, {})
        expires = profile.get("expires")
        last_used = stats.get("lastUsed", 0)
        entry = {
            "agent": path.parent.parent.name,
            "path": path,
            "data": data,
            "profile": profile,
            "stats": stats if isinstance(stats, dict) else {},
            "expires": expires if isinstance(expires, (int, float)) else None,
            "lastUsed": last_used if isinstance(last_used, (int, float)) else 0,
            "profileHash": hash_profile(profile),
        }
        entry["signature"] = (
            entry["profileHash"],
            entry["expires"],
        )
        entry["score"] = (
            1 if profile.get("refresh") else 0,
            1 if isinstance(expires, (int, float)) else 0,
            entry["expires"] or -1,
            entry["lastUsed"],
        )
        entries.append(entry)
    if not entries:
        fail(f"no {PROFILE_ID} entries found under {AGENTS_DIR}")
    return entries


def clear_auth_state(stats: dict) -> bool:
    changed = False
    if stats.get("errorCount") != 0:
        stats["errorCount"] = 0
        changed = True
    for key in ("cooldownUntil", "disabledUntil", "disabledReason"):
        if key in stats:
            stats.pop(key, None)
            changed = True
    failure_counts = stats.get("failureCounts")
    if isinstance(failure_counts, dict):
        for key in AUTH_FAILURE_KEYS:
            if key in failure_counts:
                failure_counts.pop(key, None)
                changed = True
        if not failure_counts:
            stats.pop("failureCounts", None)
    return changed


def summarize(entries: list[dict], canonical: dict) -> tuple[list[str], int]:
    agents_needing_sync: list[str] = []
    unique_profile_count = len({entry["signature"] for entry in entries})
    for entry in entries:
        needs_sync = entry["signature"] != canonical["signature"]
        stats_copy = dict(entry["stats"])
        if clear_auth_state(stats_copy):
            needs_sync = True
        if needs_sync:
            agents_needing_sync.append(entry["agent"])
    return sorted(agents_needing_sync), unique_profile_count


def build_report(entries: list[dict], canonical: dict) -> dict:
    agents_needing_sync, unique_profile_count = summarize(entries, canonical)
    return {
        "root": str(ROOT),
        "status": "drift" if agents_needing_sync else "ok",
        "profileId": PROFILE_ID,
        "canonicalAgent": canonical["agent"],
        "canonicalExpires": canonical["expires"],
        "canonicalExpiresUtc": iso_from_millis(canonical["expires"]),
        "canonicalProfileHash": canonical["profileHash"],
        "inspectedAgents": [entry["agent"] for entry in entries],
        "agentsNeedingSync": agents_needing_sync,
        "uniqueProfileCount": unique_profile_count,
    }


def apply_sync(entries: list[dict], canonical: dict) -> dict:
    report = build_report(entries, canonical)
    agents_needing_sync = report["agentsNeedingSync"]
    if not agents_needing_sync:
        report["status"] = "unchanged"
        report["updatedAgents"] = []
        return report

    timestamp = datetime.now(timezone.utc).strftime("%Y%m%d-%H%M%S")
    backup_dir = ROOT / "backups" / f"{slugify(PROFILE_ID)}-auth-sync-{timestamp}"
    backup_dir.mkdir(parents=True, exist_ok=True)

    canonical_profile = dict(canonical["profile"])
    canonical_stats = dict(canonical["stats"])
    updated_agents: list[str] = []

    for entry in entries:
        if entry["agent"] not in agents_needing_sync:
            continue

        path = entry["path"]
        shutil.copy2(path, backup_dir / f"{entry['agent']}.auth-profiles.json.bak")

        data = entry["data"]
        data.setdefault("profiles", {})[PROFILE_ID] = dict(canonical_profile)
        stats = data.setdefault("usageStats", {}).setdefault(PROFILE_ID, {})
        clear_auth_state(stats)
        stats["errorCount"] = 0
        if canonical_stats.get("lastFailureAt") is not None:
            stats["lastFailureAt"] = canonical_stats["lastFailureAt"]

        write_json_atomic(path, data)
        updated_agents.append(entry["agent"])

    report["status"] = "updated"
    report["backupDir"] = str(backup_dir)
    report["updatedAgents"] = sorted(updated_agents)
    return report


entries = load_entries()
canonical = max(entries, key=lambda entry: entry["score"])
report = build_report(entries, canonical)

if MODE == "dry-run":
    print(json.dumps(report, indent=2))
    raise SystemExit(0)

if MODE == "apply":
    print(json.dumps(apply_sync(entries, canonical), indent=2))
    raise SystemExit(0)

if MODE == "validate":
    if report["agentsNeedingSync"] or report["uniqueProfileCount"] != 1 or canonical["profileHash"] == "-":
        print(json.dumps(report, indent=2))
        raise SystemExit(1)
    print(json.dumps(report, indent=2))
    raise SystemExit(0)

fail(f"unsupported mode: {MODE}")
PY
}

main() {
  local mode=""
  local host=""
  local root=""
  local profile_id=""

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --dry-run)
        mode="dry-run"
        shift
        ;;
      --apply)
        mode="apply"
        shift
        ;;
      --validate)
        mode="validate"
        shift
        ;;
      --dry-run-local)
        mode="dry-run"
        shift
        ;;
      --apply-local)
        mode="apply"
        shift
        ;;
      --validate-local)
        mode="validate"
        shift
        ;;
      --host)
        host="${2:-}"
        shift 2
        ;;
      --root)
        root="${2:-}"
        shift 2
        ;;
      --profile-id)
        profile_id="${2:-}"
        shift 2
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        die "unknown argument: $1"
        ;;
    esac
  done

  [[ -n "$mode" ]] || die "a mode must be specified"
  [[ -n "$profile_id" ]] || die "--profile-id is required"

  case "$mode" in
    dry-run|apply|validate)
      if [[ -n "$root" ]]; then
        run_python_sync "$mode" "$root" "$profile_id"
      elif [[ -n "$host" ]]; then
        run_remote_mode "$mode" "$host" "$profile_id"
      else
        die "provide either --root or --host"
      fi
      ;;
    *)
      die "unsupported mode: $mode"
      ;;
  esac
}

main "$@"
