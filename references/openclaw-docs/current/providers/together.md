<!-- Source: https://docs.openclaw.ai/providers/together -->
<!-- Title: Together - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/providers/together)

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

-   [Together AI](https://docs.openclaw.ai/providers/together)
-   [Quick start](https://docs.openclaw.ai/providers/together)
-   [Non-interactive example](https://docs.openclaw.ai/providers/together)
-   [Environment note](https://docs.openclaw.ai/providers/together)
-   [Available models](https://docs.openclaw.ai/providers/together)

Providers

# Together

# 

[​

](https://docs.openclaw.ai/providers/together)

Together AI

The [Together AI](https://together.ai/) provides access to leading open-source models including Llama, DeepSeek, Kimi, and more through a unified API.

-   Provider: `together`
-   Auth: `TOGETHER_API_KEY`
-   API: OpenAI-compatible

## 

[​

](https://docs.openclaw.ai/providers/together)

Quick start

1.  Set the API key (recommended: store it for the Gateway):

Copy

```
openclaw onboard --auth-choice together-api-key
```

2.  Set a default model:

Copy

```
{
  agents: {
    defaults: {
      model: { primary: "together/moonshotai/Kimi-K2.5" },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/providers/together)

Non-interactive example

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice together-api-key \
  --together-api-key "$TOGETHER_API_KEY"
```

This will set `together/moonshotai/Kimi-K2.5` as the default model.

## 

[​

](https://docs.openclaw.ai/providers/together)

Environment note

If the Gateway runs as a daemon (launchd/systemd), make sure `TOGETHER_API_KEY` is available to that process (for example, in `~/.openclaw/.env` or via `env.shellEnv`).

## 

[​

](https://docs.openclaw.ai/providers/together)

Available models

Together AI provides access to many popular open-source models:

-   **GLM 4.7 Fp8** - Default model with 200K context window
-   **Llama 3.3 70B Instruct Turbo** - Fast, efficient instruction following
-   **Llama 4 Scout** - Vision model with image understanding
-   **Llama 4 Maverick** - Advanced vision and reasoning
-   **DeepSeek V3.1** - Powerful coding and reasoning model
-   **DeepSeek R1** - Advanced reasoning model
-   **Kimi K2 Instruct** - High-performance model with 262K context window

All models support standard chat completions and are OpenAI API compatible.

[Synthetic](https://docs.openclaw.ai/providers/synthetic)[Vercel AI Gateway](https://docs.openclaw.ai/providers/vercel-ai-gateway)

⌘I
