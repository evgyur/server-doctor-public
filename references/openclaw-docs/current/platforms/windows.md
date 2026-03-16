<!-- Source: https://docs.openclaw.ai/platforms/windows -->
<!-- Title: Windows (WSL2) - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/windows)

[OpenClaw home page![light logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)![dark logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)](https://docs.openclaw.ai/)

[Get started

](https://docs.openclaw.ai/)[Install

](https://docs.openclaw.ai/install)[Channels

](https://docs.openclaw.ai/channels)[Agents

](https://docs.openclaw.ai/pi)[Tools

](https://docs.openclaw.ai/tools)[Models

](https://docs.openclaw.ai/providers)[Platforms

](https://docs.openclaw.ai/platforms)[Gateway & Ops

](https://docs.openclaw.ai/gateway)[Reference

](https://docs.openclaw.ai/cli)[Help

](https://docs.openclaw.ai/help)

##### Platforms overview

-   [
    
    Platforms
    
    
    
    ](https://docs.openclaw.ai/platforms)
-   [
    
    macOS App
    
    
    
    ](https://docs.openclaw.ai/platforms/macos)
-   [
    
    Linux App
    
    
    
    ](https://docs.openclaw.ai/platforms/linux)
-   [
    
    Windows (WSL2)
    
    
    
    ](https://docs.openclaw.ai/platforms/windows)
-   [
    
    Android App
    
    
    
    ](https://docs.openclaw.ai/platforms/android)
-   [
    
    iOS App
    
    
    
    ](https://docs.openclaw.ai/platforms/ios)
-   [
    
    DigitalOcean
    
    
    
    ](https://docs.openclaw.ai/platforms/digitalocean)
-   [
    
    Oracle Cloud
    
    
    
    ](https://docs.openclaw.ai/platforms/oracle)
-   [
    
    Raspberry Pi
    
    
    
    ](https://docs.openclaw.ai/platforms/raspberry-pi)

##### macOS companion app

-   [
    
    macOS Dev Setup
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/dev-setup)
-   [
    
    Menu Bar
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/menu-bar)
-   [
    
    Voice Wake
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/voicewake)
-   [
    
    Voice Overlay
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/voice-overlay)
-   [
    
    WebChat
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/webchat)
-   [
    
    Canvas
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/canvas)
-   [
    
    Gateway Lifecycle
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/child-process)
-   [
    
    Health Checks
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/health)
-   [
    
    Menu Bar Icon
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/icon)
-   [
    
    macOS Logging
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/logging)
-   [
    
    macOS Permissions
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/permissions)
-   [
    
    Remote Control
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/remote)
-   [
    
    macOS Signing
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/signing)
-   [
    
    Gateway on macOS
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/bundled-gateway)
-   [
    
    macOS IPC
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/xpc)
-   [
    
    Skills
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/skills)
-   [
    
    Peekaboo Bridge
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/peekaboo)

-   [Windows (WSL2)](https://docs.openclaw.ai/platforms/windows)
-   [Install (WSL2)](https://docs.openclaw.ai/platforms/windows)
-   [Native Windows status](https://docs.openclaw.ai/platforms/windows)
-   [Gateway](https://docs.openclaw.ai/platforms/windows)
-   [Gateway service install (CLI)](https://docs.openclaw.ai/platforms/windows)
-   [Gateway auto-start before Windows login](https://docs.openclaw.ai/platforms/windows)
-   [1) Keep user services running without login](https://docs.openclaw.ai/platforms/windows)
-   [2) Install the OpenClaw gateway user service](https://docs.openclaw.ai/platforms/windows)
-   [3) Start WSL automatically at Windows boot](https://docs.openclaw.ai/platforms/windows)
-   [Verify startup chain](https://docs.openclaw.ai/platforms/windows)
-   [Advanced: expose WSL services over LAN (portproxy)](https://docs.openclaw.ai/platforms/windows)
-   [Step-by-step WSL2 install](https://docs.openclaw.ai/platforms/windows)
-   [1) Install WSL2 + Ubuntu](https://docs.openclaw.ai/platforms/windows)
-   [2) Enable systemd (required for gateway install)](https://docs.openclaw.ai/platforms/windows)
-   [3) Install OpenClaw (inside WSL)](https://docs.openclaw.ai/platforms/windows)
-   [Windows companion app](https://docs.openclaw.ai/platforms/windows)

Platforms overview

# Windows (WSL2)

# 

[​

](https://docs.openclaw.ai/platforms/windows)

Windows (WSL2)

OpenClaw on Windows is recommended **via WSL2** (Ubuntu recommended). The CLI + Gateway run inside Linux, which keeps the runtime consistent and makes tooling far more compatible (Node/Bun/pnpm, Linux binaries, skills). Native Windows might be trickier. WSL2 gives you the full Linux experience — one command to install: `wsl --install`. Native Windows companion apps are planned.

## 

[​

](https://docs.openclaw.ai/platforms/windows)

Install (WSL2)

-   [Getting Started](https://docs.openclaw.ai/start/getting-started) (use inside WSL)
-   [Install & updates](https://docs.openclaw.ai/install/updating)
-   Official WSL2 guide (Microsoft): [https://learn.microsoft.com/windows/wsl/install](https://learn.microsoft.com/windows/wsl/install)

## 

[​

](https://docs.openclaw.ai/platforms/windows)

Native Windows status

Native Windows CLI flows are improving, but WSL2 is still the recommended path. What works well on native Windows today:

-   website installer via `install.ps1`
-   local CLI use such as `openclaw --version`, `openclaw doctor`, and `openclaw plugins list --json`
-   embedded local-agent/provider smoke such as:

Copy

```
openclaw agent --local --agent main --thinking low -m "Reply with exactly WINDOWS-HATCH-OK."
```

Current caveats:

-   `openclaw onboard --non-interactive` still expects a reachable local gateway unless you pass `--skip-health`
-   `openclaw onboard --non-interactive --install-daemon` and `openclaw gateway install` try Windows Scheduled Tasks first
-   if Scheduled Task creation is denied, OpenClaw falls back to a per-user Startup-folder login item and starts the gateway immediately
-   if `schtasks` itself wedges or stops responding, OpenClaw now aborts that path quickly and falls back instead of hanging forever
-   Scheduled Tasks are still preferred when available because they provide better supervisor status

If you want the native CLI only, without gateway service install, use one of these:

Copy

```
openclaw onboard --non-interactive --skip-health
openclaw gateway run
```

If you do want managed startup on native Windows:

Copy

```
openclaw gateway install
openclaw gateway status --json
```

If Scheduled Task creation is blocked, the fallback service mode still auto-starts after login through the current user’s Startup folder.

## 

[​

](https://docs.openclaw.ai/platforms/windows)

Gateway

-   [Gateway runbook](https://docs.openclaw.ai/gateway)
-   [Configuration](https://docs.openclaw.ai/gateway/configuration)

## 

[​

](https://docs.openclaw.ai/platforms/windows)

Gateway service install (CLI)

Inside WSL2:

Copy

```
openclaw onboard --install-daemon
```

Or:

Copy

```
openclaw gateway install
```

Or:

Copy

```
openclaw configure
```

Select **Gateway service** when prompted. Repair/migrate:

Copy

```
openclaw doctor
```

## 

[​

](https://docs.openclaw.ai/platforms/windows)

Gateway auto-start before Windows login

For headless setups, ensure the full boot chain runs even when no one logs into Windows.

### 

[​

](https://docs.openclaw.ai/platforms/windows)

1) Keep user services running without login

Inside WSL:

Copy

```
sudo loginctl enable-linger "$(whoami)"
```

### 

[​

](https://docs.openclaw.ai/platforms/windows)

2) Install the OpenClaw gateway user service

Inside WSL:

Copy

```
openclaw gateway install
```

### 

[​

](https://docs.openclaw.ai/platforms/windows)

3) Start WSL automatically at Windows boot

In PowerShell as Administrator:

Copy

```
schtasks /create /tn "WSL Boot" /tr "wsl.exe -d Ubuntu --exec /bin/true" /sc onstart /ru SYSTEM
```

Replace `Ubuntu` with your distro name from:

Copy

```
wsl --list --verbose
```

### 

[​

](https://docs.openclaw.ai/platforms/windows)

Verify startup chain

After a reboot (before Windows sign-in), check from WSL:

Copy

```
systemctl --user is-enabled openclaw-gateway
systemctl --user status openclaw-gateway --no-pager
```

## 

[​

](https://docs.openclaw.ai/platforms/windows)

Advanced: expose WSL services over LAN (portproxy)

WSL has its own virtual network. If another machine needs to reach a service running **inside WSL** (SSH, a local TTS server, or the Gateway), you must forward a Windows port to the current WSL IP. The WSL IP changes after restarts, so you may need to refresh the forwarding rule. Example (PowerShell **as Administrator**):

Copy

```
$Distro = "Ubuntu-24.04"
$ListenPort = 2222
$TargetPort = 22

$WslIp = (wsl -d $Distro -- hostname -I).Trim().Split(" ")[0]
if (-not $WslIp) { throw "WSL IP not found." }

netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=$ListenPort `
  connectaddress=$WslIp connectport=$TargetPort
```

Allow the port through Windows Firewall (one-time):

Copy

```
New-NetFirewallRule -DisplayName "WSL SSH $ListenPort" -Direction Inbound `
  -Protocol TCP -LocalPort $ListenPort -Action Allow
```

Refresh the portproxy after WSL restarts:

Copy

```
netsh interface portproxy delete v4tov4 listenport=$ListenPort listenaddress=0.0.0.0 | Out-Null
netsh interface portproxy add v4tov4 listenport=$ListenPort listenaddress=0.0.0.0 `
  connectaddress=$WslIp connectport=$TargetPort | Out-Null
```

Notes:

-   SSH from another machine targets the **Windows host IP** (example: `ssh user@windows-host -p 2222`).
-   Remote nodes must point at a **reachable** Gateway URL (not `127.0.0.1`); use `openclaw status --all` to confirm.
-   Use `listenaddress=0.0.0.0` for LAN access; `127.0.0.1` keeps it local only.
-   If you want this automatic, register a Scheduled Task to run the refresh step at login.

## 

[​

](https://docs.openclaw.ai/platforms/windows)

Step-by-step WSL2 install

### 

[​

](https://docs.openclaw.ai/platforms/windows)

1) Install WSL2 + Ubuntu

Open PowerShell (Admin):

Copy

```
wsl --install
# Or pick a distro explicitly:
wsl --list --online
wsl --install -d Ubuntu-24.04
```

Reboot if Windows asks.

### 

[​

](https://docs.openclaw.ai/platforms/windows)

2) Enable systemd (required for gateway install)

In your WSL terminal:

Copy

```
sudo tee /etc/wsl.conf >/dev/null <<'EOF'
[boot]
systemd=true
EOF
```

Then from PowerShell:

Copy

```
wsl --shutdown
```

Re-open Ubuntu, then verify:

Copy

```
systemctl --user status
```

### 

[​

](https://docs.openclaw.ai/platforms/windows)

3) Install OpenClaw (inside WSL)

Follow the Linux Getting Started flow inside WSL:

Copy

```
git clone https://github.com/openclaw/openclaw.git
cd openclaw
pnpm install
pnpm ui:build # auto-installs UI deps on first run
pnpm build
openclaw onboard
```

Full guide: [Getting Started](https://docs.openclaw.ai/start/getting-started)

## 

[​

](https://docs.openclaw.ai/platforms/windows)

Windows companion app

We do not have a Windows companion app yet. Contributions are welcome if you want contributions to make it happen.

[Linux App](https://docs.openclaw.ai/platforms/linux)[Android App](https://docs.openclaw.ai/platforms/android)

⌘I
