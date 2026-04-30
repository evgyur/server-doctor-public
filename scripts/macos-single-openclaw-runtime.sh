#!/usr/bin/env bash
set -euo pipefail

CANONICAL_NODE="/opt/homebrew/opt/node@22/bin/node"
CANONICAL_OPENCLAW="/opt/homebrew/bin/openclaw"
CANONICAL_ENTRY="/opt/homebrew/lib/node_modules/openclaw/dist/index.js"
CANONICAL_PATH="/opt/homebrew/opt/node@22/bin:/opt/homebrew/bin:/usr/bin:/bin"
GATEWAY_LABEL="ai.openclaw.gateway"
GATEWAY_PORT="${OPENCLAW_GATEWAY_PORT:-8090}"

usage() {
  cat <<'EOF'
Usage:
  macos-single-openclaw-runtime.sh --dry-run [options]
  macos-single-openclaw-runtime.sh --apply [options]

Options:
  --canonical-node <path>       Default: /opt/homebrew/opt/node@22/bin/node
  --canonical-openclaw <path>   Default: /opt/homebrew/bin/openclaw
  --canonical-entry <path>      Default: /opt/homebrew/lib/node_modules/openclaw/dist/index.js
  --canonical-path <path-list>  Default: /opt/homebrew/opt/node@22/bin:/opt/homebrew/bin:/usr/bin:/bin
  --gateway-label <label>       Default: ai.openclaw.gateway
  --gateway-port <port>         Default: 8090

This remediation keeps one canonical OpenClaw install active on a macOS host and removes duplicate ~/.nvm copies after apply succeeds.
EOF
}

gateway_plist() {
  printf '%s\n' "$HOME/Library/LaunchAgents/${GATEWAY_LABEL}.plist"
}

list_nvm_nodes() {
  local candidate
  local found=0
  for candidate in "$HOME"/.nvm/versions/node/*/bin/node; do
    if [[ -x "$candidate" ]]; then
      local nvm_root
      nvm_root="$(cd "$(dirname "$candidate")/.." && pwd)"
      if [[ -f "$nvm_root/lib/node_modules/openclaw/dist/index.js" ]]; then
        printf '%s\n' "$candidate"
        found=1
      fi
    fi
  done
  if (( found == 0 )); then
    return 1
  fi
}

print_plan() {
  local plist_path
  plist_path="$(gateway_plist)"
  cat <<EOF
macOS single-openclaw remediation

Canonical entrypoint:
  ${CANONICAL_OPENCLAW}

Do not leave duplicate openclaw installs on this host.

Dry-run plan:
  export PATH="${CANONICAL_PATH}:\$PATH"
  which -a openclaw || true
  ${CANONICAL_NODE} ${CANONICAL_ENTRY} --version
  launchctl print gui/\$(id -u)/${GATEWAY_LABEL} 2>/dev/null | egrep 'program =|path =|args ='
  cp ${plist_path} ${plist_path}.bak.\$(date +%Y%m%d-%H%M%S)
  PATH="${CANONICAL_PATH}" ${CANONICAL_OPENCLAW} gateway install --force --port ${GATEWAY_PORT}
  PATH="${CANONICAL_PATH}" ${CANONICAL_OPENCLAW} gateway restart
  <nvm npm> npm uninstall -g openclaw
  rm -f ~/.nvm/versions/node/*/bin/openclaw
  rm -rf ~/.nvm/versions/node/*/lib/node_modules/openclaw
  PATH="${CANONICAL_PATH}" ${CANONICAL_OPENCLAW} gateway status
EOF
}

apply_fix() {
  [[ "$(uname -s)" == "Darwin" ]] || {
    echo "This apply mode is intended for macOS hosts." >&2
    exit 1
  }
  [[ -x "$CANONICAL_NODE" ]] || {
    echo "Missing canonical node: $CANONICAL_NODE" >&2
    exit 1
  }
  [[ -x "$CANONICAL_OPENCLAW" ]] || {
    echo "Missing canonical openclaw: $CANONICAL_OPENCLAW" >&2
    exit 1
  }
  [[ -f "$CANONICAL_ENTRY" ]] || {
    echo "Missing canonical openclaw entry: $CANONICAL_ENTRY" >&2
    exit 1
  }

  local timestamp
  timestamp="$(date +%Y%m%d-%H%M%S)"
  local plist_path
  plist_path="$(gateway_plist)"

  export PATH="${CANONICAL_PATH}:$PATH"

  echo "== Versions before =="
  which -a openclaw || true
  "$CANONICAL_NODE" "$CANONICAL_ENTRY" --version

  local -a nvm_nodes=()
  mapfile -t nvm_nodes < <(list_nvm_nodes || true)
  if (( ${#nvm_nodes[@]} > 0 )); then
    local nvm_node
    for nvm_node in "${nvm_nodes[@]}"; do
      local nvm_root
      nvm_root="$(cd "$(dirname "$nvm_node")/.." && pwd)"
      "$nvm_node" "$nvm_root/lib/node_modules/openclaw/dist/index.js" --version || true
    done
  fi

  if [[ -f "$plist_path" ]]; then
    cp "$plist_path" "$plist_path.bak.$timestamp"
  fi

  echo "== Reinstall gateway service from canonical runtime =="
  PATH="$CANONICAL_PATH" "$CANONICAL_OPENCLAW" gateway install --force --port "$GATEWAY_PORT"
  PATH="$CANONICAL_PATH" "$CANONICAL_OPENCLAW" gateway restart

  if [[ -f "$plist_path" ]] && grep -q "$HOME/.nvm/versions/node" "$plist_path"; then
    echo "Gateway plist still points to nvm after reinstall: $plist_path" >&2
    exit 1
  fi

  echo "== Remove nvm OpenClaw copies if present =="
  if (( ${#nvm_nodes[@]} > 0 )); then
    local nvm_node
    for nvm_node in "${nvm_nodes[@]}"; do
      local nvm_npm
      local nvm_root
      nvm_root="$(cd "$(dirname "$nvm_node")/.." && pwd)"
      nvm_npm="${nvm_node%/node}/npm"
      if [[ -x "$nvm_npm" ]]; then
        "$nvm_npm" uninstall -g openclaw || true
      fi
      rm -f "$nvm_root/bin/openclaw"
      rm -rf "$nvm_root/lib/node_modules/openclaw"
    done
  fi

  echo "== Verify final state =="
  which -a openclaw || true
  PATH="$CANONICAL_PATH" "$CANONICAL_OPENCLAW" gateway status
  launchctl print "gui/$(id -u)/${GATEWAY_LABEL}" 2>/dev/null | egrep 'program =|path =|args ='

  local -a remaining_nvm_nodes=()
  mapfile -t remaining_nvm_nodes < <(list_nvm_nodes || true)
  if (( ${#remaining_nvm_nodes[@]} > 0 )); then
    local remaining_nvm_node
    for remaining_nvm_node in "${remaining_nvm_nodes[@]}"; do
      echo "nvm OpenClaw copy still present after remediation: ${remaining_nvm_node%/bin/node}" >&2
    done
    exit 1
  fi
}

mode=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run|--apply)
      [[ -z "$mode" ]] || {
        echo "Only one mode may be specified." >&2
        exit 1
      }
      mode="$1"
      shift
      ;;
    --canonical-node)
      CANONICAL_NODE="${2:-}"
      shift 2
      ;;
    --canonical-openclaw)
      CANONICAL_OPENCLAW="${2:-}"
      shift 2
      ;;
    --canonical-entry)
      CANONICAL_ENTRY="${2:-}"
      shift 2
      ;;
    --canonical-path)
      CANONICAL_PATH="${2:-}"
      shift 2
      ;;
    --gateway-label)
      GATEWAY_LABEL="${2:-}"
      shift 2
      ;;
    --gateway-port)
      GATEWAY_PORT="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

case "$mode" in
  --dry-run)
    print_plan
    ;;
  --apply)
    apply_fix
    ;;
  *)
    usage >&2
    exit 1
    ;;
esac
