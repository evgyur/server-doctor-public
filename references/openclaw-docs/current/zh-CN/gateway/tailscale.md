<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/tailscale -->
<!-- Title: Tailscale - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

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

-   [Tailscale（Gateway 网关仪表盘）](https://docs.openclaw.ai/zh-CN/gateway/tailscale)
-   [模式](https://docs.openclaw.ai/zh-CN/gateway/tailscale)
-   [认证](https://docs.openclaw.ai/zh-CN/gateway/tailscale)
-   [配置示例](https://docs.openclaw.ai/zh-CN/gateway/tailscale)
-   [仅限 Tailnet（Serve）](https://docs.openclaw.ai/zh-CN/gateway/tailscale)
-   [仅限 Tailnet（绑定到 Tailnet IP）](https://docs.openclaw.ai/zh-CN/gateway/tailscale)
-   [公共互联网（Funnel + 共享密码）](https://docs.openclaw.ai/zh-CN/gateway/tailscale)
-   [CLI 示例](https://docs.openclaw.ai/zh-CN/gateway/tailscale)
-   [注意事项](https://docs.openclaw.ai/zh-CN/gateway/tailscale)
-   [浏览器控制（远程 Gateway 网关 + 本地浏览器）](https://docs.openclaw.ai/zh-CN/gateway/tailscale)
-   [Tailscale 前提条件 + 限制](https://docs.openclaw.ai/zh-CN/gateway/tailscale)
-   [了解更多](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

远程访问

# Tailscale

# 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

Tailscale（Gateway 网关仪表盘）

OpenClaw 可以为 Gateway 网关仪表盘和 WebSocket 端口自动配置 Tailscale **Serve**（tailnet）或 **Funnel**（公共）。这使 Gateway 网关保持绑定到 loopback，同时 Tailscale 提供 HTTPS、路由和（对于 Serve）身份头。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

模式

-   `serve`：仅限 Tailnet 的 Serve，通过 `tailscale serve`。Gateway 网关保持在 `127.0.0.1` 上。
-   `funnel`：通过 `tailscale funnel` 的公共 HTTPS。OpenClaw 需要共享密码。
-   `off`：默认（无 Tailscale 自动化）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

认证

设置 `gateway.auth.mode` 来控制握手：

-   `token`（设置 `OPENCLAW_GATEWAY_TOKEN` 时的默认值）
-   `password`（通过 `OPENCLAW_GATEWAY_PASSWORD` 或配置的共享密钥）

当 `tailscale.mode = "serve"` 且 `gateway.auth.allowTailscale` 为 `true` 时， 有效的 Serve 代理请求可以通过 Tailscale 身份头（`tailscale-user-login`）进行认证，无需提供令牌/密码。OpenClaw 通过本地 Tailscale 守护进程（`tailscale whois`）解析 `x-forwarded-for` 地址并将其与头匹配来验证身份，然后才接受它。 OpenClaw 仅在请求从 loopback 到达并带有 Tailscale 的 `x-forwarded-for`、`x-forwarded-proto` 和 `x-forwarded-host` 头时才将其视为 Serve 请求。 要要求显式凭证，设置 `gateway.auth.allowTailscale: false` 或强制 `gateway.auth.mode: "password"`。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

配置示例

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

仅限 Tailnet（Serve）

复制

```
{
  gateway: {
    bind: "loopback",
    tailscale: { mode: "serve" },
  },
}
```

打开：`https://<magicdns>/`（或你配置的 `gateway.controlUi.basePath`）

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

仅限 Tailnet（绑定到 Tailnet IP）

当你希望 Gateway 网关直接监听 Tailnet IP 时使用此方式（无 Serve/Funnel）。

复制

```
{
  gateway: {
    bind: "tailnet",
    auth: { mode: "token", token: "your-token" },
  },
}
```

从另一个 Tailnet 设备连接：

-   控制 UI：`http://<tailscale-ip>:18789/`
-   WebSocket：`ws://<tailscale-ip>:18789`

注意：在此模式下 loopback（`http://127.0.0.1:18789`）将**不**工作。

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

公共互联网（Funnel + 共享密码）

复制

```
{
  gateway: {
    bind: "loopback",
    tailscale: { mode: "funnel" },
    auth: { mode: "password", password: "replace-me" },
  },
}
```

优先使用 `OPENCLAW_GATEWAY_PASSWORD` 而不是将密码提交到磁盘。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

CLI 示例

复制

```
openclaw gateway --tailscale serve
openclaw gateway --tailscale funnel --auth password
```

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

注意事项

-   Tailscale Serve/Funnel 需要安装并登录 `tailscale` CLI。
-   `tailscale.mode: "funnel"` 除非认证模式为 `password`，否则拒绝启动，以避免公共暴露。
-   如果你希望 OpenClaw 在关闭时撤销 `tailscale serve` 或 `tailscale funnel` 配置，设置 `gateway.tailscale.resetOnExit`。
-   `gateway.bind: "tailnet"` 是直接 Tailnet 绑定（无 HTTPS，无 Serve/Funnel）。
-   `gateway.bind: "auto"` 优先 loopback；如果你想要仅 Tailnet，使用 `tailnet`。
-   Serve/Funnel 仅暴露 **Gateway 网关控制 UI + WS**。节点通过相同的 Gateway 网关 WS 端点连接，因此 Serve 可以用于节点访问。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

浏览器控制（远程 Gateway 网关 + 本地浏览器）

如果你在一台机器上运行 Gateway 网关但想在另一台机器上驱动浏览器， 在浏览器机器上运行一个**节点主机**并让两者保持在同一个 tailnet 上。 Gateway 网关会将浏览器操作代理到节点；不需要单独的控制服务器或 Serve URL。 避免将 Funnel 用于浏览器控制；将节点配对视为操作者访问。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

Tailscale 前提条件 + 限制

-   Serve 需要为你的 tailnet 启用 HTTPS；如果缺少，CLI 会提示。
-   Serve 注入 Tailscale 身份头；Funnel 不会。
-   Funnel 需要 Tailscale v1.38.3+、MagicDNS、启用 HTTPS 和 funnel 节点属性。
-   Funnel 仅支持通过 TLS 的端口 `443`、`8443` 和 `10000`。
-   macOS 上的 Funnel 需要开源 Tailscale 应用变体。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

了解更多

-   Tailscale Serve 概述：[https://tailscale.com/kb/1312/serve](https://tailscale.com/kb/1312/serve)
-   `tailscale serve` 命令：[https://tailscale.com/kb/1242/tailscale-serve](https://tailscale.com/kb/1242/tailscale-serve)
-   Tailscale Funnel 概述：[https://tailscale.com/kb/1223/tailscale-funnel](https://tailscale.com/kb/1223/tailscale-funnel)
-   `tailscale funnel` 命令：[https://tailscale.com/kb/1311/tailscale-funnel](https://tailscale.com/kb/1311/tailscale-funnel)

[远程 Gateway 网关设置](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)[网络](https://docs.openclaw.ai/zh-CN/network)

⌘I
