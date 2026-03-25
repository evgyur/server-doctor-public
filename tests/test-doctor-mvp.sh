#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
helper="$repo_root/scripts/doctor-mvp.sh"

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

fake_bin="$tmpdir/fake-bin"
mkdir -p "$fake_bin" "$tmpdir/out"

cat > "$fake_bin/ssh" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
cat >/dev/null
cat <<'OUT'
ssh_access|pass|operator@public-host
os|pass|Ubuntu 24.04.2 LTS
ssh_hardening|warn|PermitRootLogin=yes, PasswordAuthentication=yes (effective)
firewall|pass|Status: active
fail2ban|pass|active
auto_updates|pass|enabled
disk|pass|root used 10%
memory|pass|available 4096MB
docker|warn|not installed
proxy|warn|no active caddy/nginx
backups|warn|no backup evidence
exposed_ports|pass|no non-loopback listeners detected
OUT
EOF

chmod +x "$fake_bin/ssh"

PATH="$fake_bin:$PATH" \
  "$helper" check example-host "$tmpdir/out" > "$tmpdir/run.log"

json_report="$(find "$tmpdir/out" -name 'server-doctor-example-host-*.json' | head -1)"
md_report="$(find "$tmpdir/out" -name 'server-doctor-example-host-*.md' | head -1)"

test -n "$json_report"
test -n "$md_report"

python3 - "$json_report" "$md_report" <<'PY'
import json
import sys
from pathlib import Path

report = json.loads(Path(sys.argv[1]).read_text(encoding="utf-8"))
markdown = Path(sys.argv[2]).read_text(encoding="utf-8")

assert report["host"] == "example-host", report
assert report["summary"] == {"pass": 8, "warn": 4, "fail": 0}, report
ssh_entry = next(item for item in report["checks"] if item["check"] == "ssh_hardening")
assert ssh_entry["status"] == "warn", ssh_entry
assert "PermitRootLogin=yes" in ssh_entry["detail"], ssh_entry
assert "PasswordAuthentication=yes" in ssh_entry["detail"], ssh_entry
assert "# Server Doctor Report" in markdown, markdown
assert "`ssh_hardening`" in markdown, markdown
assert "**83/100**" in markdown, markdown
PY

echo "ok"
