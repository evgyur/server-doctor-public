<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/mac/xpc -->
<!-- Title: macOS IPC - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)

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

-   [OpenClaw macOS IPC 架构](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)
-   [目标](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)
-   [工作原理](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)
-   [Gateway 网关 + 节点传输](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)
-   [节点服务 + 应用 IPC](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)
-   [PeekabooBridge（UI 自动化）](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)
-   [操作流程](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)
-   [加固注意事项](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)

macOS 配套应用

# macOS IPC

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)

OpenClaw macOS IPC 架构

**当前模型：** 一个本地 Unix 套接字将**节点主机服务**连接到 **macOS 应用**，用于 exec 审批 + `system.run`。存在一个 `openclaw-mac` 调试 CLI 用于发现/连接检查；智能体操作仍通过 Gateway 网关 WebSocket 和 `node.invoke` 流转。UI 自动化使用 PeekabooBridge。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)

目标

-   单个 GUI 应用实例拥有所有面向 TCC 的工作（通知、屏幕录制、麦克风、语音、AppleScript）。
-   小型自动化接口：Gateway 网关 + 节点命令，加上用于 UI 自动化的 PeekabooBridge。
-   可预测的权限：始终是同一个签名的 bundle ID，由 launchd 启动，因此 TCC 授权保持有效。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)

工作原理

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)

Gateway 网关 + 节点传输

-   应用运行 Gateway 网关（本地模式）并作为节点连接到它。
-   智能体操作通过 `node.invoke` 执行（例如 `system.run`、`system.notify`、`canvas.*`）。

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)

节点服务 + 应用 IPC

-   一个无头节点主机服务连接到 Gateway 网关 WebSocket。
-   `system.run` 请求通过本地 Unix 套接字转发到 macOS 应用。
-   应用在 UI 上下文中执行 exec，必要时提示，并返回输出。

图示（SCI）：

复制

```
Agent -> Gateway -> Node Service (WS)
                      |  IPC (UDS + token + HMAC + TTL)
                      v
                  Mac App (UI + TCC + system.run)
```

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)

PeekabooBridge（UI 自动化）

-   UI 自动化使用名为 `bridge.sock` 的单独 UNIX 套接字和 PeekabooBridge JSON 协议。
-   主机优先顺序（客户端侧）：Peekaboo.app → Claude.app → OpenClaw.app → 本地执行。
-   安全性：桥接主机需要允许的 TeamID；仅 DEBUG 的同 UID 逃逸通道由 `PEEKABOO_ALLOW_UNSIGNED_SOCKET_CLIENTS=1` 保护（Peekaboo 约定）。
-   参见：[PeekabooBridge 用法](https://docs.openclaw.ai/platforms/mac/peekaboo)了解详情。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)

操作流程

-   重启/重建：`SIGN_IDENTITY="Apple Development: <Developer Name> (<TEAMID>)" scripts/restart-mac.sh`
    -   终止现有实例
    -   Swift 构建 + 打包
    -   写入/引导/启动 LaunchAgent
-   单实例：如果具有相同 bundle ID 的另一个实例正在运行，应用会提前退出。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)

加固注意事项

-   优先要求所有特权接口的 TeamID 匹配。
-   PeekabooBridge：`PEEKABOO_ALLOW_UNSIGNED_SOCKET_CLIENTS=1`（仅 DEBUG）可能允许同 UID 调用者用于本地开发。
-   所有通信仅保持本地；不暴露网络套接字。
-   TCC 提示仅源自 GUI 应用包；在重建时保持签名的 bundle ID 稳定。
-   IPC 加固：套接字模式 `0600`、令牌、对等 UID 检查、HMAC 质询/响应、短 TTL。

[macOS 上的 Gateway 网关](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)[Skills](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)

⌘I
