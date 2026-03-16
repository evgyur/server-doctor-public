<!-- Source: https://docs.openclaw.ai/zh-CN/concepts/retry -->
<!-- Title: 重试策略 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/concepts/retry)

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

##### 基础

-   [
    
    Pi 集成架构
    
    
    
    ](https://docs.openclaw.ai/zh-CN/pi)
-   [
    
    Gateway 网关架构
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [
    
    智能体运行时
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/agent)
-   [
    
    智能体循环
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/agent-loop)
-   [
    
    系统提示词
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)
-   [
    
    上下文
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/context)
-   [
    
    智能体工作区
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/agent-workspace)
-   [
    
    OAuth
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/oauth)

##### 引导

-   [
    
    引导
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/bootstrapping)

##### 会话与记忆

-   [
    
    会话管理
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/session)
-   [
    
    Session pruning
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [
    
    会话工具
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/session-tool)
-   [
    
    记忆
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/memory)
-   [
    
    压缩
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/compaction)

##### 多代理

-   [
    
    多智能体路由
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [
    
    在线状态
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/presence)

##### 消息与投递

-   [
    
    消息
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/messages)
-   [
    
    流式传输和分块
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/streaming)
-   [
    
    重试策略
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/retry)
-   [
    
    命令队列
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/queue)

-   [重试策略](https://docs.openclaw.ai/zh-CN/concepts/retry)
-   [目标](https://docs.openclaw.ai/zh-CN/concepts/retry)
-   [默认值](https://docs.openclaw.ai/zh-CN/concepts/retry)
-   [行为](https://docs.openclaw.ai/zh-CN/concepts/retry)
-   [Discord](https://docs.openclaw.ai/zh-CN/concepts/retry)
-   [Telegram](https://docs.openclaw.ai/zh-CN/concepts/retry)
-   [配置](https://docs.openclaw.ai/zh-CN/concepts/retry)
-   [注意事项](https://docs.openclaw.ai/zh-CN/concepts/retry)

消息与投递

# 重试策略

# 

[​

](https://docs.openclaw.ai/zh-CN/concepts/retry)

重试策略

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/retry)

目标

-   按 HTTP 请求重试，而非按多步骤流程重试。
-   通过仅重试当前步骤来保持顺序。
-   避免重复执行非幂等操作。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/retry)

默认值

-   尝试次数：3
-   最大延迟上限：30000 毫秒
-   抖动：0.1（10%）
-   提供商默认值：
    -   Telegram 最小延迟：400 毫秒
    -   Discord 最小延迟：500 毫秒

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/retry)

行为

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/retry)

Discord

-   仅在速率限制错误（HTTP 429）时重试。
-   可用时使用 Discord `retry_after`，否则使用指数退避。

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/retry)

Telegram

-   在瞬态错误时重试（429、超时、连接/重置/关闭、暂时不可用）。
-   可用时使用 `retry_after`，否则使用指数退避。
-   Markdown 解析错误不会重试；会回退为纯文本。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/retry)

配置

在 `~/.openclaw/openclaw.json` 中按提供商设置重试策略：

复制

```
{
  channels: {
    telegram: {
      retry: {
        attempts: 3,
        minDelayMs: 400,
        maxDelayMs: 30000,
        jitter: 0.1,
      },
    },
    discord: {
      retry: {
        attempts: 3,
        minDelayMs: 500,
        maxDelayMs: 30000,
        jitter: 0.1,
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/retry)

注意事项

-   重试按请求应用（消息发送、媒体上传、表情回应、投票、贴纸）。
-   组合流程不会重试已完成的步骤。

[流式传输和分块](https://docs.openclaw.ai/zh-CN/concepts/streaming)[命令队列](https://docs.openclaw.ai/zh-CN/concepts/queue)

⌘I
