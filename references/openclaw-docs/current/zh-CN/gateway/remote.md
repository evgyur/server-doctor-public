<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/remote -->
<!-- Title: 远程访问 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/remote)

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

-   [远程访问（SSH、隧道和 tailnet）](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [核心理念](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [常见的 VPN/tailnet 设置（智能体所在位置）](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [1) tailnet 中始终在线的 Gateway 网关（VPS 或家庭服务器）](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [2) 家庭桌面运行 Gateway 网关，笔记本电脑作为远程控制](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [3) 笔记本电脑运行 Gateway 网关，从其他机器远程访问](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [命令流（什么在哪里运行）](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [SSH 隧道（CLI + 工具）](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [CLI 远程默认值](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [通过 SSH 的聊天 UI](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [macOS 应用”Remote over SSH”](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [安全规则（远程/VPN）](https://docs.openclaw.ai/zh-CN/gateway/remote)

远程访问

# 远程访问

# 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote)

远程访问（SSH、隧道和 tailnet）

本仓库通过在专用主机（桌面/服务器）上运行单个 Gateway 网关（主节点）并让客户端连接到它来支持”SSH 远程”。

-   对于**操作员（你/macOS 应用）**：SSH 隧道是通用的回退方案。
-   对于**节点（iOS/Android 和未来的设备）**：连接到 Gateway **WebSocket**（LAN/tailnet 或根据需要通过 SSH 隧道）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote)

核心理念

-   Gateway WebSocket 绑定到你配置端口的 **loopback**（默认为 18789）。
-   对于远程使用，你通过 SSH 转发该 loopback 端口（或使用 tailnet/VPN 减少隧道需求）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote)

常见的 VPN/tailnet 设置（智能体所在位置）

将 **Gateway 网关主机**视为”智能体所在的位置”。它拥有会话、身份验证配置文件、渠道和状态。 你的笔记本电脑/桌面（和节点）连接到该主机。

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote)

1) tailnet 中始终在线的 Gateway 网关（VPS 或家庭服务器）

在持久主机上运行 Gateway 网关，并通过 **Tailscale** 或 SSH 访问它。

-   **最佳用户体验：** 保持 `gateway.bind: "loopback"` 并使用 **Tailscale Serve** 作为控制 UI。
-   **回退方案：** 保持 loopback + 从任何需要访问的机器建立 SSH 隧道。
-   **示例：** [exe.dev](https://docs.openclaw.ai/install/exe-dev)（简易 VM）或 [Hetzner](https://docs.openclaw.ai/install/hetzner)（生产 VPS）。

当你的笔记本电脑经常休眠但你希望智能体始终在线时，这是理想的选择。

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote)

2) 家庭桌面运行 Gateway 网关，笔记本电脑作为远程控制

笔记本电脑**不**运行智能体。它远程连接：

-   使用 macOS 应用的 **Remote over SSH** 模式（设置 → 通用 → “OpenClaw runs”）。
-   应用打开并管理隧道，因此 WebChat + 健康检查”直接工作”。

操作手册：[macOS 远程访问](https://docs.openclaw.ai/platforms/mac/remote)。

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote)

3) 笔记本电脑运行 Gateway 网关，从其他机器远程访问

保持 Gateway 网关在本地但安全地暴露它：

-   从其他机器到笔记本电脑的 SSH 隧道，或
-   Tailscale Serve 控制 UI 并保持 Gateway 网关仅 loopback。

指南：[Tailscale](https://docs.openclaw.ai/gateway/tailscale) 和 [Web 概览](https://docs.openclaw.ai/web)。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote)

命令流（什么在哪里运行）

一个 Gateway 网关服务拥有状态 + 渠道。节点是外围设备。 流程示例（Telegram → 节点）：

-   Telegram 消息到达 **Gateway 网关**。
-   Gateway 网关运行**智能体**并决定是否调用节点工具。
-   Gateway 网关通过 Gateway WebSocket 调用**节点**（`node.*` RPC）。
-   节点返回结果；Gateway 网关回复到 Telegram。

说明：

-   **节点不运行 Gateway 网关服务。** 除非你有意运行隔离的配置文件，否则每台主机只应运行一个 Gateway 网关（参见[多 Gateway 网关](https://docs.openclaw.ai/gateway/multiple-gateways)）。
-   macOS 应用的”节点模式”只是通过 Gateway WebSocket 的节点客户端。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote)

SSH 隧道（CLI + 工具）

创建到远程 Gateway WS 的本地隧道：

复制

```
ssh -N -L 18789:127.0.0.1:18789 user@host
```

隧道建立后：

-   `openclaw health` 和 `openclaw status --deep` 现在通过 `ws://127.0.0.1:18789` 访问远程 Gateway 网关。
-   `openclaw gateway {status,health,send,agent,call}` 在需要时也可以通过 `--url` 指定转发的 URL。

注意：将 `18789` 替换为你配置的 `gateway.port`（或 `--port`/`OPENCLAW_GATEWAY_PORT`）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote)

CLI 远程默认值

你可以持久化远程目标，以便 CLI 命令默认使用它：

复制

```
{
  gateway: {
    mode: "remote",
    remote: {
      url: "ws://127.0.0.1:18789",
      token: "your-token",
    },
  },
}
```

当 Gateway 网关仅限 loopback 时，保持 URL 为 `ws://127.0.0.1:18789` 并先打开 SSH 隧道。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote)

通过 SSH 的聊天 UI

WebChat 不再使用单独的 HTTP 端口。SwiftUI 聊天 UI 直接连接到 Gateway WebSocket。

-   通过 SSH 转发 `18789`（见上文），然后让客户端连接到 `ws://127.0.0.1:18789`。
-   在 macOS 上，优先使用应用的”Remote over SSH”模式，它会自动管理隧道。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote)

macOS 应用”Remote over SSH”

macOS 菜单栏应用可以端到端驱动相同的设置（远程状态检查、WebChat 和语音唤醒转发）。 操作手册：[macOS 远程访问](https://docs.openclaw.ai/platforms/mac/remote)。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote)

安全规则（远程/VPN）

简短版本：**保持 Gateway 网关仅 loopback**，除非你确定需要绑定。

-   **Loopback + SSH/Tailscale Serve** 是最安全的默认设置（无公开暴露）。
-   **非 loopback 绑定**（`lan`/`tailnet`/`custom`，或当 loopback 不可用时的 `auto`）必须使用身份验证令牌/密码。
-   `gateway.remote.token` **仅**用于远程 CLI 调用——它**不**启用本地身份验证。
-   `gateway.remote.tlsFingerprint` 在使用 `wss://` 时固定远程 TLS 证书。
-   当 `gateway.auth.allowTailscale: true` 时，**Tailscale Serve** 可以通过身份标头进行身份验证。如果你想使用令牌/密码，请将其设置为 `false`。
-   将浏览器控制视为操作员访问：仅限 tailnet + 有意的节点配对。

深入了解：[安全](https://docs.openclaw.ai/gateway/security)。

[Bonjour 设备发现](https://docs.openclaw.ai/zh-CN/gateway/bonjour)[远程 Gateway 网关设置](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

⌘I
