<!-- Source: https://docs.openclaw.ai/platforms/mac/voicewake -->
<!-- Title: Voice Wake - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/mac/voicewake)

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

-   [Voice Wake & Push-to-Talk](https://docs.openclaw.ai/platforms/mac/voicewake)
-   [Modes](https://docs.openclaw.ai/platforms/mac/voicewake)
-   [Runtime behavior (wake-word)](https://docs.openclaw.ai/platforms/mac/voicewake)
-   [Lifecycle invariants](https://docs.openclaw.ai/platforms/mac/voicewake)
-   [Sticky overlay failure mode (previous)](https://docs.openclaw.ai/platforms/mac/voicewake)
-   [Push-to-talk specifics](https://docs.openclaw.ai/platforms/mac/voicewake)
-   [User-facing settings](https://docs.openclaw.ai/platforms/mac/voicewake)
-   [Forwarding behavior](https://docs.openclaw.ai/platforms/mac/voicewake)
-   [Forwarding payload](https://docs.openclaw.ai/platforms/mac/voicewake)
-   [Quick verification](https://docs.openclaw.ai/platforms/mac/voicewake)

macOS companion app

# Voice Wake

# 

[​

](https://docs.openclaw.ai/platforms/mac/voicewake)

Voice Wake & Push-to-Talk

## 

[​

](https://docs.openclaw.ai/platforms/mac/voicewake)

Modes

-   **Wake-word mode** (default): always-on Speech recognizer waits for trigger tokens (`swabbleTriggerWords`). On match it starts capture, shows the overlay with partial text, and auto-sends after silence.
-   **Push-to-talk (Right Option hold)**: hold the right Option key to capture immediately—no trigger needed. The overlay appears while held; releasing finalizes and forwards after a short delay so you can tweak text.

## 

[​

](https://docs.openclaw.ai/platforms/mac/voicewake)

Runtime behavior (wake-word)

-   Speech recognizer lives in `VoiceWakeRuntime`.
-   Trigger only fires when there’s a **meaningful pause** between the wake word and the next word (~0.55s gap). The overlay/chime can start on the pause even before the command begins.
-   Silence windows: 2.0s when speech is flowing, 5.0s if only the trigger was heard.
-   Hard stop: 120s to prevent runaway sessions.
-   Debounce between sessions: 350ms.
-   Overlay is driven via `VoiceWakeOverlayController` with committed/volatile coloring.
-   After send, recognizer restarts cleanly to listen for the next trigger.

## 

[​

](https://docs.openclaw.ai/platforms/mac/voicewake)

Lifecycle invariants

-   If Voice Wake is enabled and permissions are granted, the wake-word recognizer should be listening (except during an explicit push-to-talk capture).
-   Overlay visibility (including manual dismiss via the X button) must never prevent the recognizer from resuming.

## 

[​

](https://docs.openclaw.ai/platforms/mac/voicewake)

Sticky overlay failure mode (previous)

Previously, if the overlay got stuck visible and you manually closed it, Voice Wake could appear “dead” because the runtime’s restart attempt could be blocked by overlay visibility and no subsequent restart was scheduled. Hardening:

-   Wake runtime restart is no longer blocked by overlay visibility.
-   Overlay dismiss completion triggers a `VoiceWakeRuntime.refresh(...)` via `VoiceSessionCoordinator`, so manual X-dismiss always resumes listening.

## 

[​

](https://docs.openclaw.ai/platforms/mac/voicewake)

Push-to-talk specifics

-   Hotkey detection uses a global `.flagsChanged` monitor for **right Option** (`keyCode 61` + `.option`). We only observe events (no swallowing).
-   Capture pipeline lives in `VoicePushToTalk`: starts Speech immediately, streams partials to the overlay, and calls `VoiceWakeForwarder` on release.
-   When push-to-talk starts we pause the wake-word runtime to avoid dueling audio taps; it restarts automatically after release.
-   Permissions: requires Microphone + Speech; seeing events needs Accessibility/Input Monitoring approval.
-   External keyboards: some may not expose right Option as expected—offer a fallback shortcut if users report misses.

## 

[​

](https://docs.openclaw.ai/platforms/mac/voicewake)

User-facing settings

-   **Voice Wake** toggle: enables wake-word runtime.
-   **Hold Cmd+Fn to talk**: enables the push-to-talk monitor. Disabled on macOS < 26.
-   Language & mic pickers, live level meter, trigger-word table, tester (local-only; does not forward).
-   Mic picker preserves the last selection if a device disconnects, shows a disconnected hint, and temporarily falls back to the system default until it returns.
-   **Sounds**: chimes on trigger detect and on send; defaults to the macOS “Glass” system sound. You can pick any `NSSound`\-loadable file (e.g. MP3/WAV/AIFF) for each event or choose **No Sound**.

## 

[​

](https://docs.openclaw.ai/platforms/mac/voicewake)

Forwarding behavior

-   When Voice Wake is enabled, transcripts are forwarded to the active gateway/agent (the same local vs remote mode used by the rest of the mac app).
-   Replies are delivered to the **last-used main provider** (WhatsApp/Telegram/Discord/WebChat). If delivery fails, the error is logged and the run is still visible via WebChat/session logs.

## 

[​

](https://docs.openclaw.ai/platforms/mac/voicewake)

Forwarding payload

-   `VoiceWakeForwarder.prefixedTranscript(_:)` prepends the machine hint before sending. Shared between wake-word and push-to-talk paths.

## 

[​

](https://docs.openclaw.ai/platforms/mac/voicewake)

Quick verification

-   Toggle push-to-talk on, hold Cmd+Fn, speak, release: overlay should show partials then send.
-   While holding, menu-bar ears should stay enlarged (uses `triggerVoiceEars(ttl:nil)`); they drop after release.

[Menu Bar](https://docs.openclaw.ai/platforms/mac/menu-bar)[Voice Overlay](https://docs.openclaw.ai/platforms/mac/voice-overlay)

⌘I
