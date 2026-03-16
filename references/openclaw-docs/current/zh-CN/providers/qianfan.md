<!-- Source: https://docs.openclaw.ai/zh-CN/providers/qianfan -->
<!-- Title: Qianfan - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/providers/qianfan)

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

-   [Qianfan 提供商指南](https://docs.openclaw.ai/zh-CN/providers/qianfan)
-   [前提条件](https://docs.openclaw.ai/zh-CN/providers/qianfan)
-   [获取 API key](https://docs.openclaw.ai/zh-CN/providers/qianfan)
-   [CLI 设置](https://docs.openclaw.ai/zh-CN/providers/qianfan)
-   [相关文档](https://docs.openclaw.ai/zh-CN/providers/qianfan)

提供商

# Qianfan

# 

[​

](https://docs.openclaw.ai/zh-CN/providers/qianfan)

Qianfan 提供商指南

Qianfan 是 Baidu 的 MaaS 平台，提供一个**统一 API**，可通过单个 端点和 API key 将请求路由到许多模型。它与 OpenAI 兼容，因此大多数 OpenAI SDK 只需切换 base URL 即可使用。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/qianfan)

前提条件

1.  一个已开通 Qianfan API 访问权限的 Baidu Cloud 账号
2.  一个来自 Qianfan 控制台的 API key
3.  已在你的系统上安装 OpenClaw

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/qianfan)

获取 API key

1.  访问 [Qianfan Console](https://console.bce.baidu.com/qianfan/ais/console/apiKey)
2.  创建一个新应用，或选择一个现有应用
3.  生成一个 API key（格式：`bce-v3/ALTAK-...`）
4.  复制该 API key 以在 OpenClaw 中使用

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/qianfan)

CLI 设置

复制

```
openclaw onboard --auth-choice qianfan-api-key
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/qianfan)

相关文档

-   [OpenClaw Configuration](https://docs.openclaw.ai/gateway/configuration)
-   [Model Providers](https://docs.openclaw.ai/concepts/model-providers)
-   [Agent Setup](https://docs.openclaw.ai/concepts/agent)
-   [Qianfan API Documentation](https://cloud.baidu.com/doc/qianfan-api/s/3m7of64lb)

[OpenRouter](https://docs.openclaw.ai/zh-CN/providers/openrouter)[Qwen](https://docs.openclaw.ai/zh-CN/providers/qwen)

⌘I
