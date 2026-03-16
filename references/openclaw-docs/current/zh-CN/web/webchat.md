<!-- Source: https://docs.openclaw.ai/zh-CN/web/webchat -->
<!-- Title: WebChat - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/web/webchat)

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

-   [WebChat（Gateway 网关 WebSocket UI）](https://docs.openclaw.ai/zh-CN/web/webchat)
-   [它是什么](https://docs.openclaw.ai/zh-CN/web/webchat)
-   [快速开始](https://docs.openclaw.ai/zh-CN/web/webchat)
-   [工作原理（行为）](https://docs.openclaw.ai/zh-CN/web/webchat)
-   [远程使用](https://docs.openclaw.ai/zh-CN/web/webchat)
-   [配置参考（WebChat）](https://docs.openclaw.ai/zh-CN/web/webchat)

Web 界面

# WebChat

# 

[​

](https://docs.openclaw.ai/zh-CN/web/webchat)

WebChat（Gateway 网关 WebSocket UI）

状态：macOS/iOS SwiftUI 聊天 UI 直接与 Gateway 网关 WebSocket 通信。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/webchat)

它是什么

-   Gateway 网关的原生聊天 UI（无嵌入式浏览器，无本地静态服务器）。
-   使用与其他渠道相同的会话和路由规则。
-   确定性路由：回复始终返回到 WebChat。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/webchat)

快速开始

1.  启动 Gateway 网关。
2.  打开 WebChat UI（macOS/iOS 应用）或控制 UI 聊天标签页。
3.  确保已配置 Gateway 网关认证（默认需要，即使在 loopback 上）。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/webchat)

工作原理（行为）

-   UI 连接到 Gateway 网关 WebSocket 并使用 `chat.history`、`chat.send` 和 `chat.inject`。
-   `chat.inject` 直接将助手注释追加到转录并广播到 UI（无智能体运行）。
-   历史记录始终从 Gateway 网关获取（无本地文件监听）。
-   如果 Gateway 网关不可达，WebChat 为只读模式。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/webchat)

远程使用

-   远程模式通过 SSH/Tailscale 隧道传输 Gateway 网关 WebSocket。
-   你不需要运行单独的 WebChat 服务器。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/webchat)

配置参考（WebChat）

完整配置：[配置](https://docs.openclaw.ai/gateway/configuration) 渠道选项：

-   没有专用的 `webchat.*` 块。WebChat 使用下面的 Gateway 网关端点 + 认证设置。

相关的全局选项：

-   `gateway.port`、`gateway.bind`：WebSocket 主机/端口。
-   `gateway.auth.mode`、`gateway.auth.token`、`gateway.auth.password`：WebSocket 认证。
-   `gateway.remote.url`、`gateway.remote.token`、`gateway.remote.password`：远程 Gateway 网关目标。
-   `session.*`：会话存储和主键默认值。

[仪表板](https://docs.openclaw.ai/zh-CN/web/dashboard)[TUI](https://docs.openclaw.ai/zh-CN/web/tui)

⌘I
