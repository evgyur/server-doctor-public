#!/usr/bin/env bash
set -euo pipefail

# Server Doctor MVP
# Modes:
#   check    <host> [output_dir]
#   fix      <host> [output_dir]        # safe auto-fix: ssh baseline, firewall baseline, fail2ban
#   preflight <host> [output_dir]       # warn-only gate based on check results

mode="${1:-}"
host="${2:-}"
out_dir="${3:-/tmp/server-doctor}"

usage() {
  cat <<USAGE
Usage:
  $0 check <host-alias-or-user@ip> [output_dir]
  $0 fix <host-alias-or-user@ip> [output_dir]
  $0 preflight <host-alias-or-user@ip> [output_dir]
USAGE
}

if [[ -z "$mode" || -z "$host" ]]; then
  usage
  exit 1
fi

if [[ "$mode" != "check" && "$mode" != "fix" && "$mode" != "preflight" ]]; then
  usage
  exit 1
fi

mkdir -p "$out_dir"
ts="$(date +%Y%m%d-%H%M%S)"
base="${out_dir}/server-doctor-${host//[^a-zA-Z0-9._-]/_}-${ts}"

ssh_cmd=(ssh -o BatchMode=yes -o ConnectTimeout=10 "$host" 'bash -s')

run_remote_check() {
  local raw_file="$1"
  "${ssh_cmd[@]}" <<'REMOTE' > "$raw_file"
set -euo pipefail

ok(){ printf "%s|pass|%s\n" "$1" "$2"; }
warn(){ printf "%s|warn|%s\n" "$1" "$2"; }
fail(){ printf "%s|fail|%s\n" "$1" "$2"; }

# 1) SSH access + identity
id_line="$(whoami)@$(hostname)"
ok ssh_access "$id_line"

# 2) OS
if [[ -f /etc/os-release ]]; then
  os="$(
    . /etc/os-release
    echo "${PRETTY_NAME:-unknown}"
  )"
  ok os "$os"
else
  warn os "no /etc/os-release"
fi

# 3) SSH hardening
cfg="/etc/ssh/sshd_config"
sshd_effective=""
if command -v sshd >/dev/null 2>&1; then
  sshd_effective="$(sshd -T 2>/dev/null || true)"
fi

if [[ -n "$sshd_effective" ]]; then
  prl="$(awk '$1=="permitrootlogin"{print $2; exit}' <<<"$sshd_effective" || true)"
  pa="$(awk '$1=="passwordauthentication"{print $2; exit}' <<<"$sshd_effective" || true)"
  detail_suffix=" (effective)"
elif [[ -f "$cfg" ]]; then
  prl="$(grep -E "^\s*PermitRootLogin\s+" "$cfg" | tail -1 | awk '{print $2}' || true)"
  pa="$(grep -E "^\s*PasswordAuthentication\s+" "$cfg" | tail -1 | awk '{print $2}' || true)"
  detail_suffix=""
else
  prl=""
  pa=""
  detail_suffix=""
fi

if [[ -n "${prl:-}${pa:-}" ]]; then
  if [[ "${prl,,}" == "no" && "${pa,,}" == "no" ]]; then
    ok ssh_hardening "PermitRootLogin=no, PasswordAuthentication=no${detail_suffix}"
  else
    warn ssh_hardening "PermitRootLogin=${prl:-unset}, PasswordAuthentication=${pa:-unset}${detail_suffix}"
  fi
else
  warn ssh_hardening "no sshd_config"
fi

# 4) Firewall
if command -v ufw >/dev/null 2>&1; then
  st="$(ufw status 2>/dev/null | head -1 || true)"
  if echo "$st" | grep -qi 'active'; then
    ok firewall "$st"
  else
    warn firewall "$st"
  fi
elif command -v firewall-cmd >/dev/null 2>&1; then
  st="$(firewall-cmd --state 2>/dev/null || true)"
  if [[ "$st" == "running" ]]; then
    ok firewall "firewalld running"
  else
    warn firewall "firewalld: ${st:-unknown}"
  fi
else
  warn firewall "no ufw/firewalld"
fi

# 5) fail2ban
if systemctl is-active --quiet fail2ban 2>/dev/null; then
  ok fail2ban "active"
else
  warn fail2ban "inactive"
fi

# 6) Auto updates
if systemctl is-enabled --quiet unattended-upgrades 2>/dev/null || systemctl is-enabled --quiet apt-daily.timer 2>/dev/null || systemctl is-enabled --quiet dnf-automatic.timer 2>/dev/null; then
  ok auto_updates "enabled"
else
  warn auto_updates "not detected"
fi

# 7) Disk
root_used="$(df -P / | awk 'NR==2{gsub("%","");print $5}')"
if [[ -n "${root_used:-}" ]]; then
  if (( root_used < 85 )); then
    ok disk "root used ${root_used}%"
  elif (( root_used < 93 )); then
    warn disk "root used ${root_used}%"
  else
    fail disk "root used ${root_used}%"
  fi
else
  warn disk "unknown"
fi

# 8) Memory
avail_mb="$(free -m | awk '/Mem:/{print $7}')"
if [[ -n "${avail_mb:-}" ]]; then
  if (( avail_mb > 512 )); then
    ok memory "available ${avail_mb}MB"
  elif (( avail_mb > 200 )); then
    warn memory "available ${avail_mb}MB"
  else
    fail memory "available ${avail_mb}MB"
  fi
else
  warn memory "unknown"
fi

# 9) Docker runtime
if command -v docker >/dev/null 2>&1; then
  if systemctl is-active --quiet docker 2>/dev/null; then
    ok docker "installed+active"
  else
    warn docker "installed, service inactive"
  fi
else
  warn docker "not installed"
fi

# 10) Reverse proxy
if systemctl is-active --quiet caddy 2>/dev/null; then
  ok proxy "caddy active"
elif systemctl is-active --quiet nginx 2>/dev/null; then
  ok proxy "nginx active"
else
  warn proxy "no active caddy/nginx"
fi

# 11) Backups signal
if compgen -G "/etc/cron*/*" >/dev/null 2>&1 && (grep -Rsiq "backup" /etc/cron* 2>/dev/null); then
  ok backups "cron backup entry detected"
elif [[ -d /opt/backups || -d /var/backups ]]; then
  warn backups "backup dir exists but schedule not confirmed"
else
  warn backups "no backup evidence"
fi

# 12) Exposed ports summary (warn-only)
ports="$(ss -tulpenH 2>/dev/null | awk '$5 !~ /127\.0\.0\.1|\[::1\]/ {print $1":"$5}' | head -20 | tr '\n' ',' | sed 's/,$//')"
if [[ -n "$ports" ]]; then
  warn exposed_ports "${ports}"
else
  ok exposed_ports "no non-loopback listeners detected"
fi
REMOTE
}

run_remote_fix() {
  local actions_file="$1"
  "${ssh_cmd[@]}" <<'REMOTE' > "$actions_file"
set -euo pipefail

log(){ printf "%s|%s|%s\n" "$1" "$2" "$3"; }

if [[ "$(id -u)" -eq 0 ]]; then
  SUDO=""
else
  SUDO="sudo"
fi

pkg_install() {
  if command -v apt-get >/dev/null 2>&1; then
    $SUDO apt-get update -y >/dev/null 2>&1 || true
    DEBIAN_FRONTEND=noninteractive $SUDO apt-get install -y "$@" >/dev/null 2>&1 || return 1
    return 0
  elif command -v dnf >/dev/null 2>&1; then
    $SUDO dnf install -y "$@" >/dev/null 2>&1 || return 1
    return 0
  elif command -v yum >/dev/null 2>&1; then
    $SUDO yum install -y "$@" >/dev/null 2>&1 || return 1
    return 0
  fi
  return 1
}

ensure_sshd_setting() {
  local key="$1" value="$2" cfg="$3"
  if grep -Eq "^\s*${key}\s+" "$cfg"; then
    $SUDO sed -i -E "s#^\s*${key}\s+.*#${key} ${value}#" "$cfg"
  else
    echo "${key} ${value}" | $SUDO tee -a "$cfg" >/dev/null
  fi
}

# 1) SSH hardening (safe)
cfg="/etc/ssh/sshd_config"
can_harden=0
if [[ -s "$HOME/.ssh/authorized_keys" || -s "/root/.ssh/authorized_keys" ]]; then
  can_harden=1
fi
if [[ -n "${SUDO_USER:-}" && -s "/home/${SUDO_USER}/.ssh/authorized_keys" ]]; then
  can_harden=1
fi

if [[ -f "$cfg" && "$can_harden" -eq 1 ]]; then
  backup="${cfg}.server-doctor.$(date +%s).bak"
  $SUDO cp -a "$cfg" "$backup"
  ensure_sshd_setting "PermitRootLogin" "no" "$cfg"
  ensure_sshd_setting "PasswordAuthentication" "no" "$cfg"
  ensure_sshd_setting "PubkeyAuthentication" "yes" "$cfg"
  if $SUDO sshd -t 2>/dev/null; then
    $SUDO systemctl restart ssh 2>/dev/null || $SUDO systemctl restart sshd 2>/dev/null || true
    log ssh_hardening pass "applied, backup=$backup"
  else
    $SUDO cp -a "$backup" "$cfg"
    log ssh_hardening fail "sshd config invalid, rolled back from backup"
  fi
elif [[ ! -f "$cfg" ]]; then
  log ssh_hardening warn "skipped: no sshd_config"
else
  log ssh_hardening warn "skipped: no authorized_keys evidence"
fi

# 2) Firewall baseline
if command -v ufw >/dev/null 2>&1; then
  $SUDO ufw default deny incoming >/dev/null 2>&1 || true
  $SUDO ufw default allow outgoing >/dev/null 2>&1 || true
  $SUDO ufw allow OpenSSH >/dev/null 2>&1 || $SUDO ufw allow 22/tcp >/dev/null 2>&1 || true
  $SUDO ufw allow 80/tcp >/dev/null 2>&1 || true
  $SUDO ufw allow 443/tcp >/dev/null 2>&1 || true
  yes | $SUDO ufw enable >/dev/null 2>&1 || true
  log firewall pass "ufw baseline applied"
elif command -v firewall-cmd >/dev/null 2>&1; then
  $SUDO systemctl enable --now firewalld >/dev/null 2>&1 || true
  $SUDO firewall-cmd --permanent --add-service=ssh >/dev/null 2>&1 || true
  $SUDO firewall-cmd --permanent --add-service=http >/dev/null 2>&1 || true
  $SUDO firewall-cmd --permanent --add-service=https >/dev/null 2>&1 || true
  $SUDO firewall-cmd --reload >/dev/null 2>&1 || true
  log firewall pass "firewalld baseline applied"
else
  log firewall warn "skipped: ufw/firewalld missing"
fi

# 3) fail2ban enable
if ! command -v fail2ban-client >/dev/null 2>&1; then
  if pkg_install fail2ban; then
    log fail2ban pass "installed"
  else
    log fail2ban warn "install failed"
  fi
fi

if command -v fail2ban-client >/dev/null 2>&1; then
  $SUDO systemctl enable --now fail2ban >/dev/null 2>&1 || true
  if $SUDO systemctl is-active --quiet fail2ban; then
    log fail2ban pass "enabled+active"
  else
    log fail2ban warn "installed but inactive"
  fi
else
  log fail2ban warn "not available"
fi
REMOTE
}

build_check_reports() {
  local raw_path="$1"
  local json_path="$2"
  local md_path="$3"
  local host_name="$4"
  python3 - "$raw_path" "$json_path" "$md_path" "$host_name" <<'PY'
import datetime
import json
import sys

raw_path, json_path, md_path, host = sys.argv[1:5]
rows = []
with open(raw_path, "r", encoding="utf-8") as handle:
    for line in handle:
        line = line.strip()
        if not line or "|" not in line:
            continue
        check, status, detail = line.split("|", 2)
        rows.append({"check": check, "status": status, "detail": detail})

weights = {"pass": 1.0, "warn": 0.5, "fail": 0.0}
score = sum(weights.get(row["status"], 0) for row in rows)
health = round((score / (len(rows) or 1)) * 100)
report = {
    "host": host,
    "generatedAt": datetime.datetime.now(datetime.timezone.utc).isoformat().replace("+00:00", "Z"),
    "healthScore": health,
    "checks": rows,
    "summary": {
        "pass": sum(1 for row in rows if row["status"] == "pass"),
        "warn": sum(1 for row in rows if row["status"] == "warn"),
        "fail": sum(1 for row in rows if row["status"] == "fail"),
    },
}
with open(json_path, "w", encoding="utf-8") as handle:
    json.dump(report, handle, ensure_ascii=False, indent=2)

with open(md_path, "w", encoding="utf-8") as handle:
    handle.write("# Server Doctor Report\n\n")
    handle.write(f"- Host: `{host}`\n")
    handle.write(f"- Generated: `{report['generatedAt']}`\n")
    handle.write(f"- Health score: **{health}/100**\n\n")
    handle.write("| Check | Status | Detail |\n|---|---|---|\n")
    for row in rows:
        emoji = {"pass": "PASS", "warn": "WARN", "fail": "FAIL"}.get(row["status"], "INFO")
        detail = row["detail"].replace("|", "/")
        handle.write(f"| `{row['check']}` | {emoji} {row['status']} | {detail} |\n")
    handle.write("\n## Summary\n")
    handle.write(f"- pass: {report['summary']['pass']}\n")
    handle.write(f"- warn: {report['summary']['warn']}\n")
    handle.write(f"- fail: {report['summary']['fail']}\n")

print(json_path)
print(md_path)
PY
}

build_fix_reports() {
  local before_json="$1"
  local after_json="$2"
  local actions_raw="$3"
  local out_json="$4"
  local out_md="$5"
  python3 - "$before_json" "$after_json" "$actions_raw" "$out_json" "$out_md" <<'PY'
import datetime
import json
import sys

before_path, after_path, actions_path, out_json, out_md = sys.argv[1:6]
before = json.load(open(before_path, "r", encoding="utf-8"))
after = json.load(open(after_path, "r", encoding="utf-8"))
actions = []
with open(actions_path, "r", encoding="utf-8") as handle:
    for line in handle:
        line = line.strip()
        if not line or "|" not in line:
            continue
        action, status, detail = line.split("|", 2)
        actions.append({"action": action, "status": status, "detail": detail})

report = {
    "host": before.get("host"),
    "generatedAt": datetime.datetime.now(datetime.timezone.utc).isoformat().replace("+00:00", "Z"),
    "mode": "fix",
    "beforeHealth": before.get("healthScore"),
    "afterHealth": after.get("healthScore"),
    "deltaHealth": after.get("healthScore", 0) - before.get("healthScore", 0),
    "actions": actions,
    "before": before,
    "after": after,
}
json.dump(report, open(out_json, "w", encoding="utf-8"), ensure_ascii=False, indent=2)

with open(out_md, "w", encoding="utf-8") as handle:
    handle.write("# Server Doctor Fix Report\n\n")
    handle.write(f"- Host: `{report['host']}`\n")
    handle.write(f"- Generated: `{report['generatedAt']}`\n")
    handle.write(f"- Health: **{report['beforeHealth']} -> {report['afterHealth']}** (delta {report['deltaHealth']:+d})\n\n")
    handle.write("## Applied actions\n")
    for action in actions:
        emoji = {"pass": "PASS", "warn": "WARN", "fail": "FAIL"}.get(action["status"], "INFO")
        handle.write(f"- {emoji} `{action['action']}` - {action['detail']}\n")
    handle.write("\n## Post-check summary\n")
    summary = after.get("summary", {})
    handle.write(f"- pass: {summary.get('pass', 0)}\n")
    handle.write(f"- warn: {summary.get('warn', 0)}\n")
    handle.write(f"- fail: {summary.get('fail', 0)}\n")

print(out_json)
print(out_md)
PY
}

case "$mode" in
  check)
    raw="${base}.raw"
    json="${base}.json"
    md="${base}.md"
    run_remote_check "$raw"
    build_check_reports "$raw" "$json" "$md" "$host"
    echo "Done. Artifacts:"
    echo "- $json"
    echo "- $md"
    ;;

  preflight)
    raw="${base}.preflight.raw"
    json="${base}.preflight.json"
    md="${base}.preflight.md"
    run_remote_check "$raw"
    build_check_reports "$raw" "$json" "$md" "$host"
    python3 - "$json" <<'PY'
import json
import sys

path = sys.argv[1]
report = json.load(open(path, "r", encoding="utf-8"))
warn = [check for check in report["checks"] if check["status"] == "warn"]
fail = [check for check in report["checks"] if check["status"] == "fail"]
print("WARN-ONLY PREFLIGHT")
print(
    f"health={report['healthScore']} pass={report['summary']['pass']} "
    f"warn={report['summary']['warn']} fail={report['summary']['fail']}"
)
if fail or warn:
    print("issues:")
    for check in fail + warn:
        print(f"- [{check['status']}] {check['check']}: {check['detail']}")
else:
    print("no warnings/failures")
PY
    echo "Done. Artifacts:"
    echo "- $json"
    echo "- $md"
    ;;

  fix)
    before_raw="${base}.before.raw"
    before_json="${base}.before.json"
    before_md="${base}.before.md"
    actions_raw="${base}.actions.raw"
    after_raw="${base}.after.raw"
    after_json="${base}.after.json"
    after_md="${base}.after.md"
    fix_json="${base}.fix.json"
    fix_md="${base}.fix.md"

    run_remote_check "$before_raw"
    build_check_reports "$before_raw" "$before_json" "$before_md" "$host"

    run_remote_fix "$actions_raw"

    run_remote_check "$after_raw"
    build_check_reports "$after_raw" "$after_json" "$after_md" "$host"

    build_fix_reports "$before_json" "$after_json" "$actions_raw" "$fix_json" "$fix_md"

    echo "Done. Artifacts:"
    echo "- $fix_json"
    echo "- $fix_md"
    echo "- $before_json"
    echo "- $after_json"
    ;;
esac
