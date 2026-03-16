<!-- Source: https://docs.openclaw.ai/providers -->
<!-- Title: Model Providers - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/providers)

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

-   [Model Providers](https://docs.openclaw.ai/providers)
-   [Quick start](https://docs.openclaw.ai/providers)
-   [Provider docs](https://docs.openclaw.ai/providers)
-   [Transcription providers](https://docs.openclaw.ai/providers)
-   [Community tools](https://docs.openclaw.ai/providers)

Overview

# Model Providers

# 

[​

](https://docs.openclaw.ai/providers)

Model Providers

OpenClaw can use many LLM providers. Pick a provider, authenticate, then set the default model as `provider/model`. Looking for chat channel docs (WhatsApp/Telegram/Discord/Slack/Mattermost (plugin)/etc.)? See [Channels](https://docs.openclaw.ai/channels).

## 

[​

](https://docs.openclaw.ai/providers)

Quick start

1.  Authenticate with the provider (usually via `openclaw onboard`).
2.  Set the default model:

Copy

```
{
  agents: { defaults: { model: { primary: "anthropic/claude-opus-4-6" } } },
}
```

## 

[​

](https://docs.openclaw.ai/providers)

Provider docs

-   [Amazon Bedrock](https://docs.openclaw.ai/providers/bedrock)
-   [Anthropic (API + Claude Code CLI)](https://docs.openclaw.ai/providers/anthropic)
-   [Cloudflare AI Gateway](https://docs.openclaw.ai/providers/cloudflare-ai-gateway)
-   [GLM models](https://docs.openclaw.ai/providers/glm)
-   [Hugging Face (Inference)](https://docs.openclaw.ai/providers/huggingface)
-   [Kilocode](https://docs.openclaw.ai/providers/kilocode)
-   [LiteLLM (unified gateway)](https://docs.openclaw.ai/providers/litellm)
-   [MiniMax](https://docs.openclaw.ai/providers/minimax)
-   [Mistral](https://docs.openclaw.ai/providers/mistral)
-   [Moonshot AI (Kimi + Kimi Coding)](https://docs.openclaw.ai/providers/moonshot)
-   [NVIDIA](https://docs.openclaw.ai/providers/nvidia)
-   [Ollama (cloud + local models)](https://docs.openclaw.ai/providers/ollama)
-   [OpenAI (API + Codex)](https://docs.openclaw.ai/providers/openai)
-   [OpenCode (Zen + Go)](https://docs.openclaw.ai/providers/opencode)
-   [OpenRouter](https://docs.openclaw.ai/providers/openrouter)
-   [Qianfan](https://docs.openclaw.ai/providers/qianfan)
-   [Qwen (OAuth)](https://docs.openclaw.ai/providers/qwen)
-   [Together AI](https://docs.openclaw.ai/providers/together)
-   [Vercel AI Gateway](https://docs.openclaw.ai/providers/vercel-ai-gateway)
-   [Venice (Venice AI, privacy-focused)](https://docs.openclaw.ai/providers/venice)
-   [vLLM (local models)](https://docs.openclaw.ai/providers/vllm)
-   [Xiaomi](https://docs.openclaw.ai/providers/xiaomi)
-   [Z.AI](https://docs.openclaw.ai/providers/zai)

## 

[​

](https://docs.openclaw.ai/providers)

Transcription providers

-   [Deepgram (audio transcription)](https://docs.openclaw.ai/providers/deepgram)

## 

[​

](https://docs.openclaw.ai/providers)

Community tools

-   [Claude Max API Proxy](https://docs.openclaw.ai/providers/claude-max-api-proxy) - Community proxy for Claude subscription credentials (verify Anthropic policy/terms before use)

For the full provider catalog (xAI, Groq, Mistral, etc.) and advanced configuration, see [Model providers](https://docs.openclaw.ai/concepts/model-providers).

[Model Provider Quickstart](https://docs.openclaw.ai/providers/models)

⌘I
