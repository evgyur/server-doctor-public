<!-- Source: https://docs.openclaw.ai/gateway/tools-invoke-http-api -->
<!-- Title: Tools Invoke API - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/tools-invoke-http-api)

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

-   [Tools Invoke (HTTP)](https://docs.openclaw.ai/gateway/tools-invoke-http-api)
-   [Authentication](https://docs.openclaw.ai/gateway/tools-invoke-http-api)
-   [Request body](https://docs.openclaw.ai/gateway/tools-invoke-http-api)
-   [Policy + routing behavior](https://docs.openclaw.ai/gateway/tools-invoke-http-api)
-   [Responses](https://docs.openclaw.ai/gateway/tools-invoke-http-api)
-   [Example](https://docs.openclaw.ai/gateway/tools-invoke-http-api)

Protocols and APIs

# Tools Invoke API

# 

[​

](https://docs.openclaw.ai/gateway/tools-invoke-http-api)

Tools Invoke (HTTP)

OpenClaw’s Gateway exposes a simple HTTP endpoint for invoking a single tool directly. It is always enabled, but gated by Gateway auth and tool policy.

-   `POST /tools/invoke`
-   Same port as the Gateway (WS + HTTP multiplex): `http://<gateway-host>:<port>/tools/invoke`

Default max payload size is 2 MB.

## 

[​

](https://docs.openclaw.ai/gateway/tools-invoke-http-api)

Authentication

Uses the Gateway auth configuration. Send a bearer token:

-   `Authorization: Bearer <token>`

Notes:

-   When `gateway.auth.mode="token"`, use `gateway.auth.token` (or `OPENCLAW_GATEWAY_TOKEN`).
-   When `gateway.auth.mode="password"`, use `gateway.auth.password` (or `OPENCLAW_GATEWAY_PASSWORD`).
-   If `gateway.auth.rateLimit` is configured and too many auth failures occur, the endpoint returns `429` with `Retry-After`.

## 

[​

](https://docs.openclaw.ai/gateway/tools-invoke-http-api)

Request body

Copy

```
{
  "tool": "sessions_list",
  "action": "json",
  "args": {},
  "sessionKey": "main",
  "dryRun": false
}
```

Fields:

-   `tool` (string, required): tool name to invoke.
-   `action` (string, optional): mapped into args if the tool schema supports `action` and the args payload omitted it.
-   `args` (object, optional): tool-specific arguments.
-   `sessionKey` (string, optional): target session key. If omitted or `"main"`, the Gateway uses the configured main session key (honors `session.mainKey` and default agent, or `global` in global scope).
-   `dryRun` (boolean, optional): reserved for future use; currently ignored.

## 

[​

](https://docs.openclaw.ai/gateway/tools-invoke-http-api)

Policy + routing behavior

Tool availability is filtered through the same policy chain used by Gateway agents:

-   `tools.profile` / `tools.byProvider.profile`
-   `tools.allow` / `tools.byProvider.allow`
-   `agents.<id>.tools.allow` / `agents.<id>.tools.byProvider.allow`
-   group policies (if the session key maps to a group or channel)
-   subagent policy (when invoking with a subagent session key)

If a tool is not allowed by policy, the endpoint returns **404**. Gateway HTTP also applies a hard deny list by default (even if session policy allows the tool):

-   `sessions_spawn`
-   `sessions_send`
-   `gateway`
-   `whatsapp_login`

You can customize this deny list via `gateway.tools`:

Copy

```
{
  gateway: {
    tools: {
      // Additional tools to block over HTTP /tools/invoke
      deny: ["browser"],
      // Remove tools from the default deny list
      allow: ["gateway"],
    },
  },
}
```

To help group policies resolve context, you can optionally set:

-   `x-openclaw-message-channel: <channel>` (example: `slack`, `telegram`)
-   `x-openclaw-account-id: <accountId>` (when multiple accounts exist)

## 

[​

](https://docs.openclaw.ai/gateway/tools-invoke-http-api)

Responses

-   `200` → `{ ok: true, result }`
-   `400` → `{ ok: false, error: { type, message } }` (invalid request or tool input error)
-   `401` → unauthorized
-   `429` → auth rate-limited (`Retry-After` set)
-   `404` → tool not available (not found or not allowlisted)
-   `405` → method not allowed
-   `500` → `{ ok: false, error: { type, message } }` (unexpected tool execution error; sanitized message)

## 

[​

](https://docs.openclaw.ai/gateway/tools-invoke-http-api)

Example

Copy

```
curl -sS http://127.0.0.1:18789/tools/invoke \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
    "tool": "sessions_list",
    "action": "json",
    "args": {}
  }'
```

[OpenResponses API](https://docs.openclaw.ai/gateway/openresponses-http-api)[CLI Backends](https://docs.openclaw.ai/gateway/cli-backends)

⌘I
