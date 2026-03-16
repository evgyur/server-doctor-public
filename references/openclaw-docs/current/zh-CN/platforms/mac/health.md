<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/mac/health -->
<!-- Title: 健康检查 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/mac/health)

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

-   [macOS 上的健康检查](https://docs.openclaw.ai/zh-CN/platforms/mac/health)
-   [菜单栏](https://docs.openclaw.ai/zh-CN/platforms/mac/health)
-   [设置](https://docs.openclaw.ai/zh-CN/platforms/mac/health)
-   [探测工作原理](https://docs.openclaw.ai/zh-CN/platforms/mac/health)
-   [有疑问时](https://docs.openclaw.ai/zh-CN/platforms/mac/health)

macOS 配套应用

# 健康检查

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/health)

macOS 上的健康检查

如何从菜单栏应用查看关联渠道是否健康。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/health)

菜单栏

-   状态圆点现在反映 Baileys 健康状态：
    -   绿色：已关联 + socket 最近已打开。
    -   橙色：正在连接/重试。
    -   红色：已登出或探测失败。
-   第二行显示”linked · auth 12m”或显示失败原因。
-   “Run Health Check”菜单项触发按需探测。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/health)

设置

-   通用选项卡新增健康卡片，显示：关联认证时间、会话存储路径/数量、上次检查时间、上次错误/状态码，以及运行健康检查/显示日志按钮。
-   使用缓存快照，因此 UI 立即加载，离线时优雅降级。
-   **渠道选项卡**显示渠道状态 + WhatsApp/Telegram 的控制（登录二维码、登出、探测、上次断开/错误）。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/health)

探测工作原理

-   应用每约 60 秒和按需时通过 `ShellExecutor` 运行 `openclaw health --json`。探测加载凭证并报告状态，不发送消息。
-   分别缓存上次成功的快照和上次错误以避免闪烁；显示每个的时间戳。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/health)

有疑问时

-   你仍然可以使用 [Gateway 网关健康](https://docs.openclaw.ai/gateway/health) 中的 CLI 流程（`openclaw status`、`openclaw status --deep`、`openclaw health --json`），并在 `/tmp/openclaw/openclaw-*.log` 中跟踪 `web-heartbeat` / `web-reconnect`。

[Gateway 网关生命周期](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)[菜单栏图标](https://docs.openclaw.ai/zh-CN/platforms/mac/icon)

⌘I
