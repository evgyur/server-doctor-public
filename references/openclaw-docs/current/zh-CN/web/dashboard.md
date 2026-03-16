<!-- Source: https://docs.openclaw.ai/zh-CN/web/dashboard -->
<!-- Title: 仪表板 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/web/dashboard)

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

-   [仪表板（控制 UI）](https://docs.openclaw.ai/zh-CN/web/dashboard)
-   [快速路径（推荐）](https://docs.openclaw.ai/zh-CN/web/dashboard)
-   [Token 基础（本地 vs 远程）](https://docs.openclaw.ai/zh-CN/web/dashboard)
-   [如果你看到”unauthorized” / 1008](https://docs.openclaw.ai/zh-CN/web/dashboard)

Web 界面

# 仪表板

# 

[​

](https://docs.openclaw.ai/zh-CN/web/dashboard)

仪表板（控制 UI）

Gateway 网关仪表板是默认在 `/` 提供的浏览器控制 UI （通过 `gateway.controlUi.basePath` 覆盖）。 快速打开（本地 Gateway 网关）：

-   [http://127.0.0.1:18789/（或](http://127.0.0.1:18789/%EF%BC%88%E6%88%96) [http://localhost:18789/）](http://localhost:18789/%EF%BC%89)

关键参考：

-   [控制 UI](https://docs.openclaw.ai/web/control-ui) 了解使用方法和 UI 功能。
-   [Tailscale](https://docs.openclaw.ai/gateway/tailscale) 了解 Serve/Funnel 自动化。
-   [Web 界面](https://docs.openclaw.ai/web) 了解绑定模式和安全注意事项。

认证通过 `connect.params.auth`（token 或密码）在 WebSocket 握手时强制执行。 参见 [Gateway 网关配置](https://docs.openclaw.ai/gateway/configuration) 中的 `gateway.auth`。 安全注意事项：控制 UI 是一个**管理界面**（聊天、配置、执行审批）。 不要公开暴露它。UI 在首次加载后将 token 存储在 `localStorage` 中。 优先使用 localhost、Tailscale Serve 或 SSH 隧道。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/dashboard)

快速路径（推荐）

-   新手引导后，CLI 现在会自动打开带有你的 token 的仪表板，并打印相同的带 token 链接。
-   随时重新打开：`openclaw dashboard`（复制链接，如果可能则打开浏览器，如果是无头环境则显示 SSH 提示）。
-   token 保持本地（仅查询参数）；UI 在首次加载后移除它并保存到 localStorage。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/dashboard)

Token 基础（本地 vs 远程）

-   **Localhost**：打开 `http://127.0.0.1:18789/`。如果你看到”unauthorized”，运行 `openclaw dashboard` 并使用带 token 的链接（`?token=...`）。
-   **Token 来源**：`gateway.auth.token`（或 `OPENCLAW_GATEWAY_TOKEN`）；UI 在首次加载后存储它。
-   **非 localhost**：使用 Tailscale Serve（如果 `gateway.auth.allowTailscale: true` 则无需 token）、带 token 的 tailnet 绑定，或 SSH 隧道。参见 [Web 界面](https://docs.openclaw.ai/web)。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/dashboard)

如果你看到”unauthorized” / 1008

-   运行 `openclaw dashboard` 获取新的带 token 链接。
-   确保 Gateway 网关可达（本地：`openclaw status`；远程：SSH 隧道 `ssh -N -L 18789:127.0.0.1:18789 user@host` 然后打开 `http://127.0.0.1:18789/?token=...`）。
-   在仪表板设置中，粘贴你在 `gateway.auth.token`（或 `OPENCLAW_GATEWAY_TOKEN`）中配置的相同 token。

[控制 UI](https://docs.openclaw.ai/zh-CN/web/control-ui)[WebChat](https://docs.openclaw.ai/zh-CN/web/webchat)

⌘I
