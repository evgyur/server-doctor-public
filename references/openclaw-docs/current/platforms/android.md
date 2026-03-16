<!-- Source: https://docs.openclaw.ai/platforms/android -->
<!-- Title: Android App - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/android)

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

-   [Android App (Node)](https://docs.openclaw.ai/platforms/android)
-   [Support snapshot](https://docs.openclaw.ai/platforms/android)
-   [System control](https://docs.openclaw.ai/platforms/android)
-   [Connection Runbook](https://docs.openclaw.ai/platforms/android)
-   [Prerequisites](https://docs.openclaw.ai/platforms/android)
-   [1) Start the Gateway](https://docs.openclaw.ai/platforms/android)
-   [2) Verify discovery (optional)](https://docs.openclaw.ai/platforms/android)
-   [Tailnet (Vienna ⇄ London) discovery via unicast DNS-SD](https://docs.openclaw.ai/platforms/android)
-   [3) Connect from Android](https://docs.openclaw.ai/platforms/android)
-   [4) Approve pairing (CLI)](https://docs.openclaw.ai/platforms/android)
-   [5) Verify the node is connected](https://docs.openclaw.ai/platforms/android)
-   [6) Chat + history](https://docs.openclaw.ai/platforms/android)
-   [7) Canvas + camera](https://docs.openclaw.ai/platforms/android)
-   [Gateway Canvas Host (recommended for web content)](https://docs.openclaw.ai/platforms/android)
-   [8) Voice + expanded Android command surface](https://docs.openclaw.ai/platforms/android)

Platforms overview

# Android App

# 

[​

](https://docs.openclaw.ai/platforms/android)

Android App (Node)

> **Note:** The Android app has not been publicly released yet. The source code is available in the [OpenClaw repository](https://github.com/openclaw/openclaw) under `apps/android`. You can build it yourself using Java 17 and the Android SDK (`./gradlew :app:assembleDebug`). See [apps/android/README.md](https://github.com/openclaw/openclaw/blob/main/apps/android/README.md) for build instructions.

## 

[​

](https://docs.openclaw.ai/platforms/android)

Support snapshot

-   Role: companion node app (Android does not host the Gateway).
-   Gateway required: yes (run it on macOS, Linux, or Windows via WSL2).
-   Install: [Getting Started](https://docs.openclaw.ai/start/getting-started) + [Pairing](https://docs.openclaw.ai/channels/pairing).
-   Gateway: [Runbook](https://docs.openclaw.ai/gateway) + [Configuration](https://docs.openclaw.ai/gateway/configuration).
    -   Protocols: [Gateway protocol](https://docs.openclaw.ai/gateway/protocol) (nodes + control plane).

## 

[​

](https://docs.openclaw.ai/platforms/android)

System control

System control (launchd/systemd) lives on the Gateway host. See [Gateway](https://docs.openclaw.ai/gateway).

## 

[​

](https://docs.openclaw.ai/platforms/android)

Connection Runbook

Android node app ⇄ (mDNS/NSD + WebSocket) ⇄ **Gateway** Android connects directly to the Gateway WebSocket (default `ws://<host>:18789`) and uses device pairing (`role: node`).

### 

[​

](https://docs.openclaw.ai/platforms/android)

Prerequisites

-   You can run the Gateway on the “master” machine.
-   Android device/emulator can reach the gateway WebSocket:
    -   Same LAN with mDNS/NSD, **or**
    -   Same Tailscale tailnet using Wide-Area Bonjour / unicast DNS-SD (see below), **or**
    -   Manual gateway host/port (fallback)
-   You can run the CLI (`openclaw`) on the gateway machine (or via SSH).

### 

[​

](https://docs.openclaw.ai/platforms/android)

1) Start the Gateway

Copy

```
openclaw gateway --port 18789 --verbose
```

Confirm in logs you see something like:

-   `listening on ws://0.0.0.0:18789`

For tailnet-only setups (recommended for Vienna ⇄ London), bind the gateway to the tailnet IP:

-   Set `gateway.bind: "tailnet"` in `~/.openclaw/openclaw.json` on the gateway host.
-   Restart the Gateway / macOS menubar app.

### 

[​

](https://docs.openclaw.ai/platforms/android)

2) Verify discovery (optional)

From the gateway machine:

Copy

```
dns-sd -B _openclaw-gw._tcp local.
```

More debugging notes: [Bonjour](https://docs.openclaw.ai/gateway/bonjour).

#### 

[​

](https://docs.openclaw.ai/platforms/android)

Tailnet (Vienna ⇄ London) discovery via unicast DNS-SD

Android NSD/mDNS discovery won’t cross networks. If your Android node and the gateway are on different networks but connected via Tailscale, use Wide-Area Bonjour / unicast DNS-SD instead:

1.  Set up a DNS-SD zone (example `openclaw.internal.`) on the gateway host and publish `_openclaw-gw._tcp` records.
2.  Configure Tailscale split DNS for your chosen domain pointing at that DNS server.

Details and example CoreDNS config: [Bonjour](https://docs.openclaw.ai/gateway/bonjour).

### 

[​

](https://docs.openclaw.ai/platforms/android)

3) Connect from Android

In the Android app:

-   The app keeps its gateway connection alive via a **foreground service** (persistent notification).
-   Open the **Connect** tab.
-   Use **Setup Code** or **Manual** mode.
-   If discovery is blocked, use manual host/port (and TLS/token/password when required) in **Advanced controls**.

After the first successful pairing, Android auto-reconnects on launch:

-   Manual endpoint (if enabled), otherwise
-   The last discovered gateway (best-effort).

### 

[​

](https://docs.openclaw.ai/platforms/android)

4) Approve pairing (CLI)

On the gateway machine:

Copy

```
openclaw devices list
openclaw devices approve <requestId>
openclaw devices reject <requestId>
```

Pairing details: [Pairing](https://docs.openclaw.ai/channels/pairing).

### 

[​

](https://docs.openclaw.ai/platforms/android)

5) Verify the node is connected

-   Via nodes status:
    
    Copy
    
    ```
    openclaw nodes status
    ```
    
-   Via Gateway:
    
    Copy
    
    ```
    openclaw gateway call node.list --params "{}"
    ```
    

### 

[​

](https://docs.openclaw.ai/platforms/android)

6) Chat + history

The Android Chat tab supports session selection (default `main`, plus other existing sessions):

-   History: `chat.history`
-   Send: `chat.send`
-   Push updates (best-effort): `chat.subscribe` → `event:"chat"`

### 

[​

](https://docs.openclaw.ai/platforms/android)

7) Canvas + camera

#### 

[​

](https://docs.openclaw.ai/platforms/android)

Gateway Canvas Host (recommended for web content)

If you want the node to show real HTML/CSS/JS that the agent can edit on disk, point the node at the Gateway canvas host. Note: nodes load canvas from the Gateway HTTP server (same port as `gateway.port`, default `18789`).

1.  Create `~/.openclaw/workspace/canvas/index.html` on the gateway host.
2.  Navigate the node to it (LAN):

Copy

```
openclaw nodes invoke --node "<Android Node>" --command canvas.navigate --params '{"url":"http://<gateway-hostname>.local:18789/__openclaw__/canvas/"}'
```

Tailnet (optional): if both devices are on Tailscale, use a MagicDNS name or tailnet IP instead of `.local`, e.g. `http://<gateway-magicdns>:18789/__openclaw__/canvas/`. This server injects a live-reload client into HTML and reloads on file changes. The A2UI host lives at `http://<gateway-host>:18789/__openclaw__/a2ui/`. Canvas commands (foreground only):

-   `canvas.eval`, `canvas.snapshot`, `canvas.navigate` (use `{"url":""}` or `{"url":"/"}` to return to the default scaffold). `canvas.snapshot` returns `{ format, base64 }` (default `format="jpeg"`).
-   A2UI: `canvas.a2ui.push`, `canvas.a2ui.reset` (`canvas.a2ui.pushJSONL` legacy alias)

Camera commands (foreground only; permission-gated):

-   `camera.snap` (jpg)
-   `camera.clip` (mp4)

See [Camera node](https://docs.openclaw.ai/nodes/camera) for parameters and CLI helpers.

### 

[​

](https://docs.openclaw.ai/platforms/android)

8) Voice + expanded Android command surface

-   Voice: Android uses a single mic on/off flow in the Voice tab with transcript capture and TTS playback (ElevenLabs when configured, system TTS fallback). Voice stops when the app leaves the foreground.
-   Voice wake/talk-mode toggles are currently removed from Android UX/runtime.
-   Additional Android command families (availability depends on device + permissions):
    -   `device.status`, `device.info`, `device.permissions`, `device.health`
    -   `notifications.list`, `notifications.actions`
    -   `photos.latest`
    -   `contacts.search`, `contacts.add`
    -   `calendar.events`, `calendar.add`
    -   `callLog.search`
    -   `motion.activity`, `motion.pedometer`

[Windows (WSL2)](https://docs.openclaw.ai/platforms/windows)[iOS App](https://docs.openclaw.ai/platforms/ios)

⌘I
