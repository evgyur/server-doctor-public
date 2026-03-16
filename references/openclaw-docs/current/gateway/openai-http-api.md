<!-- Source: https://docs.openclaw.ai/gateway/openai-http-api -->
<!-- Title: OpenAI Chat Completions - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/openai-http-api)

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

-   [OpenAI Chat Completions (HTTP)](https://docs.openclaw.ai/gateway/openai-http-api)
-   [Authentication](https://docs.openclaw.ai/gateway/openai-http-api)
-   [Security boundary (important)](https://docs.openclaw.ai/gateway/openai-http-api)
-   [Choosing an agent](https://docs.openclaw.ai/gateway/openai-http-api)
-   [Enabling the endpoint](https://docs.openclaw.ai/gateway/openai-http-api)
-   [Disabling the endpoint](https://docs.openclaw.ai/gateway/openai-http-api)
-   [Session behavior](https://docs.openclaw.ai/gateway/openai-http-api)
-   [Streaming (SSE)](https://docs.openclaw.ai/gateway/openai-http-api)
-   [Examples](https://docs.openclaw.ai/gateway/openai-http-api)

Protocols and APIs

# OpenAI Chat Completions

# 

[​

](https://docs.openclaw.ai/gateway/openai-http-api)

OpenAI Chat Completions (HTTP)

OpenClaw’s Gateway can serve a small OpenAI-compatible Chat Completions endpoint. This endpoint is **disabled by default**. Enable it in config first.

-   `POST /v1/chat/completions`
-   Same port as the Gateway (WS + HTTP multiplex): `http://<gateway-host>:<port>/v1/chat/completions`

Under the hood, requests are executed as a normal Gateway agent run (same codepath as `openclaw agent`), so routing/permissions/config match your Gateway.

## 

[​

](https://docs.openclaw.ai/gateway/openai-http-api)

Authentication

Uses the Gateway auth configuration. Send a bearer token:

-   `Authorization: Bearer <token>`

Notes:

-   When `gateway.auth.mode="token"`, use `gateway.auth.token` (or `OPENCLAW_GATEWAY_TOKEN`).
-   When `gateway.auth.mode="password"`, use `gateway.auth.password` (or `OPENCLAW_GATEWAY_PASSWORD`).
-   If `gateway.auth.rateLimit` is configured and too many auth failures occur, the endpoint returns `429` with `Retry-After`.

## 

[​

](https://docs.openclaw.ai/gateway/openai-http-api)

Security boundary (important)

Treat this endpoint as a **full operator-access** surface for the gateway instance.

-   HTTP bearer auth here is not a narrow per-user scope model.
-   A valid Gateway token/password for this endpoint should be treated like an owner/operator credential.
-   Requests run through the same control-plane agent path as trusted operator actions.
-   There is no separate non-owner/per-user tool boundary on this endpoint; once a caller passes Gateway auth here, OpenClaw treats that caller as a trusted operator for this gateway.
-   If the target agent policy allows sensitive tools, this endpoint can use them.
-   Keep this endpoint on loopback/tailnet/private ingress only; do not expose it directly to the public internet.

See [Security](https://docs.openclaw.ai/gateway/security) and [Remote access](https://docs.openclaw.ai/gateway/remote).

## 

[​

](https://docs.openclaw.ai/gateway/openai-http-api)

Choosing an agent

No custom headers required: encode the agent id in the OpenAI `model` field:

-   `model: "openclaw:<agentId>"` (example: `"openclaw:main"`, `"openclaw:beta"`)
-   `model: "agent:<agentId>"` (alias)

Or target a specific OpenClaw agent by header:

-   `x-openclaw-agent-id: <agentId>` (default: `main`)

Advanced:

-   `x-openclaw-session-key: <sessionKey>` to fully control session routing.

## 

[​

](https://docs.openclaw.ai/gateway/openai-http-api)

Enabling the endpoint

Set `gateway.http.endpoints.chatCompletions.enabled` to `true`:

Copy

```
{
  gateway: {
    http: {
      endpoints: {
        chatCompletions: { enabled: true },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/gateway/openai-http-api)

Disabling the endpoint

Set `gateway.http.endpoints.chatCompletions.enabled` to `false`:

Copy

```
{
  gateway: {
    http: {
      endpoints: {
        chatCompletions: { enabled: false },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/gateway/openai-http-api)

Session behavior

By default the endpoint is **stateless per request** (a new session key is generated each call). If the request includes an OpenAI `user` string, the Gateway derives a stable session key from it, so repeated calls can share an agent session.

## 

[​

](https://docs.openclaw.ai/gateway/openai-http-api)

Streaming (SSE)

Set `stream: true` to receive Server-Sent Events (SSE):

-   `Content-Type: text/event-stream`
-   Each event line is `data: <json>`
-   Stream ends with `data: [DONE]`

## 

[​

](https://docs.openclaw.ai/gateway/openai-http-api)

Examples

Non-streaming:

Copy

```
curl -sS http://127.0.0.1:18789/v1/chat/completions \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'x-openclaw-agent-id: main' \
  -d '{
    "model": "openclaw",
    "messages": [{"role":"user","content":"hi"}]
  }'
```

Streaming:

Copy

```
curl -N http://127.0.0.1:18789/v1/chat/completions \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'x-openclaw-agent-id: main' \
  -d '{
    "model": "openclaw",
    "stream": true,
    "messages": [{"role":"user","content":"hi"}]
  }'
```

[Bridge Protocol](https://docs.openclaw.ai/gateway/bridge-protocol)[OpenResponses API](https://docs.openclaw.ai/gateway/openresponses-http-api)

⌘I
