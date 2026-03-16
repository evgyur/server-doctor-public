<!-- Source: https://docs.openclaw.ai/providers/qwen -->
<!-- Title: Qwen - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/providers/qwen)

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

-   [Qwen](https://docs.openclaw.ai/providers/qwen)
-   [Enable the plugin](https://docs.openclaw.ai/providers/qwen)
-   [Authenticate](https://docs.openclaw.ai/providers/qwen)
-   [Model IDs](https://docs.openclaw.ai/providers/qwen)
-   [Reuse Qwen Code CLI login](https://docs.openclaw.ai/providers/qwen)
-   [Notes](https://docs.openclaw.ai/providers/qwen)

Providers

# Qwen

# 

[​

](https://docs.openclaw.ai/providers/qwen)

Qwen

Qwen provides a free-tier OAuth flow for Qwen Coder and Qwen Vision models (2,000 requests/day, subject to Qwen rate limits).

## 

[​

](https://docs.openclaw.ai/providers/qwen)

Enable the plugin

Copy

```
openclaw plugins enable qwen-portal-auth
```

Restart the Gateway after enabling.

## 

[​

](https://docs.openclaw.ai/providers/qwen)

Authenticate

Copy

```
openclaw models auth login --provider qwen-portal --set-default
```

This runs the Qwen device-code OAuth flow and writes a provider entry to your `models.json` (plus a `qwen` alias for quick switching).

## 

[​

](https://docs.openclaw.ai/providers/qwen)

Model IDs

-   `qwen-portal/coder-model`
-   `qwen-portal/vision-model`

Switch models with:

Copy

```
openclaw models set qwen-portal/coder-model
```

## 

[​

](https://docs.openclaw.ai/providers/qwen)

Reuse Qwen Code CLI login

If you already logged in with the Qwen Code CLI, OpenClaw will sync credentials from `~/.qwen/oauth_creds.json` when it loads the auth store. You still need a `models.providers.qwen-portal` entry (use the login command above to create one).

## 

[​

](https://docs.openclaw.ai/providers/qwen)

Notes

-   Tokens auto-refresh; re-run the login command if refresh fails or access is revoked.
-   Default base URL: `https://portal.qwen.ai/v1` (override with `models.providers.qwen-portal.baseUrl` if Qwen provides a different endpoint).
-   See [Model providers](https://docs.openclaw.ai/concepts/model-providers) for provider-wide rules.

[Qianfan](https://docs.openclaw.ai/providers/qianfan)[Synthetic](https://docs.openclaw.ai/providers/synthetic)

⌘I
