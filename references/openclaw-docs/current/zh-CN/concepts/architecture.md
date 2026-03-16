<!-- Source: https://docs.openclaw.ai/zh-CN/concepts/architecture -->
<!-- Title: Gateway 网关架构 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/concepts/architecture)

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

-   [Gateway 网关架构](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [概述](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [组件和流程](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [Gateway 网关（守护进程）](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [客户端（mac 应用 / CLI / web 管理）](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [节点（macOS / iOS / Android / 无头设备）](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [WebChat](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [连接生命周期（单个客户端）](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [线路协议（摘要）](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [配对 + 本地信任](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [协议类型和代码生成](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [远程访问](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [操作快照](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [不变量](https://docs.openclaw.ai/zh-CN/concepts/architecture)

基础

# Gateway 网关架构

# 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

Gateway 网关架构

最后更新：2026-01-22

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

概述

-   单个长期运行的 **Gateway 网关**拥有所有消息平台（通过 Baileys 的 WhatsApp、通过 grammY 的 Telegram、Slack、Discord、Signal、iMessage、WebChat）。
-   控制平面客户端（macOS 应用、CLI、Web 界面、自动化）通过配置的绑定主机（默认 `127.0.0.1:18789`）上的 **WebSocket** 连接到 Gateway 网关。
-   **节点**（macOS/iOS/Android/无头设备）也通过 **WebSocket** 连接，但声明 `role: node` 并带有明确的能力/命令。
-   每台主机一个 Gateway 网关；它是唯一打开 WhatsApp 会话的位置。
-   **canvas 主机**（默认 `18793`）提供智能体可编辑的 HTML 和 A2UI。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

组件和流程

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

Gateway 网关（守护进程）

-   维护提供商连接。
-   暴露类型化的 WS API（请求、响应、服务器推送事件）。
-   根据 JSON Schema 验证入站帧。
-   发出事件如 `agent`、`chat`、`presence`、`health`、`heartbeat`、`cron`。

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

客户端（mac 应用 / CLI / web 管理）

-   每个客户端一个 WS 连接。
-   发送请求（`health`、`status`、`send`、`agent`、`system-presence`）。
-   订阅事件（`tick`、`agent`、`presence`、`shutdown`）。

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

节点（macOS / iOS / Android / 无头设备）

-   以 `role: node` 连接到**同一个 WS 服务器**。
-   在 `connect` 中提供设备身份；配对是**基于设备**的（角色为 `node`），批准存储在设备配对存储中。
-   暴露命令如 `canvas.*`、`camera.*`、`screen.record`、`location.get`。

协议详情：

-   [Gateway 网关协议](https://docs.openclaw.ai/gateway/protocol)

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

WebChat

-   静态界面，使用 Gateway 网关 WS API 获取聊天历史和发送消息。
-   在远程设置中，通过与其他客户端相同的 SSH/Tailscale 隧道连接。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

连接生命周期（单个客户端）

复制

```
Client                    Gateway
  |                          |
  |---- req:connect -------->|
  |<------ res (ok) ---------|   (or res error + close)
  |   (payload=hello-ok carries snapshot: presence + health)
  |                          |
  |<------ event:presence ---|
  |<------ event:tick -------|
  |                          |
  |------- req:agent ------->|
  |<------ res:agent --------|   (ack: {runId,status:"accepted"})
  |<------ event:agent ------|   (streaming)
  |<------ res:agent --------|   (final: {runId,status,summary})
  |                          |
```

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

线路协议（摘要）

-   传输：WebSocket，带 JSON 载荷的文本帧。
-   第一帧**必须**是 `connect`。
-   握手后：
    -   请求：`{type:"req", id, method, params}` → `{type:"res", id, ok, payload|error}`
    -   事件：`{type:"event", event, payload, seq?, stateVersion?}`
-   如果设置了 `OPENCLAW_GATEWAY_TOKEN`（或 `--token`），`connect.params.auth.token` 必须匹配，否则套接字关闭。
-   有副作用的方法（`send`、`agent`）需要幂等键以安全重试；服务器保持短期去重缓存。
-   节点必须在 `connect` 中包含 `role: "node"` 以及能力/命令/权限。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

配对 + 本地信任

-   所有 WS 客户端（操作员 + 节点）在 `connect` 时包含**设备身份**。
-   新设备 ID 需要配对批准；Gateway 网关为后续连接颁发**设备令牌**。
-   **本地**连接（loopback 或 Gateway 网关主机自身的 tailnet 地址）可以自动批准以保持同主机用户体验流畅。
-   **非本地**连接必须签名 `connect.challenge` nonce 并需要明确批准。
-   Gateway 网关认证（`gateway.auth.*`）仍适用于**所有**连接，无论本地还是远程。

详情：[Gateway 网关协议](https://docs.openclaw.ai/gateway/protocol)、[配对](https://docs.openclaw.ai/channels/pairing)、[安全](https://docs.openclaw.ai/gateway/security)。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

协议类型和代码生成

-   TypeBox 模式定义协议。
-   从这些模式生成 JSON Schema。
-   从 JSON Schema 生成 Swift 模型。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

远程访问

-   推荐：Tailscale 或 VPN。
-   替代方案：SSH 隧道
    
    复制
    
    ```
    ssh -N -L 18789:127.0.0.1:18789 user@host
    ```
    
-   相同的握手 + 认证令牌适用于隧道连接。
-   远程设置中可以为 WS 启用 TLS + 可选的证书固定。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

操作快照

-   启动：`openclaw gateway`（前台，日志输出到 stdout）。
-   健康检查：通过 WS 的 `health`（也包含在 `hello-ok` 中）。
-   监控：使用 launchd/systemd 自动重启。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/architecture)

不变量

-   每台主机恰好一个 Gateway 网关控制单个 Baileys 会话。
-   握手是强制的；任何非 JSON 或非 connect 的第一帧都会导致硬关闭。
-   事件不会重放；客户端必须在出现间隙时刷新。

[Pi 集成架构](https://docs.openclaw.ai/zh-CN/pi)[智能体运行时](https://docs.openclaw.ai/zh-CN/concepts/agent)

⌘I
