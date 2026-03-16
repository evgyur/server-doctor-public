<!-- Source: https://docs.openclaw.ai/zh-CN/providers/opencode -->
<!-- Title: OpenCode - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/providers/opencode)

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

-   [OpenCode](https://docs.openclaw.ai/zh-CN/providers/opencode)
-   [CLI 设置](https://docs.openclaw.ai/zh-CN/providers/opencode)
-   [Zen 目录](https://docs.openclaw.ai/zh-CN/providers/opencode)
-   [Go 目录](https://docs.openclaw.ai/zh-CN/providers/opencode)
-   [配置片段](https://docs.openclaw.ai/zh-CN/providers/opencode)
-   [目录](https://docs.openclaw.ai/zh-CN/providers/opencode)
-   [Zen](https://docs.openclaw.ai/zh-CN/providers/opencode)
-   [Go](https://docs.openclaw.ai/zh-CN/providers/opencode)
-   [说明](https://docs.openclaw.ai/zh-CN/providers/opencode)

提供商

# OpenCode

# 

[​

](https://docs.openclaw.ai/zh-CN/providers/opencode)

OpenCode

OpenCode 在 OpenClaw 中提供两个托管目录：

-   `opencode/...` 用于 **Zen** 目录
-   `opencode-go/...` 用于 **Go** 目录

两个目录都使用相同的 OpenCode API 密钥。OpenClaw 会将运行时提供商 ID 保持拆分，以便上游按模型路由保持正确，但新手引导和文档将它们视为 同一个 OpenCode 设置。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/opencode)

CLI 设置

### 

[​

](https://docs.openclaw.ai/zh-CN/providers/opencode)

Zen 目录

复制

```
openclaw onboard --auth-choice opencode-zen
openclaw onboard --opencode-zen-api-key "$OPENCODE_API_KEY"
```

### 

[​

](https://docs.openclaw.ai/zh-CN/providers/opencode)

Go 目录

复制

```
openclaw onboard --auth-choice opencode-go
openclaw onboard --opencode-go-api-key "$OPENCODE_API_KEY"
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/opencode)

配置片段

复制

```
{
  env: { OPENCODE_API_KEY: "sk-..." },
  agents: { defaults: { model: { primary: "opencode/claude-opus-4-6" } } },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/opencode)

目录

### 

[​

](https://docs.openclaw.ai/zh-CN/providers/opencode)

Zen

-   运行时提供商：`opencode`
-   示例模型：`opencode/claude-opus-4-6`、`opencode/gpt-5.2`、`opencode/gemini-3-pro`
-   适合你想使用精选的 OpenCode 多模型代理时

### 

[​

](https://docs.openclaw.ai/zh-CN/providers/opencode)

Go

-   运行时提供商：`opencode-go`
-   示例模型：`opencode-go/kimi-k2.5`、`opencode-go/glm-5`、`opencode-go/minimax-m2.5`
-   适合你想使用 OpenCode 托管的 Kimi/GLM/MiniMax 产品线时

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/opencode)

说明

-   也支持 `OPENCODE_ZEN_API_KEY`。
-   在设置期间输入一个 OpenCode 密钥，会为两个运行时提供商都存储凭证。
-   你需要登录 OpenCode、添加计费信息，然后复制你的 API 密钥。
-   计费和目录可用性由 OpenCode 仪表板管理。

[MiniMax](https://docs.openclaw.ai/zh-CN/providers/minimax)[Ollama](https://docs.openclaw.ai/zh-CN/providers/ollama)

⌘I
