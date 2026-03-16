<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol -->
<!-- Title: Bridge 协议 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)

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

##### 网关

-   [
    
    Gateway 网关运行手册
    
    
    
    ](https://docs.openclaw.ai/zh-CN/gateway)

-   -   [
        
        Gateway 网关协议
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/protocol)
    -   [
        
        Bridge 协议
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)
    -   [
        
        OpenAI Chat Completions
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)
    -   [
        
        OpenResponses API
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
    -   [
        
        工具调用 API
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)
    -   [
        
        CLI 后端
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/cli-backends)
    -   [
        
        本地模型
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/local-models)

##### 远程访问

-   [
    
    远程访问
    
    
    
    ](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [
    
    远程 Gateway 网关设置
    
    
    
    ](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [
    
    Tailscale
    
    
    
    ](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

##### 运维专题

-   [
    
    网络
    
    
    
    ](https://docs.openclaw.ai/zh-CN/network)
-   [
    
    日志
    
    
    
    ](https://docs.openclaw.ai/zh-CN/logging)

##### 安全

-   [
    
    形式化验证（安全模型）
    
    
    
    ](https://docs.openclaw.ai/zh-CN/security/formal-verification)

##### Web 界面

-   [
    
    Web
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web)
-   [
    
    控制 UI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web/control-ui)
-   [
    
    仪表板
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web/dashboard)
-   [
    
    WebChat
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web/webchat)
-   [
    
    TUI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web/tui)

-   [Bridge 协议（旧版节点传输）](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)
-   [为什么我们有两种协议](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)
-   [传输](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)
-   [握手 + 配对](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)
-   [帧](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)
-   [Exec 生命周期事件](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)
-   [Tailnet 使用](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)
-   [版本控制](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)

协议与 API

# Bridge 协议

# 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)

Bridge 协议（旧版节点传输）

Bridge 协议是一个**旧版**节点传输（TCP JSONL）。新的节点客户端应该使用统一的 Gateway 网关 WebSocket 协议。 如果你正在构建操作者或节点客户端，请使用 [Gateway 网关协议](https://docs.openclaw.ai/gateway/protocol)。 **注意：** 当前的 OpenClaw 构建不再包含 TCP bridge 监听器；本文档仅作历史参考保留。 旧版 `bridge.*` 配置键不再是配置模式的一部分。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)

为什么我们有两种协议

-   **安全边界**：bridge 暴露一个小的允许列表，而不是完整的 Gateway 网关 API 接口。
-   **配对 + 节点身份**：节点准入由 Gateway 网关管理，并与每节点令牌绑定。
-   **设备发现用户体验**：节点可以通过局域网上的 Bonjour 发现 Gateway 网关，或通过 tailnet 直接连接。
-   **Loopback WS**：完整的 WS 控制平面保持本地，除非通过 SSH 隧道。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)

传输

-   TCP，每行一个 JSON 对象（JSONL）。
-   可选 TLS（当 `bridge.tls.enabled` 为 true 时）。
-   旧版默认监听端口为 `18790`（当前构建不启动 TCP bridge）。

当 TLS 启用时，设备发现 TXT 记录包含 `bridgeTls=1` 加上 `bridgeTlsSha256`，以便节点可以固定证书。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)

握手 + 配对

1.  客户端发送带有节点元数据 + 令牌（如果已配对）的 `hello`。
2.  如果未配对，Gateway 网关回复 `error`（`NOT_PAIRED`/`UNAUTHORIZED`）。
3.  客户端发送 `pair-request`。
4.  Gateway 网关等待批准，然后发送 `pair-ok` 和 `hello-ok`。

`hello-ok` 返回 `serverName`，可能包含 `canvasHostUrl`。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)

帧

客户端 → Gateway 网关：

-   `req` / `res`：作用域 Gateway 网关 RPC（chat、sessions、config、health、voicewake、skills.bins）
-   `event`：节点信号（语音转录、智能体请求、聊天订阅、exec 生命周期）

Gateway 网关 → 客户端：

-   `invoke` / `invoke-res`：节点命令（`canvas.*`、`camera.*`、`screen.record`、`location.get`、`sms.send`）
-   `event`：已订阅会话的聊天更新
-   `ping` / `pong`：保活

旧版允许列表强制执行位于 `src/gateway/server-bridge.ts`（已移除）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)

Exec 生命周期事件

节点可以发出 `exec.finished` 或 `exec.denied` 事件来表面化 system.run 活动。 这些被映射到 Gateway 网关中的系统事件。（旧版节点可能仍会发出 `exec.started`。） Payload 字段（除非注明，否则都是可选的）：

-   `sessionKey`（必需）：接收系统事件的智能体会话。
-   `runId`：用于分组的唯一 exec id。
-   `command`：原始或格式化的命令字符串。
-   `exitCode`、`timedOut`、`success`、`output`：完成详情（仅限 finished）。
-   `reason`：拒绝原因（仅限 denied）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)

Tailnet 使用

-   将 bridge 绑定到 tailnet IP：在 `~/.openclaw/openclaw.json` 中设置 `bridge.bind: "tailnet"`。
-   客户端通过 MagicDNS 名称或 tailnet IP 连接。
-   Bonjour **不**跨网络；需要时使用手动主机/端口或广域 DNS‑SD。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)

版本控制

Bridge 目前是**隐式 v1**（无最小/最大协商）。预期向后兼容；在任何破坏性变更之前添加 bridge 协议版本字段。

[Gateway 网关协议](https://docs.openclaw.ai/zh-CN/gateway/protocol)[OpenAI Chat Completions](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)

⌘I
