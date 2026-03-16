<!-- Source: https://docs.openclaw.ai/zh-CN/web -->
<!-- Title: Web - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/web)

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

-   [Web（Gateway 网关）](https://docs.openclaw.ai/zh-CN/web)
-   [Webhooks](https://docs.openclaw.ai/zh-CN/web)
-   [配置（默认开启）](https://docs.openclaw.ai/zh-CN/web)
-   [Tailscale 访问](https://docs.openclaw.ai/zh-CN/web)
-   [集成 Serve（推荐）](https://docs.openclaw.ai/zh-CN/web)
-   [Tailnet 绑定 + 令牌](https://docs.openclaw.ai/zh-CN/web)
-   [公共互联网（Funnel）](https://docs.openclaw.ai/zh-CN/web)
-   [安全注意事项](https://docs.openclaw.ai/zh-CN/web)
-   [构建 UI](https://docs.openclaw.ai/zh-CN/web)

Web 界面

# Web

# 

[​

](https://docs.openclaw.ai/zh-CN/web)

Web（Gateway 网关）

Gateway 网关从与 Gateway 网关 WebSocket 相同的端口提供一个小型**浏览器 Control UI**（Vite + Lit）：

-   默认：`http://<host>:18789/`
-   可选前缀：设置 `gateway.controlUi.basePath`（例如 `/openclaw`）

功能详见 [Control UI](https://docs.openclaw.ai/web/control-ui)。 本页重点介绍绑定模式、安全和面向 Web 的界面。

## 

[​

](https://docs.openclaw.ai/zh-CN/web)

Webhooks

当 `hooks.enabled=true` 时，Gateway 网关还在同一 HTTP 服务器上公开一个小型 webhook 端点。 参见 [Gateway 网关配置](https://docs.openclaw.ai/gateway/configuration) → `hooks` 了解认证 + 载荷。

## 

[​

](https://docs.openclaw.ai/zh-CN/web)

配置（默认开启）

当资源存在时（`dist/control-ui`），Control UI **默认启用**。 你可以通过配置控制它：

复制

```
{
  gateway: {
    controlUi: { enabled: true, basePath: "/openclaw" }, // basePath 可选
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/web)

Tailscale 访问

### 

[​

](https://docs.openclaw.ai/zh-CN/web)

集成 Serve（推荐）

保持 Gateway 网关在本地回环上，让 Tailscale Serve 代理它：

复制

```
{
  gateway: {
    bind: "loopback",
    tailscale: { mode: "serve" },
  },
}
```

然后启动 Gateway 网关：

复制

```
openclaw gateway
```

打开：

-   `https://<magicdns>/`（或你配置的 `gateway.controlUi.basePath`）

### 

[​

](https://docs.openclaw.ai/zh-CN/web)

Tailnet 绑定 + 令牌

复制

```
{
  gateway: {
    bind: "tailnet",
    controlUi: { enabled: true },
    auth: { mode: "token", token: "your-token" },
  },
}
```

然后启动 Gateway 网关（非本地回环绑定需要令牌）：

复制

```
openclaw gateway
```

打开：

-   `http://<tailscale-ip>:18789/`（或你配置的 `gateway.controlUi.basePath`）

### 

[​

](https://docs.openclaw.ai/zh-CN/web)

公共互联网（Funnel）

复制

```
{
  gateway: {
    bind: "loopback",
    tailscale: { mode: "funnel" },
    auth: { mode: "password" }, // 或 OPENCLAW_GATEWAY_PASSWORD
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/web)

安全注意事项

-   Gateway 网关认证默认是必需的（令牌/密码或 Tailscale 身份头）。
-   非本地回环绑定仍然**需要**共享令牌/密码（`gateway.auth` 或环境变量）。
-   向导默认生成 Gateway 网关令牌（即使在本地回环上）。
-   UI 发送 `connect.params.auth.token` 或 `connect.params.auth.password`。
-   使用 Serve 时，当 `gateway.auth.allowTailscale` 为 `true` 时，Tailscale 身份头可以满足认证（无需令牌/密码）。设置 `gateway.auth.allowTailscale: false` 以要求显式凭证。参见 [Tailscale](https://docs.openclaw.ai/gateway/tailscale) 和 [安全](https://docs.openclaw.ai/gateway/security)。
-   `gateway.tailscale.mode: "funnel"` 需要 `gateway.auth.mode: "password"`（共享密码）。

## 

[​

](https://docs.openclaw.ai/zh-CN/web)

构建 UI

Gateway 网关从 `dist/control-ui` 提供静态文件。使用以下命令构建：

复制

```
pnpm ui:build # 首次运行时自动安装 UI 依赖
```

[形式化验证（安全模型）](https://docs.openclaw.ai/zh-CN/security/formal-verification)[控制 UI](https://docs.openclaw.ai/zh-CN/web/control-ui)

⌘I
