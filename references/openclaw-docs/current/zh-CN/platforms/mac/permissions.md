<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/mac/permissions -->
<!-- Title: macOS 权限 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/mac/permissions)

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

-   [macOS 权限（TCC）](https://docs.openclaw.ai/zh-CN/platforms/mac/permissions)
-   [稳定权限的要求](https://docs.openclaw.ai/zh-CN/platforms/mac/permissions)
-   [权限提示消失时的恢复清单](https://docs.openclaw.ai/zh-CN/platforms/mac/permissions)

macOS 配套应用

# macOS 权限

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/permissions)

macOS 权限（TCC）

macOS 权限授予是脆弱的。TCC 将权限授予与应用的代码签名、Bundle 标识符和磁盘路径关联。如果其中任何一项发生变化，macOS 会将该应用视为新应用，可能会丢弃或隐藏权限提示。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/permissions)

稳定权限的要求

-   相同路径：从固定位置运行应用（对于 OpenClaw，为 `dist/OpenClaw.app`）。
-   相同 Bundle 标识符：更改 Bundle ID 会创建新的权限身份。
-   已签名的应用：未签名或临时签名的构建不会持久化权限。
-   一致的签名：使用真实的 Apple Development 或 Developer ID 证书，以确保签名在多次构建之间保持稳定。

临时签名每次构建都会生成新的身份。macOS 会忘记之前的授权，提示可能完全消失，直到清除过期条目为止。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/permissions)

权限提示消失时的恢复清单

1.  退出应用。
2.  在系统设置 -> 隐私与安全性中移除该应用条目。
3.  从相同路径重新启动应用并重新授予权限。
4.  如果提示仍未出现，使用 `tccutil` 重置 TCC 条目后重试。
5.  某些权限仅在完全重启 macOS 后才会重新出现。

重置示例（根据需要替换 Bundle ID）：

复制

```
sudo tccutil reset Accessibility bot.molt.mac
sudo tccutil reset ScreenCapture bot.molt.mac
sudo tccutil reset AppleEvents
```

如果你正在测试权限，请始终使用真实证书签名。临时签名的构建仅适用于不需要权限的快速本地运行。

[macOS 日志](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)[远程控制](https://docs.openclaw.ai/zh-CN/platforms/mac/remote)

⌘I
