<!-- Source: https://docs.openclaw.ai/platforms -->
<!-- Title: Platforms - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms)

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

-   [Platforms](https://docs.openclaw.ai/platforms)
-   [Choose your OS](https://docs.openclaw.ai/platforms)
-   [VPS & hosting](https://docs.openclaw.ai/platforms)
-   [Common links](https://docs.openclaw.ai/platforms)
-   [Gateway service install (CLI)](https://docs.openclaw.ai/platforms)

Platforms overview

# Platforms

# 

[​

](https://docs.openclaw.ai/platforms)

Platforms

OpenClaw core is written in TypeScript. **Node is the recommended runtime**. Bun is not recommended for the Gateway (WhatsApp/Telegram bugs). Companion apps exist for macOS (menu bar app) and mobile nodes (iOS/Android). Windows and Linux companion apps are planned, but the Gateway is fully supported today. Native companion apps for Windows are also planned; the Gateway is recommended via WSL2.

## 

[​

](https://docs.openclaw.ai/platforms)

Choose your OS

-   macOS: [macOS](https://docs.openclaw.ai/platforms/macos)
-   iOS: [iOS](https://docs.openclaw.ai/platforms/ios)
-   Android: [Android](https://docs.openclaw.ai/platforms/android)
-   Windows: [Windows](https://docs.openclaw.ai/platforms/windows)
-   Linux: [Linux](https://docs.openclaw.ai/platforms/linux)

## 

[​

](https://docs.openclaw.ai/platforms)

VPS & hosting

-   VPS hub: [VPS hosting](https://docs.openclaw.ai/vps)
-   Fly.io: [Fly.io](https://docs.openclaw.ai/install/fly)
-   Hetzner (Docker): [Hetzner](https://docs.openclaw.ai/install/hetzner)
-   GCP (Compute Engine): [GCP](https://docs.openclaw.ai/install/gcp)
-   exe.dev (VM + HTTPS proxy): [exe.dev](https://docs.openclaw.ai/install/exe-dev)

## 

[​

](https://docs.openclaw.ai/platforms)

Common links

-   Install guide: [Getting Started](https://docs.openclaw.ai/start/getting-started)
-   Gateway runbook: [Gateway](https://docs.openclaw.ai/gateway)
-   Gateway configuration: [Configuration](https://docs.openclaw.ai/gateway/configuration)
-   Service status: `openclaw gateway status`

## 

[​

](https://docs.openclaw.ai/platforms)

Gateway service install (CLI)

Use one of these (all supported):

-   Wizard (recommended): `openclaw onboard --install-daemon`
-   Direct: `openclaw gateway install`
-   Configure flow: `openclaw configure` → select **Gateway service**
-   Repair/migrate: `openclaw doctor` (offers to install or fix the service)

The service target depends on OS:

-   macOS: LaunchAgent (`ai.openclaw.gateway` or `ai.openclaw.<profile>`; legacy `com.openclaw.*`)
-   Linux/WSL2: systemd user service (`openclaw-gateway[-<profile>].service`)

[macOS App](https://docs.openclaw.ai/platforms/macos)

⌘I
