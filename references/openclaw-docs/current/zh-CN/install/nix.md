<!-- Source: https://docs.openclaw.ai/zh-CN/install/nix -->
<!-- Title: Nix - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/install/nix)

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

##### 安装概览

-   [
    
    安装
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install)
-   [
    
    安装器内部机制
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/installer)

##### 安装方式

-   [
    
    Docker
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/docker)
-   [
    
    Nix
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/nix)
-   [
    
    Ansible
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [
    
    Bun（实验性）
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/bun)

##### 维护

-   [
    
    更新
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/updating)
-   [
    
    迁移指南
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/migrating)
-   [
    
    卸载
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/uninstall)

##### 托管与部署

-   [
    
    VPS 托管
    
    
    
    ](https://docs.openclaw.ai/zh-CN/vps)
-   [
    
    Fly.io
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/fly)
-   [
    
    Hetzner
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [
    
    GCP
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/gcp)
-   [
    
    macOS VM
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/macos-vm)
-   [
    
    exe.dev
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/exe-dev)
-   [
    
    在 Railway 上部署
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/railway)
-   [
    
    在 Render 上部署
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/render)
-   [
    
    在 Northflank 上部署
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/northflank)

##### 高级

-   [
    
    开发渠道
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/development-channels)

-   [Nix 安装](https://docs.openclaw.ai/zh-CN/install/nix)
-   [快速开始](https://docs.openclaw.ai/zh-CN/install/nix)
-   [你将获得](https://docs.openclaw.ai/zh-CN/install/nix)
-   [Nix 模式运行时行为](https://docs.openclaw.ai/zh-CN/install/nix)
-   [配置 + 状态路径](https://docs.openclaw.ai/zh-CN/install/nix)
-   [Nix 模式下的运行时行为](https://docs.openclaw.ai/zh-CN/install/nix)
-   [打包注意事项（macOS）](https://docs.openclaw.ai/zh-CN/install/nix)
-   [相关内容](https://docs.openclaw.ai/zh-CN/install/nix)

安装方式

# Nix

# 

[​

](https://docs.openclaw.ai/zh-CN/install/nix)

Nix 安装

使用 Nix 运行 OpenClaw 的推荐方式是通过 **[nix-openclaw](https://github.com/openclaw/nix-openclaw)** — 一个开箱即用的 Home Manager 模块。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/nix)

快速开始

将此粘贴给你的 AI 智能体（Claude、Cursor 等）：

复制

```
I want to set up nix-openclaw on my Mac.
Repository: github:openclaw/nix-openclaw

What I need you to do:
1. Check if Determinate Nix is installed (if not, install it)
2. Create a local flake at ~/code/openclaw-local using templates/agent-first/flake.nix
3. Help me create a Telegram bot (@BotFather) and get my chat ID (@userinfobot)
4. Set up secrets (bot token, Anthropic key) - plain files at ~/.secrets/ is fine
5. Fill in the template placeholders and run home-manager switch
6. Verify: launchd running, bot responds to messages

Reference the nix-openclaw README for module options.
```

> **📦 完整指南：[github.com/openclaw/nix-openclaw](https://github.com/openclaw/nix-openclaw)** nix-openclaw 仓库是 Nix 安装的权威来源。本页只是一个快速概述。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/nix)

你将获得

-   Gateway 网关 + macOS 应用 + 工具（whisper、spotify、cameras）— 全部固定版本
-   重启后仍能运行的 Launchd 服务
-   带有声明式配置的插件系统
-   即时回滚：`home-manager switch --rollback`

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/nix)

Nix 模式运行时行为

当设置 `OPENCLAW_NIX_MODE=1` 时（nix-openclaw 会自动设置）： OpenClaw 支持 **Nix 模式**，使配置确定性并禁用自动安装流程。 通过导出以下环境变量启用：

复制

```
OPENCLAW_NIX_MODE=1
```

在 macOS 上，GUI 应用不会自动继承 shell 环境变量。你也可以通过 defaults 启用 Nix 模式：

复制

```
defaults write bot.molt.mac openclaw.nixMode -bool true
```

### 

[​

](https://docs.openclaw.ai/zh-CN/install/nix)

配置 + 状态路径

OpenClaw 从 `OPENCLAW_CONFIG_PATH` 读取 JSON5 配置，并将可变数据存储在 `OPENCLAW_STATE_DIR` 中。

-   `OPENCLAW_STATE_DIR`（默认：`~/.openclaw`）
-   `OPENCLAW_CONFIG_PATH`（默认：`$OPENCLAW_STATE_DIR/openclaw.json`）

在 Nix 下运行时，将这些显式设置为 Nix 管理的位置，以便运行时状态和配置不会进入不可变存储。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/nix)

Nix 模式下的运行时行为

-   自动安装和自我修改流程被禁用
-   缺失的依赖会显示 Nix 特定的修复消息
-   存在时 UI 会显示只读 Nix 模式横幅

## 

[​

](https://docs.openclaw.ai/zh-CN/install/nix)

打包注意事项（macOS）

macOS 打包流程期望在以下位置有一个稳定的 Info.plist 模板：

复制

```
apps/macos/Sources/OpenClaw/Resources/Info.plist
```

[`scripts/package-mac-app.sh`](https://github.com/openclaw/openclaw/blob/main/scripts/package-mac-app.sh) 将此模板复制到应用包中并修补动态字段（bundle ID、版本/构建号、Git SHA、Sparkle 密钥）。这使 plist 对于 SwiftPM 打包和 Nix 构建保持确定性（它们不依赖完整的 Xcode 工具链）。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/nix)

相关内容

-   [nix-openclaw](https://github.com/openclaw/nix-openclaw) — 完整设置指南
-   [向导](https://docs.openclaw.ai/start/wizard) — 非 Nix CLI 设置
-   [Docker](https://docs.openclaw.ai/install/docker) — 容器化设置

[Docker](https://docs.openclaw.ai/zh-CN/install/docker)[Ansible](https://docs.openclaw.ai/zh-CN/install/ansible)

⌘I
