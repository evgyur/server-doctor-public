<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/bonjour -->
<!-- Title: Bonjour 设备发现 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

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

-   [Bonjour / mDNS 设备发现](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [通过 Tailscale 的广域 Bonjour（单播 DNS‑SD）](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [Gateway 网关配置（推荐）](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [一次性 DNS 服务器设置（Gateway 网关主机）](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [Tailscale DNS 设置](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [Gateway 网关监听器安全（推荐）](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [什么在广播](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [服务类型](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [TXT 键（非机密提示）](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [在 macOS 上调试](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [在 Gateway 网关日志中调试](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [在 iOS 节点上调试](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [常见故障模式](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [转义的实例名称（\\032）](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [禁用 / 配置](https://docs.openclaw.ai/zh-CN/gateway/bonjour)
-   [相关文档](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

网络与发现

# Bonjour 设备发现

# 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

Bonjour / mDNS 设备发现

OpenClaw 使用 Bonjour（mDNS / DNS‑SD）作为**仅限局域网的便捷方式**来发现 活跃的 Gateway 网关（WebSocket 端点）。这是尽力而为的，**不能**替代 SSH 或 基于 Tailnet 的连接。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

通过 Tailscale 的广域 Bonjour（单播 DNS‑SD）

如果节点和 Gateway 网关在不同的网络上，多播 mDNS 无法跨越 边界。你可以通过切换到基于 Tailscale 的**单播 DNS‑SD** （“广域 Bonjour”）来保持相同的设备发现用户体验。 概要步骤：

1.  在 Gateway 网关主机上运行 DNS 服务器（可通过 Tailnet 访问）。
2.  在专用区域下发布 `_openclaw-gw._tcp` 的 DNS‑SD 记录 （示例：`openclaw.internal.`）。
3.  配置 Tailscale **分割 DNS**，使你选择的域名通过该 DNS 服务器为客户端（包括 iOS）解析。

OpenClaw 支持任何发现域名；`openclaw.internal.` 只是一个示例。 iOS/Android 节点同时浏览 `local.` 和你配置的广域域名。

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

Gateway 网关配置（推荐）

复制

```
{
  gateway: { bind: "tailnet" }, // 仅 tailnet（推荐）
  discovery: { wideArea: { enabled: true } }, // 启用广域 DNS-SD 发布
}
```

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

一次性 DNS 服务器设置（Gateway 网关主机）

复制

```
openclaw dns setup --apply
```

这会安装 CoreDNS 并配置它：

-   仅在 Gateway 网关的 Tailscale 接口上监听 53 端口
-   从 `~/.openclaw/dns/<domain>.db` 提供你选择的域名服务（示例：`openclaw.internal.`）

从 Tailnet 连接的机器上验证：

复制

```
dns-sd -B _openclaw-gw._tcp openclaw.internal.
dig @<TAILNET_IPV4> -p 53 _openclaw-gw._tcp.openclaw.internal PTR +short
```

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

Tailscale DNS 设置

在 Tailscale 管理控制台中：

-   添加指向 Gateway 网关 Tailnet IP 的名称服务器（UDP/TCP 53）。
-   添加分割 DNS，使你的发现域名使用该名称服务器。

一旦客户端接受 Tailnet DNS，iOS 节点就可以在 你的发现域名中浏览 `_openclaw-gw._tcp`，无需多播。

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

Gateway 网关监听器安全（推荐）

Gateway 网关 WS 端口（默认 `18789`）默认绑定到 loopback。对于局域网/Tailnet 访问，请明确绑定并保持认证启用。 对于仅 Tailnet 的设置：

-   在 `~/.openclaw/openclaw.json` 中设置 `gateway.bind: "tailnet"`。
-   重启 Gateway 网关（或重启 macOS 菜单栏应用）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

什么在广播

只有 Gateway 网关广播 `_openclaw-gw._tcp`。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

服务类型

-   `_openclaw-gw._tcp` — Gateway 网关传输信标（被 macOS/iOS/Android 节点使用）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

TXT 键（非机密提示）

Gateway 网关广播小型非机密提示以方便 UI 流程：

-   `role=gateway`
-   `displayName=<友好名称>`
-   `lanHost=<hostname>.local`
-   `gatewayPort=<port>`（Gateway 网关 WS + HTTP）
-   `gatewayTls=1`（仅当 TLS 启用时）
-   `gatewayTlsSha256=<sha256>`（仅当 TLS 启用且指纹可用时）
-   `canvasPort=<port>`（仅当画布主机启用时；默认 `18793`）
-   `sshPort=<port>`（未覆盖时默认为 22）
-   `transport=gateway`
-   `cliPath=<path>`（可选；可运行的 `openclaw` 入口点的绝对路径）
-   `tailnetDns=<magicdns>`（当 Tailnet 可用时的可选提示）

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

在 macOS 上调试

有用的内置工具：

-   浏览实例：
    
    复制
    
    ```
    dns-sd -B _openclaw-gw._tcp local.
    ```
    
-   解析单个实例（替换 `<instance>`）：
    
    复制
    
    ```
    dns-sd -L "<instance>" _openclaw-gw._tcp local.
    ```
    

如果浏览有效但解析失败，你通常遇到的是局域网策略或 mDNS 解析器问题。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

在 Gateway 网关日志中调试

Gateway 网关会写入滚动日志文件（启动时打印为 `gateway log file: ...`）。查找 `bonjour:` 行，特别是：

-   `bonjour: advertise failed ...`
-   `bonjour: ... name conflict resolved` / `hostname conflict resolved`
-   `bonjour: watchdog detected non-announced service ...`

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

在 iOS 节点上调试

iOS 节点使用 `NWBrowser` 来发现 `_openclaw-gw._tcp`。 要捕获日志：

-   设置 → Gateway 网关 → 高级 → **Discovery Debug Logs**
-   设置 → Gateway 网关 → 高级 → **Discovery Logs** → 复现 → **Copy**

日志包括浏览器状态转换和结果集变化。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

常见故障模式

-   **Bonjour 不能跨网络**：使用 Tailnet 或 SSH。
-   **多播被阻止**：某些 Wi‑Fi 网络禁用 mDNS。
-   **休眠 / 接口变动**：macOS 可能暂时丢弃 mDNS 结果；重试。
-   **浏览有效但解析失败**：保持机器名称简单（避免表情符号或 标点符号），然后重启 Gateway 网关。服务实例名称源自 主机名，因此过于复杂的名称可能会混淆某些解析器。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

转义的实例名称（`\032`）

Bonjour/DNS‑SD 经常将服务实例名称中的字节转义为十进制 `\DDD` 序列（例如空格变成 `\032`）。

-   这在协议级别是正常的。
-   UI 应该解码以进行显示（iOS 使用 `BonjourEscapes.decode`）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

禁用 / 配置

-   `OPENCLAW_DISABLE_BONJOUR=1` 禁用广播（旧版：`OPENCLAW_DISABLE_BONJOUR`）。
-   `~/.openclaw/openclaw.json` 中的 `gateway.bind` 控制 Gateway 网关绑定模式。
-   `OPENCLAW_SSH_PORT` 覆盖 TXT 中广播的 SSH 端口（旧版：`OPENCLAW_SSH_PORT`）。
-   `OPENCLAW_TAILNET_DNS` 在 TXT 中发布 MagicDNS 提示（旧版：`OPENCLAW_TAILNET_DNS`）。
-   `OPENCLAW_CLI_PATH` 覆盖广播的 CLI 路径（旧版：`OPENCLAW_CLI_PATH`）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/bonjour)

相关文档

-   设备发现策略和传输选择：[设备发现](https://docs.openclaw.ai/gateway/discovery)
-   节点配对 + 批准：[Gateway 网关配对](https://docs.openclaw.ai/gateway/pairing)

[设备发现 + 传输协议](https://docs.openclaw.ai/zh-CN/gateway/discovery)[远程访问](https://docs.openclaw.ai/zh-CN/gateway/remote)

⌘I
