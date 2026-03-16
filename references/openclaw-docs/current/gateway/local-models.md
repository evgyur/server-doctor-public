<!-- Source: https://docs.openclaw.ai/gateway/local-models -->
<!-- Title: Local Models - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/local-models)

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

-   [Local models](https://docs.openclaw.ai/gateway/local-models)
-   [Recommended: LM Studio + MiniMax M2.5 (Responses API, full-size)](https://docs.openclaw.ai/gateway/local-models)
-   [Hybrid config: hosted primary, local fallback](https://docs.openclaw.ai/gateway/local-models)
-   [Local-first with hosted safety net](https://docs.openclaw.ai/gateway/local-models)
-   [Regional hosting / data routing](https://docs.openclaw.ai/gateway/local-models)
-   [Other OpenAI-compatible local proxies](https://docs.openclaw.ai/gateway/local-models)
-   [Troubleshooting](https://docs.openclaw.ai/gateway/local-models)

Protocols and APIs

# Local Models

# 

[​

](https://docs.openclaw.ai/gateway/local-models)

Local models

Local is doable, but OpenClaw expects large context + strong defenses against prompt injection. Small cards truncate context and leak safety. Aim high: **≥2 maxed-out Mac Studios or equivalent GPU rig (~$30k+)**. A single **24 GB** GPU works only for lighter prompts with higher latency. Use the **largest / full-size model variant you can run**; aggressively quantized or “small” checkpoints raise prompt-injection risk (see [Security](https://docs.openclaw.ai/gateway/security)). If you want the lowest-friction local setup, start with [Ollama](https://docs.openclaw.ai/providers/ollama) and `openclaw onboard`. This page is the opinionated guide for higher-end local stacks and custom OpenAI-compatible local servers.

## 

[​

](https://docs.openclaw.ai/gateway/local-models)

Recommended: LM Studio + MiniMax M2.5 (Responses API, full-size)

Best current local stack. Load MiniMax M2.5 in LM Studio, enable the local server (default `http://127.0.0.1:1234`), and use Responses API to keep reasoning separate from final text.

Copy

```
{
  agents: {
    defaults: {
      model: { primary: "lmstudio/minimax-m2.5-gs32" },
      models: {
        "anthropic/claude-opus-4-6": { alias: "Opus" },
        "lmstudio/minimax-m2.5-gs32": { alias: "Minimax" },
      },
    },
  },
  models: {
    mode: "merge",
    providers: {
      lmstudio: {
        baseUrl: "http://127.0.0.1:1234/v1",
        apiKey: "lmstudio",
        api: "openai-responses",
        models: [
          {
            id: "minimax-m2.5-gs32",
            name: "MiniMax M2.5 GS32",
            reasoning: false,
            input: ["text"],
            cost: { input: 0, output: 0, cacheRead: 0, cacheWrite: 0 },
            contextWindow: 196608,
            maxTokens: 8192,
          },
        ],
      },
    },
  },
}
```

**Setup checklist**

-   Install LM Studio: [https://lmstudio.ai](https://lmstudio.ai/)
-   In LM Studio, download the **largest MiniMax M2.5 build available** (avoid “small”/heavily quantized variants), start the server, confirm `http://127.0.0.1:1234/v1/models` lists it.
-   Keep the model loaded; cold-load adds startup latency.
-   Adjust `contextWindow`/`maxTokens` if your LM Studio build differs.
-   For WhatsApp, stick to Responses API so only final text is sent.

Keep hosted models configured even when running local; use `models.mode: "merge"` so fallbacks stay available.

### 

[​

](https://docs.openclaw.ai/gateway/local-models)

Hybrid config: hosted primary, local fallback

Copy

```
{
  agents: {
    defaults: {
      model: {
        primary: "anthropic/claude-sonnet-4-5",
        fallbacks: ["lmstudio/minimax-m2.5-gs32", "anthropic/claude-opus-4-6"],
      },
      models: {
        "anthropic/claude-sonnet-4-5": { alias: "Sonnet" },
        "lmstudio/minimax-m2.5-gs32": { alias: "MiniMax Local" },
        "anthropic/claude-opus-4-6": { alias: "Opus" },
      },
    },
  },
  models: {
    mode: "merge",
    providers: {
      lmstudio: {
        baseUrl: "http://127.0.0.1:1234/v1",
        apiKey: "lmstudio",
        api: "openai-responses",
        models: [
          {
            id: "minimax-m2.5-gs32",
            name: "MiniMax M2.5 GS32",
            reasoning: false,
            input: ["text"],
            cost: { input: 0, output: 0, cacheRead: 0, cacheWrite: 0 },
            contextWindow: 196608,
            maxTokens: 8192,
          },
        ],
      },
    },
  },
}
```

### 

[​

](https://docs.openclaw.ai/gateway/local-models)

Local-first with hosted safety net

Swap the primary and fallback order; keep the same providers block and `models.mode: "merge"` so you can fall back to Sonnet or Opus when the local box is down.

### 

[​

](https://docs.openclaw.ai/gateway/local-models)

Regional hosting / data routing

-   Hosted MiniMax/Kimi/GLM variants also exist on OpenRouter with region-pinned endpoints (e.g., US-hosted). Pick the regional variant there to keep traffic in your chosen jurisdiction while still using `models.mode: "merge"` for Anthropic/OpenAI fallbacks.
-   Local-only remains the strongest privacy path; hosted regional routing is the middle ground when you need provider features but want control over data flow.

## 

[​

](https://docs.openclaw.ai/gateway/local-models)

Other OpenAI-compatible local proxies

vLLM, LiteLLM, OAI-proxy, or custom gateways work if they expose an OpenAI-style `/v1` endpoint. Replace the provider block above with your endpoint and model ID:

Copy

```
{
  models: {
    mode: "merge",
    providers: {
      local: {
        baseUrl: "http://127.0.0.1:8000/v1",
        apiKey: "sk-local",
        api: "openai-responses",
        models: [
          {
            id: "my-local-model",
            name: "Local Model",
            reasoning: false,
            input: ["text"],
            cost: { input: 0, output: 0, cacheRead: 0, cacheWrite: 0 },
            contextWindow: 120000,
            maxTokens: 8192,
          },
        ],
      },
    },
  },
}
```

Keep `models.mode: "merge"` so hosted models stay available as fallbacks.

## 

[​

](https://docs.openclaw.ai/gateway/local-models)

Troubleshooting

-   Gateway can reach the proxy? `curl http://127.0.0.1:1234/v1/models`.
-   LM Studio model unloaded? Reload; cold start is a common “hanging” cause.
-   Context errors? Lower `contextWindow` or raise your server limit.
-   Safety: local models skip provider-side filters; keep agents narrow and compaction on to limit prompt injection blast radius.

[CLI Backends](https://docs.openclaw.ai/gateway/cli-backends)[Network model](https://docs.openclaw.ai/gateway/network-model)

⌘I
