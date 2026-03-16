<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo -->
<!-- Title: Peekaboo Bridge - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)

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

-   [Peekaboo Bridge（macOS UI 自动化）](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)
-   [这是什么（以及不是什么）](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)
-   [启用桥接](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)
-   [客户端发现顺序](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)
-   [安全与权限](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)
-   [快照行为（自动化）](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)
-   [故障排除](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)

macOS 配套应用

# Peekaboo Bridge

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)

Peekaboo Bridge（macOS UI 自动化）

OpenClaw 可以将 **PeekabooBridge** 作为本地的、权限感知的 UI 自动化代理进行托管。这使得 `peekaboo` CLI 能够驱动 UI 自动化，同时复用 macOS 应用的 TCC 权限。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)

这是什么（以及不是什么）

-   **宿主**：OpenClaw.app 可以作为 PeekabooBridge 宿主。
-   **客户端**：使用 `peekaboo` CLI（无需单独的 `openclaw ui ...` 界面）。
-   **界面**：视觉叠加层保留在 Peekaboo.app 中；OpenClaw 只是一个轻量代理宿主。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)

启用桥接

在 macOS 应用中：

-   设置 → **启用 Peekaboo Bridge**

启用后，OpenClaw 会启动一个本地 UNIX 套接字服务器。如果禁用，宿主会停止，`peekaboo` 将回退到其他可用宿主。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)

客户端发现顺序

Peekaboo 客户端通常按以下顺序尝试宿主：

1.  Peekaboo.app（完整用户体验）
2.  Claude.app（如已安装）
3.  OpenClaw.app（轻量代理）

使用 `peekaboo bridge status --verbose` 查看当前活跃的宿主及使用的套接字路径。你可以通过以下方式覆盖：

复制

```
export PEEKABOO_BRIDGE_SOCKET=/path/to/bridge.sock
```

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)

安全与权限

-   桥接会验证**调用方的代码签名**；强制执行 TeamID 白名单（Peekaboo 宿主 TeamID + OpenClaw 应用 TeamID）。
-   请求在约 10 秒后超时。
-   如果缺少所需权限，桥接会返回清晰的错误信息，而不是启动系统设置。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)

快照行为（自动化）

快照存储在内存中，并在短暂窗口期后自动过期。如果需要更长的保留时间，请从客户端重新捕获。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)

故障排除

-   如果 `peekaboo` 报告”bridge client is not authorized”，请确保客户端已正确签名，或仅在**调试**模式下使用 `PEEKABOO_ALLOW_UNSIGNED_SOCKET_CLIENTS=1` 运行宿主。
-   如果未找到宿主，请打开其中一个宿主应用（Peekaboo.app 或 OpenClaw.app）并确认已授予权限。

[Skills](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)

⌘I
