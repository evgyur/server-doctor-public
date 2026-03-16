<!-- Source: https://docs.openclaw.ai/platforms/mac/permissions -->
<!-- Title: macOS Permissions - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/mac/permissions)

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

-   [macOS permissions (TCC)](https://docs.openclaw.ai/platforms/mac/permissions)
-   [Requirements for stable permissions](https://docs.openclaw.ai/platforms/mac/permissions)
-   [Recovery checklist when prompts disappear](https://docs.openclaw.ai/platforms/mac/permissions)
-   [Files and folders permissions (Desktop/Documents/Downloads)](https://docs.openclaw.ai/platforms/mac/permissions)

macOS companion app

# macOS Permissions

# 

[​

](https://docs.openclaw.ai/platforms/mac/permissions)

macOS permissions (TCC)

macOS permission grants are fragile. TCC associates a permission grant with the app’s code signature, bundle identifier, and on-disk path. If any of those change, macOS treats the app as new and may drop or hide prompts.

## 

[​

](https://docs.openclaw.ai/platforms/mac/permissions)

Requirements for stable permissions

-   Same path: run the app from a fixed location (for OpenClaw, `dist/OpenClaw.app`).
-   Same bundle identifier: changing the bundle ID creates a new permission identity.
-   Signed app: unsigned or ad-hoc signed builds do not persist permissions.
-   Consistent signature: use a real Apple Development or Developer ID certificate so the signature stays stable across rebuilds.

Ad-hoc signatures generate a new identity every build. macOS will forget previous grants, and prompts can disappear entirely until the stale entries are cleared.

## 

[​

](https://docs.openclaw.ai/platforms/mac/permissions)

Recovery checklist when prompts disappear

1.  Quit the app.
2.  Remove the app entry in System Settings -> Privacy & Security.
3.  Relaunch the app from the same path and re-grant permissions.
4.  If the prompt still does not appear, reset TCC entries with `tccutil` and try again.
5.  Some permissions only reappear after a full macOS restart.

Example resets (replace bundle ID as needed):

Copy

```
sudo tccutil reset Accessibility ai.openclaw.mac
sudo tccutil reset ScreenCapture ai.openclaw.mac
sudo tccutil reset AppleEvents
```

## 

[​

](https://docs.openclaw.ai/platforms/mac/permissions)

Files and folders permissions (Desktop/Documents/Downloads)

macOS may also gate Desktop, Documents, and Downloads for terminal/background processes. If file reads or directory listings hang, grant access to the same process context that performs file operations (for example Terminal/iTerm, LaunchAgent-launched app, or SSH process). Workaround: move files into the OpenClaw workspace (`~/.openclaw/workspace`) if you want to avoid per-folder grants. If you are testing permissions, always sign with a real certificate. Ad-hoc builds are only acceptable for quick local runs where permissions do not matter.

[macOS Logging](https://docs.openclaw.ai/platforms/mac/logging)[Remote Control](https://docs.openclaw.ai/platforms/mac/remote)

⌘I
