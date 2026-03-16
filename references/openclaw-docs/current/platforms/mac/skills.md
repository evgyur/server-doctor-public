<!-- Source: https://docs.openclaw.ai/platforms/mac/skills -->
<!-- Title: Skills - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/mac/skills)

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

-   [Skills (macOS)](https://docs.openclaw.ai/platforms/mac/skills)
-   [Data source](https://docs.openclaw.ai/platforms/mac/skills)
-   [Install actions](https://docs.openclaw.ai/platforms/mac/skills)
-   [Env/API keys](https://docs.openclaw.ai/platforms/mac/skills)
-   [Remote mode](https://docs.openclaw.ai/platforms/mac/skills)

macOS companion app

# Skills

# 

[​

](https://docs.openclaw.ai/platforms/mac/skills)

Skills (macOS)

The macOS app surfaces OpenClaw skills via the gateway; it does not parse skills locally.

## 

[​

](https://docs.openclaw.ai/platforms/mac/skills)

Data source

-   `skills.status` (gateway) returns all skills plus eligibility and missing requirements (including allowlist blocks for bundled skills).
-   Requirements are derived from `metadata.openclaw.requires` in each `SKILL.md`.

## 

[​

](https://docs.openclaw.ai/platforms/mac/skills)

Install actions

-   `metadata.openclaw.install` defines install options (brew/node/go/uv).
-   The app calls `skills.install` to run installers on the gateway host.
-   The gateway surfaces only one preferred installer when multiple are provided (brew when available, otherwise node manager from `skills.install`, default npm).

## 

[​

](https://docs.openclaw.ai/platforms/mac/skills)

Env/API keys

-   The app stores keys in `~/.openclaw/openclaw.json` under `skills.entries.<skillKey>`.
-   `skills.update` patches `enabled`, `apiKey`, and `env`.

## 

[​

](https://docs.openclaw.ai/platforms/mac/skills)

Remote mode

-   Install + config updates happen on the gateway host (not the local Mac).

[macOS IPC](https://docs.openclaw.ai/platforms/mac/xpc)[Peekaboo Bridge](https://docs.openclaw.ai/platforms/mac/peekaboo)

⌘I
