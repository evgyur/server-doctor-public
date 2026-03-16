<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup -->
<!-- Title: macOS 开发设置 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)

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

-   [macOS 开发者设置](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)
-   [前置条件](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)
-   [1\. 安装依赖](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)
-   [2\. 构建和打包应用](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)
-   [3\. 安装 CLI](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)
-   [故障排除](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)
-   [构建失败：工具链或 SDK 不匹配](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)
-   [授予权限时应用崩溃](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)
-   [Gateway 网关无限期”Starting…”](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)

macOS 配套应用

# macOS 开发设置

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)

macOS 开发者设置

本指南涵盖从源代码构建和运行 OpenClaw macOS 应用程序的必要步骤。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)

前置条件

在构建应用之前，确保你已安装以下内容：

1.  **Xcode 26.2+**：Swift 开发所需。
2.  **Node.js 22+ & pnpm**：Gateway 网关、CLI 和打包脚本所需。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)

1\. 安装依赖

安装项目范围的依赖：

复制

```
pnpm install
```

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)

2\. 构建和打包应用

要构建 macOS 应用并将其打包到 `dist/OpenClaw.app`，运行：

复制

```
./scripts/package-mac-app.sh
```

如果你没有 Apple Developer ID 证书，脚本将自动使用 **ad-hoc 签名**（`-`）。 有关开发运行模式、签名标志和 Team ID 故障排除，请参阅 macOS 应用 README： [https://github.com/openclaw/openclaw/blob/main/apps/macos/README.md](https://github.com/openclaw/openclaw/blob/main/apps/macos/README.md)

> **注意**：Ad-hoc 签名的应用可能会触发安全提示。如果应用立即崩溃并显示”Abort trap 6”，请参阅[故障排除](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)部分。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)

3\. 安装 CLI

macOS 应用期望全局安装 `openclaw` CLI 来管理后台任务。 **安装方法（推荐）：**

1.  打开 OpenClaw 应用。
2.  转到 **General** 设置标签页。
3.  点击 **“Install CLI”**。

或者，手动安装：

复制

```
npm install -g openclaw@<version>
```

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)

故障排除

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)

构建失败：工具链或 SDK 不匹配

macOS 应用构建期望最新的 macOS SDK 和 Swift 6.2 工具链。 **系统依赖（必需）：**

-   **软件更新中可用的最新 macOS 版本**（Xcode 26.2 SDK 所需）
-   **Xcode 26.2**（Swift 6.2 工具链）

**检查：**

复制

```
xcodebuild -version
xcrun swift --version
```

如果版本不匹配，更新 macOS/Xcode 并重新运行构建。

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)

授予权限时应用崩溃

如果在尝试允许**语音识别**或**麦克风**访问时应用崩溃，可能是由于 TCC 缓存损坏或签名不匹配。 **修复：**

1.  重置 TCC 权限：
    
    复制
    
    ```
    tccutil reset All bot.molt.mac.debug
    ```
    
2.  如果这不起作用，在 [`scripts/package-mac-app.sh`](https://github.com/openclaw/openclaw/blob/main/scripts/package-mac-app.sh) 中临时更改 `BUNDLE_ID` 以强制 macOS 从”全新状态”开始。

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)

Gateway 网关无限期”Starting…”

如果 Gateway 网关状态一直停留在”Starting…”，检查是否有僵尸进程占用端口：

复制

```
openclaw gateway status
openclaw gateway stop

# 如果你没有使用 LaunchAgent（开发模式/手动运行），找到监听器：
lsof -nP -iTCP:18789 -sTCP:LISTEN
```

如果手动运行占用了端口，停止该进程（Ctrl+C）。作为最后手段，杀死你找到的 PID。

[Raspberry Pi](https://docs.openclaw.ai/zh-CN/platforms/raspberry-pi)[菜单栏](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)

⌘I
