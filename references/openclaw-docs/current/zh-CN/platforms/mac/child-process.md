<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/mac/child-process -->
<!-- Title: Gateway 网关生命周期 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)

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

-   [macOS 上的 Gateway 网关生命周期](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)
-   [默认行为（launchd）](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)
-   [未签名的开发构建](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)
-   [仅连接模式](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)
-   [远程模式](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)
-   [为什么我们更喜欢 launchd](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)

macOS 配套应用

# Gateway 网关生命周期

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)

macOS 上的 Gateway 网关生命周期

macOS 应用**默认通过 launchd 管理 Gateway 网关**，不会将 Gateway 网关作为子进程生成。它首先尝试连接到配置端口上已运行的 Gateway 网关；如果无法访问，它会通过外部 `openclaw` CLI（无嵌入式运行时）启用 launchd 服务。这为你提供了可靠的登录时自动启动和崩溃后重启。 子进程模式（由应用直接生成 Gateway 网关）**目前未使用**。 如果你需要与 UI 更紧密的耦合，请在终端中手动运行 Gateway 网关。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)

默认行为（launchd）

-   应用安装标记为 `bot.molt.gateway` 的按用户 LaunchAgent （使用 `--profile`/`OPENCLAW_PROFILE` 时为 `bot.molt.<profile>`；支持旧版 `com.openclaw.*`）。
-   当启用本地模式时，应用确保 LaunchAgent 已加载，并 在需要时启动 Gateway 网关。
-   日志写入 launchd Gateway 网关日志路径（在调试设置中可见）。

常用命令：

复制

```
launchctl kickstart -k gui/$UID/bot.molt.gateway
launchctl bootout gui/$UID/bot.molt.gateway
```

运行命名配置文件时，将标签替换为 `bot.molt.<profile>`。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)

未签名的开发构建

`scripts/restart-mac.sh --no-sign` 用于在没有签名密钥时的快速本地构建。为了防止 launchd 指向未签名的中继二进制文件，它：

-   写入 `~/.openclaw/disable-launchagent`。

已签名运行的 `scripts/restart-mac.sh` 会在标记存在时清除此覆盖。要手动重置：

复制

```
rm ~/.openclaw/disable-launchagent
```

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)

仅连接模式

要强制 macOS 应用**永不安装或管理 launchd**，请使用 `--attach-only`（或 `--no-launchd`）启动它。这会设置 `~/.openclaw/disable-launchagent`， 因此应用只会连接到已运行的 Gateway 网关。你可以在调试设置中切换相同的 行为。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)

远程模式

远程模式永远不会启动本地 Gateway 网关。应用使用到 远程主机的 SSH 隧道并通过该隧道连接。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)

为什么我们更喜欢 launchd

-   登录时自动启动。
-   内置的重启/KeepAlive 语义。
-   可预测的日志和监管。

如果将来再次需要真正的子进程模式，它应该被记录为 单独的、明确的仅开发模式。

[Canvas](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)[健康检查](https://docs.openclaw.ai/zh-CN/platforms/mac/health)

⌘I
