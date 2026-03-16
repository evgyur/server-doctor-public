<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/network-model -->
<!-- Title: 网络模型 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/network-model)

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

-   [核心规则](https://docs.openclaw.ai/zh-CN/gateway/network-model)

网络与发现

# 网络模型

大多数操作通过 Gateway 网关（`openclaw gateway`）进行，它是一个长期运行的单一进程，负责管理渠道连接和 WebSocket 控制平面。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/network-model)

核心规则

-   建议每台主机运行一个 Gateway 网关。它是唯一允许拥有 WhatsApp Web 会话的进程。对于救援机器人或严格隔离的场景，可以使用隔离的配置文件和端口运行多个 Gateway 网关。参见[多 Gateway 网关](https://docs.openclaw.ai/gateway/multiple-gateways)。
-   优先使用回环地址：Gateway 网关的 WS 默认为 `ws://127.0.0.1:18789`。即使是回环连接，向导也会默认生成 gateway token。若需通过 tailnet 访问，请运行 `openclaw gateway --bind tailnet --token ...`，因为非回环绑定必须使用 token。
-   节点根据需要通过局域网、tailnet 或 SSH 连接到 Gateway 网关的 WS。旧版 TCP 桥接已弃用。
-   Canvas 主机是一个 HTTP 文件服务器，运行在 `canvasHost.port`（默认 `18793`）上，提供 `/__openclaw__/canvas/` 路径供节点 WebView 使用。参见 [Gateway 网关配置](https://docs.openclaw.ai/gateway/configuration)（`canvasHost`）。
-   远程使用通常通过 SSH 隧道或 Tailscale VPN。参见[远程访问](https://docs.openclaw.ai/gateway/remote)和[设备发现](https://docs.openclaw.ai/gateway/discovery)。

[本地模型](https://docs.openclaw.ai/zh-CN/gateway/local-models)[Gateway 网关拥有的配对](https://docs.openclaw.ai/zh-CN/gateway/pairing)

⌘I
