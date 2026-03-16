<!-- Source: https://docs.openclaw.ai/providers/qianfan -->
<!-- Title: Qianfan - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/providers/qianfan)

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

-   [Qianfan Provider Guide](https://docs.openclaw.ai/providers/qianfan)
-   [Prerequisites](https://docs.openclaw.ai/providers/qianfan)
-   [Getting Your API Key](https://docs.openclaw.ai/providers/qianfan)
-   [CLI setup](https://docs.openclaw.ai/providers/qianfan)
-   [Related Documentation](https://docs.openclaw.ai/providers/qianfan)

Providers

# Qianfan

# 

[​

](https://docs.openclaw.ai/providers/qianfan)

Qianfan Provider Guide

Qianfan is Baidu’s MaaS platform, provides a **unified API** that routes requests to many models behind a single endpoint and API key. It is OpenAI-compatible, so most OpenAI SDKs work by switching the base URL.

## 

[​

](https://docs.openclaw.ai/providers/qianfan)

Prerequisites

1.  A Baidu Cloud account with Qianfan API access
2.  An API key from the Qianfan console
3.  OpenClaw installed on your system

## 

[​

](https://docs.openclaw.ai/providers/qianfan)

Getting Your API Key

1.  Visit the [Qianfan Console](https://console.bce.baidu.com/qianfan/ais/console/apiKey)
2.  Create a new application or select an existing one
3.  Generate an API key (format: `bce-v3/ALTAK-...`)
4.  Copy the API key for use with OpenClaw

## 

[​

](https://docs.openclaw.ai/providers/qianfan)

CLI setup

Copy

```
openclaw onboard --auth-choice qianfan-api-key
```

## 

[​

](https://docs.openclaw.ai/providers/qianfan)

Related Documentation

-   [OpenClaw Configuration](https://docs.openclaw.ai/gateway/configuration)
-   [Model Providers](https://docs.openclaw.ai/concepts/model-providers)
-   [Agent Setup](https://docs.openclaw.ai/concepts/agent)
-   [Qianfan API Documentation](https://cloud.baidu.com/doc/qianfan-api/s/3m7of64lb)

[OpenRouter](https://docs.openclaw.ai/providers/openrouter)[Qwen](https://docs.openclaw.ai/providers/qwen)

⌘I
