<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/linux -->
<!-- Title: Linux 应用 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/linux)

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

-   [Linux 应用](https://docs.openclaw.ai/zh-CN/platforms/linux)
-   [面向初学者的快速路径（VPS）](https://docs.openclaw.ai/zh-CN/platforms/linux)
-   [安装](https://docs.openclaw.ai/zh-CN/platforms/linux)
-   [Gateway 网关](https://docs.openclaw.ai/zh-CN/platforms/linux)
-   [Gateway 网关服务安装（CLI）](https://docs.openclaw.ai/zh-CN/platforms/linux)
-   [系统控制（systemd 用户单元）](https://docs.openclaw.ai/zh-CN/platforms/linux)

平台概览

# Linux 应用

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/linux)

Linux 应用

Gateway 网关在 Linux 上得到完全支持。**Node 是推荐的运行时**。 不建议将 Bun 用于 Gateway 网关（存在 WhatsApp/Telegram bug）。 原生 Linux 配套应用已在规划中。如果你想帮助构建一个，欢迎贡献。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/linux)

面向初学者的快速路径（VPS）

1.  安装 Node 24（推荐；Node 22 LTS，目前 `22.16+`，为了兼容性仍然可用）
2.  `npm i -g openclaw@latest`
3.  `openclaw onboard --install-daemon`
4.  在你的笔记本电脑上运行：`ssh -N -L 18789:127.0.0.1:18789 <user>@<host>`
5.  打开 `http://127.0.0.1:18789/` 并粘贴你的令牌

分步 VPS 指南：[exe.dev](https://docs.openclaw.ai/install/exe-dev)

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/linux)

安装

-   [入门指南](https://docs.openclaw.ai/start/getting-started)
-   [安装与更新](https://docs.openclaw.ai/install/updating)
-   可选流程：[Bun（实验性）](https://docs.openclaw.ai/install/bun)、[Nix](https://docs.openclaw.ai/install/nix)、[Docker](https://docs.openclaw.ai/install/docker)

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/linux)

Gateway 网关

-   [Gateway 网关运行手册](https://docs.openclaw.ai/gateway)
-   [配置](https://docs.openclaw.ai/gateway/configuration)

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/linux)

Gateway 网关服务安装（CLI）

使用以下任一方式：

复制

```
openclaw onboard --install-daemon
```

或者：

复制

```
openclaw gateway install
```

或者：

复制

```
openclaw configure
```

出现提示时，选择 **Gateway 服务**。 修复/迁移：

复制

```
openclaw doctor
```

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/linux)

系统控制（systemd 用户单元）

OpenClaw 默认安装 systemd **用户**服务。对于共享或始终在线的服务器，请使用 **系统** 服务。完整的单元示例和指导 请参见 [Gateway 网关运行手册](https://docs.openclaw.ai/gateway)。 最小设置： 创建 `~/.config/systemd/user/openclaw-gateway[-<profile>].service`：

复制

```
[Unit]
Description=OpenClaw Gateway (profile: <profile>, v<version>)
After=network-online.target
Wants=network-online.target

[Service]
ExecStart=/usr/local/bin/openclaw gateway --port 18789
Restart=always
RestartSec=5

[Install]
WantedBy=default.target
```

启用它：

复制

```
systemctl --user enable --now openclaw-gateway[-<profile>].service
```

[macOS 应用](https://docs.openclaw.ai/zh-CN/platforms/macos)[Windows（WSL2）](https://docs.openclaw.ai/zh-CN/platforms/windows)

⌘I
