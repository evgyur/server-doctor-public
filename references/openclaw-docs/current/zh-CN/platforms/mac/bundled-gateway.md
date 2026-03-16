<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway -->
<!-- Title: macOS 上的 Gateway 网关 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)

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

##### 平台概览

-   [
    
    平台
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms)
-   [
    
    macOS 应用
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/macos)
-   [
    
    Linux 应用
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/linux)
-   [
    
    Windows（WSL2）
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/windows)
-   [
    
    Android 应用
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/android)
-   [
    
    iOS 应用
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/ios)
-   [
    
    DigitalOcean
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/digitalocean)
-   [
    
    Oracle Cloud
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/oracle)
-   [
    
    Raspberry Pi
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/raspberry-pi)

##### macOS 配套应用

-   [
    
    macOS 开发设置
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)
-   [
    
    菜单栏
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)
-   [
    
    语音唤醒
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/voicewake)
-   [
    
    语音浮层
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)
-   [
    
    WebChat
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)
-   [
    
    Canvas
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)
-   [
    
    Gateway 网关生命周期
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)
-   [
    
    健康检查
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/health)
-   [
    
    菜单栏图标
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/icon)
-   [
    
    macOS 日志
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)
-   [
    
    macOS 权限
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/permissions)
-   [
    
    远程控制
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/remote)
-   [
    
    macOS 签名
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/signing)
-   [
    
    macOS 上的 Gateway 网关
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)
-   [
    
    macOS IPC
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)
-   [
    
    Skills
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)
-   [
    
    Peekaboo Bridge
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)

-   [macOS 上的 Gateway 网关（外部 launchd）](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)
-   [安装 CLI（本地模式必需）](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)
-   [Launchd（Gateway 网关作为 LaunchAgent）](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)
-   [版本兼容性](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)
-   [冒烟测试](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)

macOS 配套应用

# macOS 上的 Gateway 网关

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)

macOS 上的 Gateway 网关（外部 launchd）

OpenClaw.app 不再捆绑 Node/Bun 或 Gateway 网关运行时。macOS 应用期望有一个**外部**的 `openclaw` CLI 安装，不会将 Gateway 网关作为子进程启动，而是管理一个每用户的 launchd 服务来保持 Gateway 网关运行（或者如果已有本地 Gateway 网关正在运行，则连接到现有的）。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)

安装 CLI（本地模式必需）

你需要在 Mac 上安装 Node 22+，然后全局安装 `openclaw`：

复制

```
npm install -g openclaw@<version>
```

macOS 应用的**安装 CLI**按钮通过 npm/pnpm 运行相同的流程（不推荐使用 bun 作为 Gateway 网关运行时）。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)

Launchd（Gateway 网关作为 LaunchAgent）

标签：

-   `bot.molt.gateway`（或 `bot.molt.<profile>`；旧版 `com.openclaw.*` 可能仍然存在）

Plist 位置（每用户）：

-   `~/Library/LaunchAgents/bot.molt.gateway.plist` （或 `~/Library/LaunchAgents/bot.molt.<profile>.plist`）

管理者：

-   macOS 应用在本地模式下拥有 LaunchAgent 的安装/更新权限。
-   CLI 也可以安装它：`openclaw gateway install`。

行为：

-   “OpenClaw Active”启用/禁用 LaunchAgent。
-   应用退出**不会**停止 Gateway 网关（launchd 保持其存活）。
-   如果 Gateway 网关已经在配置的端口上运行，应用会连接到它而不是启动新的。

日志：

-   launchd stdout/err：`/tmp/openclaw/openclaw-gateway.log`

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)

版本兼容性

macOS 应用会检查 Gateway 网关版本与其自身版本是否匹配。如果不兼容，请更新全局 CLI 以匹配应用版本。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)

冒烟测试

复制

```
openclaw --version

OPENCLAW_SKIP_CHANNELS=1 \
OPENCLAW_SKIP_CANVAS_HOST=1 \
openclaw gateway --port 18999 --bind loopback
```

然后：

复制

```
openclaw gateway call health --url ws://127.0.0.1:18999 --timeout 3000
```

[macOS 签名](https://docs.openclaw.ai/zh-CN/platforms/mac/signing)[macOS IPC](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)

⌘I
