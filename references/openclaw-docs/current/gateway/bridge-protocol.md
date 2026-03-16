<!-- Source: https://docs.openclaw.ai/gateway/bridge-protocol -->
<!-- Title: Bridge Protocol - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/bridge-protocol)

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

-   -   [
        
        Gateway Protocol
        
        
        
        ](https://docs.openclaw.ai/gateway/protocol)
    -   [
        
        Bridge Protocol
        
        
        
        ](https://docs.openclaw.ai/gateway/bridge-protocol)
    -   [
        
        OpenAI Chat Completions
        
        
        
        ](https://docs.openclaw.ai/gateway/openai-http-api)
    -   [
        
        OpenResponses API
        
        
        
        ](https://docs.openclaw.ai/gateway/openresponses-http-api)
    -   [
        
        Tools Invoke API
        
        
        
        ](https://docs.openclaw.ai/gateway/tools-invoke-http-api)
    -   [
        
        CLI Backends
        
        
        
        ](https://docs.openclaw.ai/gateway/cli-backends)
    -   [
        
        Local Models
        
        
        
        ](https://docs.openclaw.ai/gateway/local-models)

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

-   [Bridge protocol (legacy node transport)](https://docs.openclaw.ai/gateway/bridge-protocol)
-   [Why we have both](https://docs.openclaw.ai/gateway/bridge-protocol)
-   [Transport](https://docs.openclaw.ai/gateway/bridge-protocol)
-   [Handshake + pairing](https://docs.openclaw.ai/gateway/bridge-protocol)
-   [Frames](https://docs.openclaw.ai/gateway/bridge-protocol)
-   [Exec lifecycle events](https://docs.openclaw.ai/gateway/bridge-protocol)
-   [Tailnet usage](https://docs.openclaw.ai/gateway/bridge-protocol)
-   [Versioning](https://docs.openclaw.ai/gateway/bridge-protocol)

Protocols and APIs

# Bridge Protocol

# 

[​

](https://docs.openclaw.ai/gateway/bridge-protocol)

Bridge protocol (legacy node transport)

The Bridge protocol is a **legacy** node transport (TCP JSONL). New node clients should use the unified Gateway WebSocket protocol instead. If you are building an operator or node client, use the [Gateway protocol](https://docs.openclaw.ai/gateway/protocol). **Note:** Current OpenClaw builds no longer ship the TCP bridge listener; this document is kept for historical reference. Legacy `bridge.*` config keys are no longer part of the config schema.

## 

[​

](https://docs.openclaw.ai/gateway/bridge-protocol)

Why we have both

-   **Security boundary**: the bridge exposes a small allowlist instead of the full gateway API surface.
-   **Pairing + node identity**: node admission is owned by the gateway and tied to a per-node token.
-   **Discovery UX**: nodes can discover gateways via Bonjour on LAN, or connect directly over a tailnet.
-   **Loopback WS**: the full WS control plane stays local unless tunneled via SSH.

## 

[​

](https://docs.openclaw.ai/gateway/bridge-protocol)

Transport

-   TCP, one JSON object per line (JSONL).
-   Optional TLS (when `bridge.tls.enabled` is true).
-   Legacy default listener port was `18790` (current builds do not start a TCP bridge).

When TLS is enabled, discovery TXT records include `bridgeTls=1` plus `bridgeTlsSha256` as a non-secret hint. Note that Bonjour/mDNS TXT records are unauthenticated; clients must not treat the advertised fingerprint as an authoritative pin without explicit user intent or other out-of-band verification.

## 

[​

](https://docs.openclaw.ai/gateway/bridge-protocol)

Handshake + pairing

1.  Client sends `hello` with node metadata + token (if already paired).
2.  If not paired, gateway replies `error` (`NOT_PAIRED`/`UNAUTHORIZED`).
3.  Client sends `pair-request`.
4.  Gateway waits for approval, then sends `pair-ok` and `hello-ok`.

`hello-ok` returns `serverName` and may include `canvasHostUrl`.

## 

[​

](https://docs.openclaw.ai/gateway/bridge-protocol)

Frames

Client → Gateway:

-   `req` / `res`: scoped gateway RPC (chat, sessions, config, health, voicewake, skills.bins)
-   `event`: node signals (voice transcript, agent request, chat subscribe, exec lifecycle)

Gateway → Client:

-   `invoke` / `invoke-res`: node commands (`canvas.*`, `camera.*`, `screen.record`, `location.get`, `sms.send`)
-   `event`: chat updates for subscribed sessions
-   `ping` / `pong`: keepalive

Legacy allowlist enforcement lived in `src/gateway/server-bridge.ts` (removed).

## 

[​

](https://docs.openclaw.ai/gateway/bridge-protocol)

Exec lifecycle events

Nodes can emit `exec.finished` or `exec.denied` events to surface system.run activity. These are mapped to system events in the gateway. (Legacy nodes may still emit `exec.started`.) Payload fields (all optional unless noted):

-   `sessionKey` (required): agent session to receive the system event.
-   `runId`: unique exec id for grouping.
-   `command`: raw or formatted command string.
-   `exitCode`, `timedOut`, `success`, `output`: completion details (finished only).
-   `reason`: denial reason (denied only).

## 

[​

](https://docs.openclaw.ai/gateway/bridge-protocol)

Tailnet usage

-   Bind the bridge to a tailnet IP: `bridge.bind: "tailnet"` in `~/.openclaw/openclaw.json`.
-   Clients connect via MagicDNS name or tailnet IP.
-   Bonjour does **not** cross networks; use manual host/port or wide-area DNS‑SD when needed.

## 

[​

](https://docs.openclaw.ai/gateway/bridge-protocol)

Versioning

Bridge is currently **implicit v1** (no min/max negotiation). Backward‑compat is expected; add a bridge protocol version field before any breaking changes.

[Gateway Protocol](https://docs.openclaw.ai/gateway/protocol)[OpenAI Chat Completions](https://docs.openclaw.ai/gateway/openai-http-api)

⌘I
