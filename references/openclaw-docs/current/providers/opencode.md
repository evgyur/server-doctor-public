<!-- Source: https://docs.openclaw.ai/providers/opencode -->
<!-- Title: OpenCode - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/providers/opencode)

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

-   [OpenCode](https://docs.openclaw.ai/providers/opencode)
-   [CLI setup](https://docs.openclaw.ai/providers/opencode)
-   [Zen catalog](https://docs.openclaw.ai/providers/opencode)
-   [Go catalog](https://docs.openclaw.ai/providers/opencode)
-   [Config snippet](https://docs.openclaw.ai/providers/opencode)
-   [Catalogs](https://docs.openclaw.ai/providers/opencode)
-   [Zen](https://docs.openclaw.ai/providers/opencode)
-   [Go](https://docs.openclaw.ai/providers/opencode)
-   [Notes](https://docs.openclaw.ai/providers/opencode)

Providers

# OpenCode

# 

[​

](https://docs.openclaw.ai/providers/opencode)

OpenCode

OpenCode exposes two hosted catalogs in OpenClaw:

-   `opencode/...` for the **Zen** catalog
-   `opencode-go/...` for the **Go** catalog

Both catalogs use the same OpenCode API key. OpenClaw keeps the runtime provider ids split so upstream per-model routing stays correct, but onboarding and docs treat them as one OpenCode setup.

## 

[​

](https://docs.openclaw.ai/providers/opencode)

CLI setup

### 

[​

](https://docs.openclaw.ai/providers/opencode)

Zen catalog

Copy

```
openclaw onboard --auth-choice opencode-zen
openclaw onboard --opencode-zen-api-key "$OPENCODE_API_KEY"
```

### 

[​

](https://docs.openclaw.ai/providers/opencode)

Go catalog

Copy

```
openclaw onboard --auth-choice opencode-go
openclaw onboard --opencode-go-api-key "$OPENCODE_API_KEY"
```

## 

[​

](https://docs.openclaw.ai/providers/opencode)

Config snippet

Copy

```
{
  env: { OPENCODE_API_KEY: "sk-..." },
  agents: { defaults: { model: { primary: "opencode/claude-opus-4-6" } } },
}
```

## 

[​

](https://docs.openclaw.ai/providers/opencode)

Catalogs

### 

[​

](https://docs.openclaw.ai/providers/opencode)

Zen

-   Runtime provider: `opencode`
-   Example models: `opencode/claude-opus-4-6`, `opencode/gpt-5.2`, `opencode/gemini-3-pro`
-   Best when you want the curated OpenCode multi-model proxy

### 

[​

](https://docs.openclaw.ai/providers/opencode)

Go

-   Runtime provider: `opencode-go`
-   Example models: `opencode-go/kimi-k2.5`, `opencode-go/glm-5`, `opencode-go/minimax-m2.5`
-   Best when you want the OpenCode-hosted Kimi/GLM/MiniMax lineup

## 

[​

](https://docs.openclaw.ai/providers/opencode)

Notes

-   `OPENCODE_ZEN_API_KEY` is also supported.
-   Entering one OpenCode key during setup stores credentials for both runtime providers.
-   You sign in to OpenCode, add billing details, and copy your API key.
-   Billing and catalog availability are managed from the OpenCode dashboard.

[OpenCode Go](https://docs.openclaw.ai/providers/opencode-go)[OpenRouter](https://docs.openclaw.ai/providers/openrouter)

⌘I
