<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/gateway-lock -->
<!-- Title: Gateway 网关锁 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/gateway-lock)

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
        
        配置
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/configuration)
    -   [
        
        配置示例
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/configuration-examples)
    -   [
        
        认证
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/authentication)
    -   [
        
        健康检查
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/health)
    -   [
        
        心跳
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/heartbeat)
    -   [
        
        Doctor
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/doctor)
    -   [
        
        日志
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/logging)
    -   [
        
        Gateway 网关锁
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/gateway-lock)
    -   [
        
        后台 Exec 和 Process 工具
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/background-process)
    -   [
        
        多个 Gateway 网关
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/multiple-gateways)
    -   [
        
        故障排除
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/troubleshooting)

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

-   [Gateway 网关锁](https://docs.openclaw.ai/zh-CN/gateway/gateway-lock)
-   [原因](https://docs.openclaw.ai/zh-CN/gateway/gateway-lock)
-   [机制](https://docs.openclaw.ai/zh-CN/gateway/gateway-lock)
-   [错误表面](https://docs.openclaw.ai/zh-CN/gateway/gateway-lock)
-   [运维说明](https://docs.openclaw.ai/zh-CN/gateway/gateway-lock)

配置与运维

# Gateway 网关锁

# 

[​

](https://docs.openclaw.ai/zh-CN/gateway/gateway-lock)

Gateway 网关锁

最后更新：2025-12-11

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/gateway-lock)

原因

-   确保同一主机上每个基础端口只运行一个 Gateway 网关实例；额外的 Gateway 网关必须使用隔离的配置文件和唯一的端口。
-   在崩溃/SIGKILL 后不留下过时的锁文件。
-   当控制端口已被占用时快速失败并给出清晰的错误。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/gateway-lock)

机制

-   Gateway 网关在启动时立即使用独占 TCP 监听器绑定 WebSocket 监听器（默认 `ws://127.0.0.1:18789`）。
-   如果绑定因 `EADDRINUSE` 失败，启动会抛出 `GatewayLockError("another gateway instance is already listening on ws://127.0.0.1:<port>")`。
-   操作系统在任何进程退出时（包括崩溃和 SIGKILL）自动释放监听器——不需要单独的锁文件或清理步骤。
-   关闭时，Gateway 网关关闭 WebSocket 服务器和底层 HTTP 服务器以及时释放端口。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/gateway-lock)

错误表面

-   如果另一个进程持有端口，启动会抛出 `GatewayLockError("another gateway instance is already listening on ws://127.0.0.1:<port>")`。
-   其他绑定失败会显示为 `GatewayLockError("failed to bind gateway socket on ws://127.0.0.1:<port>: …")`。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/gateway-lock)

运维说明

-   如果端口被_另一个_进程占用，错误是相同的；释放端口或使用 `openclaw gateway --port <port>` 选择另一个端口。
-   macOS 应用在启动 Gateway 网关之前仍维护自己的轻量级 PID 保护；运行时锁由 WebSocket 绑定强制执行。

[日志](https://docs.openclaw.ai/zh-CN/gateway/logging)[后台 Exec 和 Process 工具](https://docs.openclaw.ai/zh-CN/gateway/background-process)

⌘I
