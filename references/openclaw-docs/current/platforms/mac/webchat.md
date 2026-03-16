<!-- Source: https://docs.openclaw.ai/platforms/mac/webchat -->
<!-- Title: WebChat - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/mac/webchat)

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

-   [WebChat (macOS app)](https://docs.openclaw.ai/platforms/mac/webchat)
-   [Launch & debugging](https://docs.openclaw.ai/platforms/mac/webchat)
-   [How it’s wired](https://docs.openclaw.ai/platforms/mac/webchat)
-   [Security surface](https://docs.openclaw.ai/platforms/mac/webchat)
-   [Known limitations](https://docs.openclaw.ai/platforms/mac/webchat)

macOS companion app

# WebChat

# 

[​

](https://docs.openclaw.ai/platforms/mac/webchat)

WebChat (macOS app)

The macOS menu bar app embeds the WebChat UI as a native SwiftUI view. It connects to the Gateway and defaults to the **main session** for the selected agent (with a session switcher for other sessions).

-   **Local mode**: connects directly to the local Gateway WebSocket.
-   **Remote mode**: forwards the Gateway control port over SSH and uses that tunnel as the data plane.

## 

[​

](https://docs.openclaw.ai/platforms/mac/webchat)

Launch & debugging

-   Manual: Lobster menu → “Open Chat”.
-   Auto‑open for testing:
    
    Copy
    
    ```
    dist/OpenClaw.app/Contents/MacOS/OpenClaw --webchat
    ```
    
-   Logs: `./scripts/clawlog.sh` (subsystem `ai.openclaw`, category `WebChatSwiftUI`).

## 

[​

](https://docs.openclaw.ai/platforms/mac/webchat)

How it’s wired

-   Data plane: Gateway WS methods `chat.history`, `chat.send`, `chat.abort`, `chat.inject` and events `chat`, `agent`, `presence`, `tick`, `health`.
-   Session: defaults to the primary session (`main`, or `global` when scope is global). The UI can switch between sessions.
-   Onboarding uses a dedicated session to keep first‑run setup separate.

## 

[​

](https://docs.openclaw.ai/platforms/mac/webchat)

Security surface

-   Remote mode forwards only the Gateway WebSocket control port over SSH.

## 

[​

](https://docs.openclaw.ai/platforms/mac/webchat)

Known limitations

-   The UI is optimized for chat sessions (not a full browser sandbox).

[Voice Overlay](https://docs.openclaw.ai/platforms/mac/voice-overlay)[Canvas](https://docs.openclaw.ai/platforms/mac/canvas)

⌘I
