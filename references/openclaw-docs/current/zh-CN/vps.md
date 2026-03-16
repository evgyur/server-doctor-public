<!-- Source: https://docs.openclaw.ai/zh-CN/vps -->
<!-- Title: VPS 托管 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/vps)

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

-   [VPS 托管](https://docs.openclaw.ai/zh-CN/vps)
-   [选择提供商](https://docs.openclaw.ai/zh-CN/vps)
-   [云设置的工作原理](https://docs.openclaw.ai/zh-CN/vps)
-   [在 VPS 上使用节点](https://docs.openclaw.ai/zh-CN/vps)

托管与部署

# VPS 托管

# 

[​

](https://docs.openclaw.ai/zh-CN/vps)

VPS 托管

本中心链接到支持的 VPS/托管指南，并在高层次上解释云部署的工作原理。

## 

[​

](https://docs.openclaw.ai/zh-CN/vps)

选择提供商

-   **Railway**（一键 + 浏览器设置）：[Railway](https://docs.openclaw.ai/install/railway)
-   **Northflank**（一键 + 浏览器设置）：[Northflank](https://docs.openclaw.ai/install/northflank)
-   **Oracle Cloud（永久免费）**：[Oracle](https://docs.openclaw.ai/platforms/oracle) — $0/月（永久免费，ARM；容量/注册可能不太稳定）
-   **Fly.io**：[Fly.io](https://docs.openclaw.ai/install/fly)
-   **Hetzner（Docker）**：[Hetzner](https://docs.openclaw.ai/install/hetzner)
-   **GCP（Compute Engine）**：[GCP](https://docs.openclaw.ai/install/gcp)
-   **exe.dev**（VM + HTTPS 代理）：[exe.dev](https://docs.openclaw.ai/install/exe-dev)
-   **AWS（EC2/Lightsail/免费套餐）**：也运行良好。视频指南： [https://x.com/techfrenAJ/status/2014934471095812547](https://x.com/techfrenAJ/status/2014934471095812547)

## 

[​

](https://docs.openclaw.ai/zh-CN/vps)

云设置的工作原理

-   **Gateway 网关运行在 VPS 上**并拥有状态 + 工作区。
-   你通过**控制 UI** 或 **Tailscale/SSH** 从笔记本电脑/手机连接。
-   将 VPS 视为数据源并**备份**状态 + 工作区。
-   安全默认：将 Gateway 网关保持在 loopback 上，通过 SSH 隧道或 Tailscale Serve 访问。 如果你绑定到 `lan`/`tailnet`，需要 `gateway.auth.token` 或 `gateway.auth.password`。

远程访问：[Gateway 网关远程访问](https://docs.openclaw.ai/gateway/remote) 平台中心：[平台](https://docs.openclaw.ai/platforms)

## 

[​

](https://docs.openclaw.ai/zh-CN/vps)

在 VPS 上使用节点

你可以将 Gateway 网关保持在云端，并在本地设备（Mac/iOS/Android/无头）上配对**节点**。节点提供本地屏幕/摄像头/canvas 和 `system.run` 功能，而 Gateway 网关保持在云端。 文档：[节点](https://docs.openclaw.ai/nodes)，[节点 CLI](https://docs.openclaw.ai/cli/nodes)

[卸载](https://docs.openclaw.ai/zh-CN/install/uninstall)[Fly.io](https://docs.openclaw.ai/zh-CN/install/fly)

⌘I
