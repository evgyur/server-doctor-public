<!-- Source: https://docs.openclaw.ai/zh-CN/providers/deepgram -->
<!-- Title: Deepgram - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/providers/deepgram)

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

-   [Deepgram（音频转录）](https://docs.openclaw.ai/zh-CN/providers/deepgram)
-   [快速开始](https://docs.openclaw.ai/zh-CN/providers/deepgram)
-   [选项](https://docs.openclaw.ai/zh-CN/providers/deepgram)
-   [注意事项](https://docs.openclaw.ai/zh-CN/providers/deepgram)

提供商

# Deepgram

# 

[​

](https://docs.openclaw.ai/zh-CN/providers/deepgram)

Deepgram（音频转录）

Deepgram 是一个语音转文字 API。在 OpenClaw 中，它通过 `tools.media.audio` 用于**接收音频/语音消息的转录**。 启用后，OpenClaw 会将音频文件上传到 Deepgram，并将转录文本注入回复管道（`{{Transcript}}` + `[Audio]` 块）。这**不是流式**处理；它使用的是预录音转录端点。 网站：[https://deepgram.com](https://deepgram.com/)  
文档：[https://developers.deepgram.com](https://developers.deepgram.com/)

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/deepgram)

快速开始

1.  设置你的 API 密钥：

复制

```
DEEPGRAM_API_KEY=dg_...
```

2.  启用提供商：

复制

```
{
  tools: {
    media: {
      audio: {
        enabled: true,
        models: [{ provider: "deepgram", model: "nova-3" }],
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/deepgram)

选项

-   `model`：Deepgram 模型 ID（默认：`nova-3`）
-   `language`：语言提示（可选）
-   `tools.media.audio.providerOptions.deepgram.detect_language`：启用语言检测（可选）
-   `tools.media.audio.providerOptions.deepgram.punctuate`：启用标点符号（可选）
-   `tools.media.audio.providerOptions.deepgram.smart_format`：启用智能格式化（可选）

带语言参数的示例：

复制

```
{
  tools: {
    media: {
      audio: {
        enabled: true,
        models: [{ provider: "deepgram", model: "nova-3", language: "en" }],
      },
    },
  },
}
```

带 Deepgram 选项的示例：

复制

```
{
  tools: {
    media: {
      audio: {
        enabled: true,
        providerOptions: {
          deepgram: {
            detect_language: true,
            punctuate: true,
            smart_format: true,
          },
        },
        models: [{ provider: "deepgram", model: "nova-3" }],
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/deepgram)

注意事项

-   认证遵循标准提供商认证顺序；`DEEPGRAM_API_KEY` 是最简单的方式。
-   使用代理时，可通过 `tools.media.audio.baseUrl` 和 `tools.media.audio.headers` 覆盖端点或请求头。
-   输出遵循与其他提供商相同的音频规则（大小限制、超时、转录文本注入）。

[Claude Max API 代理](https://docs.openclaw.ai/zh-CN/providers/claude-max-api-proxy)[GitHub Copilot](https://docs.openclaw.ai/zh-CN/providers/github-copilot)

⌘I
