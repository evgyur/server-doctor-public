<!-- Source: https://docs.openclaw.ai/zh-CN/install/railway -->
<!-- Title: 在 Railway 上部署 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/install/railway)

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

-   [快速检查清单（新用户）](https://docs.openclaw.ai/zh-CN/install/railway)
-   [一键部署](https://docs.openclaw.ai/zh-CN/install/railway)
-   [你将获得](https://docs.openclaw.ai/zh-CN/install/railway)
-   [必需的 Railway 设置](https://docs.openclaw.ai/zh-CN/install/railway)
-   [公共网络](https://docs.openclaw.ai/zh-CN/install/railway)
-   [Volume（必需）](https://docs.openclaw.ai/zh-CN/install/railway)
-   [变量](https://docs.openclaw.ai/zh-CN/install/railway)
-   [设置流程](https://docs.openclaw.ai/zh-CN/install/railway)
-   [获取聊天令牌](https://docs.openclaw.ai/zh-CN/install/railway)
-   [Telegram 机器人令牌](https://docs.openclaw.ai/zh-CN/install/railway)
-   [Discord 机器人令牌](https://docs.openclaw.ai/zh-CN/install/railway)
-   [备份与迁移](https://docs.openclaw.ai/zh-CN/install/railway)

托管与部署

# 在 Railway 上部署

通过一键模板在 Railway 上部署 OpenClaw，并在浏览器中完成设置。 这是最简单的”无需在服务器上使用终端”的方式：Railway 为你运行 Gateway网关， 你只需通过 `/setup` 网页向导完成所有配置。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/railway)

快速检查清单（新用户）

1.  点击下方的 **Deploy on Railway**。
2.  添加一个挂载到 `/data` 的 **Volume**。
3.  设置必需的**变量**（至少需要 `SETUP_PASSWORD`）。
4.  在端口 `8080` 上启用 **HTTP Proxy**。
5.  打开 `https://<your-railway-domain>/setup` 并完成向导。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/railway)

一键部署

[Deploy on Railway](https://railway.com/deploy/clawdbot-railway-template) 部署完成后，在 **Railway → 你的服务 → Settings → Domains** 中找到你的公开 URL。 Railway 会：

-   为你生成一个域名（通常是 `https://<something>.up.railway.app`），或者
-   使用你绑定的自定义域名。

然后打开：

-   `https://<your-railway-domain>/setup` — 设置向导（需密码保护）
-   `https://<your-railway-domain>/openclaw` — 控制面板 UI

## 

[​

](https://docs.openclaw.ai/zh-CN/install/railway)

你将获得

-   托管的 OpenClaw Gateway网关 + 控制面板 UI
-   `/setup` 网页设置向导（无需终端命令）
-   通过 Railway Volume（`/data`）实现持久化存储，配置/凭证/工作区在重新部署后不会丢失
-   在 `/setup/export` 导出备份，方便日后从 Railway 迁移

## 

[​

](https://docs.openclaw.ai/zh-CN/install/railway)

必需的 Railway 设置

### 

[​

](https://docs.openclaw.ai/zh-CN/install/railway)

公共网络

为服务启用 **HTTP Proxy**。

-   端口：`8080`

### 

[​

](https://docs.openclaw.ai/zh-CN/install/railway)

Volume（必需）

挂载一个 Volume 到：

-   `/data`

### 

[​

](https://docs.openclaw.ai/zh-CN/install/railway)

变量

在服务上设置以下变量：

-   `SETUP_PASSWORD`（必需）
-   `PORT=8080`（必需 — 必须与公共网络中的端口一致）
-   `OPENCLAW_STATE_DIR=/data/.openclaw`（推荐）
-   `OPENCLAW_WORKSPACE_DIR=/data/workspace`（推荐）
-   `OPENCLAW_GATEWAY_TOKEN`（推荐；请视为管理员密钥）

## 

[​

](https://docs.openclaw.ai/zh-CN/install/railway)

设置流程

1.  访问 `https://<your-railway-domain>/setup` 并输入你的 `SETUP_PASSWORD`。
2.  选择模型/认证提供商并粘贴你的密钥。
3.  （可选）添加 Telegram/Discord/Slack 令牌。
4.  点击 **Run setup**。

如果 Telegram 私信设置为配对模式，设置向导可以批准配对码。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/railway)

获取聊天令牌

### 

[​

](https://docs.openclaw.ai/zh-CN/install/railway)

Telegram 机器人令牌

1.  在 Telegram 中给 `@BotFather` 发消息
2.  执行 `/newbot`
3.  复制令牌（格式类似 `123456789:AA...`）
4.  将其粘贴到 `/setup` 中

### 

[​

](https://docs.openclaw.ai/zh-CN/install/railway)

Discord 机器人令牌

1.  前往 [https://discord.com/developers/applications](https://discord.com/developers/applications)
2.  **New Application** → 选择一个名称
3.  **Bot** → **Add Bot**
4.  在 Bot → Privileged Gateway Intents 下**启用 MESSAGE CONTENT INTENT**（必需，否则机器人启动时会崩溃）
5.  复制 **Bot Token** 并粘贴到 `/setup` 中
6.  邀请机器人加入你的服务器（OAuth2 URL Generator；scopes：`bot`、`applications.commands`）

## 

[​

](https://docs.openclaw.ai/zh-CN/install/railway)

备份与迁移

在以下地址下载备份：

-   `https://<your-railway-domain>/setup/export`

这会导出你的 OpenClaw 状态和工作区，方便你迁移到其他主机而不丢失配置或记忆。

[exe.dev](https://docs.openclaw.ai/zh-CN/install/exe-dev)[在 Render 上部署](https://docs.openclaw.ai/zh-CN/install/render)

⌘I
