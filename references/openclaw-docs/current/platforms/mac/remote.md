<!-- Source: https://docs.openclaw.ai/platforms/mac/remote -->
<!-- Title: Remote Control - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/mac/remote)

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

-   [Remote OpenClaw (macOS ⇄ remote host)](https://docs.openclaw.ai/platforms/mac/remote)
-   [Modes](https://docs.openclaw.ai/platforms/mac/remote)
-   [Remote transports](https://docs.openclaw.ai/platforms/mac/remote)
-   [Prereqs on the remote host](https://docs.openclaw.ai/platforms/mac/remote)
-   [macOS app setup](https://docs.openclaw.ai/platforms/mac/remote)
-   [Web Chat](https://docs.openclaw.ai/platforms/mac/remote)
-   [Permissions](https://docs.openclaw.ai/platforms/mac/remote)
-   [Security notes](https://docs.openclaw.ai/platforms/mac/remote)
-   [WhatsApp login flow (remote)](https://docs.openclaw.ai/platforms/mac/remote)
-   [Troubleshooting](https://docs.openclaw.ai/platforms/mac/remote)
-   [Notification sounds](https://docs.openclaw.ai/platforms/mac/remote)

macOS companion app

# Remote Control

# 

[​

](https://docs.openclaw.ai/platforms/mac/remote)

Remote OpenClaw (macOS ⇄ remote host)

This flow lets the macOS app act as a full remote control for a OpenClaw gateway running on another host (desktop/server). It’s the app’s **Remote over SSH** (remote run) feature. All features—health checks, Voice Wake forwarding, and Web Chat—reuse the same remote SSH configuration from _Settings → General_.

## 

[​

](https://docs.openclaw.ai/platforms/mac/remote)

Modes

-   **Local (this Mac)**: Everything runs on the laptop. No SSH involved.
-   **Remote over SSH (default)**: OpenClaw commands are executed on the remote host. The mac app opens an SSH connection with `-o BatchMode` plus your chosen identity/key and a local port-forward.
-   **Remote direct (ws/wss)**: No SSH tunnel. The mac app connects to the gateway URL directly (for example, via Tailscale Serve or a public HTTPS reverse proxy).

## 

[​

](https://docs.openclaw.ai/platforms/mac/remote)

Remote transports

Remote mode supports two transports:

-   **SSH tunnel** (default): Uses `ssh -N -L ...` to forward the gateway port to localhost. The gateway will see the node’s IP as `127.0.0.1` because the tunnel is loopback.
-   **Direct (ws/wss)**: Connects straight to the gateway URL. The gateway sees the real client IP.

## 

[​

](https://docs.openclaw.ai/platforms/mac/remote)

Prereqs on the remote host

1.  Install Node + pnpm and build/install the OpenClaw CLI (`pnpm install && pnpm build && pnpm link --global`).
2.  Ensure `openclaw` is on PATH for non-interactive shells (symlink into `/usr/local/bin` or `/opt/homebrew/bin` if needed).
3.  Open SSH with key auth. We recommend **Tailscale** IPs for stable reachability off-LAN.

## 

[​

](https://docs.openclaw.ai/platforms/mac/remote)

macOS app setup

1.  Open _Settings → General_.
2.  Under **OpenClaw runs**, pick **Remote over SSH** and set:
    -   **Transport**: **SSH tunnel** or **Direct (ws/wss)**.
    -   **SSH target**: `user@host` (optional `:port`).
        -   If the gateway is on the same LAN and advertises Bonjour, pick it from the discovered list to auto-fill this field.
    -   **Gateway URL** (Direct only): `wss://gateway.example.ts.net` (or `ws://...` for local/LAN).
    -   **Identity file** (advanced): path to your key.
    -   **Project root** (advanced): remote checkout path used for commands.
    -   **CLI path** (advanced): optional path to a runnable `openclaw` entrypoint/binary (auto-filled when advertised).
3.  Hit **Test remote**. Success indicates the remote `openclaw status --json` runs correctly. Failures usually mean PATH/CLI issues; exit 127 means the CLI isn’t found remotely.
4.  Health checks and Web Chat will now run through this SSH tunnel automatically.

## 

[​

](https://docs.openclaw.ai/platforms/mac/remote)

Web Chat

-   **SSH tunnel**: Web Chat connects to the gateway over the forwarded WebSocket control port (default 18789).
-   **Direct (ws/wss)**: Web Chat connects straight to the configured gateway URL.
-   There is no separate WebChat HTTP server anymore.

## 

[​

](https://docs.openclaw.ai/platforms/mac/remote)

Permissions

-   The remote host needs the same TCC approvals as local (Automation, Accessibility, Screen Recording, Microphone, Speech Recognition, Notifications). Run onboarding on that machine to grant them once.
-   Nodes advertise their permission state via `node.list` / `node.describe` so agents know what’s available.

## 

[​

](https://docs.openclaw.ai/platforms/mac/remote)

Security notes

-   Prefer loopback binds on the remote host and connect via SSH or Tailscale.
-   SSH tunneling uses strict host-key checking; trust the host key first so it exists in `~/.ssh/known_hosts`.
-   If you bind the Gateway to a non-loopback interface, require token/password auth.
-   See [Security](https://docs.openclaw.ai/gateway/security) and [Tailscale](https://docs.openclaw.ai/gateway/tailscale).

## 

[​

](https://docs.openclaw.ai/platforms/mac/remote)

WhatsApp login flow (remote)

-   Run `openclaw channels login --verbose` **on the remote host**. Scan the QR with WhatsApp on your phone.
-   Re-run login on that host if auth expires. Health check will surface link problems.

## 

[​

](https://docs.openclaw.ai/platforms/mac/remote)

Troubleshooting

-   **exit 127 / not found**: `openclaw` isn’t on PATH for non-login shells. Add it to `/etc/paths`, your shell rc, or symlink into `/usr/local/bin`/`/opt/homebrew/bin`.
-   **Health probe failed**: check SSH reachability, PATH, and that Baileys is logged in (`openclaw status --json`).
-   **Web Chat stuck**: confirm the gateway is running on the remote host and the forwarded port matches the gateway WS port; the UI requires a healthy WS connection.
-   **Node IP shows 127.0.0.1**: expected with the SSH tunnel. Switch **Transport** to **Direct (ws/wss)** if you want the gateway to see the real client IP.
-   **Voice Wake**: trigger phrases are forwarded automatically in remote mode; no separate forwarder is needed.

## 

[​

](https://docs.openclaw.ai/platforms/mac/remote)

Notification sounds

Pick sounds per notification from scripts with `openclaw` and `node.invoke`, e.g.:

Copy

```
openclaw nodes notify --node <id> --title "Ping" --body "Remote gateway ready" --sound Glass
```

There is no global “default sound” toggle in the app anymore; callers choose a sound (or none) per request.

[macOS Permissions](https://docs.openclaw.ai/platforms/mac/permissions)[macOS Signing](https://docs.openclaw.ai/platforms/mac/signing)

⌘I
