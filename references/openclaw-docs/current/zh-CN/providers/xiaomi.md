<!-- Source: https://docs.openclaw.ai/zh-CN/providers/xiaomi -->
<!-- Title: Xiaomi MiMo - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/providers/xiaomi)

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

-   [Xiaomi MiMo](https://docs.openclaw.ai/zh-CN/providers/xiaomi)
-   [模型概览](https://docs.openclaw.ai/zh-CN/providers/xiaomi)
-   [CLI 设置](https://docs.openclaw.ai/zh-CN/providers/xiaomi)
-   [配置片段](https://docs.openclaw.ai/zh-CN/providers/xiaomi)
-   [说明](https://docs.openclaw.ai/zh-CN/providers/xiaomi)

提供商

# Xiaomi MiMo

# 

[​

](https://docs.openclaw.ai/zh-CN/providers/xiaomi)

Xiaomi MiMo

Xiaomi MiMo 是 **MiMo** 模型的 API 平台。它提供与 OpenAI 和 Anthropic 格式兼容的 REST API，并使用 API key 进行认证。请在 [Xiaomi MiMo console](https://platform.xiaomimimo.com/) 中创建你的 API key。OpenClaw 使用 `xiaomi` 提供商配合 Xiaomi MiMo API key。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/xiaomi)

模型概览

-   **mimo-v2-flash**：262144-token 上下文窗口，兼容 Anthropic Messages API。
-   Base URL：`https://api.xiaomimimo.com/anthropic`
-   认证方式：`Bearer $XIAOMI_API_KEY`

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/xiaomi)

CLI 设置

复制

```
openclaw onboard --auth-choice xiaomi-api-key
# 或非交互式
openclaw onboard --auth-choice xiaomi-api-key --xiaomi-api-key "$XIAOMI_API_KEY"
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/xiaomi)

配置片段

复制

```
{
  env: { XIAOMI_API_KEY: "your-key" },
  agents: { defaults: { model: { primary: "xiaomi/mimo-v2-flash" } } },
  models: {
    mode: "merge",
    providers: {
      xiaomi: {
        baseUrl: "https://api.xiaomimimo.com/anthropic",
        api: "anthropic-messages",
        apiKey: "XIAOMI_API_KEY",
        models: [
          {
            id: "mimo-v2-flash",
            name: "Xiaomi MiMo V2 Flash",
            reasoning: false,
            input: ["text"],
            cost: { input: 0, output: 0, cacheRead: 0, cacheWrite: 0 },
            contextWindow: 262144,
            maxTokens: 8192,
          },
        ],
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/xiaomi)

说明

-   模型引用：`xiaomi/mimo-v2-flash`。
-   当设置了 `XIAOMI_API_KEY`（或存在凭证配置文件）时，提供商会自动注入。
-   有关提供商规则，请参阅 [/concepts/model-providers](https://docs.openclaw.ai/concepts/model-providers)。

[Vercel AI Gateway](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)[Z.AI](https://docs.openclaw.ai/zh-CN/providers/zai)

⌘I
