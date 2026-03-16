<!-- Source: https://docs.openclaw.ai/zh-CN/install/hetzner -->
<!-- Title: Hetzner - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/install/hetzner)

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

-   [在 Hetzner 上运行 OpenClaw（Docker，生产 VPS 指南）](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [目标](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [我们在做什么（简单说明）？](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [快速路径（有经验的运维人员）](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [你需要什么](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [1) 配置 VPS](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [2) 安装 Docker（在 VPS 上）](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [3) 克隆 OpenClaw 仓库](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [4) 创建持久化主机目录](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [5) 配置环境变量](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [6) Docker Compose 配置](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [7) 将所需二进制文件烘焙到镜像中（关键）](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [8) 构建并启动](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [9) 验证 Gateway 网关](https://docs.openclaw.ai/zh-CN/install/hetzner)
-   [持久化位置（事实来源）](https://docs.openclaw.ai/zh-CN/install/hetzner)

托管与部署

# Hetzner

# 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

在 Hetzner 上运行 OpenClaw（Docker，生产 VPS 指南）

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

目标

使用 Docker 在 Hetzner VPS 上运行持久的 OpenClaw Gateway 网关，带持久状态、内置二进制文件和安全的重启行为。 如果你想要”约 $5 实现 OpenClaw 24/7”，这是最简单可靠的设置。 Hetzner 定价会变化；选择最小的 Debian/Ubuntu VPS，如果遇到 OOM 再扩容。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

我们在做什么（简单说明）？

-   租用一台小型 Linux 服务器（Hetzner VPS）
-   安装 Docker（隔离的应用运行时）
-   在 Docker 中启动 OpenClaw Gateway 网关
-   在主机上持久化 `~/.openclaw` + `~/.openclaw/workspace`（重启/重建后保留）
-   通过 SSH 隧道从你的笔记本电脑访问控制 UI

Gateway 网关可以通过以下方式访问：

-   从你的笔记本电脑进行 SSH 端口转发
-   如果你自己管理防火墙和令牌，可以直接暴露端口

本指南假设在 Hetzner 上使用 Ubuntu 或 Debian。 如果你使用其他 Linux VPS，请相应地映射软件包。 通用 Docker 流程请参见 [Docker](https://docs.openclaw.ai/install/docker)。

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

快速路径（有经验的运维人员）

1.  配置 Hetzner VPS
2.  安装 Docker
3.  克隆 OpenClaw 仓库
4.  创建持久化主机目录
5.  配置 `.env` 和 `docker-compose.yml`
6.  将所需二进制文件烘焙到镜像中
7.  `docker compose up -d`
8.  验证持久化和 Gateway 网关访问

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

你需要什么

-   具有 root 访问权限的 Hetzner VPS
-   从你的笔记本电脑进行 SSH 访问
-   基本熟悉 SSH + 复制/粘贴
-   约 20 分钟
-   Docker 和 Docker Compose
-   模型认证凭证
-   可选的提供商凭证
    -   WhatsApp 二维码
    -   Telegram 机器人令牌
    -   Gmail OAuth

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

1) 配置 VPS

在 Hetzner 中创建一个 Ubuntu 或 Debian VPS。 以 root 身份连接：

复制

```
ssh root@YOUR_VPS_IP
```

本指南假设 VPS 是有状态的。 不要将其视为一次性基础设施。

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

2) 安装 Docker（在 VPS 上）

复制

```
apt-get update
apt-get install -y git curl ca-certificates
curl -fsSL https://get.docker.com | sh
```

验证：

复制

```
docker --version
docker compose version
```

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

3) 克隆 OpenClaw 仓库

复制

```
git clone https://github.com/openclaw/openclaw.git
cd openclaw
```

本指南假设你将构建自定义镜像以保证二进制文件持久化。

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

4) 创建持久化主机目录

Docker 容器是临时的。 所有长期状态必须存储在主机上。

复制

```
mkdir -p /root/.openclaw
mkdir -p /root/.openclaw/workspace

# 将所有权设置为容器用户（uid 1000）：
chown -R 1000:1000 /root/.openclaw
chown -R 1000:1000 /root/.openclaw/workspace
```

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

5) 配置环境变量

在仓库根目录创建 `.env`。

复制

```
OPENCLAW_IMAGE=openclaw:latest
OPENCLAW_GATEWAY_TOKEN=change-me-now
OPENCLAW_GATEWAY_BIND=lan
OPENCLAW_GATEWAY_PORT=18789

OPENCLAW_CONFIG_DIR=/root/.openclaw
OPENCLAW_WORKSPACE_DIR=/root/.openclaw/workspace

GOG_KEYRING_PASSWORD=change-me-now
XDG_CONFIG_HOME=/home/node/.openclaw
```

生成强密钥：

复制

```
openssl rand -hex 32
```

**不要提交此文件。**

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

6) Docker Compose 配置

创建或更新 `docker-compose.yml`。

复制

```
services:
  openclaw-gateway:
    image: ${OPENCLAW_IMAGE}
    build: .
    restart: unless-stopped
    env_file:
      - .env
    environment:
      - HOME=/home/node
      - NODE_ENV=production
      - TERM=xterm-256color
      - OPENCLAW_GATEWAY_BIND=${OPENCLAW_GATEWAY_BIND}
      - OPENCLAW_GATEWAY_PORT=${OPENCLAW_GATEWAY_PORT}
      - OPENCLAW_GATEWAY_TOKEN=${OPENCLAW_GATEWAY_TOKEN}
      - GOG_KEYRING_PASSWORD=${GOG_KEYRING_PASSWORD}
      - XDG_CONFIG_HOME=${XDG_CONFIG_HOME}
      - PATH=/home/linuxbrew/.linuxbrew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    volumes:
      - ${OPENCLAW_CONFIG_DIR}:/home/node/.openclaw
      - ${OPENCLAW_WORKSPACE_DIR}:/home/node/.openclaw/workspace
    ports:
      # 推荐：在 VPS 上保持 Gateway 网关仅限 loopback；通过 SSH 隧道访问。
      # 要公开暴露，移除 `127.0.0.1:` 前缀并相应配置防火墙。
      - "127.0.0.1:${OPENCLAW_GATEWAY_PORT}:18789"

      # 可选：仅当你对此 VPS 运行 iOS/Android 节点并需要 Canvas 主机时。
      # 如果你公开暴露此端口，请阅读 /gateway/security 并相应配置防火墙。
      # - "18793:18793"
    command:
      [
        "node",
        "dist/index.js",
        "gateway",
        "--bind",
        "${OPENCLAW_GATEWAY_BIND}",
        "--port",
        "${OPENCLAW_GATEWAY_PORT}",
      ]
```

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

7) 将所需二进制文件烘焙到镜像中（关键）

在运行中的容器内安装二进制文件是一个陷阱。 任何在运行时安装的东西都会在重启时丢失。 所有 skills 所需的外部二进制文件必须在镜像构建时安装。 以下示例仅展示三个常见二进制文件：

-   `gog` 用于 Gmail 访问
-   `goplaces` 用于 Google Places
-   `wacli` 用于 WhatsApp

这些是示例，不是完整列表。 你可以使用相同的模式安装任意数量的二进制文件。 如果你以后添加依赖额外二进制文件的新 skills，你必须：

1.  更新 Dockerfile
2.  重新构建镜像
3.  重启容器

**示例 Dockerfile**

复制

```
FROM node:22-bookworm

RUN apt-get update && apt-get install -y socat && rm -rf /var/lib/apt/lists/*

# 示例二进制文件 1：Gmail CLI
RUN curl -L https://github.com/steipete/gog/releases/latest/download/gog_Linux_x86_64.tar.gz \
  | tar -xz -C /usr/local/bin && chmod +x /usr/local/bin/gog

# 示例二进制文件 2：Google Places CLI
RUN curl -L https://github.com/steipete/goplaces/releases/latest/download/goplaces_Linux_x86_64.tar.gz \
  | tar -xz -C /usr/local/bin && chmod +x /usr/local/bin/goplaces

# 示例二进制文件 3：WhatsApp CLI
RUN curl -L https://github.com/steipete/wacli/releases/latest/download/wacli_Linux_x86_64.tar.gz \
  | tar -xz -C /usr/local/bin && chmod +x /usr/local/bin/wacli

# 使用相同模式在下方添加更多二进制文件

WORKDIR /app
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml .npmrc ./
COPY ui/package.json ./ui/package.json
COPY scripts ./scripts

RUN corepack enable
RUN pnpm install --frozen-lockfile

COPY . .
RUN pnpm build
RUN pnpm ui:install
RUN pnpm ui:build

ENV NODE_ENV=production

CMD ["node","dist/index.js"]
```

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

8) 构建并启动

复制

```
docker compose build
docker compose up -d openclaw-gateway
```

验证二进制文件：

复制

```
docker compose exec openclaw-gateway which gog
docker compose exec openclaw-gateway which goplaces
docker compose exec openclaw-gateway which wacli
```

预期输出：

复制

```
/usr/local/bin/gog
/usr/local/bin/goplaces
/usr/local/bin/wacli
```

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

9) 验证 Gateway 网关

复制

```
docker compose logs -f openclaw-gateway
```

成功：

复制

```
[gateway] listening on ws://0.0.0.0:18789
```

从你的笔记本电脑：

复制

```
ssh -N -L 18789:127.0.0.1:18789 root@YOUR_VPS_IP
```

打开： `http://127.0.0.1:18789/` 粘贴你的 Gateway 网关令牌。

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/hetzner)

持久化位置（事实来源）

OpenClaw 在 Docker 中运行，但 Docker 不是事实来源。 所有长期状态必须在重启、重建和重启后保留。

| 组件 | 位置 | 持久化机制 | 说明 |
| --- | --- | --- | --- |
| Gateway 网关配置 | `/home/node/.openclaw/` | 主机卷挂载 | 包括 `openclaw.json`、令牌 |
| 模型认证配置文件 | `/home/node/.openclaw/` | 主机卷挂载 | OAuth 令牌、API 密钥 |
| Skill 配置 | `/home/node/.openclaw/skills/` | 主机卷挂载 | Skill 级别状态 |
| 智能体工作区 | `/home/node/.openclaw/workspace/` | 主机卷挂载 | 代码和智能体产物 |
| WhatsApp 会话 | `/home/node/.openclaw/` | 主机卷挂载 | 保留二维码登录 |
| Gmail 密钥环 | `/home/node/.openclaw/` | 主机卷 + 密码 | 需要 `GOG_KEYRING_PASSWORD` |
| 外部二进制文件 | `/usr/local/bin/` | Docker 镜像 | 必须在构建时烘焙 |
| Node 运行时 | 容器文件系统 | Docker 镜像 | 每次镜像构建时重建 |
| 操作系统包 | 容器文件系统 | Docker 镜像 | 不要在运行时安装 |
| Docker 容器 | 临时的 | 可重启 | 可以安全销毁 |

[Fly.io](https://docs.openclaw.ai/zh-CN/install/fly)[GCP](https://docs.openclaw.ai/zh-CN/install/gcp)

⌘I
