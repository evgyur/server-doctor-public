<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/mac/skills -->
<!-- Title: Skills - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)

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

-   [Skills（macOS）](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)
-   [数据来源](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)
-   [安装操作](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)
-   [环境变量/API 密钥](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)
-   [远程模式](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)

macOS 配套应用

# Skills

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)

Skills（macOS）

macOS 应用通过 Gateway 网关展示 OpenClaw Skills；它不会在本地解析 Skills。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)

数据来源

-   `skills.status`（Gateway 网关）返回所有 Skills 以及资格和缺失的要求 （包括内置 Skills 的允许列表阻止情况）。
-   要求来源于每个 `SKILL.md` 中的 `metadata.openclaw.requires`。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)

安装操作

-   `metadata.openclaw.install` 定义安装选项（brew/node/go/uv）。
-   应用调用 `skills.install` 在 Gateway 网关主机上运行安装器。
-   当提供多个安装器时，Gateway 网关仅展示一个首选安装器 （如果可用则使用 brew，否则使用来自 `skills.install` 的 node 管理器，默认 npm）。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)

环境变量/API 密钥

-   应用将密钥存储在 `~/.openclaw/openclaw.json` 的 `skills.entries.<skillKey>` 下。
-   `skills.update` 更新 `enabled`、`apiKey` 和 `env`。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)

远程模式

-   安装 + 配置更新发生在 Gateway 网关主机上（不是本地 Mac）。

[macOS IPC](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)[Peekaboo Bridge](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)

⌘I
