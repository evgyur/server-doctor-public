<!-- Source: https://docs.openclaw.ai/providers/kilocode -->
<!-- Title: Kilocode - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/providers/kilocode)

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

-   [Kilo Gateway](https://docs.openclaw.ai/providers/kilocode)
-   [Getting an API key](https://docs.openclaw.ai/providers/kilocode)
-   [CLI setup](https://docs.openclaw.ai/providers/kilocode)
-   [Config snippet](https://docs.openclaw.ai/providers/kilocode)
-   [Default model](https://docs.openclaw.ai/providers/kilocode)
-   [Available models](https://docs.openclaw.ai/providers/kilocode)
-   [Notes](https://docs.openclaw.ai/providers/kilocode)

Providers

# Kilocode

# 

[​

](https://docs.openclaw.ai/providers/kilocode)

Kilo Gateway

Kilo Gateway provides a **unified API** that routes requests to many models behind a single endpoint and API key. It is OpenAI-compatible, so most OpenAI SDKs work by switching the base URL.

## 

[​

](https://docs.openclaw.ai/providers/kilocode)

Getting an API key

1.  Go to [app.kilo.ai](https://app.kilo.ai/)
2.  Sign in or create an account
3.  Navigate to API Keys and generate a new key

## 

[​

](https://docs.openclaw.ai/providers/kilocode)

CLI setup

Copy

```
openclaw onboard --kilocode-api-key <key>
```

Or set the environment variable:

Copy

```
export KILOCODE_API_KEY="<your-kilocode-api-key>" # pragma: allowlist secret
```

## 

[​

](https://docs.openclaw.ai/providers/kilocode)

Config snippet

Copy

```
{
  env: { KILOCODE_API_KEY: "<your-kilocode-api-key>" }, // pragma: allowlist secret
  agents: {
    defaults: {
      model: { primary: "kilocode/kilo/auto" },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/providers/kilocode)

Default model

The default model is `kilocode/kilo/auto`, a smart routing model that automatically selects the best underlying model based on the task:

-   Planning, debugging, and orchestration tasks route to Claude Opus
-   Code writing and exploration tasks route to Claude Sonnet

## 

[​

](https://docs.openclaw.ai/providers/kilocode)

Available models

OpenClaw dynamically discovers available models from the Kilo Gateway at startup. Use `/models kilocode` to see the full list of models available with your account. Any model available on the gateway can be used with the `kilocode/` prefix:

Copy

```
kilocode/kilo/auto              (default - smart routing)
kilocode/anthropic/claude-sonnet-4
kilocode/openai/gpt-5.2
kilocode/google/gemini-3-pro-preview
...and many more
```

## 

[​

](https://docs.openclaw.ai/providers/kilocode)

Notes

-   Model refs are `kilocode/<model-id>` (e.g., `kilocode/anthropic/claude-sonnet-4`).
-   Default model: `kilocode/kilo/auto`
-   Base URL: `https://api.kilo.ai/api/gateway/`
-   For more model/provider options, see [/concepts/model-providers](https://docs.openclaw.ai/concepts/model-providers).
-   Kilo Gateway uses a Bearer token with your API key under the hood.

[Hugging Face (Inference)](https://docs.openclaw.ai/providers/huggingface)[Litellm](https://docs.openclaw.ai/providers/litellm)

⌘I
