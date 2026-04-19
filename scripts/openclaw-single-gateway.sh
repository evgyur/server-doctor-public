#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  openclaw-single-gateway.sh --dry-run --host <ssh-host>
  openclaw-single-gateway.sh --apply --host <ssh-host>
  openclaw-single-gateway.sh --validate --host <ssh-host>
  openclaw-single-gateway.sh --dry-run-local --root <filesystem-root>
  openclaw-single-gateway.sh --apply-local --root <filesystem-root>
  openclaw-single-gateway.sh --validate-local --root <filesystem-root>

Public modes:
  --dry-run   Inspect a host for duplicate OpenClaw supervisors sharing one state dir.
  --apply     Promote one canonical user service on port 8090 and remove the system unit.
  --validate  Fail unless the host is on the canonical single-gateway shape.

Test/helper modes:
  --dry-run-local --root <filesystem-root>
  --apply-local --root <filesystem-root>
  --validate-local --root <filesystem-root>
              Run against a local filesystem tree without SSH or systemctl.
EOF
}

die() {
  echo "error: $*" >&2
  exit 1
}

emit_python_program() {
  cat <<'PY'
from __future__ import annotations

import json
import re
import shutil
import sys
import textwrap
from datetime import datetime, timezone
from pathlib import Path
from tempfile import NamedTemporaryFile


MODE = sys.argv[1]
ROOT = Path(sys.argv[2])
HOME_DIR = ROOT / "home" / "chip"
STATE_DIR = HOME_DIR / ".openclaw"
USER_UNIT = HOME_DIR / ".config/systemd/user/openclaw-gateway.service"
SYSTEM_UNIT = ROOT / "etc/systemd/system/openclaw-gateway.service"
ENV_FILE = STATE_DIR / ".env"
BACKUP_BASE = STATE_DIR / "backups"
CANONICAL_PORT = 8090
CANONICAL_STATE_DIR = "/home/chip/.openclaw"

IGNORED_ENV_KEYS = {
    "HOME",
    "TMPDIR",
    "PATH",
    "OPENCLAW_GATEWAY_PORT",
    "OPENCLAW_SYSTEMD_UNIT",
    "OPENCLAW_WINDOWS_TASK_NAME",
    "OPENCLAW_SERVICE_MARKER",
    "OPENCLAW_SERVICE_KIND",
    "OPENCLAW_SERVICE_VERSION",
}


def fail(message: str, code: int = 1) -> None:
    print(json.dumps({"status": "error", "error": message}, indent=2))
    raise SystemExit(code)


def read_text(path: Path) -> str:
    if not path.exists():
        return ""
    return path.read_text(encoding="utf-8")


def normalize_text(content: str) -> str:
    content = textwrap.dedent(content).strip()
    return content + "\n" if content else ""


def write_text_atomic(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with NamedTemporaryFile("w", encoding="utf-8", dir=path.parent, delete=False) as tmp_file:
        tmp_file.write(normalize_text(content))
        tmp_path = Path(tmp_file.name)
    tmp_path.replace(path)


def parse_environment_lines(text: str) -> dict[str, str]:
    env: dict[str, str] = {}
    for raw_line in text.splitlines():
        line = raw_line.strip()
        if not line.startswith("Environment="):
            continue
        payload = line[len("Environment="):]
        if payload.startswith('"') and payload.endswith('"'):
            payload = payload[1:-1]
        if "=" not in payload:
            continue
        key, value = payload.split("=", 1)
        env[key] = value
    return env


def parse_port(text: str) -> int | None:
    match = re.search(r"--port\s+(\d+)", text)
    if not match:
        return None
    return int(match.group(1))


def parse_state_dir(text: str) -> str | None:
    env = parse_environment_lines(text)
    return env.get("OPENCLAW_STATE_DIR")


def parse_env_file(path: Path) -> dict[str, str]:
    env: dict[str, str] = {}
    if not path.exists():
        return env
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        env[key] = value
    return env


def render_env_file(env: dict[str, str]) -> str:
    lines = [f"{key}={value}" for key, value in sorted(env.items())]
    return "\n".join(lines) + ("\n" if lines else "")


def canonical_user_unit() -> str:
    return normalize_text(
        f"""
        [Unit]
        Description=OpenClaw Gateway (canonical single gateway, run as chip)
        After=network-online.target
        Wants=network-online.target

        [Service]
        ExecStart=/home/chip/.npm-global/bin/openclaw gateway --port {CANONICAL_PORT}
        Restart=always
        RestartSec=5

        [Install]
        WantedBy=default.target
        """
    )


def build_report() -> dict:
    user_text = read_text(USER_UNIT)
    system_text = read_text(SYSTEM_UNIT)
    user_env = parse_environment_lines(user_text)
    user_unit_exists = USER_UNIT.exists()
    system_unit_exists = SYSTEM_UNIT.exists()
    system_state_dir = parse_state_dir(system_text)
    user_port = parse_port(user_text)
    system_port = parse_port(system_text)
    env_keys_to_migrate = sorted(key for key in user_env.keys() if key not in IGNORED_ENV_KEYS)
    duplicate_shared_state = (
        user_unit_exists
        and system_unit_exists
        and system_state_dir == CANONICAL_STATE_DIR
    )
    system_has_pkill_prestart = "pkill -9 -f openclaw-gateway" in system_text
    user_unit_matches = normalize_text(user_text) == canonical_user_unit()

    status = "ok"
    if (
        duplicate_shared_state
        or not user_unit_exists
        or system_unit_exists
        or user_port != CANONICAL_PORT
        or system_has_pkill_prestart
        or not user_unit_matches
    ):
        status = "drift"

    return {
        "status": status,
        "root": str(ROOT),
        "userUnitExists": user_unit_exists,
        "systemUnitExists": system_unit_exists,
        "userUnitPath": str(USER_UNIT),
        "systemUnitPath": str(SYSTEM_UNIT),
        "envFilePath": str(ENV_FILE),
        "userPort": user_port,
        "systemPort": system_port,
        "canonicalPort": CANONICAL_PORT,
        "systemStateDir": system_state_dir,
        "duplicateSharedState": duplicate_shared_state,
        "systemHasPkillPrestart": system_has_pkill_prestart,
        "envKeysToMigrate": env_keys_to_migrate,
        "recommendedAction": "promote-user-service-drop-system-unit",
        "canonicalUserUnitMatches": user_unit_matches,
    }


def apply_changes(report: dict) -> dict:
    timestamp = datetime.now(timezone.utc).strftime("%Y%m%d-%H%M%S")
    backup_dir = BACKUP_BASE / f"openclaw-single-gateway-{timestamp}"
    backup_dir.mkdir(parents=True, exist_ok=True)

    if USER_UNIT.exists():
        shutil.copy2(USER_UNIT, backup_dir / "openclaw-gateway.user.service.bak")
    if SYSTEM_UNIT.exists():
        shutil.copy2(SYSTEM_UNIT, backup_dir / "openclaw-gateway.system.service.bak")
    if ENV_FILE.exists():
        shutil.copy2(ENV_FILE, backup_dir / ".env.bak")

    merged_env = parse_env_file(ENV_FILE)
    user_env = parse_environment_lines(read_text(USER_UNIT))
    for key in sorted(user_env):
        if key in IGNORED_ENV_KEYS:
            continue
        merged_env.setdefault(key, user_env[key])

    if merged_env:
        write_text_atomic(ENV_FILE, render_env_file(merged_env))
    elif ENV_FILE.exists():
        ENV_FILE.unlink()

    write_text_atomic(USER_UNIT, canonical_user_unit())

    if SYSTEM_UNIT.exists():
        SYSTEM_UNIT.unlink()

    updated = build_report()
    updated["status"] = "updated"
    updated["backupDir"] = str(backup_dir)
    updated["migratedEnvKeys"] = sorted(key for key in merged_env.keys() if key not in IGNORED_ENV_KEYS)
    return updated


report = build_report()

if MODE == "dry-run":
    print(json.dumps(report, indent=2))
    raise SystemExit(0)

if MODE == "apply":
    print(json.dumps(apply_changes(report), indent=2))
    raise SystemExit(0)

if MODE == "validate":
    print(json.dumps(report, indent=2))
    if (
        report["status"] == "ok"
        and report["userPort"] == CANONICAL_PORT
        and report["userUnitExists"]
        and not report["systemUnitExists"]
        and not report["systemHasPkillPrestart"]
        and report["canonicalUserUnitMatches"]
    ):
        raise SystemExit(0)
    raise SystemExit(1)

fail(f"unsupported mode: {MODE}")
PY
}

run_local_mode() {
  local mode="$1"
  local root="$2"
  emit_python_program | python3 - "$mode" "$root"
}

run_remote_script() {
  local host="$1"
  local remote_command="$2"

  local tmp_name
  tmp_name="$(basename "$0")"
  ssh "$host" "tmp=\$(mktemp /tmp/${tmp_name}.XXXXXX); cat >\"\$tmp\"; chmod +x \"\$tmp\"; ${remote_command}; status=\$?; rm -f \"\$tmp\"; exit \$status" < "$0"
}

run_remote_mode() {
  local mode="$1"
  local host="$2"

  case "$mode" in
    dry-run)
      run_remote_script "$host" "\"\$tmp\" --dry-run-local --root /"
      ;;
    apply)
      run_remote_script "$host" "sudo loginctl enable-linger chip; systemctl --user disable --now openclaw-gateway >/dev/null 2>&1 || true; sudo systemctl disable --now openclaw-gateway >/dev/null 2>&1 || true; sudo \"\$tmp\" --apply-local --root /; sudo chown chip:chip /home/chip/.openclaw/.env >/dev/null 2>&1 || true; sudo chmod 600 /home/chip/.openclaw/.env >/dev/null 2>&1 || true; sudo chown -R chip:chip /home/chip/.config/systemd >/dev/null 2>&1 || true; if sudo test -d /root/.openclaw; then sudo mv /root/.openclaw /root/.openclaw.server-doctor-disabled.\$(date +%Y%m%d-%H%M%S); fi; sudo systemctl daemon-reload; sudo -u chip -H env HOME=/home/chip PATH=/home/chip/.npm-global/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin /home/chip/.npm-global/bin/openclaw gateway install --force --port 8090; systemctl --user daemon-reload; systemctl --user enable --now openclaw-gateway; sudo \"\$tmp\" --validate-local --root /; systemctl --user status openclaw-gateway --no-pager -l || true; sudo ss -tulpn | grep -E '127.0.0.1:(8090|18789|18791)' || true"
      ;;
    validate)
      run_remote_script "$host" "\"\$tmp\" --validate-local --root /; systemctl --user status openclaw-gateway --no-pager -l >/dev/null 2>&1 || true; sudo systemctl status openclaw-gateway --no-pager -l >/dev/null 2>&1 || true; sudo ss -tulpn | grep -E '127.0.0.1:(8090|18789|18791)' || true"
      ;;
    *)
      die "unsupported remote mode: $mode"
      ;;
  esac
}

main() {
  local mode=""
  local host=""
  local root=""

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
        mode="dry-run-local"
        shift
        ;;
      --apply-local)
        mode="apply-local"
        shift
        ;;
      --validate-local)
        mode="validate-local"
        shift
        ;;
      --host)
        [[ $# -ge 2 ]] || die "--host requires a value"
        host="$2"
        shift 2
        ;;
      --root)
        [[ $# -ge 2 ]] || die "--root requires a value"
        root="$2"
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

  case "$mode" in
    dry-run|apply|validate)
      [[ -n "$host" ]] || die "--host is required for remote modes"
      run_remote_mode "$mode" "$host"
      ;;
    dry-run-local)
      [[ -n "$root" ]] || die "--root is required for local modes"
      run_local_mode "dry-run" "$root"
      ;;
    apply-local)
      [[ -n "$root" ]] || die "--root is required for local modes"
      run_local_mode "apply" "$root"
      ;;
    validate-local)
      [[ -n "$root" ]] || die "--root is required for local modes"
      run_local_mode "validate" "$root"
      ;;
    *)
      usage >&2
      exit 1
      ;;
  esac
}

main "$@"
