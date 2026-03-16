<!-- Source: https://docs.openclaw.ai/concepts/presence -->
<!-- Title: Presence - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/concepts/presence)

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

-   [Presence](https://docs.openclaw.ai/concepts/presence)
-   [Presence fields (what shows up)](https://docs.openclaw.ai/concepts/presence)
-   [Producers (where presence comes from)](https://docs.openclaw.ai/concepts/presence)
-   [1) Gateway self entry](https://docs.openclaw.ai/concepts/presence)
-   [2) WebSocket connect](https://docs.openclaw.ai/concepts/presence)
-   [Why one‑off CLI commands don’t show up](https://docs.openclaw.ai/concepts/presence)
-   [3) system-event beacons](https://docs.openclaw.ai/concepts/presence)
-   [4) Node connects (role: node)](https://docs.openclaw.ai/concepts/presence)
-   [Merge + dedupe rules (why instanceId matters)](https://docs.openclaw.ai/concepts/presence)
-   [TTL and bounded size](https://docs.openclaw.ai/concepts/presence)
-   [Remote/tunnel caveat (loopback IPs)](https://docs.openclaw.ai/concepts/presence)
-   [Consumers](https://docs.openclaw.ai/concepts/presence)
-   [macOS Instances tab](https://docs.openclaw.ai/concepts/presence)
-   [Debugging tips](https://docs.openclaw.ai/concepts/presence)

Multi-agent

# Presence

# 

[​

](https://docs.openclaw.ai/concepts/presence)

Presence

OpenClaw “presence” is a lightweight, best‑effort view of:

-   the **Gateway** itself, and
-   **clients connected to the Gateway** (mac app, WebChat, CLI, etc.)

Presence is used primarily to render the macOS app’s **Instances** tab and to provide quick operator visibility.

## 

[​

](https://docs.openclaw.ai/concepts/presence)

Presence fields (what shows up)

Presence entries are structured objects with fields like:

-   `instanceId` (optional but strongly recommended): stable client identity (usually `connect.client.instanceId`)
-   `host`: human‑friendly host name
-   `ip`: best‑effort IP address
-   `version`: client version string
-   `deviceFamily` / `modelIdentifier`: hardware hints
-   `mode`: `ui`, `webchat`, `cli`, `backend`, `probe`, `test`, `node`, …
-   `lastInputSeconds`: “seconds since last user input” (if known)
-   `reason`: `self`, `connect`, `node-connected`, `periodic`, …
-   `ts`: last update timestamp (ms since epoch)

## 

[​

](https://docs.openclaw.ai/concepts/presence)

Producers (where presence comes from)

Presence entries are produced by multiple sources and **merged**.

### 

[​

](https://docs.openclaw.ai/concepts/presence)

1) Gateway self entry

The Gateway always seeds a “self” entry at startup so UIs show the gateway host even before any clients connect.

### 

[​

](https://docs.openclaw.ai/concepts/presence)

2) WebSocket connect

Every WS client begins with a `connect` request. On successful handshake the Gateway upserts a presence entry for that connection.

#### 

[​

](https://docs.openclaw.ai/concepts/presence)

Why one‑off CLI commands don’t show up

The CLI often connects for short, one‑off commands. To avoid spamming the Instances list, `client.mode === "cli"` is **not** turned into a presence entry.

### 

[​

](https://docs.openclaw.ai/concepts/presence)

3) `system-event` beacons

Clients can send richer periodic beacons via the `system-event` method. The mac app uses this to report host name, IP, and `lastInputSeconds`.

### 

[​

](https://docs.openclaw.ai/concepts/presence)

4) Node connects (role: node)

When a node connects over the Gateway WebSocket with `role: node`, the Gateway upserts a presence entry for that node (same flow as other WS clients).

## 

[​

](https://docs.openclaw.ai/concepts/presence)

Merge + dedupe rules (why `instanceId` matters)

Presence entries are stored in a single in‑memory map:

-   Entries are keyed by a **presence key**.
-   The best key is a stable `instanceId` (from `connect.client.instanceId`) that survives restarts.
-   Keys are case‑insensitive.

If a client reconnects without a stable `instanceId`, it may show up as a **duplicate** row.

## 

[​

](https://docs.openclaw.ai/concepts/presence)

TTL and bounded size

Presence is intentionally ephemeral:

-   **TTL:** entries older than 5 minutes are pruned
-   **Max entries:** 200 (oldest dropped first)

This keeps the list fresh and avoids unbounded memory growth.

## 

[​

](https://docs.openclaw.ai/concepts/presence)

Remote/tunnel caveat (loopback IPs)

When a client connects over an SSH tunnel / local port forward, the Gateway may see the remote address as `127.0.0.1`. To avoid overwriting a good client‑reported IP, loopback remote addresses are ignored.

## 

[​

](https://docs.openclaw.ai/concepts/presence)

Consumers

### 

[​

](https://docs.openclaw.ai/concepts/presence)

macOS Instances tab

The macOS app renders the output of `system-presence` and applies a small status indicator (Active/Idle/Stale) based on the age of the last update.

## 

[​

](https://docs.openclaw.ai/concepts/presence)

Debugging tips

-   To see the raw list, call `system-presence` against the Gateway.
-   If you see duplicates:
    -   confirm clients send a stable `client.instanceId` in the handshake
    -   confirm periodic beacons use the same `instanceId`
    -   check whether the connection‑derived entry is missing `instanceId` (duplicates are expected)

[Multi-Agent Routing](https://docs.openclaw.ai/concepts/multi-agent)[Messages](https://docs.openclaw.ai/concepts/messages)

⌘I
