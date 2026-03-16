<!-- Source: https://docs.openclaw.ai/providers/github-copilot -->
<!-- Title: GitHub Copilot - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/providers/github-copilot)

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

-   [GitHub Copilot](https://docs.openclaw.ai/providers/github-copilot)
-   [What is GitHub Copilot?](https://docs.openclaw.ai/providers/github-copilot)
-   [Two ways to use Copilot in OpenClaw](https://docs.openclaw.ai/providers/github-copilot)
-   [1) Built-in GitHub Copilot provider (github-copilot)](https://docs.openclaw.ai/providers/github-copilot)
-   [2) Copilot Proxy plugin (copilot-proxy)](https://docs.openclaw.ai/providers/github-copilot)
-   [CLI setup](https://docs.openclaw.ai/providers/github-copilot)
-   [Optional flags](https://docs.openclaw.ai/providers/github-copilot)
-   [Set a default model](https://docs.openclaw.ai/providers/github-copilot)
-   [Config snippet](https://docs.openclaw.ai/providers/github-copilot)
-   [Notes](https://docs.openclaw.ai/providers/github-copilot)

Providers

# GitHub Copilot

# 

[​

](https://docs.openclaw.ai/providers/github-copilot)

GitHub Copilot

## 

[​

](https://docs.openclaw.ai/providers/github-copilot)

What is GitHub Copilot?

GitHub Copilot is GitHub’s AI coding assistant. It provides access to Copilot models for your GitHub account and plan. OpenClaw can use Copilot as a model provider in two different ways.

## 

[​

](https://docs.openclaw.ai/providers/github-copilot)

Two ways to use Copilot in OpenClaw

### 

[​

](https://docs.openclaw.ai/providers/github-copilot)

1) Built-in GitHub Copilot provider (`github-copilot`)

Use the native device-login flow to obtain a GitHub token, then exchange it for Copilot API tokens when OpenClaw runs. This is the **default** and simplest path because it does not require VS Code.

### 

[​

](https://docs.openclaw.ai/providers/github-copilot)

2) Copilot Proxy plugin (`copilot-proxy`)

Use the **Copilot Proxy** VS Code extension as a local bridge. OpenClaw talks to the proxy’s `/v1` endpoint and uses the model list you configure there. Choose this when you already run Copilot Proxy in VS Code or need to route through it. You must enable the plugin and keep the VS Code extension running. Use GitHub Copilot as a model provider (`github-copilot`). The login command runs the GitHub device flow, saves an auth profile, and updates your config to use that profile.

## 

[​

](https://docs.openclaw.ai/providers/github-copilot)

CLI setup

Copy

```
openclaw models auth login-github-copilot
```

You’ll be prompted to visit a URL and enter a one-time code. Keep the terminal open until it completes.

### 

[​

](https://docs.openclaw.ai/providers/github-copilot)

Optional flags

Copy

```
openclaw models auth login-github-copilot --profile-id github-copilot:work
openclaw models auth login-github-copilot --yes
```

## 

[​

](https://docs.openclaw.ai/providers/github-copilot)

Set a default model

Copy

```
openclaw models set github-copilot/gpt-4o
```

### 

[​

](https://docs.openclaw.ai/providers/github-copilot)

Config snippet

Copy

```
{
  agents: { defaults: { model: { primary: "github-copilot/gpt-4o" } } },
}
```

## 

[​

](https://docs.openclaw.ai/providers/github-copilot)

Notes

-   Requires an interactive TTY; run it directly in a terminal.
-   Copilot model availability depends on your plan; if a model is rejected, try another ID (for example `github-copilot/gpt-4.1`).
-   The login stores a GitHub token in the auth profile store and exchanges it for a Copilot API token when OpenClaw runs.

[Deepgram](https://docs.openclaw.ai/providers/deepgram)[Hugging Face (Inference)](https://docs.openclaw.ai/providers/huggingface)

⌘I
