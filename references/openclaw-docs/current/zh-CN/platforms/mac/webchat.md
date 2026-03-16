<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/mac/webchat -->
<!-- Title: WebChat - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)

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

-   [WebChat（macOS 应用）](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)
-   [启动和调试](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)
-   [工作原理](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)
-   [安全面](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)
-   [已知限制](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)

macOS 配套应用

# WebChat

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)

WebChat（macOS 应用）

macOS 菜单栏应用将 WebChat UI 嵌入为原生 SwiftUI 视图。它连接到 Gateway 网关，默认使用所选智能体的**主会话**（带有会话切换器用于其他会话）。

-   **本地模式**：直接连接到本地 Gateway 网关 WebSocket。
-   **远程模式**：通过 SSH 转发 Gateway 网关控制端口，并使用该隧道作为数据平面。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)

启动和调试

-   手动：Lobster 菜单 → “Open Chat”。
-   测试时自动打开：
    
    复制
    
    ```
    dist/OpenClaw.app/Contents/MacOS/OpenClaw --webchat
    ```
    
-   日志：`./scripts/clawlog.sh`（子系统 `bot.molt`，类别 `WebChatSwiftUI`）。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)

工作原理

-   数据平面：Gateway 网关 WS 方法 `chat.history`、`chat.send`、`chat.abort`、`chat.inject` 和事件 `chat`、`agent`、`presence`、`tick`、`health`。
-   会话：默认为主会话（`main`，或当范围为全局时为 `global`）。UI 可以在会话之间切换。
-   新手引导使用专用会话，以将首次运行设置分开。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)

安全面

-   远程模式仅通过 SSH 转发 Gateway 网关 WebSocket 控制端口。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)

已知限制

-   UI 针对聊天会话优化（不是完整的浏览器沙箱）。

[语音浮层](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)[Canvas](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)

⌘I
