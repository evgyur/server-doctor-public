<!-- Source: https://docs.openclaw.ai/zh-CN/concepts/presence -->
<!-- Title: 在线状态 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/concepts/presence)

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

-   [在线状态](https://docs.openclaw.ai/zh-CN/concepts/presence)
-   [在线状态字段（显示的内容）](https://docs.openclaw.ai/zh-CN/concepts/presence)
-   [生产者（在线状态来源）](https://docs.openclaw.ai/zh-CN/concepts/presence)
-   [1）Gateway 网关自身条目](https://docs.openclaw.ai/zh-CN/concepts/presence)
-   [2）WebSocket 连接](https://docs.openclaw.ai/zh-CN/concepts/presence)
-   [为什么一次性 CLI 命令不会显示](https://docs.openclaw.ai/zh-CN/concepts/presence)
-   [3）system-event 信标](https://docs.openclaw.ai/zh-CN/concepts/presence)
-   [4）节点连接（role: node）](https://docs.openclaw.ai/zh-CN/concepts/presence)
-   [合并 + 去重规则（为什么 instanceId 很重要）](https://docs.openclaw.ai/zh-CN/concepts/presence)
-   [TTL 和有界大小](https://docs.openclaw.ai/zh-CN/concepts/presence)
-   [远程/隧道注意事项（回环 IP）](https://docs.openclaw.ai/zh-CN/concepts/presence)
-   [消费者](https://docs.openclaw.ai/zh-CN/concepts/presence)
-   [macOS 实例标签页](https://docs.openclaw.ai/zh-CN/concepts/presence)
-   [调试技巧](https://docs.openclaw.ai/zh-CN/concepts/presence)

多代理

# 在线状态

# 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

在线状态

OpenClaw”在线状态”是以下内容的轻量级、尽力而为的视图：

-   **Gateway 网关**本身，以及
-   **连接到 Gateway 网关的客户端**（mac 应用、WebChat、CLI 等）

在线状态主要用于渲染 macOS 应用的**实例**标签页，并为运维人员提供快速可见性。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

在线状态字段（显示的内容）

在线状态条目是具有以下字段的结构化对象：

-   `instanceId`（可选但强烈推荐）：稳定的客户端身份（通常是 `connect.client.instanceId`）
-   `host`：人类友好的主机名
-   `ip`：尽力而为的 IP 地址
-   `version`：客户端版本字符串
-   `deviceFamily` / `modelIdentifier`：硬件提示
-   `mode`：`ui`、`webchat`、`cli`、`backend`、`probe`、`test`、`node`，…
-   `lastInputSeconds`：“自上次用户输入以来的秒数”（如果已知）
-   `reason`：`self`、`connect`、`node-connected`、`periodic`，…
-   `ts`：最后更新时间戳（自纪元以来的毫秒数）

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

生产者（在线状态来源）

在线状态条目由多个来源生成并**合并**。

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

1）Gateway 网关自身条目

Gateway 网关始终在启动时植入一个”self”条目，这样即使在任何客户端连接之前，UI 也能显示 Gateway 网关主机。

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

2）WebSocket 连接

每个 WS 客户端都以 `connect` 请求开始。在成功握手后，Gateway 网关为该连接更新插入一个在线状态条目。

#### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

为什么一次性 CLI 命令不会显示

CLI 经常为短暂的一次性命令进行连接。为避免实例列表被刷屏，`client.mode === "cli"` **不会**被转换为在线状态条目。

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

3）`system-event` 信标

客户端可以通过 `system-event` 方法发送更丰富的周期性信标。mac 应用使用此方法报告主机名、IP 和 `lastInputSeconds`。

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

4）节点连接（role: node）

当节点通过 Gateway 网关 WebSocket 以 `role: node` 连接时，Gateway 网关为该节点更新插入一个在线状态条目（与其他 WS 客户端流程相同）。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

合并 + 去重规则（为什么 `instanceId` 很重要）

在线状态条目存储在单个内存映射中：

-   条目以**在线状态键**为索引。
-   最佳键是稳定的 `instanceId`（来自 `connect.client.instanceId`），它在重启后仍然有效。
-   键不区分大小写。

如果客户端在没有稳定 `instanceId` 的情况下重新连接，它可能会显示为**重复**行。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

TTL 和有界大小

在线状态是有意设计为短暂的：

-   **TTL：** 超过 5 分钟的条目会被修剪
-   **最大条目数：** 200（最旧的优先删除）

这使列表保持新鲜并避免无限制的内存增长。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

远程/隧道注意事项（回环 IP）

当客户端通过 SSH 隧道/本地端口转发连接时，Gateway 网关可能会看到远程地址为 `127.0.0.1`。为避免覆盖客户端报告的有效 IP，回环远程地址会被忽略。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

消费者

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

macOS 实例标签页

macOS 应用渲染 `system-presence` 的输出，并根据最后更新的时间应用一个小的状态指示器（活跃/空闲/过期）。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/presence)

调试技巧

-   要查看原始列表，对 Gateway 网关调用 `system-presence`。
-   如果你看到重复项：
    -   确认客户端在握手中发送稳定的 `client.instanceId`
    -   确认周期性信标使用相同的 `instanceId`
    -   检查连接派生的条目是否缺少 `instanceId`（这种情况下重复是预期的）

[多智能体路由](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)[消息](https://docs.openclaw.ai/zh-CN/concepts/messages)

⌘I
