<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/health -->
<!-- Title: 健康检查 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/health)

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

-   [健康检查（CLI）](https://docs.openclaw.ai/zh-CN/gateway/health)
-   [快速检查](https://docs.openclaw.ai/zh-CN/gateway/health)
-   [深度诊断](https://docs.openclaw.ai/zh-CN/gateway/health)
-   [当出现故障时](https://docs.openclaw.ai/zh-CN/gateway/health)
-   [专用”health”命令](https://docs.openclaw.ai/zh-CN/gateway/health)

配置与运维

# 健康检查

# 

[​

](https://docs.openclaw.ai/zh-CN/gateway/health)

健康检查（CLI）

验证渠道连接的简短指南，无需猜测。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/health)

快速检查

-   `openclaw status` — 本地摘要：Gateway 网关可达性/模式、更新提示、已链接渠道认证时长、会话 + 最近活动。
-   `openclaw status --all` — 完整本地诊断（只读、彩色、可安全粘贴用于调试）。
-   `openclaw status --deep` — 还会探测运行中的 Gateway 网关（支持时进行每渠道探测）。
-   `openclaw health --json` — 向运行中的 Gateway 网关请求完整健康快照（仅 WS；不直接访问 Baileys 套接字）。
-   在 WhatsApp/WebChat 中单独发送 `/status` 消息可获取状态回复，而不调用智能体。
-   日志：跟踪 `/tmp/openclaw/openclaw-*.log` 并过滤 `web-heartbeat`、`web-reconnect`、`web-auto-reply`、`web-inbound`。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/health)

深度诊断

-   磁盘上的凭证：`ls -l ~/.openclaw/credentials/whatsapp/<accountId>/creds.json`（mtime 应该是最近的）。
-   会话存储：`ls -l ~/.openclaw/agents/<agentId>/sessions/sessions.json`（路径可在配置中覆盖）。计数和最近收件人通过 `status` 显示。
-   重新链接流程：当日志中出现状态码 409–515 或 `loggedOut` 时，执行 `openclaw channels logout && openclaw channels login --verbose`。（注意：配对后状态 515 时 QR 登录流程会自动重启一次。）

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/health)

当出现故障时

-   `logged out` 或状态 409–515 → 使用 `openclaw channels logout` 然后 `openclaw channels login` 重新链接。
-   Gateway 网关不可达 → 启动它：`openclaw gateway --port 18789`（如果端口被占用则使用 `--force`）。
-   没有入站消息 → 确认已链接的手机在线且发送者被允许（`channels.whatsapp.allowFrom`）；对于群聊，确保允许列表 + 提及规则匹配（`channels.whatsapp.groups`、`agents.list[].groupChat.mentionPatterns`）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/health)

专用”health”命令

`openclaw health --json` 向运行中的 Gateway 网关请求其健康快照（CLI 不直接访问渠道套接字）。它报告已链接凭证/认证时长（如可用）、每渠道探测摘要、会话存储摘要和探测持续时间。如果 Gateway 网关不可达或探测失败/超时，它以非零退出。使用 `--timeout <ms>` 覆盖默认的 10 秒。

[认证](https://docs.openclaw.ai/zh-CN/gateway/authentication)[心跳](https://docs.openclaw.ai/zh-CN/gateway/heartbeat)

⌘I
