<!-- Source: https://docs.openclaw.ai/web/webchat -->
<!-- Title: WebChat - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/web/webchat)

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

##### Gateway

-   [
    
    Gateway Runbook
    
    
    
    ](https://docs.openclaw.ai/gateway)

##### Remote access

-   [
    
    Remote Access
    
    
    
    ](https://docs.openclaw.ai/gateway/remote)
-   [
    
    Remote Gateway Setup
    
    
    
    ](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [
    
    Tailscale
    
    
    
    ](https://docs.openclaw.ai/gateway/tailscale)

##### Security

-   [
    
    Formal Verification (Security Models)
    
    
    
    ](https://docs.openclaw.ai/security/formal-verification)
-   [
    
    THREAT MODEL ATLAS
    
    
    
    ](https://docs.openclaw.ai/security/THREAT-MODEL-ATLAS)
-   [
    
    CONTRIBUTING THREAT MODEL
    
    
    
    ](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

##### Web interfaces

-   [
    
    Web
    
    
    
    ](https://docs.openclaw.ai/web)
-   [
    
    Control UI
    
    
    
    ](https://docs.openclaw.ai/web/control-ui)
-   [
    
    Dashboard
    
    
    
    ](https://docs.openclaw.ai/web/dashboard)
-   [
    
    WebChat
    
    
    
    ](https://docs.openclaw.ai/web/webchat)
-   [
    
    TUI
    
    
    
    ](https://docs.openclaw.ai/web/tui)

-   [WebChat (Gateway WebSocket UI)](https://docs.openclaw.ai/web/webchat)
-   [What it is](https://docs.openclaw.ai/web/webchat)
-   [Quick start](https://docs.openclaw.ai/web/webchat)
-   [How it works (behavior)](https://docs.openclaw.ai/web/webchat)
-   [Control UI agents tools panel](https://docs.openclaw.ai/web/webchat)
-   [Remote use](https://docs.openclaw.ai/web/webchat)
-   [Configuration reference (WebChat)](https://docs.openclaw.ai/web/webchat)

Web interfaces

# WebChat

# 

[​

](https://docs.openclaw.ai/web/webchat)

WebChat (Gateway WebSocket UI)

Status: the macOS/iOS SwiftUI chat UI talks directly to the Gateway WebSocket.

## 

[​

](https://docs.openclaw.ai/web/webchat)

What it is

-   A native chat UI for the gateway (no embedded browser and no local static server).
-   Uses the same sessions and routing rules as other channels.
-   Deterministic routing: replies always go back to WebChat.

## 

[​

](https://docs.openclaw.ai/web/webchat)

Quick start

1.  Start the gateway.
2.  Open the WebChat UI (macOS/iOS app) or the Control UI chat tab.
3.  Ensure gateway auth is configured (required by default, even on loopback).

## 

[​

](https://docs.openclaw.ai/web/webchat)

How it works (behavior)

-   The UI connects to the Gateway WebSocket and uses `chat.history`, `chat.send`, and `chat.inject`.
-   `chat.history` is bounded for stability: Gateway may truncate long text fields, omit heavy metadata, and replace oversized entries with `[chat.history omitted: message too large]`.
-   `chat.inject` appends an assistant note directly to the transcript and broadcasts it to the UI (no agent run).
-   Aborted runs can keep partial assistant output visible in the UI.
-   Gateway persists aborted partial assistant text into transcript history when buffered output exists, and marks those entries with abort metadata.
-   History is always fetched from the gateway (no local file watching).
-   If the gateway is unreachable, WebChat is read-only.

## 

[​

](https://docs.openclaw.ai/web/webchat)

Control UI agents tools panel

-   The Control UI `/agents` Tools panel fetches a runtime catalog via `tools.catalog` and labels each tool as `core` or `plugin:<id>` (plus `optional` for optional plugin tools).
-   If `tools.catalog` is unavailable, the panel falls back to a built-in static list.
-   The panel edits profile and override config, but effective runtime access still follows policy precedence (`allow`/`deny`, per-agent and provider/channel overrides).

## 

[​

](https://docs.openclaw.ai/web/webchat)

Remote use

-   Remote mode tunnels the gateway WebSocket over SSH/Tailscale.
-   You do not need to run a separate WebChat server.

## 

[​

](https://docs.openclaw.ai/web/webchat)

Configuration reference (WebChat)

Full configuration: [Configuration](https://docs.openclaw.ai/gateway/configuration) Channel options:

-   No dedicated `webchat.*` block. WebChat uses the gateway endpoint + auth settings below.

Related global options:

-   `gateway.port`, `gateway.bind`: WebSocket host/port.
-   `gateway.auth.mode`, `gateway.auth.token`, `gateway.auth.password`: WebSocket auth (token/password).
-   `gateway.auth.mode: "trusted-proxy"`: reverse-proxy auth for browser clients (see [Trusted Proxy Auth](https://docs.openclaw.ai/gateway/trusted-proxy-auth)).
-   `gateway.remote.url`, `gateway.remote.token`, `gateway.remote.password`: remote gateway target.
-   `session.*`: session storage and main key defaults.

[Dashboard](https://docs.openclaw.ai/web/dashboard)[TUI](https://docs.openclaw.ai/web/tui)

⌘I
