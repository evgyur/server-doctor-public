<!-- Source: https://docs.openclaw.ai/concepts/architecture -->
<!-- Title: Gateway Architecture - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/concepts/architecture)

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

-   [Gateway architecture](https://docs.openclaw.ai/concepts/architecture)
-   [Overview](https://docs.openclaw.ai/concepts/architecture)
-   [Components and flows](https://docs.openclaw.ai/concepts/architecture)
-   [Gateway (daemon)](https://docs.openclaw.ai/concepts/architecture)
-   [Clients (mac app / CLI / web admin)](https://docs.openclaw.ai/concepts/architecture)
-   [Nodes (macOS / iOS / Android / headless)](https://docs.openclaw.ai/concepts/architecture)
-   [WebChat](https://docs.openclaw.ai/concepts/architecture)
-   [Connection lifecycle (single client)](https://docs.openclaw.ai/concepts/architecture)
-   [Wire protocol (summary)](https://docs.openclaw.ai/concepts/architecture)
-   [Pairing + local trust](https://docs.openclaw.ai/concepts/architecture)
-   [Protocol typing and codegen](https://docs.openclaw.ai/concepts/architecture)
-   [Remote access](https://docs.openclaw.ai/concepts/architecture)
-   [Operations snapshot](https://docs.openclaw.ai/concepts/architecture)
-   [Invariants](https://docs.openclaw.ai/concepts/architecture)

Fundamentals

# Gateway Architecture

# 

[​

](https://docs.openclaw.ai/concepts/architecture)

Gateway architecture

Last updated: 2026-01-22

## 

[​

](https://docs.openclaw.ai/concepts/architecture)

Overview

-   A single long‑lived **Gateway** owns all messaging surfaces (WhatsApp via Baileys, Telegram via grammY, Slack, Discord, Signal, iMessage, WebChat).
-   Control-plane clients (macOS app, CLI, web UI, automations) connect to the Gateway over **WebSocket** on the configured bind host (default `127.0.0.1:18789`).
-   **Nodes** (macOS/iOS/Android/headless) also connect over **WebSocket**, but declare `role: node` with explicit caps/commands.
-   One Gateway per host; it is the only place that opens a WhatsApp session.
-   The **canvas host** is served by the Gateway HTTP server under:
    -   `/__openclaw__/canvas/` (agent-editable HTML/CSS/JS)
    -   `/__openclaw__/a2ui/` (A2UI host) It uses the same port as the Gateway (default `18789`).

## 

[​

](https://docs.openclaw.ai/concepts/architecture)

Components and flows

### 

[​

](https://docs.openclaw.ai/concepts/architecture)

Gateway (daemon)

-   Maintains provider connections.
-   Exposes a typed WS API (requests, responses, server‑push events).
-   Validates inbound frames against JSON Schema.
-   Emits events like `agent`, `chat`, `presence`, `health`, `heartbeat`, `cron`.

### 

[​

](https://docs.openclaw.ai/concepts/architecture)

Clients (mac app / CLI / web admin)

-   One WS connection per client.
-   Send requests (`health`, `status`, `send`, `agent`, `system-presence`).
-   Subscribe to events (`tick`, `agent`, `presence`, `shutdown`).

### 

[​

](https://docs.openclaw.ai/concepts/architecture)

Nodes (macOS / iOS / Android / headless)

-   Connect to the **same WS server** with `role: node`.
-   Provide a device identity in `connect`; pairing is **device‑based** (role `node`) and approval lives in the device pairing store.
-   Expose commands like `canvas.*`, `camera.*`, `screen.record`, `location.get`.

Protocol details:

-   [Gateway protocol](https://docs.openclaw.ai/gateway/protocol)

### 

[​

](https://docs.openclaw.ai/concepts/architecture)

WebChat

-   Static UI that uses the Gateway WS API for chat history and sends.
-   In remote setups, connects through the same SSH/Tailscale tunnel as other clients.

## 

[​

](https://docs.openclaw.ai/concepts/architecture)

Connection lifecycle (single client)

## 

[​

](https://docs.openclaw.ai/concepts/architecture)

Wire protocol (summary)

-   Transport: WebSocket, text frames with JSON payloads.
-   First frame **must** be `connect`.
-   After handshake:
    -   Requests: `{type:"req", id, method, params}` → `{type:"res", id, ok, payload|error}`
    -   Events: `{type:"event", event, payload, seq?, stateVersion?}`
-   If `OPENCLAW_GATEWAY_TOKEN` (or `--token`) is set, `connect.params.auth.token` must match or the socket closes.
-   Idempotency keys are required for side‑effecting methods (`send`, `agent`) to safely retry; the server keeps a short‑lived dedupe cache.
-   Nodes must include `role: "node"` plus caps/commands/permissions in `connect`.

## 

[​

](https://docs.openclaw.ai/concepts/architecture)

Pairing + local trust

-   All WS clients (operators + nodes) include a **device identity** on `connect`.
-   New device IDs require pairing approval; the Gateway issues a **device token** for subsequent connects.
-   **Local** connects (loopback or the gateway host’s own tailnet address) can be auto‑approved to keep same‑host UX smooth.
-   All connects must sign the `connect.challenge` nonce.
-   Signature payload `v3` also binds `platform` + `deviceFamily`; the gateway pins paired metadata on reconnect and requires repair pairing for metadata changes.
-   **Non‑local** connects still require explicit approval.
-   Gateway auth (`gateway.auth.*`) still applies to **all** connections, local or remote.

Details: [Gateway protocol](https://docs.openclaw.ai/gateway/protocol), [Pairing](https://docs.openclaw.ai/channels/pairing), [Security](https://docs.openclaw.ai/gateway/security).

## 

[​

](https://docs.openclaw.ai/concepts/architecture)

Protocol typing and codegen

-   TypeBox schemas define the protocol.
-   JSON Schema is generated from those schemas.
-   Swift models are generated from the JSON Schema.

## 

[​

](https://docs.openclaw.ai/concepts/architecture)

Remote access

-   Preferred: Tailscale or VPN.
-   Alternative: SSH tunnel
    
    Copy
    
    ```
    ssh -N -L 18789:127.0.0.1:18789 user@host
    ```
    
-   The same handshake + auth token apply over the tunnel.
-   TLS + optional pinning can be enabled for WS in remote setups.

## 

[​

](https://docs.openclaw.ai/concepts/architecture)

Operations snapshot

-   Start: `openclaw gateway` (foreground, logs to stdout).
-   Health: `health` over WS (also included in `hello-ok`).
-   Supervision: launchd/systemd for auto‑restart.

## 

[​

](https://docs.openclaw.ai/concepts/architecture)

Invariants

-   Exactly one Gateway controls a single Baileys session per host.
-   Handshake is mandatory; any non‑JSON or non‑connect first frame is a hard close.
-   Events are not replayed; clients must refresh on gaps.

[Pi Integration Architecture](https://docs.openclaw.ai/pi)[Agent Runtime](https://docs.openclaw.ai/concepts/agent)

⌘I
