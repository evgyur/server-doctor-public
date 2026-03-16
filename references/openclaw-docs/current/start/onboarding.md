<!-- Source: https://docs.openclaw.ai/start/onboarding -->
<!-- Title: Onboarding (macOS App) - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/start/onboarding)

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

##### Home

-   [
    
    OpenClaw
    
    
    
    ](https://docs.openclaw.ai/)

##### Overview

-   [
    
    Showcase
    
    
    
    ](https://docs.openclaw.ai/start/showcase)

##### Core concepts

-   [
    
    Features
    
    
    
    ](https://docs.openclaw.ai/concepts/features)

##### First steps

-   [
    
    Getting Started
    
    
    
    ](https://docs.openclaw.ai/start/getting-started)
-   [
    
    Onboarding Overview
    
    
    
    ](https://docs.openclaw.ai/start/onboarding-overview)
-   [
    
    Onboarding: CLI
    
    
    
    ](https://docs.openclaw.ai/start/wizard)
-   [
    
    Onboarding: macOS App
    
    
    
    ](https://docs.openclaw.ai/start/onboarding)

##### Guides

-   [
    
    Personal Assistant Setup
    
    
    
    ](https://docs.openclaw.ai/start/openclaw)
-   [
    
    CLI reference
    
    
    
    ](https://docs.openclaw.ai/start/wizard-cli-reference)
-   [
    
    CLI automation
    
    
    
    ](https://docs.openclaw.ai/start/wizard-cli-automation)

-   [Onboarding (macOS App)](https://docs.openclaw.ai/start/onboarding)

First steps

# Onboarding (macOS App)

# 

[​

](https://docs.openclaw.ai/start/onboarding)

Onboarding (macOS App)

This doc describes the **current** first‑run setup flow. The goal is a smooth “day 0” experience: pick where the Gateway runs, connect auth, run the wizard, and let the agent bootstrap itself. For a general overview of onboarding paths, see [Onboarding Overview](https://docs.openclaw.ai/start/onboarding-overview).

1

[

](https://docs.openclaw.ai/start/onboarding)

Approve macOS warning

![](https://mintcdn.com/clawdhub/zr61AlCx-k7XN8so/assets/macos-onboarding/01-macos-warning.jpeg?fit=max&auto=format&n=zr61AlCx-k7XN8so&q=85&s=7ade99ff85eba6a2fe743ff1f7799087)

2

[

](https://docs.openclaw.ai/start/onboarding)

Approve find local networks

![](https://mintcdn.com/clawdhub/zr61AlCx-k7XN8so/assets/macos-onboarding/02-local-networks.jpeg?fit=max&auto=format&n=zr61AlCx-k7XN8so&q=85&s=e9fcec535d0cdca207cff0cf2379e951)

3

[

](https://docs.openclaw.ai/start/onboarding)

Welcome and security notice

![](https://mintcdn.com/clawdhub/zr61AlCx-k7XN8so/assets/macos-onboarding/03-security-notice.png?fit=max&auto=format&n=zr61AlCx-k7XN8so&q=85&s=8866e4aaac170614a163d990091addac)

Security trust model:

-   By default, OpenClaw is a personal agent: one trusted operator boundary.
-   Shared/multi-user setups require lock-down (split trust boundaries, keep tool access minimal, and follow [Security](https://docs.openclaw.ai/gateway/security)).
-   Local onboarding now defaults new configs to `tools.profile: "coding"` so fresh local setups keep filesystem/runtime tools without forcing the unrestricted `full` profile.
-   If hooks/webhooks or other untrusted content feeds are enabled, use a strong modern model tier and keep strict tool policy/sandboxing.

4

[

](https://docs.openclaw.ai/start/onboarding)

Local vs Remote

![](https://mintcdn.com/clawdhub/zr61AlCx-k7XN8so/assets/macos-onboarding/04-choose-gateway.png?fit=max&auto=format&n=zr61AlCx-k7XN8so&q=85&s=7e923f389e6d774363064140691b4fbe)

Where does the **Gateway** run?

-   **This Mac (Local only):** onboarding can configure auth and write credentials locally.
-   **Remote (over SSH/Tailnet):** onboarding does **not** configure local auth; credentials must exist on the gateway host.
-   **Configure later:** skip setup and leave the app unconfigured.

**Gateway auth tip:**

-   The wizard now generates a **token** even for loopback, so local WS clients must authenticate.
-   If you disable auth, any local process can connect; use that only on fully trusted machines.
-   Use a **token** for multi‑machine access or non‑loopback binds.

5

[

](https://docs.openclaw.ai/start/onboarding)

Permissions

![](https://mintcdn.com/clawdhub/zr61AlCx-k7XN8so/assets/macos-onboarding/05-permissions.png?fit=max&auto=format&n=zr61AlCx-k7XN8so&q=85&s=6c45fa49282cf491a1425a714ec68f18)

Onboarding requests TCC permissions needed for:

-   Automation (AppleScript)
-   Notifications
-   Accessibility
-   Screen Recording
-   Microphone
-   Speech Recognition
-   Camera
-   Location

6

[

](https://docs.openclaw.ai/start/onboarding)

CLI

This step is optional

The app can install the global `openclaw` CLI via npm/pnpm so terminal workflows and launchd tasks work out of the box.

7

[

](https://docs.openclaw.ai/start/onboarding)

Onboarding Chat (dedicated session)

After setup, the app opens a dedicated onboarding chat session so the agent can introduce itself and guide next steps. This keeps first‑run guidance separate from your normal conversation. See [Bootstrapping](https://docs.openclaw.ai/start/bootstrapping) for what happens on the gateway host during the first agent run.

[Onboarding: CLI](https://docs.openclaw.ai/start/wizard)[Personal Assistant Setup](https://docs.openclaw.ai/start/openclaw)

⌘I
