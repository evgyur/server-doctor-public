<!-- Source: https://docs.openclaw.ai/platforms/mac/child-process -->
<!-- Title: Gateway Lifecycle - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/mac/child-process)

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

-   [Gateway lifecycle on macOS](https://docs.openclaw.ai/platforms/mac/child-process)
-   [Default behavior (launchd)](https://docs.openclaw.ai/platforms/mac/child-process)
-   [Unsigned dev builds](https://docs.openclaw.ai/platforms/mac/child-process)
-   [Attach-only mode](https://docs.openclaw.ai/platforms/mac/child-process)
-   [Remote mode](https://docs.openclaw.ai/platforms/mac/child-process)
-   [Why we prefer launchd](https://docs.openclaw.ai/platforms/mac/child-process)

macOS companion app

# Gateway Lifecycle

# 

[​

](https://docs.openclaw.ai/platforms/mac/child-process)

Gateway lifecycle on macOS

The macOS app **manages the Gateway via launchd** by default and does not spawn the Gateway as a child process. It first tries to attach to an already‑running Gateway on the configured port; if none is reachable, it enables the launchd service via the external `openclaw` CLI (no embedded runtime). This gives you reliable auto‑start at login and restart on crashes. Child‑process mode (Gateway spawned directly by the app) is **not in use** today. If you need tighter coupling to the UI, run the Gateway manually in a terminal.

## 

[​

](https://docs.openclaw.ai/platforms/mac/child-process)

Default behavior (launchd)

-   The app installs a per‑user LaunchAgent labeled `ai.openclaw.gateway` (or `ai.openclaw.<profile>` when using `--profile`/`OPENCLAW_PROFILE`; legacy `com.openclaw.*` is supported).
-   When Local mode is enabled, the app ensures the LaunchAgent is loaded and starts the Gateway if needed.
-   Logs are written to the launchd gateway log path (visible in Debug Settings).

Common commands:

Copy

```
launchctl kickstart -k gui/$UID/ai.openclaw.gateway
launchctl bootout gui/$UID/ai.openclaw.gateway
```

Replace the label with `ai.openclaw.<profile>` when running a named profile.

## 

[​

](https://docs.openclaw.ai/platforms/mac/child-process)

Unsigned dev builds

`scripts/restart-mac.sh --no-sign` is for fast local builds when you don’t have signing keys. To prevent launchd from pointing at an unsigned relay binary, it:

-   Writes `~/.openclaw/disable-launchagent`.

Signed runs of `scripts/restart-mac.sh` clear this override if the marker is present. To reset manually:

Copy

```
rm ~/.openclaw/disable-launchagent
```

## 

[​

](https://docs.openclaw.ai/platforms/mac/child-process)

Attach-only mode

To force the macOS app to **never install or manage launchd**, launch it with `--attach-only` (or `--no-launchd`). This sets `~/.openclaw/disable-launchagent`, so the app only attaches to an already running Gateway. You can toggle the same behavior in Debug Settings.

## 

[​

](https://docs.openclaw.ai/platforms/mac/child-process)

Remote mode

Remote mode never starts a local Gateway. The app uses an SSH tunnel to the remote host and connects over that tunnel.

## 

[​

](https://docs.openclaw.ai/platforms/mac/child-process)

Why we prefer launchd

-   Auto‑start at login.
-   Built‑in restart/KeepAlive semantics.
-   Predictable logs and supervision.

If a true child‑process mode is ever needed again, it should be documented as a separate, explicit dev‑only mode.

[Canvas](https://docs.openclaw.ai/platforms/mac/canvas)[Health Checks](https://docs.openclaw.ai/platforms/mac/health)

⌘I
