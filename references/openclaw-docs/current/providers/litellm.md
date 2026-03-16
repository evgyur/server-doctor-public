<!-- Source: https://docs.openclaw.ai/providers/litellm -->
<!-- Title: Litellm - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/providers/litellm)

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

-   [LiteLLM](https://docs.openclaw.ai/providers/litellm)
-   [Why use LiteLLM with OpenClaw?](https://docs.openclaw.ai/providers/litellm)
-   [Quick start](https://docs.openclaw.ai/providers/litellm)
-   [Via onboarding](https://docs.openclaw.ai/providers/litellm)
-   [Manual setup](https://docs.openclaw.ai/providers/litellm)
-   [Configuration](https://docs.openclaw.ai/providers/litellm)
-   [Environment variables](https://docs.openclaw.ai/providers/litellm)
-   [Config file](https://docs.openclaw.ai/providers/litellm)
-   [Virtual keys](https://docs.openclaw.ai/providers/litellm)
-   [Model routing](https://docs.openclaw.ai/providers/litellm)
-   [Viewing usage](https://docs.openclaw.ai/providers/litellm)
-   [Notes](https://docs.openclaw.ai/providers/litellm)
-   [See also](https://docs.openclaw.ai/providers/litellm)

Providers

# Litellm

# 

[​

](https://docs.openclaw.ai/providers/litellm)

LiteLLM

[LiteLLM](https://litellm.ai/) is an open-source LLM gateway that provides a unified API to 100+ model providers. Route OpenClaw through LiteLLM to get centralized cost tracking, logging, and the flexibility to switch backends without changing your OpenClaw config.

## 

[​

](https://docs.openclaw.ai/providers/litellm)

Why use LiteLLM with OpenClaw?

-   **Cost tracking** — See exactly what OpenClaw spends across all models
-   **Model routing** — Switch between Claude, GPT-4, Gemini, Bedrock without config changes
-   **Virtual keys** — Create keys with spend limits for OpenClaw
-   **Logging** — Full request/response logs for debugging
-   **Fallbacks** — Automatic failover if your primary provider is down

## 

[​

](https://docs.openclaw.ai/providers/litellm)

Quick start

### 

[​

](https://docs.openclaw.ai/providers/litellm)

Via onboarding

Copy

```
openclaw onboard --auth-choice litellm-api-key
```

### 

[​

](https://docs.openclaw.ai/providers/litellm)

Manual setup

1.  Start LiteLLM Proxy:

Copy

```
pip install 'litellm[proxy]'
litellm --model claude-opus-4-6
```

2.  Point OpenClaw to LiteLLM:

Copy

```
export LITELLM_API_KEY="your-litellm-key"

openclaw
```

That’s it. OpenClaw now routes through LiteLLM.

## 

[​

](https://docs.openclaw.ai/providers/litellm)

Configuration

### 

[​

](https://docs.openclaw.ai/providers/litellm)

Environment variables

Copy

```
export LITELLM_API_KEY="sk-litellm-key"
```

### 

[​

](https://docs.openclaw.ai/providers/litellm)

Config file

Copy

```
{
  models: {
    providers: {
      litellm: {
        baseUrl: "http://localhost:4000",
        apiKey: "${LITELLM_API_KEY}",
        api: "openai-completions",
        models: [
          {
            id: "claude-opus-4-6",
            name: "Claude Opus 4.6",
            reasoning: true,
            input: ["text", "image"],
            contextWindow: 200000,
            maxTokens: 64000,
          },
          {
            id: "gpt-4o",
            name: "GPT-4o",
            reasoning: false,
            input: ["text", "image"],
            contextWindow: 128000,
            maxTokens: 8192,
          },
        ],
      },
    },
  },
  agents: {
    defaults: {
      model: { primary: "litellm/claude-opus-4-6" },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/providers/litellm)

Virtual keys

Create a dedicated key for OpenClaw with spend limits:

Copy

```
curl -X POST "http://localhost:4000/key/generate" \
  -H "Authorization: Bearer $LITELLM_MASTER_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "key_alias": "openclaw",
    "max_budget": 50.00,
    "budget_duration": "monthly"
  }'
```

Use the generated key as `LITELLM_API_KEY`.

## 

[​

](https://docs.openclaw.ai/providers/litellm)

Model routing

LiteLLM can route model requests to different backends. Configure in your LiteLLM `config.yaml`:

Copy

```
model_list:
  - model_name: claude-opus-4-6
    litellm_params:
      model: claude-opus-4-6
      api_key: os.environ/ANTHROPIC_API_KEY

  - model_name: gpt-4o
    litellm_params:
      model: gpt-4o
      api_key: os.environ/OPENAI_API_KEY
```

OpenClaw keeps requesting `claude-opus-4-6` — LiteLLM handles the routing.

## 

[​

](https://docs.openclaw.ai/providers/litellm)

Viewing usage

Check LiteLLM’s dashboard or API:

Copy

```
# Key info
curl "http://localhost:4000/key/info" \
  -H "Authorization: Bearer sk-litellm-key"

# Spend logs
curl "http://localhost:4000/spend/logs" \
  -H "Authorization: Bearer $LITELLM_MASTER_KEY"
```

## 

[​

](https://docs.openclaw.ai/providers/litellm)

Notes

-   LiteLLM runs on `http://localhost:4000` by default
-   OpenClaw connects via the OpenAI-compatible `/v1/chat/completions` endpoint
-   All OpenClaw features work through LiteLLM — no limitations

## 

[​

](https://docs.openclaw.ai/providers/litellm)

See also

-   [LiteLLM Docs](https://docs.litellm.ai/)
-   [Model Providers](https://docs.openclaw.ai/concepts/model-providers)

[Kilocode](https://docs.openclaw.ai/providers/kilocode)[GLM Models](https://docs.openclaw.ai/providers/glm)

⌘I
