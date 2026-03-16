<!-- Source: https://docs.openclaw.ai/platforms/linux -->
<!-- Title: Linux App - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/linux)

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

-   [Linux App](https://docs.openclaw.ai/platforms/linux)
-   [Beginner quick path (VPS)](https://docs.openclaw.ai/platforms/linux)
-   [Install](https://docs.openclaw.ai/platforms/linux)
-   [Gateway](https://docs.openclaw.ai/platforms/linux)
-   [Gateway service install (CLI)](https://docs.openclaw.ai/platforms/linux)
-   [System control (systemd user unit)](https://docs.openclaw.ai/platforms/linux)

Platforms overview

# Linux App

# 

[​

](https://docs.openclaw.ai/platforms/linux)

Linux App

The Gateway is fully supported on Linux. **Node is the recommended runtime**. Bun is not recommended for the Gateway (WhatsApp/Telegram bugs). Native Linux companion apps are planned. Contributions are welcome if you want to help build one.

## 

[​

](https://docs.openclaw.ai/platforms/linux)

Beginner quick path (VPS)

1.  Install Node 24 (recommended; Node 22 LTS, currently `22.16+`, still works for compatibility)
2.  `npm i -g openclaw@latest`
3.  `openclaw onboard --install-daemon`
4.  From your laptop: `ssh -N -L 18789:127.0.0.1:18789 <user>@<host>`
5.  Open `http://127.0.0.1:18789/` and paste your token

Step-by-step VPS guide: [exe.dev](https://docs.openclaw.ai/install/exe-dev)

## 

[​

](https://docs.openclaw.ai/platforms/linux)

Install

-   [Getting Started](https://docs.openclaw.ai/start/getting-started)
-   [Install & updates](https://docs.openclaw.ai/install/updating)
-   Optional flows: [Bun (experimental)](https://docs.openclaw.ai/install/bun), [Nix](https://docs.openclaw.ai/install/nix), [Docker](https://docs.openclaw.ai/install/docker)

## 

[​

](https://docs.openclaw.ai/platforms/linux)

Gateway

-   [Gateway runbook](https://docs.openclaw.ai/gateway)
-   [Configuration](https://docs.openclaw.ai/gateway/configuration)

## 

[​

](https://docs.openclaw.ai/platforms/linux)

Gateway service install (CLI)

Use one of these:

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

](https://docs.openclaw.ai/platforms/linux)

System control (systemd user unit)

OpenClaw installs a systemd **user** service by default. Use a **system** service for shared or always-on servers. The full unit example and guidance live in the [Gateway runbook](https://docs.openclaw.ai/gateway). Minimal setup: Create `~/.config/systemd/user/openclaw-gateway[-<profile>].service`:

Copy

```
[Unit]
Description=OpenClaw Gateway (profile: <profile>, v<version>)
After=network-online.target
Wants=network-online.target

[Service]
ExecStart=/usr/local/bin/openclaw gateway --port 18789
Restart=always
RestartSec=5

[Install]
WantedBy=default.target
```

Enable it:

Copy

```
systemctl --user enable --now openclaw-gateway[-<profile>].service
```

[macOS App](https://docs.openclaw.ai/platforms/macos)[Windows (WSL2)](https://docs.openclaw.ai/platforms/windows)

⌘I
