<!-- Source: https://docs.openclaw.ai/platforms/mac/logging -->
<!-- Title: macOS Logging - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/mac/logging)

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

-   [Logging (macOS)](https://docs.openclaw.ai/platforms/mac/logging)
-   [Rolling diagnostics file log (Debug pane)](https://docs.openclaw.ai/platforms/mac/logging)
-   [Unified logging private data on macOS](https://docs.openclaw.ai/platforms/mac/logging)
-   [Enable for OpenClaw (ai.openclaw)](https://docs.openclaw.ai/platforms/mac/logging)
-   [Disable after debugging](https://docs.openclaw.ai/platforms/mac/logging)

macOS companion app

# macOS Logging

# 

[​

](https://docs.openclaw.ai/platforms/mac/logging)

Logging (macOS)

## 

[​

](https://docs.openclaw.ai/platforms/mac/logging)

Rolling diagnostics file log (Debug pane)

OpenClaw routes macOS app logs through swift-log (unified logging by default) and can write a local, rotating file log to disk when you need a durable capture.

-   Verbosity: **Debug pane → Logs → App logging → Verbosity**
-   Enable: **Debug pane → Logs → App logging → “Write rolling diagnostics log (JSONL)”**
-   Location: `~/Library/Logs/OpenClaw/diagnostics.jsonl` (rotates automatically; old files are suffixed with `.1`, `.2`, …)
-   Clear: **Debug pane → Logs → App logging → “Clear”**

Notes:

-   This is **off by default**. Enable only while actively debugging.
-   Treat the file as sensitive; don’t share it without review.

## 

[​

](https://docs.openclaw.ai/platforms/mac/logging)

Unified logging private data on macOS

Unified logging redacts most payloads unless a subsystem opts into `privacy -off`. Per Peter’s write-up on macOS [logging privacy shenanigans](https://steipete.me/posts/2025/logging-privacy-shenanigans) (2025) this is controlled by a plist in `/Library/Preferences/Logging/Subsystems/` keyed by the subsystem name. Only new log entries pick up the flag, so enable it before reproducing an issue.

## 

[​

](https://docs.openclaw.ai/platforms/mac/logging)

Enable for OpenClaw (`ai.openclaw`)

-   Write the plist to a temp file first, then install it atomically as root:

Copy

```
cat <<'EOF' >/tmp/ai.openclaw.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>DEFAULT-OPTIONS</key>
    <dict>
        <key>Enable-Private-Data</key>
        <true/>
    </dict>
</dict>
</plist>
EOF
sudo install -m 644 -o root -g wheel /tmp/ai.openclaw.plist /Library/Preferences/Logging/Subsystems/ai.openclaw.plist
```

-   No reboot is required; logd notices the file quickly, but only new log lines will include private payloads.
-   View the richer output with the existing helper, e.g. `./scripts/clawlog.sh --category WebChat --last 5m`.

## 

[​

](https://docs.openclaw.ai/platforms/mac/logging)

Disable after debugging

-   Remove the override: `sudo rm /Library/Preferences/Logging/Subsystems/ai.openclaw.plist`.
-   Optionally run `sudo log config --reload` to force logd to drop the override immediately.
-   Remember this surface can include phone numbers and message bodies; keep the plist in place only while you actively need the extra detail.

[Menu Bar Icon](https://docs.openclaw.ai/platforms/mac/icon)[macOS Permissions](https://docs.openclaw.ai/platforms/mac/permissions)

⌘I
