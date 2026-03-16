<!-- Source: https://docs.openclaw.ai/zh-CN/install/exe-dev -->
<!-- Title: exe.dev - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/install/exe-dev)

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

-   [exe.dev](https://docs.openclaw.ai/zh-CN/install/exe-dev)
-   [面向初学者的快速路径](https://docs.openclaw.ai/zh-CN/install/exe-dev)
-   [你需要准备的内容](https://docs.openclaw.ai/zh-CN/install/exe-dev)
-   [使用 Shelley 自动安装](https://docs.openclaw.ai/zh-CN/install/exe-dev)
-   [手动安装](https://docs.openclaw.ai/zh-CN/install/exe-dev)
-   [1）创建 VM](https://docs.openclaw.ai/zh-CN/install/exe-dev)
-   [2）安装前置依赖（在 VM 上）](https://docs.openclaw.ai/zh-CN/install/exe-dev)
-   [3）安装 OpenClaw](https://docs.openclaw.ai/zh-CN/install/exe-dev)
-   [4）设置 nginx，将 OpenClaw 代理到端口 8000](https://docs.openclaw.ai/zh-CN/install/exe-dev)
-   [5）访问 OpenClaw 并授予权限](https://docs.openclaw.ai/zh-CN/install/exe-dev)
-   [远程访问](https://docs.openclaw.ai/zh-CN/install/exe-dev)
-   [更新](https://docs.openclaw.ai/zh-CN/install/exe-dev)

托管与部署

# exe.dev

# 

[​

](https://docs.openclaw.ai/zh-CN/install/exe-dev)

exe.dev

目标：让 OpenClaw Gateway 网关运行在 exe.dev VM 上，并且可通过你的笔记本电脑访问：`https://<vm-name>.exe.xyz` 本页假设你使用的是 exe.dev 默认的 **exeuntu** 镜像。如果你选择了不同的发行版，请相应调整软件包。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/exe-dev)

面向初学者的快速路径

1.  [https://exe.new/openclaw](https://exe.new/openclaw)
2.  根据需要填写你的身份验证密钥/令牌
3.  点击你的 VM 旁边的 “Agent”，然后等待……
4.  ???
5.  成功

## 

[​

](https://docs.openclaw.ai/zh-CN/install/exe-dev)

你需要准备的内容

-   exe.dev 账户
-   对 [exe.dev](https://exe.dev/) 虚拟机的 `ssh exe.dev` 访问权限（可选）

## 

[​

](https://docs.openclaw.ai/zh-CN/install/exe-dev)

使用 Shelley 自动安装

Shelley 是 [exe.dev](https://exe.dev/) 的智能体，可以使用我们的提示词立即安装 OpenClaw。 使用的提示词如下：

复制

```
Set up OpenClaw (https://docs.openclaw.ai/install) on this VM. Use the non-interactive and accept-risk flags for openclaw onboarding. Add the supplied auth or token as needed. Configure nginx to forward from the default port 18789 to the root location on the default enabled site config, making sure to enable Websocket support. Pairing is done by "openclaw devices list" and "openclaw devices approve <request id>". Make sure the dashboard shows that OpenClaw's health is OK. exe.dev handles forwarding from port 8000 to port 80/443 and HTTPS for us, so the final "reachable" should be <vm-name>.exe.xyz, without port specification.
```

## 

[​

](https://docs.openclaw.ai/zh-CN/install/exe-dev)

手动安装

## 

[​

](https://docs.openclaw.ai/zh-CN/install/exe-dev)

1）创建 VM

在你的设备上运行：

复制

```
ssh exe.dev new
```

然后连接：

复制

```
ssh <vm-name>.exe.xyz
```

提示：请让这个 VM 保持**有状态**。OpenClaw 会将状态存储在 `~/.openclaw/` 和 `~/.openclaw/workspace/` 下。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/exe-dev)

2）安装前置依赖（在 VM 上）

复制

```
sudo apt-get update
sudo apt-get install -y git curl jq ca-certificates openssl
```

## 

[​

](https://docs.openclaw.ai/zh-CN/install/exe-dev)

3）安装 OpenClaw

运行 OpenClaw 安装脚本：

复制

```
curl -fsSL https://openclaw.ai/install.sh | bash
```

## 

[​

](https://docs.openclaw.ai/zh-CN/install/exe-dev)

4）设置 nginx，将 OpenClaw 代理到端口 8000

编辑 `/etc/nginx/sites-enabled/default`，内容如下：

复制

```
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    listen 8000;
    listen [::]:8000;

    server_name _;

    location / {
        proxy_pass http://127.0.0.1:18789;
        proxy_http_version 1.1;

        # WebSocket support
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        # Standard proxy headers
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # Timeout settings for long-lived connections
        proxy_read_timeout 86400s;
        proxy_send_timeout 86400s;
    }
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/install/exe-dev)

5）访问 OpenClaw 并授予权限

访问 `https://<vm-name>.exe.xyz/`（请查看新手引导输出中的控制 UI）。如果提示进行身份验证，请粘贴 VM 上的 `gateway.auth.token` 中的令牌（可通过 `openclaw config get gateway.auth.token` 获取，或使用 `openclaw doctor --generate-gateway-token` 生成）。使用 `openclaw devices list` 和 `openclaw devices approve <requestId>` 批准设备。如果拿不准，请在浏览器中使用 Shelley！

## 

[​

](https://docs.openclaw.ai/zh-CN/install/exe-dev)

远程访问

远程访问由 [exe.dev](https://exe.dev/) 的身份验证处理。默认情况下， 来自端口 8000 的 HTTP 流量会被转发到 `https://<vm-name>.exe.xyz`， 并使用电子邮件身份验证。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/exe-dev)

更新

复制

```
npm i -g openclaw@latest
openclaw doctor
openclaw gateway restart
openclaw health
```

指南：[Updating](https://docs.openclaw.ai/install/updating)

[macOS VM](https://docs.openclaw.ai/zh-CN/install/macos-vm)[在 Railway 上部署](https://docs.openclaw.ai/zh-CN/install/railway)

⌘I
