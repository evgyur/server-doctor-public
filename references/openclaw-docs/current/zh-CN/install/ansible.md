<!-- Source: https://docs.openclaw.ai/zh-CN/install/ansible -->
<!-- Title: Ansible - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/install/ansible)

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

-   [Ansible 安装](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [快速开始](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [你将获得](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [要求](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [安装内容](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [安装后设置](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [常用命令](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [安全架构](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [4 层防御](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [验证](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [Docker 可用性](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [手动安装](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [更新 OpenClaw](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [故障排除](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [防火墙阻止了我的连接](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [服务无法启动](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [Docker 沙箱问题](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [提供商登录失败](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [高级配置](https://docs.openclaw.ai/zh-CN/install/ansible)
-   [相关内容](https://docs.openclaw.ai/zh-CN/install/ansible)

安装方式

# Ansible

# 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

Ansible 安装

将 OpenClaw 部署到生产服务器的推荐方式是通过 **[openclaw-ansible](https://github.com/openclaw/openclaw-ansible)** — 一个安全优先架构的自动化安装程序。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

快速开始

一条命令安装：

复制

```
curl -fsSL https://raw.githubusercontent.com/openclaw/openclaw-ansible/main/install.sh | bash
```

> **📦 完整指南：[github.com/openclaw/openclaw-ansible](https://github.com/openclaw/openclaw-ansible)** openclaw-ansible 仓库是 Ansible 部署的权威来源。本页是快速概述。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

你将获得

-   🔒 **防火墙优先安全**：UFW + Docker 隔离（仅 SSH + Tailscale 可访问）
-   🔐 **Tailscale VPN**：安全远程访问，无需公开暴露服务
-   🐳 **Docker**：隔离的沙箱容器，仅绑定 localhost
-   🛡️ **纵深防御**：4 层安全架构
-   🚀 **一条命令设置**：几分钟内完成部署
-   🔧 **Systemd 集成**：带加固的开机自启动

## 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

要求

-   **操作系统**：Debian 11+ 或 Ubuntu 20.04+
-   **访问权限**：Root 或 sudo 权限
-   **网络**：用于包安装的互联网连接
-   **Ansible**：2.14+（由快速启动脚本自动安装）

## 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

安装内容

Ansible playbook 安装并配置：

1.  **Tailscale**（用于安全远程访问的 mesh VPN）
2.  **UFW 防火墙**（仅允许 SSH + Tailscale 端口）
3.  **Docker CE + Compose V2**（用于智能体沙箱）
4.  **Node.js 22.x + pnpm**（运行时依赖）
5.  **OpenClaw**（基于主机，非容器化）
6.  **Systemd 服务**（带安全加固的自动启动）

注意：Gateway 网关**直接在主机上运行**（不在 Docker 中），但智能体沙箱使用 Docker 进行隔离。详情参见[沙箱隔离](https://docs.openclaw.ai/gateway/sandboxing)。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

安装后设置

安装完成后，切换到 openclaw 用户：

复制

```
sudo -i -u openclaw
```

安装后脚本将引导你完成：

1.  **新手引导向导**：配置 OpenClaw 设置
2.  **提供商登录**：连接 WhatsApp/Telegram/Discord/Signal
3.  **Gateway 网关测试**：验证安装
4.  **Tailscale 设置**：连接到你的 VPN mesh

### 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

常用命令

复制

```
# 检查服务状态
sudo systemctl status openclaw

# 查看实时日志
sudo journalctl -u openclaw -f

# 重启 Gateway 网关
sudo systemctl restart openclaw

# 提供商登录（以 openclaw 用户运行）
sudo -i -u openclaw
openclaw channels login
```

## 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

安全架构

### 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

4 层防御

1.  **防火墙（UFW）**：仅公开暴露 SSH（22）+ Tailscale（41641/udp）
2.  **VPN（Tailscale）**：Gateway 网关仅通过 VPN mesh 可访问
3.  **Docker 隔离**：DOCKER-USER iptables 链防止外部端口暴露
4.  **Systemd 加固**：NoNewPrivileges、PrivateTmp、非特权用户

### 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

验证

测试外部攻击面：

复制

```
nmap -p- YOUR_SERVER_IP
```

应该显示**仅端口 22**（SSH）开放。所有其他服务（Gateway 网关、Docker）都被锁定。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

Docker 可用性

Docker 用于**智能体沙箱**（隔离的工具执行），而不是用于运行 Gateway 网关本身。Gateway 网关仅绑定到 localhost，通过 Tailscale VPN 访问。 沙箱配置参见[多智能体沙箱与工具](https://docs.openclaw.ai/tools/multi-agent-sandbox-tools)。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

手动安装

如果你更喜欢手动控制而非自动化：

复制

```
# 1. 安装先决条件
sudo apt update && sudo apt install -y ansible git

# 2. 克隆仓库
git clone https://github.com/openclaw/openclaw-ansible.git
cd openclaw-ansible

# 3. 安装 Ansible collections
ansible-galaxy collection install -r requirements.yml

# 4. 运行 playbook
./run-playbook.sh

# 或直接运行（然后手动执行 /tmp/openclaw-setup.sh）
# ansible-playbook playbook.yml --ask-become-pass
```

## 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

更新 OpenClaw

Ansible 安装程序设置 OpenClaw 为手动更新。标准更新流程参见[更新](https://docs.openclaw.ai/install/updating)。 要重新运行 Ansible playbook（例如，用于配置更改）：

复制

```
cd openclaw-ansible
./run-playbook.sh
```

注意：这是幂等的，可以安全地多次运行。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

故障排除

### 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

防火墙阻止了我的连接

如果你被锁定：

-   确保你可以先通过 Tailscale VPN 访问
-   SSH 访问（端口 22）始终允许
-   Gateway 网关**仅**通过 Tailscale 访问，这是设计如此

### 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

服务无法启动

复制

```
# 检查日志
sudo journalctl -u openclaw -n 100

# 验证权限
sudo ls -la /opt/openclaw

# 测试手动启动
sudo -i -u openclaw
cd ~/openclaw
pnpm start
```

### 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

Docker 沙箱问题

复制

```
# 验证 Docker 正在运行
sudo systemctl status docker

# 检查沙箱镜像
sudo docker images | grep openclaw-sandbox

# 如果缺失则构建沙箱镜像
cd /opt/openclaw/openclaw
sudo -u openclaw ./scripts/sandbox-setup.sh
```

### 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

提供商登录失败

确保你以 `openclaw` 用户运行：

复制

```
sudo -i -u openclaw
openclaw channels login
```

## 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

高级配置

详细的安全架构和故障排除：

-   [安全架构](https://github.com/openclaw/openclaw-ansible/blob/main/docs/security.md)
-   [技术详情](https://github.com/openclaw/openclaw-ansible/blob/main/docs/architecture.md)
-   [故障排除指南](https://github.com/openclaw/openclaw-ansible/blob/main/docs/troubleshooting.md)

## 

[​

](https://docs.openclaw.ai/zh-CN/install/ansible)

相关内容

-   [openclaw-ansible](https://github.com/openclaw/openclaw-ansible) — 完整部署指南
-   [Docker](https://docs.openclaw.ai/install/docker) — 容器化 Gateway 网关设置
-   [沙箱隔离](https://docs.openclaw.ai/gateway/sandboxing) — 智能体沙箱配置
-   [多智能体沙箱与工具](https://docs.openclaw.ai/tools/multi-agent-sandbox-tools) — 每个智能体的隔离

[Nix](https://docs.openclaw.ai/zh-CN/install/nix)[Bun（实验性）](https://docs.openclaw.ai/zh-CN/install/bun)

⌘I
