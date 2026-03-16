<!-- Source: https://docs.openclaw.ai/zh-CN/install/northflank -->
<!-- Title: 在 Northflank 上部署 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/install/northflank)

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

-   [如何开始](https://docs.openclaw.ai/zh-CN/install/northflank)
-   [你将获得](https://docs.openclaw.ai/zh-CN/install/northflank)
-   [设置流程](https://docs.openclaw.ai/zh-CN/install/northflank)
-   [获取聊天令牌](https://docs.openclaw.ai/zh-CN/install/northflank)
-   [Telegram 机器人令牌](https://docs.openclaw.ai/zh-CN/install/northflank)
-   [Discord 机器人令牌](https://docs.openclaw.ai/zh-CN/install/northflank)

托管与部署

# 在 Northflank 上部署

通过一键模板在 Northflank 上部署 OpenClaw，然后在浏览器中完成设置。 这是最简单的”无需在服务器上使用终端”的方式：Northflank 为你运行 Gateway网关， 你通过 `/setup` 网页向导配置一切。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/northflank)

如何开始

1.  点击 [Deploy OpenClaw](https://northflank.com/stacks/deploy-openclaw) 打开模板。
2.  如果你还没有账户，请创建一个 [Northflank 账户](https://app.northflank.com/signup)。
3.  点击 **Deploy OpenClaw now**。
4.  设置必需的环境变量：`SETUP_PASSWORD`。
5.  点击 **Deploy stack** 构建并运行 OpenClaw 模板。
6.  等待部署完成，然后点击 **View resources**。
7.  打开 OpenClaw 服务。
8.  打开公开的 OpenClaw URL，在 `/setup` 完成设置。
9.  在 `/openclaw` 打开控制面板 UI。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/northflank)

你将获得

-   托管的 OpenClaw Gateway网关 + 控制面板 UI
-   `/setup` 处的网页设置向导（无需终端命令）
-   通过 Northflank Volume（`/data`）实现持久化存储，配置/凭据/工作区在重新部署后不会丢失

## 

[​

](https://docs.openclaw.ai/zh-CN/install/northflank)

设置流程

1.  访问 `https://<your-northflank-domain>/setup` 并输入你的 `SETUP_PASSWORD`。
2.  选择模型/认证提供商并粘贴你的密钥。
3.  （可选）添加 Telegram/Discord/Slack 令牌。
4.  点击 **Run setup**。
5.  在 `https://<your-northflank-domain>/openclaw` 打开控制面板 UI。

如果 Telegram 私信设置为配对模式，设置向导可以审批配对码。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/northflank)

获取聊天令牌

### 

[​

](https://docs.openclaw.ai/zh-CN/install/northflank)

Telegram 机器人令牌

1.  在 Telegram 中给 `@BotFather` 发消息
2.  运行 `/newbot`
3.  复制令牌（格式如 `123456789:AA...`）
4.  将其粘贴到 `/setup` 中

### 

[​

](https://docs.openclaw.ai/zh-CN/install/northflank)

Discord 机器人令牌

1.  前往 [https://discord.com/developers/applications](https://discord.com/developers/applications)
2.  **New Application** → 选择一个名称
3.  **Bot** → **Add Bot**
4.  在 Bot → Privileged Gateway Intents 下**启用 MESSAGE CONTENT INTENT**（必需，否则机器人启动时会崩溃）
5.  复制 **Bot Token** 并粘贴到 `/setup` 中
6.  邀请机器人加入你的服务器（OAuth2 URL Generator；权限范围：`bot`、`applications.commands`）

[在 Render 上部署](https://docs.openclaw.ai/zh-CN/install/render)[开发渠道](https://docs.openclaw.ai/zh-CN/install/development-channels)

⌘I
