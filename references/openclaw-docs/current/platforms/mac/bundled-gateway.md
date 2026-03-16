<!-- Source: https://docs.openclaw.ai/platforms/mac/bundled-gateway -->
<!-- Title: Gateway on macOS - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/mac/bundled-gateway)

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

-   [Gateway on macOS (external launchd)](https://docs.openclaw.ai/platforms/mac/bundled-gateway)
-   [Install the CLI (required for local mode)](https://docs.openclaw.ai/platforms/mac/bundled-gateway)
-   [Launchd (Gateway as LaunchAgent)](https://docs.openclaw.ai/platforms/mac/bundled-gateway)
-   [Version compatibility](https://docs.openclaw.ai/platforms/mac/bundled-gateway)
-   [Smoke check](https://docs.openclaw.ai/platforms/mac/bundled-gateway)

macOS companion app

# Gateway on macOS

# 

[​

](https://docs.openclaw.ai/platforms/mac/bundled-gateway)

Gateway on macOS (external launchd)

OpenClaw.app no longer bundles Node/Bun or the Gateway runtime. The macOS app expects an **external** `openclaw` CLI install, does not spawn the Gateway as a child process, and manages a per‑user launchd service to keep the Gateway running (or attaches to an existing local Gateway if one is already running).

## 

[​

](https://docs.openclaw.ai/platforms/mac/bundled-gateway)

Install the CLI (required for local mode)

Node 24 is the default runtime on the Mac. Node 22 LTS, currently `22.16+`, still works for compatibility. Then install `openclaw` globally:

Copy

```
npm install -g openclaw@<version>
```

The macOS app’s **Install CLI** button runs the same flow via npm/pnpm (bun not recommended for Gateway runtime).

## 

[​

](https://docs.openclaw.ai/platforms/mac/bundled-gateway)

Launchd (Gateway as LaunchAgent)

Label:

-   `ai.openclaw.gateway` (or `ai.openclaw.<profile>`; legacy `com.openclaw.*` may remain)

Plist location (per‑user):

-   `~/Library/LaunchAgents/ai.openclaw.gateway.plist` (or `~/Library/LaunchAgents/ai.openclaw.<profile>.plist`)

Manager:

-   The macOS app owns LaunchAgent install/update in Local mode.
-   The CLI can also install it: `openclaw gateway install`.

Behavior:

-   “OpenClaw Active” enables/disables the LaunchAgent.
-   App quit does **not** stop the gateway (launchd keeps it alive).
-   If a Gateway is already running on the configured port, the app attaches to it instead of starting a new one.

Logging:

-   launchd stdout/err: `/tmp/openclaw/openclaw-gateway.log`

## 

[​

](https://docs.openclaw.ai/platforms/mac/bundled-gateway)

Version compatibility

The macOS app checks the gateway version against its own version. If they’re incompatible, update the global CLI to match the app version.

## 

[​

](https://docs.openclaw.ai/platforms/mac/bundled-gateway)

Smoke check

Copy

```
openclaw --version

OPENCLAW_SKIP_CHANNELS=1 \
OPENCLAW_SKIP_CANVAS_HOST=1 \
openclaw gateway --port 18999 --bind loopback
```

Then:

Copy

```
openclaw gateway call health --url ws://127.0.0.1:18999 --timeout 3000
```

[macOS Signing](https://docs.openclaw.ai/platforms/mac/signing)[macOS IPC](https://docs.openclaw.ai/platforms/mac/xpc)

⌘I
