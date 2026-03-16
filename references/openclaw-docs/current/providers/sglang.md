<!-- Source: https://docs.openclaw.ai/providers/sglang -->
<!-- Title: SGLang - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/providers/sglang)

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

##### Overview

-   [
    
    Model Providers
    
    
    
    ](https://docs.openclaw.ai/providers)
-   [
    
    Model Provider Quickstart
    
    
    
    ](https://docs.openclaw.ai/providers/models)

##### Model concepts

-   [
    
    Models CLI
    
    
    
    ](https://docs.openclaw.ai/concepts/models)

##### Configuration

-   [
    
    Model Providers
    
    
    
    ](https://docs.openclaw.ai/concepts/model-providers)
-   [
    
    Model Failover
    
    
    
    ](https://docs.openclaw.ai/concepts/model-failover)

##### Providers

-   [
    
    Anthropic
    
    
    
    ](https://docs.openclaw.ai/providers/anthropic)
-   [
    
    Amazon Bedrock
    
    
    
    ](https://docs.openclaw.ai/providers/bedrock)
-   [
    
    Cloudflare AI Gateway
    
    
    
    ](https://docs.openclaw.ai/providers/cloudflare-ai-gateway)
-   [
    
    Claude Max API Proxy
    
    
    
    ](https://docs.openclaw.ai/providers/claude-max-api-proxy)
-   [
    
    Deepgram
    
    
    
    ](https://docs.openclaw.ai/providers/deepgram)
-   [
    
    GitHub Copilot
    
    
    
    ](https://docs.openclaw.ai/providers/github-copilot)
-   [
    
    Hugging Face (Inference)
    
    
    
    ](https://docs.openclaw.ai/providers/huggingface)
-   [
    
    Kilocode
    
    
    
    ](https://docs.openclaw.ai/providers/kilocode)
-   [
    
    Litellm
    
    
    
    ](https://docs.openclaw.ai/providers/litellm)
-   [
    
    GLM Models
    
    
    
    ](https://docs.openclaw.ai/providers/glm)
-   [
    
    MiniMax
    
    
    
    ](https://docs.openclaw.ai/providers/minimax)
-   [
    
    Moonshot AI
    
    
    
    ](https://docs.openclaw.ai/providers/moonshot)
-   [
    
    Mistral
    
    
    
    ](https://docs.openclaw.ai/providers/mistral)
-   [
    
    NVIDIA
    
    
    
    ](https://docs.openclaw.ai/providers/nvidia)
-   [
    
    Ollama
    
    
    
    ](https://docs.openclaw.ai/providers/ollama)
-   [
    
    OpenAI
    
    
    
    ](https://docs.openclaw.ai/providers/openai)
-   [
    
    OpenCode Go
    
    
    
    ](https://docs.openclaw.ai/providers/opencode-go)
-   [
    
    OpenCode
    
    
    
    ](https://docs.openclaw.ai/providers/opencode)
-   [
    
    OpenRouter
    
    
    
    ](https://docs.openclaw.ai/providers/openrouter)
-   [
    
    Qianfan
    
    
    
    ](https://docs.openclaw.ai/providers/qianfan)
-   [
    
    Qwen
    
    
    
    ](https://docs.openclaw.ai/providers/qwen)
-   [
    
    Synthetic
    
    
    
    ](https://docs.openclaw.ai/providers/synthetic)
-   [
    
    Together
    
    
    
    ](https://docs.openclaw.ai/providers/together)
-   [
    
    Vercel AI Gateway
    
    
    
    ](https://docs.openclaw.ai/providers/vercel-ai-gateway)
-   [
    
    Venice AI
    
    
    
    ](https://docs.openclaw.ai/providers/venice)
-   [
    
    vLLM
    
    
    
    ](https://docs.openclaw.ai/providers/vllm)
-   [
    
    Xiaomi MiMo
    
    
    
    ](https://docs.openclaw.ai/providers/xiaomi)
-   [
    
    Z.AI
    
    
    
    ](https://docs.openclaw.ai/providers/zai)

-   [SGLang](https://docs.openclaw.ai/providers/sglang)
-   [Quick start](https://docs.openclaw.ai/providers/sglang)
-   [Model discovery (implicit provider)](https://docs.openclaw.ai/providers/sglang)
-   [Explicit configuration (manual models)](https://docs.openclaw.ai/providers/sglang)
-   [Troubleshooting](https://docs.openclaw.ai/providers/sglang)

# SGLang

# 

[​

](https://docs.openclaw.ai/providers/sglang)

SGLang

SGLang can serve open-source models via an **OpenAI-compatible** HTTP API. OpenClaw can connect to SGLang using the `openai-completions` API. OpenClaw can also **auto-discover** available models from SGLang when you opt in with `SGLANG_API_KEY` (any value works if your server does not enforce auth) and you do not define an explicit `models.providers.sglang` entry.

## 

[​

](https://docs.openclaw.ai/providers/sglang)

Quick start

1.  Start SGLang with an OpenAI-compatible server.

Your base URL should expose `/v1` endpoints (for example `/v1/models`, `/v1/chat/completions`). SGLang commonly runs on:

-   `http://127.0.0.1:30000/v1`

2.  Opt in (any value works if no auth is configured):

Copy

```
export SGLANG_API_KEY="sglang-local"
```

3.  Run onboarding and choose `SGLang`, or set a model directly:

Copy

```
openclaw onboard
```

Copy

```
{
  agents: {
    defaults: {
      model: { primary: "sglang/your-model-id" },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/providers/sglang)

Model discovery (implicit provider)

When `SGLANG_API_KEY` is set (or an auth profile exists) and you **do not** define `models.providers.sglang`, OpenClaw will query:

-   `GET http://127.0.0.1:30000/v1/models`

and convert the returned IDs into model entries. If you set `models.providers.sglang` explicitly, auto-discovery is skipped and you must define models manually.

## 

[​

](https://docs.openclaw.ai/providers/sglang)

Explicit configuration (manual models)

Use explicit config when:

-   SGLang runs on a different host/port.
-   You want to pin `contextWindow`/`maxTokens` values.
-   Your server requires a real API key (or you want to control headers).

Copy

```
{
  models: {
    providers: {
      sglang: {
        baseUrl: "http://127.0.0.1:30000/v1",
        apiKey: "${SGLANG_API_KEY}",
        api: "openai-completions",
        models: [
          {
            id: "your-model-id",
            name: "Local SGLang Model",
            reasoning: false,
            input: ["text"],
            cost: { input: 0, output: 0, cacheRead: 0, cacheWrite: 0 },
            contextWindow: 128000,
            maxTokens: 8192,
          },
        ],
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/providers/sglang)

Troubleshooting

-   Check the server is reachable:

Copy

```
curl http://127.0.0.1:30000/v1/models
```

-   If requests fail with auth errors, set a real `SGLANG_API_KEY` that matches your server configuration, or configure the provider explicitly under `models.providers.sglang`.

⌘I
