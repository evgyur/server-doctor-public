<!-- Source: https://docs.openclaw.ai/providers/vercel-ai-gateway -->
<!-- Title: Vercel AI Gateway - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/providers/vercel-ai-gateway)

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

-   [Vercel AI Gateway](https://docs.openclaw.ai/providers/vercel-ai-gateway)
-   [Quick start](https://docs.openclaw.ai/providers/vercel-ai-gateway)
-   [Non-interactive example](https://docs.openclaw.ai/providers/vercel-ai-gateway)
-   [Environment note](https://docs.openclaw.ai/providers/vercel-ai-gateway)
-   [Model ID shorthand](https://docs.openclaw.ai/providers/vercel-ai-gateway)

Providers

# Vercel AI Gateway

# 

[​

](https://docs.openclaw.ai/providers/vercel-ai-gateway)

Vercel AI Gateway

The [Vercel AI Gateway](https://vercel.com/ai-gateway) provides a unified API to access hundreds of models through a single endpoint.

-   Provider: `vercel-ai-gateway`
-   Auth: `AI_GATEWAY_API_KEY`
-   API: Anthropic Messages compatible
-   OpenClaw auto-discovers the Gateway `/v1/models` catalog, so `/models vercel-ai-gateway` includes current model refs such as `vercel-ai-gateway/openai/gpt-5.4`.

## 

[​

](https://docs.openclaw.ai/providers/vercel-ai-gateway)

Quick start

1.  Set the API key (recommended: store it for the Gateway):

Copy

```
openclaw onboard --auth-choice ai-gateway-api-key
```

2.  Set a default model:

Copy

```
{
  agents: {
    defaults: {
      model: { primary: "vercel-ai-gateway/anthropic/claude-opus-4.6" },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/providers/vercel-ai-gateway)

Non-interactive example

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice ai-gateway-api-key \
  --ai-gateway-api-key "$AI_GATEWAY_API_KEY"
```

## 

[​

](https://docs.openclaw.ai/providers/vercel-ai-gateway)

Environment note

If the Gateway runs as a daemon (launchd/systemd), make sure `AI_GATEWAY_API_KEY` is available to that process (for example, in `~/.openclaw/.env` or via `env.shellEnv`).

## 

[​

](https://docs.openclaw.ai/providers/vercel-ai-gateway)

Model ID shorthand

OpenClaw accepts Vercel Claude shorthand model refs and normalizes them at runtime:

-   `vercel-ai-gateway/claude-opus-4.6` -> `vercel-ai-gateway/anthropic/claude-opus-4.6`
-   `vercel-ai-gateway/opus-4.6` -> `vercel-ai-gateway/anthropic/claude-opus-4-6`

[Together](https://docs.openclaw.ai/providers/together)[Venice AI](https://docs.openclaw.ai/providers/venice)

⌘I
