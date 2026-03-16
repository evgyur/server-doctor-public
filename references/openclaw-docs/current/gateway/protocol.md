<!-- Source: https://docs.openclaw.ai/gateway/protocol -->
<!-- Title: Gateway Protocol - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/protocol)

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

-   [Gateway protocol (WebSocket)](https://docs.openclaw.ai/gateway/protocol)
-   [Transport](https://docs.openclaw.ai/gateway/protocol)
-   [Handshake (connect)](https://docs.openclaw.ai/gateway/protocol)
-   [Node example](https://docs.openclaw.ai/gateway/protocol)
-   [Framing](https://docs.openclaw.ai/gateway/protocol)
-   [Roles + scopes](https://docs.openclaw.ai/gateway/protocol)
-   [Roles](https://docs.openclaw.ai/gateway/protocol)
-   [Scopes (operator)](https://docs.openclaw.ai/gateway/protocol)
-   [Caps/commands/permissions (node)](https://docs.openclaw.ai/gateway/protocol)
-   [Presence](https://docs.openclaw.ai/gateway/protocol)
-   [Node helper methods](https://docs.openclaw.ai/gateway/protocol)
-   [Operator helper methods](https://docs.openclaw.ai/gateway/protocol)
-   [Exec approvals](https://docs.openclaw.ai/gateway/protocol)
-   [Versioning](https://docs.openclaw.ai/gateway/protocol)
-   [Auth](https://docs.openclaw.ai/gateway/protocol)
-   [Device identity + pairing](https://docs.openclaw.ai/gateway/protocol)
-   [Device auth migration diagnostics](https://docs.openclaw.ai/gateway/protocol)
-   [TLS + pinning](https://docs.openclaw.ai/gateway/protocol)
-   [Scope](https://docs.openclaw.ai/gateway/protocol)

Protocols and APIs

# Gateway Protocol

# 

[​

](https://docs.openclaw.ai/gateway/protocol)

Gateway protocol (WebSocket)

The Gateway WS protocol is the **single control plane + node transport** for OpenClaw. All clients (CLI, web UI, macOS app, iOS/Android nodes, headless nodes) connect over WebSocket and declare their **role** + **scope** at handshake time.

## 

[​

](https://docs.openclaw.ai/gateway/protocol)

Transport

-   WebSocket, text frames with JSON payloads.
-   First frame **must** be a `connect` request.

## 

[​

](https://docs.openclaw.ai/gateway/protocol)

Handshake (connect)

Gateway → Client (pre-connect challenge):

Copy

```
{
  "type": "event",
  "event": "connect.challenge",
  "payload": { "nonce": "…", "ts": 1737264000000 }
}
```

Client → Gateway:

Copy

```
{
  "type": "req",
  "id": "…",
  "method": "connect",
  "params": {
    "minProtocol": 3,
    "maxProtocol": 3,
    "client": {
      "id": "cli",
      "version": "1.2.3",
      "platform": "macos",
      "mode": "operator"
    },
    "role": "operator",
    "scopes": ["operator.read", "operator.write"],
    "caps": [],
    "commands": [],
    "permissions": {},
    "auth": { "token": "…" },
    "locale": "en-US",
    "userAgent": "openclaw-cli/1.2.3",
    "device": {
      "id": "device_fingerprint",
      "publicKey": "…",
      "signature": "…",
      "signedAt": 1737264000000,
      "nonce": "…"
    }
  }
}
```

Gateway → Client:

Copy

```
{
  "type": "res",
  "id": "…",
  "ok": true,
  "payload": { "type": "hello-ok", "protocol": 3, "policy": { "tickIntervalMs": 15000 } }
}
```

When a device token is issued, `hello-ok` also includes:

Copy

```
{
  "auth": {
    "deviceToken": "…",
    "role": "operator",
    "scopes": ["operator.read", "operator.write"]
  }
}
```

### 

[​

](https://docs.openclaw.ai/gateway/protocol)

Node example

Copy

```
{
  "type": "req",
  "id": "…",
  "method": "connect",
  "params": {
    "minProtocol": 3,
    "maxProtocol": 3,
    "client": {
      "id": "ios-node",
      "version": "1.2.3",
      "platform": "ios",
      "mode": "node"
    },
    "role": "node",
    "scopes": [],
    "caps": ["camera", "canvas", "screen", "location", "voice"],
    "commands": ["camera.snap", "canvas.navigate", "screen.record", "location.get"],
    "permissions": { "camera.capture": true, "screen.record": false },
    "auth": { "token": "…" },
    "locale": "en-US",
    "userAgent": "openclaw-ios/1.2.3",
    "device": {
      "id": "device_fingerprint",
      "publicKey": "…",
      "signature": "…",
      "signedAt": 1737264000000,
      "nonce": "…"
    }
  }
}
```

## 

[​

](https://docs.openclaw.ai/gateway/protocol)

Framing

-   **Request**: `{type:"req", id, method, params}`
-   **Response**: `{type:"res", id, ok, payload|error}`
-   **Event**: `{type:"event", event, payload, seq?, stateVersion?}`

Side-effecting methods require **idempotency keys** (see schema).

## 

[​

](https://docs.openclaw.ai/gateway/protocol)

Roles + scopes

### 

[​

](https://docs.openclaw.ai/gateway/protocol)

Roles

-   `operator` = control plane client (CLI/UI/automation).
-   `node` = capability host (camera/screen/canvas/system.run).

### 

[​

](https://docs.openclaw.ai/gateway/protocol)

Scopes (operator)

Common scopes:

-   `operator.read`
-   `operator.write`
-   `operator.admin`
-   `operator.approvals`
-   `operator.pairing`

Method scope is only the first gate. Some slash commands reached through `chat.send` apply stricter command-level checks on top. For example, persistent `/config set` and `/config unset` writes require `operator.admin`.

### 

[​

](https://docs.openclaw.ai/gateway/protocol)

Caps/commands/permissions (node)

Nodes declare capability claims at connect time:

-   `caps`: high-level capability categories.
-   `commands`: command allowlist for invoke.
-   `permissions`: granular toggles (e.g. `screen.record`, `camera.capture`).

The Gateway treats these as **claims** and enforces server-side allowlists.

## 

[​

](https://docs.openclaw.ai/gateway/protocol)

Presence

-   `system-presence` returns entries keyed by device identity.
-   Presence entries include `deviceId`, `roles`, and `scopes` so UIs can show a single row per device even when it connects as both **operator** and **node**.

### 

[​

](https://docs.openclaw.ai/gateway/protocol)

Node helper methods

-   Nodes may call `skills.bins` to fetch the current list of skill executables for auto-allow checks.

### 

[​

](https://docs.openclaw.ai/gateway/protocol)

Operator helper methods

-   Operators may call `tools.catalog` (`operator.read`) to fetch the runtime tool catalog for an agent. The response includes grouped tools and provenance metadata:
    -   `source`: `core` or `plugin`
    -   `pluginId`: plugin owner when `source="plugin"`
    -   `optional`: whether a plugin tool is optional

## 

[​

](https://docs.openclaw.ai/gateway/protocol)

Exec approvals

-   When an exec request needs approval, the gateway broadcasts `exec.approval.requested`.
-   Operator clients resolve by calling `exec.approval.resolve` (requires `operator.approvals` scope).
-   For `host=node`, `exec.approval.request` must include `systemRunPlan` (canonical `argv`/`cwd`/`rawCommand`/session metadata). Requests missing `systemRunPlan` are rejected.

## 

[​

](https://docs.openclaw.ai/gateway/protocol)

Versioning

-   `PROTOCOL_VERSION` lives in `src/gateway/protocol/schema.ts`.
-   Clients send `minProtocol` + `maxProtocol`; the server rejects mismatches.
-   Schemas + models are generated from TypeBox definitions:
    -   `pnpm protocol:gen`
    -   `pnpm protocol:gen:swift`
    -   `pnpm protocol:check`

## 

[​

](https://docs.openclaw.ai/gateway/protocol)

Auth

-   If `OPENCLAW_GATEWAY_TOKEN` (or `--token`) is set, `connect.params.auth.token` must match or the socket is closed.
-   After pairing, the Gateway issues a **device token** scoped to the connection role + scopes. It is returned in `hello-ok.auth.deviceToken` and should be persisted by the client for future connects.
-   Device tokens can be rotated/revoked via `device.token.rotate` and `device.token.revoke` (requires `operator.pairing` scope).
-   Auth failures include `error.details.code` plus recovery hints:
    -   `error.details.canRetryWithDeviceToken` (boolean)
    -   `error.details.recommendedNextStep` (`retry_with_device_token`, `update_auth_configuration`, `update_auth_credentials`, `wait_then_retry`, `review_auth_configuration`)
-   Client behavior for `AUTH_TOKEN_MISMATCH`:
    -   Trusted clients may attempt one bounded retry with a cached per-device token.
    -   If that retry fails, clients should stop automatic reconnect loops and surface operator action guidance.

## 

[​

](https://docs.openclaw.ai/gateway/protocol)

Device identity + pairing

-   Nodes should include a stable device identity (`device.id`) derived from a keypair fingerprint.
-   Gateways issue tokens per device + role.
-   Pairing approvals are required for new device IDs unless local auto-approval is enabled.
-   **Local** connects include loopback and the gateway host’s own tailnet address (so same‑host tailnet binds can still auto‑approve).
-   All WS clients must include `device` identity during `connect` (operator + node). Control UI can omit it only in these modes:
    -   `gateway.controlUi.allowInsecureAuth=true` for localhost-only insecure HTTP compatibility.
    -   `gateway.controlUi.dangerouslyDisableDeviceAuth=true` (break-glass, severe security downgrade).
-   All connections must sign the server-provided `connect.challenge` nonce.

### 

[​

](https://docs.openclaw.ai/gateway/protocol)

Device auth migration diagnostics

For legacy clients that still use pre-challenge signing behavior, `connect` now returns `DEVICE_AUTH_*` detail codes under `error.details.code` with a stable `error.details.reason`. Common migration failures:

| Message | details.code | details.reason | Meaning |
| --- | --- | --- | --- |
| `device nonce required` | `DEVICE_AUTH_NONCE_REQUIRED` | `device-nonce-missing` | Client omitted `device.nonce` (or sent blank). |
| `device nonce mismatch` | `DEVICE_AUTH_NONCE_MISMATCH` | `device-nonce-mismatch` | Client signed with a stale/wrong nonce. |
| `device signature invalid` | `DEVICE_AUTH_SIGNATURE_INVALID` | `device-signature` | Signature payload does not match v2 payload. |
| `device signature expired` | `DEVICE_AUTH_SIGNATURE_EXPIRED` | `device-signature-stale` | Signed timestamp is outside allowed skew. |
| `device identity mismatch` | `DEVICE_AUTH_DEVICE_ID_MISMATCH` | `device-id-mismatch` | `device.id` does not match public key fingerprint. |
| `device public key invalid` | `DEVICE_AUTH_PUBLIC_KEY_INVALID` | `device-public-key` | Public key format/canonicalization failed. |

Migration target:

-   Always wait for `connect.challenge`.
-   Sign the v2 payload that includes the server nonce.
-   Send the same nonce in `connect.params.device.nonce`.
-   Preferred signature payload is `v3`, which binds `platform` and `deviceFamily` in addition to device/client/role/scopes/token/nonce fields.
-   Legacy `v2` signatures remain accepted for compatibility, but paired-device metadata pinning still controls command policy on reconnect.

## 

[​

](https://docs.openclaw.ai/gateway/protocol)

TLS + pinning

-   TLS is supported for WS connections.
-   Clients may optionally pin the gateway cert fingerprint (see `gateway.tls` config plus `gateway.remote.tlsFingerprint` or CLI `--tls-fingerprint`).

## 

[​

](https://docs.openclaw.ai/gateway/protocol)

Scope

This protocol exposes the **full gateway API** (status, channels, models, chat, agent, sessions, nodes, approvals, etc.). The exact surface is defined by the TypeBox schemas in `src/gateway/protocol/schema.ts`.

[Sandbox vs Tool Policy vs Elevated](https://docs.openclaw.ai/gateway/sandbox-vs-tool-policy-vs-elevated)[Bridge Protocol](https://docs.openclaw.ai/gateway/bridge-protocol)

⌘I
