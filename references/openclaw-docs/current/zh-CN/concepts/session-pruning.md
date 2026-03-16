<!-- Source: https://docs.openclaw.ai/zh-CN/concepts/session-pruning -->
<!-- Title: Session pruning - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

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

-   [会话剪枝](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [运行时机](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [智能默认值（Anthropic）](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [改进内容（成本 + 缓存行为）](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [可以剪枝的内容](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [上下文窗口估算](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [模式](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [cache-ttl](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [软剪枝 vs 硬剪枝](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [工具选择](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [与其他限制的交互](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [默认值（启用时）](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [示例](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

会话与记忆

# Session pruning

# 

[​

](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

会话剪枝

会话剪枝在每次 LLM 调用之前从内存上下文中修剪**旧的工具结果**。它**不会**重写磁盘上的会话历史（`*.jsonl`）。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

运行时机

-   当启用 `mode: "cache-ttl"` 且该会话的最后一次 Anthropic 调用早于 `ttl` 时。
-   仅影响该请求发送给模型的消息。
-   仅对 Anthropic API 调用（和 OpenRouter Anthropic 模型）生效。
-   为获得最佳效果，请将 `ttl` 与你的模型 `cacheControlTtl` 匹配。
-   剪枝后，TTL 窗口会重置，因此后续请求会保持缓存直到 `ttl` 再次过期。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

智能默认值（Anthropic）

-   **OAuth 或 setup-token** 配置文件：启用 `cache-ttl` 剪枝并将心跳设置为 `1h`。
-   **API 密钥**配置文件：启用 `cache-ttl` 剪枝，将心跳设置为 `30m`，并将 Anthropic 模型的 `cacheControlTtl` 默认为 `1h`。
-   如果你显式设置了这些值中的任何一个，OpenClaw **不会**覆盖它们。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

改进内容（成本 + 缓存行为）

-   **为什么要剪枝：** Anthropic 提示缓存仅在 TTL 内适用。如果会话空闲超过 TTL，下一个请求会重新缓存完整提示，除非你先修剪它。
-   **什么变得更便宜：** 剪枝减少了 TTL 过期后第一个请求的 **cacheWrite** 大小。
-   **为什么 TTL 重置很重要：** 一旦剪枝运行，缓存窗口会重置，因此后续请求可以重用新缓存的提示，而不是再次重新缓存完整历史。
-   **它不做什么：** 剪枝不会添加 token 或”双倍”成本；它只改变该 TTL 后第一个请求缓存的内容。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

可以剪枝的内容

-   仅 `toolResult` 消息。
-   用户 + 助手消息**永远不会**被修改。
-   最后 `keepLastAssistants` 条助手消息受保护；该截止点之后的工具结果不会被剪枝。
-   如果没有足够的助手消息来确定截止点，则跳过剪枝。
-   包含**图像块**的工具结果会被跳过（永不修剪/清除）。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

上下文窗口估算

剪枝使用估算的上下文窗口（字符 ≈ token × 4）。基础窗口按以下顺序解析：

1.  `models.providers.*.models[].contextWindow` 覆盖。
2.  模型定义 `contextWindow`（来自模型注册表）。
3.  默认 `200000` token。

如果设置了 `agents.defaults.contextTokens`，它将被视为解析窗口的上限（最小值）。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

模式

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

cache-ttl

-   仅当最后一次 Anthropic 调用早于 `ttl`（默认 `5m`）时才运行剪枝。
-   运行时：与之前相同的软修剪 + 硬清除行为。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

软剪枝 vs 硬剪枝

-   **软修剪**：仅用于过大的工具结果。
    -   保留头部 + 尾部，插入 `...`，并附加一个包含原始大小的注释。
    -   跳过包含图像块的结果。
-   **硬清除**：用 `hardClear.placeholder` 替换整个工具结果。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

工具选择

-   `tools.allow` / `tools.deny` 支持 `*` 通配符。
-   拒绝优先。
-   匹配不区分大小写。
-   允许列表为空 => 允许所有工具。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

与其他限制的交互

-   内置工具已经截断自己的输出；会话剪枝是一个额外的层，防止长时间运行的聊天在模型上下文中累积过多的工具输出。
-   压缩是独立的：压缩进行总结并持久化，剪枝是每个请求的临时操作。参阅 [/concepts/compaction](https://docs.openclaw.ai/concepts/compaction)。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

默认值（启用时）

-   `ttl`：`"5m"`
-   `keepLastAssistants`：`3`
-   `softTrimRatio`：`0.3`
-   `hardClearRatio`：`0.5`
-   `minPrunableToolChars`：`50000`
-   `softTrim`：`{ maxChars: 4000, headChars: 1500, tailChars: 1500 }`
-   `hardClear`：`{ enabled: true, placeholder: "[Old tool result content cleared]" }`

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)

示例

默认（关闭）：

复制

```
{
  agent: {
    contextPruning: { mode: "off" },
  },
}
```

启用 TTL 感知剪枝：

复制

```
{
  agent: {
    contextPruning: { mode: "cache-ttl", ttl: "5m" },
  },
}
```

限制剪枝到特定工具：

复制

```
{
  agent: {
    contextPruning: {
      mode: "cache-ttl",
      tools: { allow: ["exec", "read"], deny: ["*image*"] },
    },
  },
}
```

参阅配置参考：[Gateway 网关配置](https://docs.openclaw.ai/gateway/configuration)

[会话管理](https://docs.openclaw.ai/zh-CN/concepts/session)[会话工具](https://docs.openclaw.ai/zh-CN/concepts/session-tool)

⌘I
