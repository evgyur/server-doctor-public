<!-- Source: https://docs.openclaw.ai/platforms/mac/canvas -->
<!-- Title: Canvas - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/mac/canvas)

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

-   [Canvas (macOS app)](https://docs.openclaw.ai/platforms/mac/canvas)
-   [Where Canvas lives](https://docs.openclaw.ai/platforms/mac/canvas)
-   [Panel behavior](https://docs.openclaw.ai/platforms/mac/canvas)
-   [Agent API surface](https://docs.openclaw.ai/platforms/mac/canvas)
-   [A2UI in Canvas](https://docs.openclaw.ai/platforms/mac/canvas)
-   [A2UI commands (v0.8)](https://docs.openclaw.ai/platforms/mac/canvas)
-   [Triggering agent runs from Canvas](https://docs.openclaw.ai/platforms/mac/canvas)
-   [Security notes](https://docs.openclaw.ai/platforms/mac/canvas)

macOS companion app

# Canvas

# 

[​

](https://docs.openclaw.ai/platforms/mac/canvas)

Canvas (macOS app)

The macOS app embeds an agent‑controlled **Canvas panel** using `WKWebView`. It is a lightweight visual workspace for HTML/CSS/JS, A2UI, and small interactive UI surfaces.

## 

[​

](https://docs.openclaw.ai/platforms/mac/canvas)

Where Canvas lives

Canvas state is stored under Application Support:

-   `~/Library/Application Support/OpenClaw/canvas/<session>/...`

The Canvas panel serves those files via a **custom URL scheme**:

-   `openclaw-canvas://<session>/<path>`

Examples:

-   `openclaw-canvas://main/` → `<canvasRoot>/main/index.html`
-   `openclaw-canvas://main/assets/app.css` → `<canvasRoot>/main/assets/app.css`
-   `openclaw-canvas://main/widgets/todo/` → `<canvasRoot>/main/widgets/todo/index.html`

If no `index.html` exists at the root, the app shows a **built‑in scaffold page**.

## 

[​

](https://docs.openclaw.ai/platforms/mac/canvas)

Panel behavior

-   Borderless, resizable panel anchored near the menu bar (or mouse cursor).
-   Remembers size/position per session.
-   Auto‑reloads when local canvas files change.
-   Only one Canvas panel is visible at a time (session is switched as needed).

Canvas can be disabled from Settings → **Allow Canvas**. When disabled, canvas node commands return `CANVAS_DISABLED`.

## 

[​

](https://docs.openclaw.ai/platforms/mac/canvas)

Agent API surface

Canvas is exposed via the **Gateway WebSocket**, so the agent can:

-   show/hide the panel
-   navigate to a path or URL
-   evaluate JavaScript
-   capture a snapshot image

CLI examples:

Copy

```
openclaw nodes canvas present --node <id>
openclaw nodes canvas navigate --node <id> --url "/"
openclaw nodes canvas eval --node <id> --js "document.title"
openclaw nodes canvas snapshot --node <id>
```

Notes:

-   `canvas.navigate` accepts **local canvas paths**, `http(s)` URLs, and `file://` URLs.
-   If you pass `"/"`, the Canvas shows the local scaffold or `index.html`.

## 

[​

](https://docs.openclaw.ai/platforms/mac/canvas)

A2UI in Canvas

A2UI is hosted by the Gateway canvas host and rendered inside the Canvas panel. When the Gateway advertises a Canvas host, the macOS app auto‑navigates to the A2UI host page on first open. Default A2UI host URL:

Copy

```
http://<gateway-host>:18789/__openclaw__/a2ui/
```

### 

[​

](https://docs.openclaw.ai/platforms/mac/canvas)

A2UI commands (v0.8)

Canvas currently accepts **A2UI v0.8** server→client messages:

-   `beginRendering`
-   `surfaceUpdate`
-   `dataModelUpdate`
-   `deleteSurface`

`createSurface` (v0.9) is not supported. CLI example:

Copy

```
cat > /tmp/a2ui-v0.8.jsonl <<'EOFA2'
{"surfaceUpdate":{"surfaceId":"main","components":[{"id":"root","component":{"Column":{"children":{"explicitList":["title","content"]}}}},{"id":"title","component":{"Text":{"text":{"literalString":"Canvas (A2UI v0.8)"},"usageHint":"h1"}}},{"id":"content","component":{"Text":{"text":{"literalString":"If you can read this, A2UI push works."},"usageHint":"body"}}}]}}
{"beginRendering":{"surfaceId":"main","root":"root"}}
EOFA2

openclaw nodes canvas a2ui push --jsonl /tmp/a2ui-v0.8.jsonl --node <id>
```

Quick smoke:

Copy

```
openclaw nodes canvas a2ui push --node <id> --text "Hello from A2UI"
```

## 

[​

](https://docs.openclaw.ai/platforms/mac/canvas)

Triggering agent runs from Canvas

Canvas can trigger new agent runs via deep links:

-   `openclaw://agent?...`

Example (in JS):

Copy

```
window.location.href = "openclaw://agent?message=Review%20this%20design";
```

The app prompts for confirmation unless a valid key is provided.

## 

[​

](https://docs.openclaw.ai/platforms/mac/canvas)

Security notes

-   Canvas scheme blocks directory traversal; files must live under the session root.
-   Local Canvas content uses a custom scheme (no loopback server required).
-   External `http(s)` URLs are allowed only when explicitly navigated.

[WebChat](https://docs.openclaw.ai/platforms/mac/webchat)[Gateway Lifecycle](https://docs.openclaw.ai/platforms/mac/child-process)

⌘I
