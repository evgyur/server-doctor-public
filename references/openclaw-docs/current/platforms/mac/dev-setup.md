<!-- Source: https://docs.openclaw.ai/platforms/mac/dev-setup -->
<!-- Title: macOS Dev Setup - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/mac/dev-setup)

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

-   [macOS Developer Setup](https://docs.openclaw.ai/platforms/mac/dev-setup)
-   [Prerequisites](https://docs.openclaw.ai/platforms/mac/dev-setup)
-   [1\. Install Dependencies](https://docs.openclaw.ai/platforms/mac/dev-setup)
-   [2\. Build and Package the App](https://docs.openclaw.ai/platforms/mac/dev-setup)
-   [3\. Install the CLI](https://docs.openclaw.ai/platforms/mac/dev-setup)
-   [Troubleshooting](https://docs.openclaw.ai/platforms/mac/dev-setup)
-   [Build Fails: Toolchain or SDK Mismatch](https://docs.openclaw.ai/platforms/mac/dev-setup)
-   [App Crashes on Permission Grant](https://docs.openclaw.ai/platforms/mac/dev-setup)
-   [Gateway “Starting…” indefinitely](https://docs.openclaw.ai/platforms/mac/dev-setup)

macOS companion app

# macOS Dev Setup

# 

[​

](https://docs.openclaw.ai/platforms/mac/dev-setup)

macOS Developer Setup

This guide covers the necessary steps to build and run the OpenClaw macOS application from source.

## 

[​

](https://docs.openclaw.ai/platforms/mac/dev-setup)

Prerequisites

Before building the app, ensure you have the following installed:

1.  **Xcode 26.2+**: Required for Swift development.
2.  **Node.js 24 & pnpm**: Recommended for the gateway, CLI, and packaging scripts. Node 22 LTS, currently `22.16+`, remains supported for compatibility.

## 

[​

](https://docs.openclaw.ai/platforms/mac/dev-setup)

1\. Install Dependencies

Install the project-wide dependencies:

Copy

```
pnpm install
```

## 

[​

](https://docs.openclaw.ai/platforms/mac/dev-setup)

2\. Build and Package the App

To build the macOS app and package it into `dist/OpenClaw.app`, run:

Copy

```
./scripts/package-mac-app.sh
```

If you don’t have an Apple Developer ID certificate, the script will automatically use **ad-hoc signing** (`-`). For dev run modes, signing flags, and Team ID troubleshooting, see the macOS app README: [https://github.com/openclaw/openclaw/blob/main/apps/macos/README.md](https://github.com/openclaw/openclaw/blob/main/apps/macos/README.md)

> **Note**: Ad-hoc signed apps may trigger security prompts. If the app crashes immediately with “Abort trap 6”, see the [Troubleshooting](https://docs.openclaw.ai/platforms/mac/dev-setup) section.

## 

[​

](https://docs.openclaw.ai/platforms/mac/dev-setup)

3\. Install the CLI

The macOS app expects a global `openclaw` CLI install to manage background tasks. **To install it (recommended):**

1.  Open the OpenClaw app.
2.  Go to the **General** settings tab.
3.  Click **“Install CLI”**.

Alternatively, install it manually:

Copy

```
npm install -g openclaw@<version>
```

## 

[​

](https://docs.openclaw.ai/platforms/mac/dev-setup)

Troubleshooting

### 

[​

](https://docs.openclaw.ai/platforms/mac/dev-setup)

Build Fails: Toolchain or SDK Mismatch

The macOS app build expects the latest macOS SDK and Swift 6.2 toolchain. **System dependencies (required):**

-   **Latest macOS version available in Software Update** (required by Xcode 26.2 SDKs)
-   **Xcode 26.2** (Swift 6.2 toolchain)

**Checks:**

Copy

```
xcodebuild -version
xcrun swift --version
```

If versions don’t match, update macOS/Xcode and re-run the build.

### 

[​

](https://docs.openclaw.ai/platforms/mac/dev-setup)

App Crashes on Permission Grant

If the app crashes when you try to allow **Speech Recognition** or **Microphone** access, it may be due to a corrupted TCC cache or signature mismatch. **Fix:**

1.  Reset the TCC permissions:
    
    Copy
    
    ```
    tccutil reset All ai.openclaw.mac.debug
    ```
    
2.  If that fails, change the `BUNDLE_ID` temporarily in [`scripts/package-mac-app.sh`](https://github.com/openclaw/openclaw/blob/main/scripts/package-mac-app.sh) to force a “clean slate” from macOS.

### 

[​

](https://docs.openclaw.ai/platforms/mac/dev-setup)

Gateway “Starting…” indefinitely

If the gateway status stays on “Starting…”, check if a zombie process is holding the port:

Copy

```
openclaw gateway status
openclaw gateway stop

# If you’re not using a LaunchAgent (dev mode / manual runs), find the listener:
lsof -nP -iTCP:18789 -sTCP:LISTEN
```

If a manual run is holding the port, stop that process (Ctrl+C). As a last resort, kill the PID you found above.

[Raspberry Pi](https://docs.openclaw.ai/platforms/raspberry-pi)[Menu Bar](https://docs.openclaw.ai/platforms/mac/menu-bar)

⌘I
