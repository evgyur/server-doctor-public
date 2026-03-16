<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme -->
<!-- Title: 远程 Gateway 网关设置 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

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

-   [使用远程 Gateway 网关运行 OpenClaw.app](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [概述](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [快速设置](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [步骤 1：添加 SSH 配置](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [步骤 2：复制 SSH 密钥](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [步骤 3：设置 Gateway 网关令牌](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [步骤 4：启动 SSH 隧道](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [步骤 5：重启 OpenClaw.app](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [登录时自动启动隧道](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [创建 PLIST 文件](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [加载 Launch Agent](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [故障排除](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [工作原理](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

远程访问

# 远程 Gateway 网关设置

# 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

使用远程 Gateway 网关运行 OpenClaw.app

OpenClaw.app 使用 SSH 隧道连接到远程 Gateway 网关。本指南向你展示如何设置。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

概述

复制

```
┌─────────────────────────────────────────────────────────────┐
│                        Client Machine                          │
│                                                              │
│  OpenClaw.app ──► ws://127.0.0.1:18789 (local port)           │
│                     │                                        │
│                     ▼                                        │
│  SSH Tunnel ────────────────────────────────────────────────│
│                     │                                        │
└─────────────────────┼──────────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────────────────┐
│                         Remote Machine                        │
│                                                              │
│  Gateway WebSocket ──► ws://127.0.0.1:18789 ──►              │
│                                                              │
└─────────────────────────────────────────────────────────────┘
```

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

快速设置

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

步骤 1：添加 SSH 配置

编辑 `~/.ssh/config` 并添加：

复制

```
Host remote-gateway
    HostName <REMOTE_IP>          # e.g., 172.27.187.184
    User <REMOTE_USER>            # e.g., jefferson
    LocalForward 18789 127.0.0.1:18789
    IdentityFile ~/.ssh/id_rsa
```

将 `<REMOTE_IP>` 和 `<REMOTE_USER>` 替换为你的值。

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

步骤 2：复制 SSH 密钥

将你的公钥复制到远程机器（输入一次密码）：

复制

```
ssh-copy-id -i ~/.ssh/id_rsa <REMOTE_USER>@<REMOTE_IP>
```

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

步骤 3：设置 Gateway 网关令牌

复制

```
launchctl setenv OPENCLAW_GATEWAY_TOKEN "<your-token>"
```

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

步骤 4：启动 SSH 隧道

复制

```
ssh -N remote-gateway &
```

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

步骤 5：重启 OpenClaw.app

复制

```
# Quit OpenClaw.app (⌘Q), then reopen:
open /path/to/OpenClaw.app
```

应用现在将通过 SSH 隧道连接到远程 Gateway 网关。

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

登录时自动启动隧道

要在登录时自动启动 SSH 隧道，请创建一个 Launch Agent。

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

创建 PLIST 文件

将此保存为 `~/Library/LaunchAgents/bot.molt.ssh-tunnel.plist`：

复制

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>bot.molt.ssh-tunnel</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/ssh</string>
        <string>-N</string>
        <string>remote-gateway</string>
    </array>
    <key>KeepAlive</key>
    <true/>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
```

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

加载 Launch Agent

复制

```
launchctl bootstrap gui/$UID ~/Library/LaunchAgents/bot.molt.ssh-tunnel.plist
```

隧道现在将：

-   登录时自动启动
-   崩溃时重新启动
-   在后台持续运行

旧版注意事项：如果存在任何遗留的 `com.openclaw.ssh-tunnel` LaunchAgent，请将其删除。

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

故障排除

**检查隧道是否正在运行：**

复制

```
ps aux | grep "ssh -N remote-gateway" | grep -v grep
lsof -i :18789
```

**重启隧道：**

复制

```
launchctl kickstart -k gui/$UID/bot.molt.ssh-tunnel
```

**停止隧道：**

复制

```
launchctl bootout gui/$UID/bot.molt.ssh-tunnel
```

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)

工作原理

| 组件 | 功能 |
| --- | --- |
| `LocalForward 18789 127.0.0.1:18789` | 将本地端口 18789 转发到远程端口 18789 |
| `ssh -N` | SSH 不执行远程命令（仅端口转发） |
| `KeepAlive` | 隧道崩溃时自动重启 |
| `RunAtLoad` | 代理加载时启动隧道 |

OpenClaw.app 连接到你的客户端机器上的 `ws://127.0.0.1:18789`。SSH 隧道将该连接转发到运行 Gateway 网关的远程机器的端口 18789。

[远程访问](https://docs.openclaw.ai/zh-CN/gateway/remote)[Tailscale](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

⌘I
