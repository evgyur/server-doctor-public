<!-- Source: https://docs.openclaw.ai/zh-CN/concepts/compaction -->
<!-- Title: 压缩 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/concepts/compaction)

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

-   [上下文窗口与压缩](https://docs.openclaw.ai/zh-CN/concepts/compaction)
-   [什么是压缩](https://docs.openclaw.ai/zh-CN/concepts/compaction)
-   [配置](https://docs.openclaw.ai/zh-CN/concepts/compaction)
-   [自动压缩（默认开启）](https://docs.openclaw.ai/zh-CN/concepts/compaction)
-   [手动压缩](https://docs.openclaw.ai/zh-CN/concepts/compaction)
-   [上下文窗口来源](https://docs.openclaw.ai/zh-CN/concepts/compaction)
-   [压缩与修剪](https://docs.openclaw.ai/zh-CN/concepts/compaction)
-   [提示](https://docs.openclaw.ai/zh-CN/concepts/compaction)

会话与记忆

# 压缩

# 

[​

](https://docs.openclaw.ai/zh-CN/concepts/compaction)

上下文窗口与压缩

每个模型都有一个**上下文窗口**（可见的最大 token 数）。长时间运行的对话会累积消息和工具结果；一旦窗口空间紧张，OpenClaw 会**压缩**较早的历史记录以保持在限制范围内。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/compaction)

什么是压缩

压缩会将**较早的对话总结**为一条紧凑的摘要条目，并保持近期消息不变。摘要存储在会话历史中，因此后续请求使用的是：

-   压缩摘要
-   压缩点之后的近期消息

压缩会**持久化**到会话的 JSONL 历史记录中。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/compaction)

配置

有关 `agents.defaults.compaction` 设置，请参阅[压缩配置与模式](https://docs.openclaw.ai/concepts/compaction)。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/compaction)

自动压缩（默认开启）

当会话接近或超过模型的上下文窗口时，OpenClaw 会触发自动压缩，并可能使用压缩后的上下文重试原始请求。 你会看到：

-   详细模式下显示 `🧹 Auto-compaction complete`
-   `/status` 显示 `🧹 Compactions: <count>`

在压缩之前，OpenClaw 可以运行一次**静默记忆刷写**轮次，将持久化笔记写入磁盘。详情及配置请参阅[记忆](https://docs.openclaw.ai/concepts/memory)。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/compaction)

手动压缩

使用 `/compact`（可选附带指令）强制执行一次压缩：

复制

```
/compact Focus on decisions and open questions
```

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/compaction)

上下文窗口来源

上下文窗口因模型而异。OpenClaw 使用已配置提供商目录中的模型定义来确定限制。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/compaction)

压缩与修剪

-   **压缩**：总结并**持久化**到 JSONL 中。
-   **会话修剪**：仅裁剪旧的**工具结果**，**在内存中**按请求进行。

有关修剪的详情，请参阅 [/concepts/session-pruning](https://docs.openclaw.ai/concepts/session-pruning)。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/compaction)

提示

-   当会话感觉过时或上下文臃肿时，使用 `/compact`。
-   大型工具输出已被截断；修剪可以进一步减少工具结果的堆积。
-   如果你需要全新开始，`/new` 或 `/reset` 会启动一个新的会话 ID。

[记忆](https://docs.openclaw.ai/zh-CN/concepts/memory)[多智能体路由](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

⌘I
