<!-- Source: https://docs.openclaw.ai/concepts/retry -->
<!-- Title: Retry Policy - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/concepts/retry)

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

-   [Retry policy](https://docs.openclaw.ai/concepts/retry)
-   [Goals](https://docs.openclaw.ai/concepts/retry)
-   [Defaults](https://docs.openclaw.ai/concepts/retry)
-   [Behavior](https://docs.openclaw.ai/concepts/retry)
-   [Discord](https://docs.openclaw.ai/concepts/retry)
-   [Telegram](https://docs.openclaw.ai/concepts/retry)
-   [Configuration](https://docs.openclaw.ai/concepts/retry)
-   [Notes](https://docs.openclaw.ai/concepts/retry)

Messages and delivery

# Retry Policy

# 

[​

](https://docs.openclaw.ai/concepts/retry)

Retry policy

## 

[​

](https://docs.openclaw.ai/concepts/retry)

Goals

-   Retry per HTTP request, not per multi-step flow.
-   Preserve ordering by retrying only the current step.
-   Avoid duplicating non-idempotent operations.

## 

[​

](https://docs.openclaw.ai/concepts/retry)

Defaults

-   Attempts: 3
-   Max delay cap: 30000 ms
-   Jitter: 0.1 (10 percent)
-   Provider defaults:
    -   Telegram min delay: 400 ms
    -   Discord min delay: 500 ms

## 

[​

](https://docs.openclaw.ai/concepts/retry)

Behavior

### 

[​

](https://docs.openclaw.ai/concepts/retry)

Discord

-   Retries only on rate-limit errors (HTTP 429).
-   Uses Discord `retry_after` when available, otherwise exponential backoff.

### 

[​

](https://docs.openclaw.ai/concepts/retry)

Telegram

-   Retries on transient errors (429, timeout, connect/reset/closed, temporarily unavailable).
-   Uses `retry_after` when available, otherwise exponential backoff.
-   Markdown parse errors are not retried; they fall back to plain text.

## 

[​

](https://docs.openclaw.ai/concepts/retry)

Configuration

Set retry policy per provider in `~/.openclaw/openclaw.json`:

Copy

```
{
  channels: {
    telegram: {
      retry: {
        attempts: 3,
        minDelayMs: 400,
        maxDelayMs: 30000,
        jitter: 0.1,
      },
    },
    discord: {
      retry: {
        attempts: 3,
        minDelayMs: 500,
        maxDelayMs: 30000,
        jitter: 0.1,
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/concepts/retry)

Notes

-   Retries apply per request (message send, media upload, reaction, poll, sticker).
-   Composite flows do not retry completed steps.

[Streaming and Chunking](https://docs.openclaw.ai/concepts/streaming)[Command Queue](https://docs.openclaw.ai/concepts/queue)

⌘I
