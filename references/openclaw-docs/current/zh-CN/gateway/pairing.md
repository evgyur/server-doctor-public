<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/pairing -->
<!-- Title: Gateway 网关拥有的配对 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/pairing)

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
        
        网络模型
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/network-model)
    -   [
        
        Gateway 网关拥有的配对
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/pairing)
    -   [
        
        设备发现 + 传输协议
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/discovery)
    -   [
        
        Bonjour 设备发现
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

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

-   [Gateway 网关拥有的配对（选项 B）](https://docs.openclaw.ai/zh-CN/gateway/pairing)
-   [概念](https://docs.openclaw.ai/zh-CN/gateway/pairing)
-   [配对工作原理](https://docs.openclaw.ai/zh-CN/gateway/pairing)
-   [CLI 工作流程（支持无头模式）](https://docs.openclaw.ai/zh-CN/gateway/pairing)
-   [API 接口（Gateway 网关协议）](https://docs.openclaw.ai/zh-CN/gateway/pairing)
-   [自动审批（macOS 应用）](https://docs.openclaw.ai/zh-CN/gateway/pairing)
-   [存储（本地，私有）](https://docs.openclaw.ai/zh-CN/gateway/pairing)
-   [传输层行为](https://docs.openclaw.ai/zh-CN/gateway/pairing)

网络与发现

# Gateway 网关拥有的配对

# 

[​

](https://docs.openclaw.ai/zh-CN/gateway/pairing)

Gateway 网关拥有的配对（选项 B）

在 Gateway 网关拥有的配对中，**Gateway 网关**是允许哪些节点加入的唯一信息源。UI（macOS 应用、未来的客户端）只是审批或拒绝待处理请求的前端。 **重要：**WS 节点在 `connect` 期间使用**设备配对**（角色 `node`）。`node.pair.*` 是一个独立的配对存储，**不会**限制 WS 握手。只有显式调用 `node.pair.*` 的客户端使用此流程。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/pairing)

概念

-   **待处理请求**：一个节点请求加入；需要审批。
-   **已配对节点**：已批准的节点，带有已颁发的认证令牌。
-   **传输层**：Gateway 网关 WS 端点转发请求但不决定成员资格。（旧版 TCP 桥接支持已弃用/移除。）

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/pairing)

配对工作原理

1.  节点连接到 Gateway 网关 WS 并请求配对。
2.  Gateway 网关存储一个**待处理请求**并发出 `node.pair.requested`。
3.  你审批或拒绝该请求（CLI 或 UI）。
4.  审批后，Gateway 网关颁发一个**新令牌**（重新配对时令牌会轮换）。
5.  节点使用该令牌重新连接，现在是”已配对”状态。

待处理请求在 **5 分钟**后自动过期。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/pairing)

CLI 工作流程（支持无头模式）

复制

```
openclaw nodes pending
openclaw nodes approve <requestId>
openclaw nodes reject <requestId>
openclaw nodes status
openclaw nodes rename --node <id|name|ip> --name "Living Room iPad"
```

`nodes status` 显示已配对/已连接的节点及其功能。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/pairing)

API 接口（Gateway 网关协议）

事件：

-   `node.pair.requested` — 创建新的待处理请求时发出。
-   `node.pair.resolved` — 请求被批准/拒绝/过期时发出。

方法：

-   `node.pair.request` — 创建或复用待处理请求。
-   `node.pair.list` — 列出待处理 + 已配对的节点。
-   `node.pair.approve` — 批准待处理请求（颁发令牌）。
-   `node.pair.reject` — 拒绝待处理请求。
-   `node.pair.verify` — 验证 `{ nodeId, token }`。

注意事项：

-   `node.pair.request` 对每个节点是幂等的：重复调用返回相同的待处理请求。
-   审批**总是**生成新的令牌；`node.pair.request` 永远不会返回令牌。
-   请求可以包含 `silent: true` 作为自动审批流程的提示。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/pairing)

自动审批（macOS 应用）

当满足以下条件时，macOS 应用可以选择尝试**静默审批**：

-   请求标记为 `silent`，且
-   应用可以使用相同用户验证到 Gateway 网关主机的 SSH 连接。

如果静默审批失败，则回退到正常的”批准/拒绝”提示。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/pairing)

存储（本地，私有）

配对状态存储在 Gateway 网关状态目录下（默认 `~/.openclaw`）：

-   `~/.openclaw/nodes/paired.json`
-   `~/.openclaw/nodes/pending.json`

如果你覆盖了 `OPENCLAW_STATE_DIR`，`nodes/` 文件夹会随之移动。 安全注意事项：

-   令牌是机密信息；将 `paired.json` 视为敏感文件。
-   轮换令牌需要重新审批（或删除节点条目）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/pairing)

传输层行为

-   传输层是**无状态的**；它不存储成员资格。
-   如果 Gateway 网关离线或配对被禁用，节点无法配对。
-   如果 Gateway 网关处于远程模式，配对仍然针对远程 Gateway 网关的存储进行。

[网络模型](https://docs.openclaw.ai/zh-CN/gateway/network-model)[设备发现 + 传输协议](https://docs.openclaw.ai/zh-CN/gateway/discovery)

⌘I
