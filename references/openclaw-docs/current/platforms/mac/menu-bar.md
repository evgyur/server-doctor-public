<!-- Source: https://docs.openclaw.ai/platforms/mac/menu-bar -->
<!-- Title: Menu Bar - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/mac/menu-bar)

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

-   [Menu Bar Status Logic](https://docs.openclaw.ai/platforms/mac/menu-bar)
-   [What is shown](https://docs.openclaw.ai/platforms/mac/menu-bar)
-   [State model](https://docs.openclaw.ai/platforms/mac/menu-bar)
-   [IconState enum (Swift)](https://docs.openclaw.ai/platforms/mac/menu-bar)
-   [ActivityKind → glyph](https://docs.openclaw.ai/platforms/mac/menu-bar)
-   [Visual mapping](https://docs.openclaw.ai/platforms/mac/menu-bar)
-   [Status row text (menu)](https://docs.openclaw.ai/platforms/mac/menu-bar)
-   [Event ingestion](https://docs.openclaw.ai/platforms/mac/menu-bar)
-   [Debug override](https://docs.openclaw.ai/platforms/mac/menu-bar)
-   [Testing checklist](https://docs.openclaw.ai/platforms/mac/menu-bar)

macOS companion app

# Menu Bar

# 

[​

](https://docs.openclaw.ai/platforms/mac/menu-bar)

Menu Bar Status Logic

## 

[​

](https://docs.openclaw.ai/platforms/mac/menu-bar)

What is shown

-   We surface the current agent work state in the menu bar icon and in the first status row of the menu.
-   Health status is hidden while work is active; it returns when all sessions are idle.
-   The “Nodes” block in the menu lists **devices** only (paired nodes via `node.list`), not client/presence entries.
-   A “Usage” section appears under Context when provider usage snapshots are available.

## 

[​

](https://docs.openclaw.ai/platforms/mac/menu-bar)

State model

-   Sessions: events arrive with `runId` (per-run) plus `sessionKey` in the payload. The “main” session is the key `main`; if absent, we fall back to the most recently updated session.
-   Priority: main always wins. If main is active, its state is shown immediately. If main is idle, the most recently active non‑main session is shown. We do not flip‑flop mid‑activity; we only switch when the current session goes idle or main becomes active.
-   Activity kinds:
    -   `job`: high‑level command execution (`state: started|streaming|done|error`).
    -   `tool`: `phase: start|result` with `toolName` and `meta/args`.

## 

[​

](https://docs.openclaw.ai/platforms/mac/menu-bar)

IconState enum (Swift)

-   `idle`
-   `workingMain(ActivityKind)`
-   `workingOther(ActivityKind)`
-   `overridden(ActivityKind)` (debug override)

### 

[​

](https://docs.openclaw.ai/platforms/mac/menu-bar)

ActivityKind → glyph

-   `exec` → 💻
-   `read` → 📄
-   `write` → ✍️
-   `edit` → 📝
-   `attach` → 📎
-   default → 🛠️

### 

[​

](https://docs.openclaw.ai/platforms/mac/menu-bar)

Visual mapping

-   `idle`: normal critter.
-   `workingMain`: badge with glyph, full tint, leg “working” animation.
-   `workingOther`: badge with glyph, muted tint, no scurry.
-   `overridden`: uses the chosen glyph/tint regardless of activity.

## 

[​

](https://docs.openclaw.ai/platforms/mac/menu-bar)

Status row text (menu)

-   While work is active: `<Session role> · <activity label>`
    -   Examples: `Main · exec: pnpm test`, `Other · read: apps/macos/Sources/OpenClaw/AppState.swift`.
-   When idle: falls back to the health summary.

## 

[​

](https://docs.openclaw.ai/platforms/mac/menu-bar)

Event ingestion

-   Source: control‑channel `agent` events (`ControlChannel.handleAgentEvent`).
-   Parsed fields:
    -   `stream: "job"` with `data.state` for start/stop.
    -   `stream: "tool"` with `data.phase`, `name`, optional `meta`/`args`.
-   Labels:
    -   `exec`: first line of `args.command`.
    -   `read`/`write`: shortened path.
    -   `edit`: path plus inferred change kind from `meta`/diff counts.
    -   fallback: tool name.

## 

[​

](https://docs.openclaw.ai/platforms/mac/menu-bar)

Debug override

-   Settings ▸ Debug ▸ “Icon override” picker:
    -   `System (auto)` (default)
    -   `Working: main` (per tool kind)
    -   `Working: other` (per tool kind)
    -   `Idle`
-   Stored via `@AppStorage("iconOverride")`; mapped to `IconState.overridden`.

## 

[​

](https://docs.openclaw.ai/platforms/mac/menu-bar)

Testing checklist

-   Trigger main session job: verify icon switches immediately and status row shows main label.
-   Trigger non‑main session job while main idle: icon/status shows non‑main; stays stable until it finishes.
-   Start main while other active: icon flips to main instantly.
-   Rapid tool bursts: ensure badge does not flicker (TTL grace on tool results).
-   Health row reappears once all sessions idle.

[macOS Dev Setup](https://docs.openclaw.ai/platforms/mac/dev-setup)[Voice Wake](https://docs.openclaw.ai/platforms/mac/voicewake)

⌘I
