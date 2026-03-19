---
name: chip-mac-mini
description: Use when a mac mini should send general traffic through a Tailscale exit node and run Claude Desktop or Claude Code through a separate tailnet proxy, without exposing environment-specific IPs, users, paths, or secrets.
---

# Chip Mac Mini

Public-safe runbook for a two-layer setup:

- a Linux host acts as a Tailscale exit node for a mac mini
- the same or another tailnet host runs a lightweight HTTP proxy for `Claude.app`

This skill is intentionally generic. Replace placeholders with your own hostnames, Tailscale IPs, users, labels, and credentials.

## Gather First

Before changing anything, collect:

- Linux host that will provide internet egress
- mac mini that should use that egress
- Tailscale IP or MagicDNS name of the Linux host
- tailnet admin access or API access to approve routes
- macOS GUI access for the mac mini

## 1. Make the Linux Host an Exit Node

Enable forwarding:

```bash
sudo tee /etc/sysctl.d/99-tailscale-exit-node.conf >/dev/null <<'EOF'
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1
EOF
sudo sysctl --system
```

Advertise the exit node:

```bash
sudo tailscale set --advertise-exit-node=true
sudo tailscale debug prefs | jq '.AdvertiseRoutes'
sudo tailscale status
```

Approve `0.0.0.0/0` and `::/0` in the Tailscale admin console or API.

## 2. Point the Mac Mini at the Exit Node

Use the full Tailscale path on macOS:

```bash
sudo /Applications/Tailscale.app/Contents/MacOS/Tailscale set \
  --exit-node=<exit-node-ts-ip-or-magicdns> \
  --exit-node-allow-lan-access=true
```

Verify:

```bash
/Applications/Tailscale.app/Contents/MacOS/Tailscale status --json
route -n get default
python3 - <<'PY'
import urllib.request
print(urllib.request.urlopen("https://api.ipify.org", timeout=10).read().decode())
PY
```

Expected result:

- `BackendState` is `Running`
- `ExitNodeStatus` points at the chosen exit node
- the public IP is now the exit-node host's egress IP

## 3. Run a Claude Proxy on the Tailnet Host

Install `tinyproxy`:

```bash
sudo apt-get update
sudo apt-get install -y tinyproxy
```

Minimal config pattern:

```conf
User tinyproxy
Group tinyproxy
Port 3128
Listen <proxy-host-ts-ip>
Timeout 600
LogFile "/var/log/tinyproxy/tinyproxy.log"
LogLevel Info
MaxClients 100
Allow 127.0.0.1
Allow ::1
Allow <mac-mini-ts-ip>
DisableViaHeader Yes
ViaProxyName "claude-ts-proxy"
```

Restart and verify:

```bash
sudo systemctl restart tinyproxy
sudo systemctl is-active tinyproxy
sudo ss -ltnp | grep '<proxy-host-ts-ip>:3128'
```

Keep the proxy bound only to the Tailscale IP and restrict `Allow` to the intended client.

## 4. Create a Claude Launcher on macOS

Use a script that starts the app binary directly:

```bash
#!/bin/zsh
set -euo pipefail
PROXY_URL="http://<proxy-host-ts-ip>:3128"
APP="/Applications/Claude.app/Contents/MacOS/Claude"
export HTTP_PROXY="$PROXY_URL"
export HTTPS_PROXY="$PROXY_URL"
export ALL_PROXY="$PROXY_URL"
export NO_PROXY="127.0.0.1,localhost"
export http_proxy="$HTTP_PROXY"
export https_proxy="$HTTPS_PROXY"
export all_proxy="$ALL_PROXY"
export no_proxy="$NO_PROXY"
export NODE_USE_ENV_PROXY=1
pkill -f "$APP" >/dev/null 2>&1 || true
sleep 2
nohup "$APP" \
  --proxy-server="$PROXY_URL" \
  --proxy-bypass-list="localhost;127.0.0.1" \
  >/tmp/claude-via-tailscale-proxy.log 2>&1 &
```

Why both layers matter:

- `--proxy-server=...` covers Electron / Chromium traffic
- proxy env plus `NODE_USE_ENV_PROXY=1` cover embedded Claude Code / Node traffic

## 5. Autostart with launchd

Use a user `LaunchAgent` with:

- `RunAtLoad = true`
- `LimitLoadToSessionType = Aqua`
- `ProgramArguments` pointing at `/Applications/Claude.app/Contents/MacOS/Claude`
- proxy args
- proxy environment variables

Load it with:

```bash
launchctl bootout gui/$(id -u)/<label> >/dev/null 2>&1 || true
launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/<label>.plist
launchctl kickstart -k gui/$(id -u)/<label>
```

## 6. Optional Desktop and Dock Shortcut

If the operator wants a normal icon:

- create a small `.app` wrapper that calls the launcher script
- place it in `~/Applications`
- add a symlink to Desktop
- drag the wrapper app into the Dock

## Verification

On macOS:

```bash
launchctl print gui/$(id -u)/<label> | sed -n '1,120p'
pgrep -f '/Applications/Claude.app/Contents/MacOS/Claude' | xargs -I{} ps eww -p {}
```

Expected indicators:

- process args contain `--proxy-server=...`
- process env contains `HTTP_PROXY`, `HTTPS_PROXY`, `ALL_PROXY`
- `NODE_USE_ENV_PROXY=1` is present

On the proxy host:

```bash
sudo tail -n 40 /var/log/tinyproxy/tinyproxy.log
```

Expected indicators:

- `CONNECT` lines from the mac mini Tailscale IP
- requests to `api.anthropic.com`, `a-cdn.claude.ai`, `s-cdn.anthropic.com`, or similar Claude endpoints

## Common Failure Mode

If `Claude.app` is launched from the original Dock/Finder icon instead of the dedicated launcher or LaunchAgent, it can bypass the intended proxy env. In that case, restart it through the managed launcher path.
