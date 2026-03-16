<!-- Source: https://docs.openclaw.ai/zh-CN/install/render -->
<!-- Title: 在 Render 上部署 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/install/render)

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

-   [前提条件](https://docs.openclaw.ai/zh-CN/install/render)
-   [使用 Render Blueprint 部署](https://docs.openclaw.ai/zh-CN/install/render)
-   [了解 Blueprint](https://docs.openclaw.ai/zh-CN/install/render)
-   [选择套餐](https://docs.openclaw.ai/zh-CN/install/render)
-   [部署完成后](https://docs.openclaw.ai/zh-CN/install/render)
-   [完成设置向导](https://docs.openclaw.ai/zh-CN/install/render)
-   [访问控制面板](https://docs.openclaw.ai/zh-CN/install/render)
-   [Render 仪表盘功能](https://docs.openclaw.ai/zh-CN/install/render)
-   [日志](https://docs.openclaw.ai/zh-CN/install/render)
-   [Shell 访问](https://docs.openclaw.ai/zh-CN/install/render)
-   [环境变量](https://docs.openclaw.ai/zh-CN/install/render)
-   [自动部署](https://docs.openclaw.ai/zh-CN/install/render)
-   [自定义域名](https://docs.openclaw.ai/zh-CN/install/render)
-   [扩展](https://docs.openclaw.ai/zh-CN/install/render)
-   [备份与迁移](https://docs.openclaw.ai/zh-CN/install/render)
-   [故障排除](https://docs.openclaw.ai/zh-CN/install/render)
-   [服务无法启动](https://docs.openclaw.ai/zh-CN/install/render)
-   [冷启动缓慢（免费套餐）](https://docs.openclaw.ai/zh-CN/install/render)
-   [重新部署后数据丢失](https://docs.openclaw.ai/zh-CN/install/render)
-   [健康检查失败](https://docs.openclaw.ai/zh-CN/install/render)

托管与部署

# 在 Render 上部署

使用基础设施即代码方式在 Render 上部署 OpenClaw。内置的 `render.yaml` Blueprint 以声明式方式定义了你的整个技术栈——服务、磁盘、环境变量，让你只需一键即可完成部署，并将基础设施与代码一同进行版本管理。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

前提条件

-   一个 [Render 账户](https://render.com/)（提供免费套餐）
-   来自你首选[模型提供商](https://docs.openclaw.ai/providers)的 API 密钥

## 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

使用 Render Blueprint 部署

[部署到 Render](https://render.com/deploy) 点击此链接将会：

1.  根据本仓库根目录下的 `render.yaml` Blueprint 创建一个新的 Render 服务。
2.  提示你设置 `SETUP_PASSWORD`
3.  构建 Docker 镜像并部署

部署完成后，你的服务 URL 格式为 `https://<service-name>.onrender.com`。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

了解 Blueprint

Render Blueprint 是定义基础设施的 YAML 文件。本仓库中的 `render.yaml` 配置了运行 OpenClaw 所需的一切：

复制

```
services:
  - type: web
    name: openclaw
    runtime: docker
    plan: starter
    healthCheckPath: /health
    envVars:
      - key: PORT
        value: "8080"
      - key: SETUP_PASSWORD
        sync: false # prompts during deploy
      - key: OPENCLAW_STATE_DIR
        value: /data/.openclaw
      - key: OPENCLAW_WORKSPACE_DIR
        value: /data/workspace
      - key: OPENCLAW_GATEWAY_TOKEN
        generateValue: true # auto-generates a secure token
    disk:
      name: openclaw-data
      mountPath: /data
      sizeGB: 1
```

使用的关键 Blueprint 功能：

| 功能 | 用途 |
| --- | --- |
| `runtime: docker` | 从仓库的 Dockerfile 进行构建 |
| `healthCheckPath` | Render 监控 `/health` 并重启不健康的实例 |
| `sync: false` | 在部署时提示输入值（用于密钥） |
| `generateValue: true` | 自动生成加密安全的值 |
| `disk` | 持久化存储，在重新部署后数据仍然保留 |

## 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

选择套餐

| 套餐 | 休眠机制 | 磁盘 | 适用场景 |
| --- | --- | --- | --- |
| Free | 空闲 15 分钟后休眠 | 不可用 | 测试、演示 |
| Starter | 永不休眠 | 1GB+ | 个人使用、小团队 |
| Standard+ | 永不休眠 | 1GB+ | 生产环境、多渠道 |

Blueprint 默认使用 `starter`。如需使用免费套餐，请在你 fork 的 `render.yaml` 中将 `plan: free`（但请注意：没有持久化磁盘意味着每次部署后配置都会重置）。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

部署完成后

### 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

完成设置向导

1.  访问 `https://<your-service>.onrender.com/setup`
2.  输入你的 `SETUP_PASSWORD`
3.  选择模型提供商并粘贴你的 API 密钥
4.  可选配置消息渠道（Telegram、Discord、Slack）
5.  点击 **Run setup**

### 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

访问控制面板

Web 管理面板位于 `https://<your-service>.onrender.com/openclaw`。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

Render 仪表盘功能

### 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

日志

在 **Dashboard → 你的服务 → Logs** 中查看实时日志。可按以下类型筛选：

-   构建日志（Docker 镜像创建）
-   部署日志（服务启动）
-   运行时日志（应用输出）

### 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

Shell 访问

如需调试，可通过 **Dashboard → 你的服务 → Shell** 打开 shell 会话。持久化磁盘挂载在 `/data`。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

环境变量

在 **Dashboard → 你的服务 → Environment** 中修改变量。更改会触发自动重新部署。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

自动部署

如果你使用的是原始 OpenClaw 仓库，Render 不会自动部署你的 OpenClaw。要更新它，请在仪表盘中手动执行 Blueprint 同步。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

自定义域名

1.  前往 **Dashboard → 你的服务 → Settings → Custom Domains**
2.  添加你的域名
3.  按照指引配置 DNS（CNAME 指向 `*.onrender.com`）
4.  Render 会自动配置 TLS 证书

## 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

扩展

Render 支持水平和垂直扩展：

-   **垂直扩展**：更改套餐以获取更多 CPU/内存
-   **水平扩展**：增加实例数量（Standard 套餐及以上）

对于 OpenClaw，垂直扩展通常就足够了。水平扩展需要粘性会话或外部状态管理。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

备份与迁移

随时导出你的配置和工作区：

复制

```
https://<your-service>.onrender.com/setup/export
```

这将下载一个可移植的备份文件，你可以在任何 OpenClaw 主机上恢复。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

故障排除

### 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

服务无法启动

在 Render 仪表盘中检查部署日志。常见问题：

-   缺少 `SETUP_PASSWORD` — Blueprint 会提示输入此值，但请确认已设置
-   端口不匹配 — 确保 `PORT=8080` 与 Dockerfile 暴露的端口一致

### 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

冷启动缓慢（免费套餐）

免费套餐的服务在 15 分钟无活动后会休眠。休眠后的首次请求需要几秒钟等待容器启动。升级到 Starter 套餐可实现始终在线。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

重新部署后数据丢失

这发生在免费套餐上（无持久化磁盘）。升级到付费套餐，或通过 `/setup/export` 定期导出你的配置。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/render)

健康检查失败

Render 期望在 30 秒内从 `/health` 获得 200 响应。如果构建成功但部署失败，可能是服务启动耗时过长。请检查：

-   构建日志中是否有错误
-   容器是否能通过 `docker build && docker run` 在本地正常运行

[在 Railway 上部署](https://docs.openclaw.ai/zh-CN/install/railway)[在 Northflank 上部署](https://docs.openclaw.ai/zh-CN/install/northflank)

⌘I
