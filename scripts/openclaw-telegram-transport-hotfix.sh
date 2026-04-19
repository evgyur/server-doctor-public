#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  openclaw-telegram-transport-hotfix.sh --dry-run --host <ssh-host>
  openclaw-telegram-transport-hotfix.sh --apply --host <ssh-host>
  openclaw-telegram-transport-hotfix.sh --validate --host <ssh-host>
  openclaw-telegram-transport-hotfix.sh --apply-local --root <openclaw-install-root>

Public modes:
  --dry-run   Inspect the current install on a remote host and report what would change.
  --apply     Re-apply a local Telegram transport compatibility patch on a remote host.
  --validate  Check runtime and log health signals after the patch on a remote host.

Test/helper mode:
  --apply-local --root <dir>
              Patch a local OpenClaw install tree in place without any service restart.

Warning:
  This helper modifies installed OpenClaw runtime bundles. Treat it as a host-local
  compatibility patch, not as proof that upstream transport is fixed.
EOF
}

die() {
  echo "error: $*" >&2
  exit 1
}

ensure_path() {
  export PATH="$HOME/.npm-global/bin:$PATH"
}

resolve_local_openclaw_root() {
  ensure_path

  local -a candidates=()
  local npm_root

  if command -v npm >/dev/null 2>&1; then
    npm_root="$(npm root -g 2>/dev/null || true)"
    if [[ -n "$npm_root" ]]; then
      candidates+=("$npm_root/openclaw")
    fi
  fi

  candidates+=(
    "$HOME/.npm-global/lib/node_modules/openclaw"
    "/usr/local/lib/node_modules/openclaw"
    "/opt/homebrew/lib/node_modules/openclaw"
  )

  local candidate
  for candidate in "${candidates[@]}"; do
    if [[ -d "$candidate/dist" ]]; then
      printf '%s\n' "$candidate"
      return 0
    fi
  done

  return 1
}

run_python_patcher() {
  local mode="$1"
  local root="$2"
  local backup_suffix="${3:-}"

  python3 - "$mode" "$root" "$backup_suffix" <<'PY'
from __future__ import annotations

import json
import re
import shutil
import sys
from pathlib import Path


MODE = sys.argv[1]
ROOT = Path(sys.argv[2])
BACKUP_SUFFIX = sys.argv[3]


def error(message: str) -> None:
    print(json.dumps({"error": message}))
    raise SystemExit(1)


def match_brace(text: str, brace_index: int) -> int:
    depth = 0
    in_single = False
    in_double = False
    in_template = False
    escape = False

    for index in range(brace_index, len(text)):
        ch = text[index]

        if escape:
            escape = False
            continue

        if ch == "\\" and (in_single or in_double or in_template):
            escape = True
            continue

        if in_single:
            if ch == "'":
                in_single = False
            continue

        if in_double:
            if ch == '"':
                in_double = False
            continue

        if in_template:
            if ch == "`":
                in_template = False
            continue

        if ch == "'":
            in_single = True
            continue
        if ch == '"':
            in_double = True
            continue
        if ch == "`":
            in_template = True
            continue

        if ch == "{":
            depth += 1
            continue
        if ch == "}":
            depth -= 1
            if depth == 0:
                return index

    raise ValueError("unbalanced braces while patching buildTelegramConnectOptions")


def patch_fetch_block(block: str) -> tuple[str, bool]:
    changed = False
    new_block = block.replace(
        "typeof params.autoSelectFamily === boolean",
        'typeof params.autoSelectFamily === "boolean"',
    )
    if new_block != block:
        changed = True
        block = new_block

    if "keepAliveInitialDelay" not in block:
        connect_pattern = re.compile(r"(?m)^([ \t]*)const connect = \{\};$")
        new_block, count = connect_pattern.subn(
            lambda m: (
                f"{m.group(1)}const connect = {{}};\n"
                f"{m.group(1)}connect.keepAlive = true;\n"
                f"{m.group(1)}connect.keepAliveInitialDelay = 3e4;"
            ),
            block,
            count=1,
        )
        if count == 1:
            changed = True
            block = new_block
        else:
            def add_keepalive(match: re.Match[str]) -> str:
                indent = match.group(1)
                return (
                    f"{indent}return {{\n"
                    f"{indent}\tkeepAlive: true,\n"
                    f"{indent}\tkeepAliveInitialDelay: 3e4,\n"
                )

            new_block = re.sub(r"(?m)^([ \t]*)return \{\n", add_keepalive, block)
            if new_block != block:
                changed = True
                block = new_block

    return block, changed


def patch_fetch(text: str) -> tuple[str, bool]:
    marker = "function buildTelegramConnectOptions(params) {"
    start = text.find(marker)
    if start == -1:
        return text, False

    brace_index = text.find("{", start)
    end = match_brace(text, brace_index)
    block = text[start : end + 1]
    new_block, changed = patch_fetch_block(block)
    if not changed:
        return text, False
    return text[:start] + new_block + text[end + 1 :], True


def patch_abort(text: str) -> tuple[str, bool]:
    gate_marker = "if (opts.fetchAbortSignal)"
    if gate_marker not in text:
        return text, False
    if 'const shouldAbortOnShutdown = method === "getUpdates";' in text:
        return text, False

    gate_start = text.find(gate_marker)
    wrapper_marker = "finalFetch = ((input, init) => {"
    wrapper_start = text.find(wrapper_marker, gate_start)
    if wrapper_start == -1:
        return text, False

    wrapper_brace = text.find("{", wrapper_start)
    if wrapper_brace == -1:
        return text, False

    wrapper_end = match_brace(text, wrapper_brace)
    block = text[wrapper_start : wrapper_end + 1]
    changed = False

    controller_pattern = re.compile(
        r'(?m)^([ \t]*)const controller = new AbortController\(\);$'
    )
    block2, count = controller_pattern.subn(
        lambda m: (
            f'{m.group(1)}const method = extractTelegramApiMethod(input);\n'
            f'{m.group(1)}const shouldAbortOnShutdown = method === "getUpdates";\n'
            f"{m.group(1)}const controller = new AbortController();"
        ),
        block,
        count=1,
    )
    if count == 1:
      block = block2
      changed = True

    on_shutdown_pattern = re.compile(
        r'(?m)^([ \t]*)const onShutdown = \(\) => abortWith\(shutdownSignal\);$'
    )
    block2, count = on_shutdown_pattern.subn(
        lambda m: f"{m.group(1)}let onShutdown;",
        block,
        count=1,
    )
    if count == 1:
      block = block2
      changed = True

    guard_pattern = re.compile(
        r'(?m)^([ \t]*)if \(shutdownSignal\.aborted\) abortWith\(shutdownSignal\);\n'
        r'\1else shutdownSignal\.addEventListener\("abort", onShutdown, \{ once: true \}\);$'
    )
    block2, count = guard_pattern.subn(
        lambda m: (
            f"{m.group(1)}if (shouldAbortOnShutdown) {{\n"
            f"{m.group(1)}\tonShutdown = () => abortWith(shutdownSignal);\n"
            f"{m.group(1)}\tif (shutdownSignal.aborted) abortWith(shutdownSignal);\n"
            f'{m.group(1)}\telse shutdownSignal.addEventListener("abort", onShutdown, {{ once: true }});\n'
            f"{m.group(1)}}}"
        ),
        block,
        count=1,
    )
    if count == 1:
      block = block2
      changed = True

    remove_listener_pattern = re.compile(
        r'(?m)^([ \t]*)shutdownSignal\.removeEventListener\("abort", onShutdown\);$'
    )
    block2, count = remove_listener_pattern.subn(
        lambda m: f'{m.group(1)}if (onShutdown) shutdownSignal.removeEventListener("abort", onShutdown);',
        block,
        count=1,
    )
    if count == 1:
      block = block2
      changed = True

    if not changed:
        return text, False

    return text[:wrapper_start] + block + text[wrapper_end + 1 :], True


def iter_js_files(root: Path) -> list[Path]:
    dist = root / "dist"
    if not dist.is_dir():
        error(f"missing dist directory under {root}")

    return sorted(path for path in dist.rglob("*.js") if path.is_file())


def main() -> None:
    if not ROOT.is_dir():
        error(f"root does not exist: {ROOT}")

    files = iter_js_files(ROOT)
    changed_files = []
    fetch_files = []
    abort_files = []

    for path in files:
        original = path.read_text()
        updated = original
        file_changed = False

        updated, changed = patch_fetch(updated)
        if changed:
            fetch_files.append(str(path))
            file_changed = True

        updated, changed = patch_abort(updated)
        if changed:
            abort_files.append(str(path))
            file_changed = True

        if file_changed:
            changed_files.append(str(path))
            if MODE == "apply":
                if BACKUP_SUFFIX:
                    backup = path.with_name(path.name + BACKUP_SUFFIX)
                    if not backup.exists():
                        shutil.copy2(path, backup)
                path.write_text(updated)

    summary = {
        "mode": MODE,
        "root": str(ROOT),
        "changedCount": len(changed_files),
        "fetchPatchedCount": len(fetch_files),
        "abortPatchedCount": len(abort_files),
        "changedFiles": changed_files,
    }
    print(json.dumps(summary, indent=2))


main()
PY
}

show_recent_log_signals() {
  local log_path
  log_path="/tmp/openclaw/openclaw-$(date +%F).log"
  if [[ ! -f "$log_path" ]]; then
    log_path="$(ls -1t /tmp/openclaw/openclaw-*.log 2>/dev/null | head -n 1 || true)"
  fi

  if [[ -z "${log_path:-}" || ! -f "$log_path" ]]; then
    echo "No OpenClaw log file found under /tmp/openclaw." >&2
    return 0
  fi

  echo "Log file: $log_path"
  grep -En 'Polling stall detected|sendMessage failed|sendChatAction failed|failed to load plugin|channel exited|starting provider' "$log_path" | tail -n 40 || true
}

remote_validate() {
  ensure_path
  echo "== openclaw gateway status =="
  openclaw gateway status || true
  echo "== recent telegram transport signals =="
  show_recent_log_signals
}

remote_apply() {
  ensure_path

  local root
  root="$(resolve_local_openclaw_root)" || die "could not resolve installed OpenClaw root on remote host"

  echo "Resolved OpenClaw root: $root"
  echo "== dry-run patch summary =="
  run_python_patcher dry-run "$root"

  local backup_suffix
  backup_suffix=".bak-$(date +%Y%m%d-%H%M%S)-telegram-transport-hotfix"

  echo "== apply patch =="
  run_python_patcher apply "$root" "$backup_suffix"

  echo "== restart openclaw-gateway =="
  systemctl --user restart openclaw-gateway
  sleep 6

  remote_validate
}

dispatch_remote_self() {
  local host="$1"
  local remote_mode="$2"

  ssh -o BatchMode=yes -o ConnectTimeout=10 "$host" "bash -s -- $remote_mode" < "$0"
}

mode=""
host=""
root=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run|--apply|--validate|--apply-local|--remote-dry-run|--remote-apply|--remote-validate)
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
    -h|--help)
      usage
      exit 0
      ;;
    *)
      die "unknown argument: $1"
      ;;
  esac
done

[[ -n "$mode" ]] || {
  usage >&2
  exit 1
}

case "$mode" in
  --apply-local)
    [[ -n "$root" ]] || die "--apply-local requires --root"
    run_python_patcher apply "$root"
    ;;
  --remote-dry-run)
    ensure_path
    root="$(resolve_local_openclaw_root)" || die "could not resolve installed OpenClaw root"
    echo "Resolved OpenClaw root: $root"
    run_python_patcher dry-run "$root"
    ;;
  --remote-apply)
    remote_apply
    ;;
  --remote-validate)
    remote_validate
    ;;
  --dry-run)
    [[ -n "$host" ]] || die "--dry-run requires --host"
    dispatch_remote_self "$host" "--remote-dry-run"
    ;;
  --apply)
    [[ -n "$host" ]] || die "--apply requires --host"
    dispatch_remote_self "$host" "--remote-apply"
    ;;
  --validate)
    [[ -n "$host" ]] || die "--validate requires --host"
    dispatch_remote_self "$host" "--remote-validate"
    ;;
  *)
    die "unsupported mode: $mode"
    ;;
esac
