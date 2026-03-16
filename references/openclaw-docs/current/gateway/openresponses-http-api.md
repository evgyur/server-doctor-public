<!-- Source: https://docs.openclaw.ai/gateway/openresponses-http-api -->
<!-- Title: OpenResponses API - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/openresponses-http-api)

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

-   [OpenResponses API (HTTP)](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [Authentication, security, and routing](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [Session behavior](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [Request shape (supported)](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [Items (input)](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [message](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [function\_call\_output (turn-based tools)](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [reasoning and item\_reference](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [Tools (client-side function tools)](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [Images (input\_image)](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [Files (input\_file)](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [File + image limits (config)](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [Streaming (SSE)](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [Usage](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [Errors](https://docs.openclaw.ai/gateway/openresponses-http-api)
-   [Examples](https://docs.openclaw.ai/gateway/openresponses-http-api)

Protocols and APIs

# OpenResponses API

# 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

OpenResponses API (HTTP)

OpenClaw’s Gateway can serve an OpenResponses-compatible `POST /v1/responses` endpoint. This endpoint is **disabled by default**. Enable it in config first.

-   `POST /v1/responses`
-   Same port as the Gateway (WS + HTTP multiplex): `http://<gateway-host>:<port>/v1/responses`

Under the hood, requests are executed as a normal Gateway agent run (same codepath as `openclaw agent`), so routing/permissions/config match your Gateway.

## 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

Authentication, security, and routing

Operational behavior matches [OpenAI Chat Completions](https://docs.openclaw.ai/gateway/openai-http-api):

-   use `Authorization: Bearer <token>` with the normal Gateway auth config
-   treat the endpoint as full operator access for the gateway instance
-   select agents with `model: "openclaw:<agentId>"`, `model: "agent:<agentId>"`, or `x-openclaw-agent-id`
-   use `x-openclaw-session-key` for explicit session routing

Enable or disable this endpoint with `gateway.http.endpoints.responses.enabled`.

## 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

Session behavior

By default the endpoint is **stateless per request** (a new session key is generated each call). If the request includes an OpenResponses `user` string, the Gateway derives a stable session key from it, so repeated calls can share an agent session.

## 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

Request shape (supported)

The request follows the OpenResponses API with item-based input. Current support:

-   `input`: string or array of item objects.
-   `instructions`: merged into the system prompt.
-   `tools`: client tool definitions (function tools).
-   `tool_choice`: filter or require client tools.
-   `stream`: enables SSE streaming.
-   `max_output_tokens`: best-effort output limit (provider dependent).
-   `user`: stable session routing.

Accepted but **currently ignored**:

-   `max_tool_calls`
-   `reasoning`
-   `metadata`
-   `store`
-   `previous_response_id`
-   `truncation`

## 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

Items (input)

### 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

`message`

Roles: `system`, `developer`, `user`, `assistant`.

-   `system` and `developer` are appended to the system prompt.
-   The most recent `user` or `function_call_output` item becomes the “current message.”
-   Earlier user/assistant messages are included as history for context.

### 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

`function_call_output` (turn-based tools)

Send tool results back to the model:

Copy

```
{
  "type": "function_call_output",
  "call_id": "call_123",
  "output": "{\"temperature\": \"72F\"}"
}
```

### 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

`reasoning` and `item_reference`

Accepted for schema compatibility but ignored when building the prompt.

## 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

Tools (client-side function tools)

Provide tools with `tools: [{ type: "function", function: { name, description?, parameters? } }]`. If the agent decides to call a tool, the response returns a `function_call` output item. You then send a follow-up request with `function_call_output` to continue the turn.

## 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

Images (`input_image`)

Supports base64 or URL sources:

Copy

```
{
  "type": "input_image",
  "source": { "type": "url", "url": "https://example.com/image.png" }
}
```

Allowed MIME types (current): `image/jpeg`, `image/png`, `image/gif`, `image/webp`, `image/heic`, `image/heif`. Max size (current): 10MB.

## 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

Files (`input_file`)

Supports base64 or URL sources:

Copy

```
{
  "type": "input_file",
  "source": {
    "type": "base64",
    "media_type": "text/plain",
    "data": "SGVsbG8gV29ybGQh",
    "filename": "hello.txt"
  }
}
```

Allowed MIME types (current): `text/plain`, `text/markdown`, `text/html`, `text/csv`, `application/json`, `application/pdf`. Max size (current): 5MB. Current behavior:

-   File content is decoded and added to the **system prompt**, not the user message, so it stays ephemeral (not persisted in session history).
-   PDFs are parsed for text. If little text is found, the first pages are rasterized into images and passed to the model.

PDF parsing uses the Node-friendly `pdfjs-dist` legacy build (no worker). The modern PDF.js build expects browser workers/DOM globals, so it is not used in the Gateway. URL fetch defaults:

-   `files.allowUrl`: `true`
-   `images.allowUrl`: `true`
-   `maxUrlParts`: `8` (total URL-based `input_file` + `input_image` parts per request)
-   Requests are guarded (DNS resolution, private IP blocking, redirect caps, timeouts).
-   Optional hostname allowlists are supported per input type (`files.urlAllowlist`, `images.urlAllowlist`).
    -   Exact host: `"cdn.example.com"`
    -   Wildcard subdomains: `"*.assets.example.com"` (does not match apex)

## 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

File + image limits (config)

Defaults can be tuned under `gateway.http.endpoints.responses`:

Copy

```
{
  gateway: {
    http: {
      endpoints: {
        responses: {
          enabled: true,
          maxBodyBytes: 20000000,
          maxUrlParts: 8,
          files: {
            allowUrl: true,
            urlAllowlist: ["cdn.example.com", "*.assets.example.com"],
            allowedMimes: [
              "text/plain",
              "text/markdown",
              "text/html",
              "text/csv",
              "application/json",
              "application/pdf",
            ],
            maxBytes: 5242880,
            maxChars: 200000,
            maxRedirects: 3,
            timeoutMs: 10000,
            pdf: {
              maxPages: 4,
              maxPixels: 4000000,
              minTextChars: 200,
            },
          },
          images: {
            allowUrl: true,
            urlAllowlist: ["images.example.com"],
            allowedMimes: [
              "image/jpeg",
              "image/png",
              "image/gif",
              "image/webp",
              "image/heic",
              "image/heif",
            ],
            maxBytes: 10485760,
            maxRedirects: 3,
            timeoutMs: 10000,
          },
        },
      },
    },
  },
}
```

Defaults when omitted:

-   `maxBodyBytes`: 20MB
-   `maxUrlParts`: 8
-   `files.maxBytes`: 5MB
-   `files.maxChars`: 200k
-   `files.maxRedirects`: 3
-   `files.timeoutMs`: 10s
-   `files.pdf.maxPages`: 4
-   `files.pdf.maxPixels`: 4,000,000
-   `files.pdf.minTextChars`: 200
-   `images.maxBytes`: 10MB
-   `images.maxRedirects`: 3
-   `images.timeoutMs`: 10s
-   HEIC/HEIF `input_image` sources are accepted and normalized to JPEG before provider delivery.

Security note:

-   URL allowlists are enforced before fetch and on redirect hops.
-   Allowlisting a hostname does not bypass private/internal IP blocking.
-   For internet-exposed gateways, apply network egress controls in addition to app-level guards. See [Security](https://docs.openclaw.ai/gateway/security).

## 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

Streaming (SSE)

Set `stream: true` to receive Server-Sent Events (SSE):

-   `Content-Type: text/event-stream`
-   Each event line is `event: <type>` and `data: <json>`
-   Stream ends with `data: [DONE]`

Event types currently emitted:

-   `response.created`
-   `response.in_progress`
-   `response.output_item.added`
-   `response.content_part.added`
-   `response.output_text.delta`
-   `response.output_text.done`
-   `response.content_part.done`
-   `response.output_item.done`
-   `response.completed`
-   `response.failed` (on error)

## 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

Usage

`usage` is populated when the underlying provider reports token counts.

## 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

Errors

Errors use a JSON object like:

Copy

```
{ "error": { "message": "...", "type": "invalid_request_error" } }
```

Common cases:

-   `401` missing/invalid auth
-   `400` invalid request body
-   `405` wrong method

## 

[​

](https://docs.openclaw.ai/gateway/openresponses-http-api)

Examples

Non-streaming:

Copy

```
curl -sS http://127.0.0.1:18789/v1/responses \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'x-openclaw-agent-id: main' \
  -d '{
    "model": "openclaw",
    "input": "hi"
  }'
```

Streaming:

Copy

```
curl -N http://127.0.0.1:18789/v1/responses \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'x-openclaw-agent-id: main' \
  -d '{
    "model": "openclaw",
    "stream": true,
    "input": "hi"
  }'
```

[OpenAI Chat Completions](https://docs.openclaw.ai/gateway/openai-http-api)[Tools Invoke API](https://docs.openclaw.ai/gateway/tools-invoke-http-api)

⌘I
