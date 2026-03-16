<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar -->
<!-- Title: 菜单栏 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)

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

-   [菜单栏状态逻辑](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)
-   [显示内容](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)
-   [状态模型](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)
-   [IconState 枚举（Swift）](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)
-   [ActivityKind → 图标符号](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)
-   [视觉映射](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)
-   [状态行文本（菜单）](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)
-   [事件接收](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)
-   [调试覆盖](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)
-   [测试清单](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)

macOS 配套应用

# 菜单栏

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)

菜单栏状态逻辑

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)

显示内容

-   我们在菜单栏图标和菜单的第一行状态行中展示当前智能体的工作状态。
-   工作活跃时隐藏健康状态；当所有会话空闲时恢复显示。
-   菜单中的”节点”区块仅列出**设备**（通过 `node.list` 配对的节点），不包括客户端/在线状态条目。
-   当提供商用量快照可用时，“用量”部分会显示在上下文下方。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)

状态模型

-   会话：事件携带 `runId`（每次运行）以及载荷中的 `sessionKey`。“main” 会话的键为 `main`；如果不存在，则回退到最近更新的会话。
-   优先级：main 始终优先。如果 main 处于活跃状态，立即显示其状态。如果 main 空闲，则显示最近活跃的非 main 会话。活动进行中不会来回切换；仅在当前会话进入空闲或 main 变为活跃时才切换。
-   活动类型：
    -   `job`：高层命令执行（`state: started|streaming|done|error`）。
    -   `tool`：`phase: start|result`，包含 `toolName` 和 `meta/args`。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)

IconState 枚举（Swift）

-   `idle`
-   `workingMain(ActivityKind)`
-   `workingOther(ActivityKind)`
-   `overridden(ActivityKind)`（调试覆盖）

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)

ActivityKind → 图标符号

-   `exec` → 💻
-   `read` → 📄
-   `write` → ✍️
-   `edit` → 📝
-   `attach` → 📎
-   默认 → 🛠️

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)

视觉映射

-   `idle`：正常小动物图标。
-   `workingMain`：带图标符号的徽章，完整色调，腿部”工作”动画。
-   `workingOther`：带图标符号的徽章，柔和色调，无快跑动画。
-   `overridden`：无论活动状态如何，使用所选的图标符号/色调。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)

状态行文本（菜单）

-   工作活跃时：`<会话角色> · <活动标签>`
    -   示例：`Main · exec: pnpm test`、`Other · read: apps/macos/Sources/OpenClaw/AppState.swift`。
-   空闲时：回退显示健康摘要。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)

事件接收

-   来源：控制渠道 `agent` 事件（`ControlChannel.handleAgentEvent`）。
-   解析字段：
    -   `stream: "job"`，包含 `data.state` 用于启动/停止。
    -   `stream: "tool"`，包含 `data.phase`、`name`，可选 `meta`/`args`。
-   标签：
    -   `exec`：`args.command` 的第一行。
    -   `read`/`write`：缩短的路径。
    -   `edit`：路径加上从 `meta`/diff 计数推断的变更类型。
    -   回退：工具名称。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)

调试覆盖

-   设置 ▸ 调试 ▸ “图标覆盖” 选择器：
    -   `系统（自动）`（默认）
    -   `工作中：main`（按工具类型）
    -   `工作中：other`（按工具类型）
    -   `空闲`
-   通过 `@AppStorage("iconOverride")` 存储；映射到 `IconState.overridden`。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)

测试清单

-   触发 main 会话任务：验证图标立即切换且状态行显示 main 标签。
-   main 空闲时触发非 main 会话任务：图标/状态显示非 main；保持稳定直到完成。
-   在 other 活跃时启动 main：图标立即切换到 main。
-   快速连续工具调用：确保徽章不会闪烁（工具结果的 TTL 宽限期）。
-   所有会话空闲后健康行重新出现。

[macOS 开发设置](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)[语音唤醒](https://docs.openclaw.ai/zh-CN/platforms/mac/voicewake)

⌘I
