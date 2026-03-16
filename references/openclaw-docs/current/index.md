<!-- Source: https://docs.openclaw.ai/ -->
<!-- Title: OpenClaw - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/)

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

-   [OpenClaw 🦞](https://docs.openclaw.ai/)
-   [What is OpenClaw?](https://docs.openclaw.ai/)
-   [How it works](https://docs.openclaw.ai/)
-   [Key capabilities](https://docs.openclaw.ai/)
-   [Quick start](https://docs.openclaw.ai/)
-   [Dashboard](https://docs.openclaw.ai/)
-   [Configuration (optional)](https://docs.openclaw.ai/)
-   [Start here](https://docs.openclaw.ai/)
-   [Learn more](https://docs.openclaw.ai/)

Home

# OpenClaw

# 

[​

](https://docs.openclaw.ai/)

OpenClaw 🦞

![OpenClaw](https://mintcdn.com/clawdhub/-t5HSeZ3Y_0_wH4i/assets/openclaw-logo-text-dark.png?fit=max&auto=format&n=-t5HSeZ3Y_0_wH4i&q=85&s=61797dcb0c37d6e9279b8c5ad2e850e4)![OpenClaw](https://mintcdn.com/clawdhub/FaXdIfo7gPK_jSWb/assets/openclaw-logo-text.png?fit=max&auto=format&n=FaXdIfo7gPK_jSWb&q=85&s=d799bea41acb92d4c9fd1075c575879f)

> _“EXFOLIATE! EXFOLIATE!”_ — A space lobster, probably

**Any OS gateway for AI agents across WhatsApp, Telegram, Discord, iMessage, and more.**  
Send a message, get an agent response from your pocket. Plugins add Mattermost and more.

[

## Get Started

Install OpenClaw and bring up the Gateway in minutes.





](https://docs.openclaw.ai/start/getting-started)[

## Run the Wizard

Guided setup with `openclaw onboard` and pairing flows.





](https://docs.openclaw.ai/start/wizard)[

## Open the Control UI

Launch the browser dashboard for chat, config, and sessions.





](https://docs.openclaw.ai/web/control-ui)

## 

[​

](https://docs.openclaw.ai/)

What is OpenClaw?

OpenClaw is a **self-hosted gateway** that connects your favorite chat apps — WhatsApp, Telegram, Discord, iMessage, and more — to AI coding agents like Pi. You run a single Gateway process on your own machine (or a server), and it becomes the bridge between your messaging apps and an always-available AI assistant. **Who is it for?** Developers and power users who want a personal AI assistant they can message from anywhere — without giving up control of their data or relying on a hosted service. **What makes it different?**

-   **Self-hosted**: runs on your hardware, your rules
-   **Multi-channel**: one Gateway serves WhatsApp, Telegram, Discord, and more simultaneously
-   **Agent-native**: built for coding agents with tool use, sessions, memory, and multi-agent routing
-   **Open source**: MIT licensed, community-driven

**What do you need?** Node 24 (recommended), or Node 22 LTS (`22.16+`) for compatibility, an API key from your chosen provider, and 5 minutes. For best quality and security, use the strongest latest-generation model available.

## 

[​

](https://docs.openclaw.ai/)

How it works

The Gateway is the single source of truth for sessions, routing, and channel connections.

## 

[​

](https://docs.openclaw.ai/)

Key capabilities

## Multi-channel gateway

WhatsApp, Telegram, Discord, and iMessage with a single Gateway process.

## Plugin channels

Add Mattermost and more with extension packages.

## Multi-agent routing

Isolated sessions per agent, workspace, or sender.

## Media support

Send and receive images, audio, and documents.

## Web Control UI

Browser dashboard for chat, config, sessions, and nodes.

## Mobile nodes

Pair iOS and Android nodes for Canvas, camera, and voice-enabled workflows.

## 

[​

](https://docs.openclaw.ai/)

Quick start

1

[

](https://docs.openclaw.ai/)

Install OpenClaw

Copy

```
npm install -g openclaw@latest
```

2

[

](https://docs.openclaw.ai/)

Onboard and install the service

Copy

```
openclaw onboard --install-daemon
```

3

[

](https://docs.openclaw.ai/)

Pair WhatsApp and start the Gateway

Copy

```
openclaw channels login
openclaw gateway --port 18789
```

Need the full install and dev setup? See [Quick start](https://docs.openclaw.ai/start/quickstart).

## 

[​

](https://docs.openclaw.ai/)

Dashboard

Open the browser Control UI after the Gateway starts.

-   Local default: [http://127.0.0.1:18789/](http://127.0.0.1:18789/)
-   Remote access: [Web surfaces](https://docs.openclaw.ai/web) and [Tailscale](https://docs.openclaw.ai/gateway/tailscale)

![OpenClaw](https://mintcdn.com/clawdhub/FaXdIfo7gPK_jSWb/whatsapp-openclaw.jpg?fit=max&auto=format&n=FaXdIfo7gPK_jSWb&q=85&s=b74a3630b0e971f466eff15fbdc642cb)

## 

[​

](https://docs.openclaw.ai/)

Configuration (optional)

Config lives at `~/.openclaw/openclaw.json`.

-   If you **do nothing**, OpenClaw uses the bundled Pi binary in RPC mode with per-sender sessions.
-   If you want to lock it down, start with `channels.whatsapp.allowFrom` and (for groups) mention rules.

Example:

Copy

```
{
  channels: {
    whatsapp: {
      allowFrom: ["+15555550123"],
      groups: { "*": { requireMention: true } },
    },
  },
  messages: { groupChat: { mentionPatterns: ["@openclaw"] } },
}
```

## 

[​

](https://docs.openclaw.ai/)

Start here

[

## Docs hubs

All docs and guides, organized by use case.





](https://docs.openclaw.ai/start/hubs)[

## Configuration

Core Gateway settings, tokens, and provider config.





](https://docs.openclaw.ai/gateway/configuration)[

## Remote access

SSH and tailnet access patterns.





](https://docs.openclaw.ai/gateway/remote)[

## Channels

Channel-specific setup for WhatsApp, Telegram, Discord, and more.





](https://docs.openclaw.ai/channels/telegram)[

## Nodes

iOS and Android nodes with pairing, Canvas, camera, and device actions.





](https://docs.openclaw.ai/nodes)[

## Help

Common fixes and troubleshooting entry point.





](https://docs.openclaw.ai/help)

## 

[​

](https://docs.openclaw.ai/)

Learn more

[

## Full feature list

Complete channel, routing, and media capabilities.





](https://docs.openclaw.ai/concepts/features)[

## Multi-agent routing

Workspace isolation and per-agent sessions.





](https://docs.openclaw.ai/concepts/multi-agent)[

## Security

Tokens, allowlists, and safety controls.





](https://docs.openclaw.ai/gateway/security)[

## Troubleshooting

Gateway diagnostics and common errors.





](https://docs.openclaw.ai/gateway/troubleshooting)[

## About and credits

Project origins, contributors, and license.





](https://docs.openclaw.ai/reference/credits)

[Showcase](https://docs.openclaw.ai/start/showcase)

⌘I
