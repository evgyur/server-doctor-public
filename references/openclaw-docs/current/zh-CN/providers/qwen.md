<!-- Source: https://docs.openclaw.ai/zh-CN/providers/qwen -->
<!-- Title: Qwen - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/providers/qwen)

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

-   [Qwen](https://docs.openclaw.ai/zh-CN/providers/qwen)
-   [启用插件](https://docs.openclaw.ai/zh-CN/providers/qwen)
-   [认证](https://docs.openclaw.ai/zh-CN/providers/qwen)
-   [模型 ID](https://docs.openclaw.ai/zh-CN/providers/qwen)
-   [复用 Qwen Code CLI 登录](https://docs.openclaw.ai/zh-CN/providers/qwen)
-   [注意](https://docs.openclaw.ai/zh-CN/providers/qwen)

提供商

# Qwen

# 

[​

](https://docs.openclaw.ai/zh-CN/providers/qwen)

Qwen

Qwen 为 Qwen Coder 和 Qwen Vision 模型提供免费层 OAuth 流程（每天 2,000 次请求，受 Qwen 速率限制约束）。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/qwen)

启用插件

复制

```
openclaw plugins enable qwen-portal-auth
```

启用后重启 Gateway 网关。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/qwen)

认证

复制

```
openclaw models auth login --provider qwen-portal --set-default
```

这会运行 Qwen 设备码 OAuth 流程并将提供商条目写入你的 `models.json`（加上一个 `qwen` 别名以便快速切换）。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/qwen)

模型 ID

-   `qwen-portal/coder-model`
-   `qwen-portal/vision-model`

切换模型：

复制

```
openclaw models set qwen-portal/coder-model
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/qwen)

复用 Qwen Code CLI 登录

如果你已经使用 Qwen Code CLI 登录，OpenClaw 会在加载认证存储时从 `~/.qwen/oauth_creds.json` 同步凭证。你仍然需要一个 `models.providers.qwen-portal` 条目（使用上面的登录命令创建一个）。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/qwen)

注意

-   令牌自动刷新；如果刷新失败或访问被撤销，请重新运行登录命令。
-   默认基础 URL：`https://portal.qwen.ai/v1`（如果 Qwen 提供不同的端点，使用 `models.providers.qwen-portal.baseUrl` 覆盖）。
-   参阅[模型提供商](https://docs.openclaw.ai/concepts/model-providers)了解提供商级别的规则。

[Qianfan](https://docs.openclaw.ai/zh-CN/providers/qianfan)[Synthetic](https://docs.openclaw.ai/zh-CN/providers/synthetic)

⌘I
