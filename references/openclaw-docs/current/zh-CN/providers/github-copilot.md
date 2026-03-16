<!-- Source: https://docs.openclaw.ai/zh-CN/providers/github-copilot -->
<!-- Title: GitHub Copilot - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/providers/github-copilot)

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

-   [GitHub Copilot](https://docs.openclaw.ai/zh-CN/providers/github-copilot)
-   [什么是 GitHub Copilot？](https://docs.openclaw.ai/zh-CN/providers/github-copilot)
-   [在 OpenClaw 中使用 Copilot 的两种方式](https://docs.openclaw.ai/zh-CN/providers/github-copilot)
-   [1）内置 GitHub Copilot 提供商（github-copilot）](https://docs.openclaw.ai/zh-CN/providers/github-copilot)
-   [2）Copilot Proxy 插件（copilot-proxy）](https://docs.openclaw.ai/zh-CN/providers/github-copilot)
-   [CLI 设置](https://docs.openclaw.ai/zh-CN/providers/github-copilot)
-   [可选参数](https://docs.openclaw.ai/zh-CN/providers/github-copilot)
-   [设置默认模型](https://docs.openclaw.ai/zh-CN/providers/github-copilot)
-   [配置片段](https://docs.openclaw.ai/zh-CN/providers/github-copilot)
-   [注意事项](https://docs.openclaw.ai/zh-CN/providers/github-copilot)

提供商

# GitHub Copilot

# 

[​

](https://docs.openclaw.ai/zh-CN/providers/github-copilot)

GitHub Copilot

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/github-copilot)

什么是 GitHub Copilot？

GitHub Copilot 是 GitHub 的 AI 编程助手。它为你的 GitHub 账户和订阅计划提供 Copilot 模型的访问权限。OpenClaw 可以通过两种不同的方式将 Copilot 用作模型提供商。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/github-copilot)

在 OpenClaw 中使用 Copilot 的两种方式

### 

[​

](https://docs.openclaw.ai/zh-CN/providers/github-copilot)

1）内置 GitHub Copilot 提供商（`github-copilot`）

使用原生设备登录流程获取 GitHub 令牌，然后在 OpenClaw 运行时将其兑换为 Copilot API 令牌。这是**默认**且最简单的方式，因为它不需要 VS Code。

### 

[​

](https://docs.openclaw.ai/zh-CN/providers/github-copilot)

2）Copilot Proxy 插件（`copilot-proxy`）

使用 **Copilot Proxy** VS Code 扩展作为本地桥接。OpenClaw 与代理的 `/v1` 端点通信，并使用你在其中配置的模型列表。当你已经在 VS Code 中运行 Copilot Proxy 或需要通过它进行路由时，选择此方式。你必须启用该插件并保持 VS Code 扩展运行。 使用 GitHub Copilot 作为模型提供商（`github-copilot`）。登录命令运行 GitHub 设备流程，保存认证配置文件，并更新你的配置以使用该配置文件。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/github-copilot)

CLI 设置

复制

```
openclaw models auth login-github-copilot
```

系统会提示你访问一个 URL 并输入一次性代码。请保持终端打开直到流程完成。

### 

[​

](https://docs.openclaw.ai/zh-CN/providers/github-copilot)

可选参数

复制

```
openclaw models auth login-github-copilot --profile-id github-copilot:work
openclaw models auth login-github-copilot --yes
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/github-copilot)

设置默认模型

复制

```
openclaw models set github-copilot/gpt-4o
```

### 

[​

](https://docs.openclaw.ai/zh-CN/providers/github-copilot)

配置片段

复制

```
{
  agents: { defaults: { model: { primary: "github-copilot/gpt-4o" } } },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/github-copilot)

注意事项

-   需要交互式 TTY；请直接在终端中运行。
-   Copilot 模型的可用性取决于你的订阅计划；如果某个模型被拒绝，请尝试其他 ID（例如 `github-copilot/gpt-4.1`）。
-   登录会将 GitHub 令牌存储在认证配置文件中，并在 OpenClaw 运行时将其兑换为 Copilot API 令牌。

[Deepgram](https://docs.openclaw.ai/zh-CN/providers/deepgram)[GLM Models](https://docs.openclaw.ai/zh-CN/providers/glm)

⌘I
