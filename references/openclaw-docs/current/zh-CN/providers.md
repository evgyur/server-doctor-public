<!-- Source: https://docs.openclaw.ai/zh-CN/providers -->
<!-- Title: 模型提供商 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/providers)

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

-   [模型提供商](https://docs.openclaw.ai/zh-CN/providers)
-   [快速开始](https://docs.openclaw.ai/zh-CN/providers)
-   [提供商文档](https://docs.openclaw.ai/zh-CN/providers)
-   [转录提供商](https://docs.openclaw.ai/zh-CN/providers)
-   [社区工具](https://docs.openclaw.ai/zh-CN/providers)

概览

# 模型提供商

# 

[​

](https://docs.openclaw.ai/zh-CN/providers)

模型提供商

OpenClaw 可以使用许多 LLM 提供商。选择一个提供商，完成身份验证，然后将 默认模型设置为 `provider/model`。 在找聊天渠道文档（WhatsApp/Telegram/Discord/Slack/Mattermost（插件）/等）？请参见 [Channels](https://docs.openclaw.ai/channels)。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers)

快速开始

1.  使用该提供商进行身份验证（通常通过 `openclaw onboard`）。
2.  设置默认模型：

复制

```
{
  agents: { defaults: { model: { primary: "anthropic/claude-opus-4-6" } } },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers)

提供商文档

-   [Amazon Bedrock](https://docs.openclaw.ai/providers/bedrock)
-   [Anthropic（API + Claude Code CLI）](https://docs.openclaw.ai/providers/anthropic)
-   [Cloudflare AI Gateway](https://docs.openclaw.ai/providers/cloudflare-ai-gateway)
-   [GLM 模型](https://docs.openclaw.ai/providers/glm)
-   [Hugging Face（Inference）](https://docs.openclaw.ai/providers/huggingface)
-   [Kilocode](https://docs.openclaw.ai/providers/kilocode)
-   [LiteLLM（统一网关）](https://docs.openclaw.ai/providers/litellm)
-   [MiniMax](https://docs.openclaw.ai/providers/minimax)
-   [Mistral](https://docs.openclaw.ai/providers/mistral)
-   [Moonshot AI（Kimi + Kimi Coding）](https://docs.openclaw.ai/providers/moonshot)
-   [NVIDIA](https://docs.openclaw.ai/providers/nvidia)
-   [Ollama（云端 + 本地模型）](https://docs.openclaw.ai/providers/ollama)
-   [OpenAI（API + Codex）](https://docs.openclaw.ai/providers/openai)
-   [OpenCode（Zen + Go）](https://docs.openclaw.ai/providers/opencode)
-   [OpenRouter](https://docs.openclaw.ai/providers/openrouter)
-   [Qianfan](https://docs.openclaw.ai/providers/qianfan)
-   [Qwen（OAuth）](https://docs.openclaw.ai/providers/qwen)
-   [Together AI](https://docs.openclaw.ai/providers/together)
-   [Vercel AI Gateway](https://docs.openclaw.ai/providers/vercel-ai-gateway)
-   [Venice（Venice AI，注重隐私）](https://docs.openclaw.ai/providers/venice)
-   [vLLM（本地模型）](https://docs.openclaw.ai/providers/vllm)
-   [Xiaomi](https://docs.openclaw.ai/providers/xiaomi)
-   [Z.AI](https://docs.openclaw.ai/providers/zai)

## 

[​

](https://docs.openclaw.ai/zh-CN/providers)

转录提供商

-   [Deepgram（音频转录）](https://docs.openclaw.ai/providers/deepgram)

## 

[​

](https://docs.openclaw.ai/zh-CN/providers)

社区工具

-   [Claude Max API Proxy](https://docs.openclaw.ai/providers/claude-max-api-proxy) - 面向 Claude 订阅凭证的社区代理（使用前请核实 Anthropic 政策/条款）

有关完整的提供商目录（xAI、Groq、Mistral 等）和高级配置， 请参见 [模型提供商](https://docs.openclaw.ai/concepts/model-providers)。

[模型提供商快速开始](https://docs.openclaw.ai/zh-CN/providers/models)

⌘I
