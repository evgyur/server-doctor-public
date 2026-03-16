<!-- Source: https://docs.openclaw.ai/zh-CN/providers/glm -->
<!-- Title: GLM Models - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/providers/glm)

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

-   [GLM 模型](https://docs.openclaw.ai/zh-CN/providers/glm)
-   [CLI 设置](https://docs.openclaw.ai/zh-CN/providers/glm)
-   [配置片段](https://docs.openclaw.ai/zh-CN/providers/glm)
-   [说明](https://docs.openclaw.ai/zh-CN/providers/glm)

提供商

# GLM Models

# 

[​

](https://docs.openclaw.ai/zh-CN/providers/glm)

GLM 模型

GLM 是一个**模型家族**（不是公司），可通过 Z.AI 平台使用。在 OpenClaw 中，GLM 模型通过 `zai` 提供商访问，模型 ID 形式如 `zai/glm-5`。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/glm)

CLI 设置

复制

```
# Coding Plan Global，推荐给 Coding Plan 用户
openclaw onboard --auth-choice zai-coding-global

# Coding Plan CN（中国区域），推荐给 Coding Plan 用户
openclaw onboard --auth-choice zai-coding-cn

# 通用 API
openclaw onboard --auth-choice zai-global

# 通用 API CN（中国区域）
openclaw onboard --auth-choice zai-cn
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/glm)

配置片段

复制

```
{
  env: { ZAI_API_KEY: "sk-..." },
  agents: { defaults: { model: { primary: "zai/glm-5" } } },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/glm)

说明

-   GLM 版本和可用性可能会变化；请查看 Z.AI 的文档以获取最新信息。
-   示例模型 ID 包括 `glm-5`、`glm-4.7` 和 `glm-4.6`。
-   关于提供商详情，请参阅 [/providers/zai](https://docs.openclaw.ai/providers/zai)。

[GitHub Copilot](https://docs.openclaw.ai/zh-CN/providers/github-copilot)[Moonshot AI](https://docs.openclaw.ai/zh-CN/providers/moonshot)

⌘I
