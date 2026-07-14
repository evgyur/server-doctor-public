#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  openclaw-single-gateway.sh --dry-run --host <ssh-host> --runtime-user <user> [options]
  openclaw-single-gateway.sh --apply --host <ssh-host> --runtime-user <user> [options]
  openclaw-single-gateway.sh --validate --host <ssh-host> --runtime-user <user> [options]
  openclaw-single-gateway.sh --dry-run-local --root <filesystem-root> --runtime-user <user> [options]
  openclaw-single-gateway.sh --apply-local --root <filesystem-root> --runtime-user <user> [options]
  openclaw-single-gateway.sh --validate-local --root <filesystem-root> --runtime-user <user> [options]

Options:
  --runtime-home <path>  Default: /home/<runtime-user>
  --openclaw-bin <path>  Default: <runtime-home>/.npm-global/bin/openclaw
  --gateway-port <port>  Default: 8090

The helper keeps one user-level OpenClaw gateway and removes a conflicting
system-level unit after writing timestamped backups. Remote apply requires sudo.
EOF
}

die() {
  echo "error: $*" >&2
  exit 1
}

validate_inputs() {
  [[ "$RUNTIME_USER" =~ ^[a-z_][a-z0-9_-]*[$]?$ ]] || die "invalid --runtime-user"
  [[ "$RUNTIME_HOME" == /* ]] || die "--runtime-home must be absolute"
  [[ "$OPENCLAW_BIN" == /* ]] || die "--openclaw-bin must be absolute"
  [[ "$GATEWAY_PORT" =~ ^[0-9]+$ ]] || die "--gateway-port must be numeric"
}

emit_python_program() {
  cat <<'PY'
from __future__ import annotations

import json
import shutil
import sys
import textwrap
from datetime import datetime, timezone
from pathlib import Path
from tempfile import NamedTemporaryFile

MODE = sys.argv[1]
ROOT = Path(sys.argv[2])
RUNTIME_USER = sys.argv[3]
RUNTIME_HOME_VALUE = Path(sys.argv[4])
OPENCLAW_BIN_VALUE = Path(sys.argv[5])
CANONICAL_PORT = int(sys.argv[6])


def under_root(path: Path) -> Path:
    return ROOT / path.relative_to("/")


HOME_DIR = under_root(RUNTIME_HOME_VALUE)
STATE_DIR = HOME_DIR / ".openclaw"
USER_UNIT = HOME_DIR / ".config/systemd/user/openclaw-gateway.service"
SYSTEM_UNIT = ROOT / "etc/systemd/system/openclaw-gateway.service"
ENV_FILE = STATE_DIR / ".env"
BACKUP_BASE = STATE_DIR / "backups"
CANONICAL_STATE_DIR = str(RUNTIME_HOME_VALUE / ".openclaw")
OPENCLAW_BIN = str(OPENCLAW_BIN_VALUE)

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
    import re

    match = re.search(r"--port\s+(\d+)", text)
    return int(match.group(1)) if match else None


def parse_state_dir(text: str) -> str | None:
    return parse_environment_lines(text).get("OPENCLAW_STATE_DIR")


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
        Description=OpenClaw Gateway (canonical single gateway)
        After=network-online.target
        Wants=network-online.target

        [Service]
        Environment=HOME={RUNTIME_HOME_VALUE}
        Environment=OPENCLAW_STATE_DIR={CANONICAL_STATE_DIR}
        EnvironmentFile=-{CANONICAL_STATE_DIR}/.env
        ExecStart={OPENCLAW_BIN} gateway --port {CANONICAL_PORT}
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
    env_keys_to_migrate = sorted(key for key in user_env if key not in IGNORED_ENV_KEYS)
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
        "runtimeUser": RUNTIME_USER,
        "runtimeHome": str(RUNTIME_HOME_VALUE),
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
    for source, backup_name in (
        (USER_UNIT, "openclaw-gateway.user.service.bak"),
        (SYSTEM_UNIT, "openclaw-gateway.system.service.bak"),
        (ENV_FILE, ".env.bak"),
    ):
        if source.exists():
            shutil.copy2(source, backup_dir / backup_name)

    merged_env = parse_env_file(ENV_FILE)
    for key, value in parse_environment_lines(read_text(USER_UNIT)).items():
        if key not in IGNORED_ENV_KEYS:
            merged_env.setdefault(key, value)
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
    updated["migratedEnvKeys"] = sorted(key for key in merged_env if key not in IGNORED_ENV_KEYS)
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
    raise SystemExit(0 if report["status"] == "ok" else 1)
fail(f"unsupported mode: {MODE}")
PY
}

run_local_mode() {
  local mode="$1"
  local root="$2"
  emit_python_program | python3 - "$mode" "$root" "$RUNTIME_USER" "$RUNTIME_HOME" "$OPENCLAW_BIN" "$GATEWAY_PORT"
}

run_remote_script() {
  local host="$1"
  local remote_command="$2"
  local tmp_name
  tmp_name="$(basename "$0")"
  ssh "$host" "tmp=\$(mktemp /tmp/${tmp_name}.XXXXXX); cat >\"\$tmp\"; chmod +x \"\$tmp\"; ${remote_command}; status=\$?; rm -f \"\$tmp\"; exit \$status" < "$0"
}

remote_local_args() {
  printf '%q ' --runtime-user "$RUNTIME_USER" --runtime-home "$RUNTIME_HOME" --openclaw-bin "$OPENCLAW_BIN" --gateway-port "$GATEWAY_PORT"
}

run_remote_mode() {
  local mode="$1"
  local host="$2"
  local args uid_cmd user_systemctl
  args="$(remote_local_args)"
  uid_cmd="uid=\$(id -u $(printf '%q' "$RUNTIME_USER"))"
  user_systemctl="sudo -u $(printf '%q' "$RUNTIME_USER") -H env XDG_RUNTIME_DIR=/run/user/\$uid systemctl --user"
  case "$mode" in
    dry-run)
      run_remote_script "$host" "\"\$tmp\" --dry-run-local --root / ${args}"
      ;;
    apply)
      run_remote_script "$host" "sudo loginctl enable-linger $(printf '%q' "$RUNTIME_USER"); sudo \"\$tmp\" --apply-local --root / ${args}; sudo chown -R $(printf '%q' "$RUNTIME_USER:") $(printf '%q' "$RUNTIME_HOME/.openclaw") $(printf '%q' "$RUNTIME_HOME/.config/systemd") 2>/dev/null || true; sudo systemctl disable --now openclaw-gateway >/dev/null 2>&1 || true; ${uid_cmd}; ${user_systemctl} daemon-reload; ${user_systemctl} enable openclaw-gateway; ${user_systemctl} restart openclaw-gateway; sudo \"\$tmp\" --validate-local --root / ${args}; ${user_systemctl} status openclaw-gateway --no-pager -l"
      ;;
    validate)
      run_remote_script "$host" "sudo \"\$tmp\" --validate-local --root / ${args}; ${uid_cmd}; ${user_systemctl} status openclaw-gateway --no-pager -l"
      ;;
    *)
      die "unsupported remote mode: $mode"
      ;;
  esac
}

mode=""
host=""
root=""
RUNTIME_USER="${OPENCLAW_RUNTIME_USER:-}"
RUNTIME_HOME=""
OPENCLAW_BIN=""
GATEWAY_PORT="${OPENCLAW_GATEWAY_PORT:-8090}"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run|--apply|--validate|--dry-run-local|--apply-local|--validate-local)
      [[ -z "$mode" ]] || die "only one mode may be specified"
      mode="$1"
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
    --runtime-user)
      [[ $# -ge 2 ]] || die "--runtime-user requires a value"
      RUNTIME_USER="$2"
      shift 2
      ;;
    --runtime-home)
      [[ $# -ge 2 ]] || die "--runtime-home requires a value"
      RUNTIME_HOME="$2"
      shift 2
      ;;
    --openclaw-bin)
      [[ $# -ge 2 ]] || die "--openclaw-bin requires a value"
      OPENCLAW_BIN="$2"
      shift 2
      ;;
    --gateway-port)
      [[ $# -ge 2 ]] || die "--gateway-port requires a value"
      GATEWAY_PORT="$2"
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

[[ -n "$RUNTIME_USER" ]] || die "--runtime-user is required"
RUNTIME_HOME="${RUNTIME_HOME:-/home/$RUNTIME_USER}"
OPENCLAW_BIN="${OPENCLAW_BIN:-$RUNTIME_HOME/.npm-global/bin/openclaw}"
validate_inputs

case "$mode" in
  --dry-run|--apply|--validate)
    [[ -n "$host" ]] || die "--host is required for remote modes"
    [[ "$host" != -* && "$host" != *$'\n'* && "$host" != *$'\r'* ]] || die "invalid --host"
    run_remote_mode "${mode#--}" "$host"
    ;;
  --dry-run-local|--apply-local|--validate-local)
    [[ -n "$root" ]] || die "--root is required for local modes"
    local_mode="${mode#--}"
    run_local_mode "${local_mode%-local}" "$root"
    ;;
  *)
    usage >&2
    exit 1
    ;;
esac
