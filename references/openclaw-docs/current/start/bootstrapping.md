<!-- Source: https://docs.openclaw.ai/start/bootstrapping -->
<!-- Title: Agent Bootstrapping - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/start/bootstrapping)

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

##### Fundamentals

-   [
    
    Pi Integration Architecture
    
    
    
    ](https://docs.openclaw.ai/pi)
-   [
    
    Gateway Architecture
    
    
    
    ](https://docs.openclaw.ai/concepts/architecture)
-   [
    
    Agent Runtime
    
    
    
    ](https://docs.openclaw.ai/concepts/agent)
-   [
    
    Agent Loop
    
    
    
    ](https://docs.openclaw.ai/concepts/agent-loop)
-   [
    
    System Prompt
    
    
    
    ](https://docs.openclaw.ai/concepts/system-prompt)
-   [
    
    Context
    
    
    
    ](https://docs.openclaw.ai/concepts/context)
-   [
    
    Agent Workspace
    
    
    
    ](https://docs.openclaw.ai/concepts/agent-workspace)
-   [
    
    OAuth
    
    
    
    ](https://docs.openclaw.ai/concepts/oauth)

##### Bootstrapping

-   [
    
    Bootstrapping
    
    
    
    ](https://docs.openclaw.ai/start/bootstrapping)

##### Sessions and memory

-   [
    
    Session Management
    
    
    
    ](https://docs.openclaw.ai/concepts/session)
-   [
    
    Session Pruning
    
    
    
    ](https://docs.openclaw.ai/concepts/session-pruning)
-   [
    
    Session Tools
    
    
    
    ](https://docs.openclaw.ai/concepts/session-tool)
-   [
    
    Memory
    
    
    
    ](https://docs.openclaw.ai/concepts/memory)
-   [
    
    Compaction
    
    
    
    ](https://docs.openclaw.ai/concepts/compaction)

##### Multi-agent

-   [
    
    Multi-Agent Routing
    
    
    
    ](https://docs.openclaw.ai/concepts/multi-agent)
-   [
    
    Presence
    
    
    
    ](https://docs.openclaw.ai/concepts/presence)

##### Messages and delivery

-   [
    
    Messages
    
    
    
    ](https://docs.openclaw.ai/concepts/messages)
-   [
    
    Streaming and Chunking
    
    
    
    ](https://docs.openclaw.ai/concepts/streaming)
-   [
    
    Retry Policy
    
    
    
    ](https://docs.openclaw.ai/concepts/retry)
-   [
    
    Command Queue
    
    
    
    ](https://docs.openclaw.ai/concepts/queue)

-   [Agent Bootstrapping](https://docs.openclaw.ai/start/bootstrapping)
-   [What bootstrapping does](https://docs.openclaw.ai/start/bootstrapping)
-   [Where it runs](https://docs.openclaw.ai/start/bootstrapping)
-   [Related docs](https://docs.openclaw.ai/start/bootstrapping)

Bootstrapping

# Agent Bootstrapping

# 

[​

](https://docs.openclaw.ai/start/bootstrapping)

Agent Bootstrapping

Bootstrapping is the **first‑run** ritual that prepares an agent workspace and collects identity details. It happens after onboarding, when the agent starts for the first time.

## 

[​

](https://docs.openclaw.ai/start/bootstrapping)

What bootstrapping does

On the first agent run, OpenClaw bootstraps the workspace (default `~/.openclaw/workspace`):

-   Seeds `AGENTS.md`, `BOOTSTRAP.md`, `IDENTITY.md`, `USER.md`.
-   Runs a short Q&A ritual (one question at a time).
-   Writes identity + preferences to `IDENTITY.md`, `USER.md`, `SOUL.md`.
-   Removes `BOOTSTRAP.md` when finished so it only runs once.

## 

[​

](https://docs.openclaw.ai/start/bootstrapping)

Where it runs

Bootstrapping always runs on the **gateway host**. If the macOS app connects to a remote Gateway, the workspace and bootstrapping files live on that remote machine.

When the Gateway runs on another machine, edit workspace files on the gateway host (for example, `user@gateway-host:~/.openclaw/workspace`).

## 

[​

](https://docs.openclaw.ai/start/bootstrapping)

Related docs

-   macOS app onboarding: [Onboarding](https://docs.openclaw.ai/start/onboarding)
-   Workspace layout: [Agent workspace](https://docs.openclaw.ai/concepts/agent-workspace)

[OAuth](https://docs.openclaw.ai/concepts/oauth)[Session Management](https://docs.openclaw.ai/concepts/session)

⌘I
