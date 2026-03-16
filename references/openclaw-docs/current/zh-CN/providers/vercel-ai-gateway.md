<!-- Source: https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway -->
<!-- Title: Vercel AI Gateway - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)

[OpenClaw home page![light logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)![dark logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)](https://docs.openclaw.ai/zh-CN)

[快速开始

](https://docs.openclaw.ai/zh-CN)[安装

](https://docs.openclaw.ai/zh-CN/install)[消息渠道

](https://docs.openclaw.ai/zh-CN/channels)[代理

](https://docs.openclaw.ai/zh-CN/pi)[工具

](https://docs.openclaw.ai/zh-CN/tools)[模型

](https://docs.openclaw.ai/zh-CN/providers)[平台

](https://docs.openclaw.ai/zh-CN/platforms)[网关与运维

](https://docs.openclaw.ai/zh-CN/gateway)[参考

](https://docs.openclaw.ai/zh-CN/cli)[帮助

](https://docs.openclaw.ai/zh-CN/help)

##### 概览

-   [
    
    模型提供商
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers)
-   [
    
    模型提供商快速开始
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/models)

##### 模型概念

-   [
    
    Models CLI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/models)

##### 配置

-   [
    
    模型提供商
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/model-providers)
-   [
    
    模型故障转移
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/model-failover)

##### 提供商

-   [
    
    Anthropic
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/anthropic)
-   [
    
    Amazon Bedrock
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/bedrock)
-   [
    
    Claude Max API 代理
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/claude-max-api-proxy)
-   [
    
    Deepgram
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/deepgram)
-   [
    
    GitHub Copilot
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/github-copilot)
-   [
    
    GLM Models
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/glm)
-   [
    
    Moonshot AI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/moonshot)
-   [
    
    MiniMax
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [
    
    OpenCode
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/opencode)
-   [
    
    Ollama
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/ollama)
-   [
    
    OpenAI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/openai)
-   [
    
    OpenRouter
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/openrouter)
-   [
    
    Qianfan
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/qianfan)
-   [
    
    Qwen
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/qwen)
-   [
    
    Synthetic
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/synthetic)
-   [
    
    Venice AI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/venice)
-   [
    
    Vercel AI Gateway
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)
-   [
    
    Xiaomi MiMo
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/xiaomi)
-   [
    
    Z.AI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/zai)

-   [Vercel AI Gateway](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)
-   [快速开始](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)
-   [非交互式示例](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)
-   [环境说明](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)
-   [模型 ID 简写](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)

提供商

# Vercel AI Gateway

# 

[​

](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)

Vercel AI Gateway

[Vercel AI Gateway](https://vercel.com/ai-gateway) 提供统一 API，可通过单个端点访问数百个模型。

-   提供商：`vercel-ai-gateway`
-   认证：`AI_GATEWAY_API_KEY`
-   API：兼容 Anthropic Messages
-   OpenClaw 会自动发现 Gateway 的 `/v1/models` 目录，因此 `/models vercel-ai-gateway` 会包含当前模型引用，例如 `vercel-ai-gateway/openai/gpt-5.4`。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)

快速开始

1.  设置 API key（推荐：为 Gateway 网关持久保存它）：

复制

```
openclaw onboard --auth-choice ai-gateway-api-key
```

2.  设置默认模型：

复制

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

](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)

非交互式示例

复制

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice ai-gateway-api-key \
  --ai-gateway-api-key "$AI_GATEWAY_API_KEY"
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)

环境说明

如果 Gateway 作为守护进程运行（launchd/systemd），请确保 `AI_GATEWAY_API_KEY` 对此进程可用（例如放在 `~/.openclaw/.env` 中，或通过 `env.shellEnv` 提供）。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)

模型 ID 简写

OpenClaw 接受 Vercel Claude 简写模型引用，并会在运行时将其规范化：

-   `vercel-ai-gateway/claude-opus-4.6` -> `vercel-ai-gateway/anthropic/claude-opus-4.6`
-   `vercel-ai-gateway/opus-4.6` -> `vercel-ai-gateway/anthropic/claude-opus-4-6`

[Venice AI](https://docs.openclaw.ai/zh-CN/providers/venice)[Xiaomi MiMo](https://docs.openclaw.ai/zh-CN/providers/xiaomi)

⌘I
