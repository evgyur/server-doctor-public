<!-- Source: https://docs.openclaw.ai/zh-CN/install/bun -->
<!-- Title: Bun（实验性） - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/install/bun)

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

-   [Bun（实验性）](https://docs.openclaw.ai/zh-CN/install/bun)
-   [状态](https://docs.openclaw.ai/zh-CN/install/bun)
-   [安装](https://docs.openclaw.ai/zh-CN/install/bun)
-   [构建/测试（Bun）](https://docs.openclaw.ai/zh-CN/install/bun)
-   [Bun 生命周期脚本（默认被阻止）](https://docs.openclaw.ai/zh-CN/install/bun)
-   [注意事项](https://docs.openclaw.ai/zh-CN/install/bun)

安装方式

# Bun（实验性）

# 

[​

](https://docs.openclaw.ai/zh-CN/install/bun)

Bun（实验性）

目标：使用 **Bun** 运行此仓库（可选，不推荐用于 WhatsApp/Telegram），同时不偏离 pnpm 工作流。 ⚠️ **不推荐用于 Gateway 网关运行时**（WhatsApp/Telegram 存在 bug）。生产环境请使用 Node。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/bun)

状态

-   Bun 是一个可选的本地运行时，用于直接运行 TypeScript（`bun run …`、`bun --watch …`）。
-   `pnpm` 是构建的默认工具，仍然完全支持（并被一些文档工具使用）。
-   Bun 无法使用 `pnpm-lock.yaml` 并会忽略它。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/bun)

安装

默认：

复制

```
bun install
```

注意：`bun.lock`/`bun.lockb` 被 gitignore，所以无论哪种方式都不会有仓库变动。如果你想_不写入锁文件_：

复制

```
bun install --no-save
```

## 

[​

](https://docs.openclaw.ai/zh-CN/install/bun)

构建/测试（Bun）

复制

```
bun run build
bun run vitest run
```

## 

[​

](https://docs.openclaw.ai/zh-CN/install/bun)

Bun 生命周期脚本（默认被阻止）

除非明确信任（`bun pm untrusted` / `bun pm trust`），Bun 可能会阻止依赖的生命周期脚本。 对于此仓库，通常被阻止的脚本不是必需的：

-   `@whiskeysockets/baileys` `preinstall`：检查 Node 主版本 >= 20（我们运行 Node 22+）。
-   `protobufjs` `postinstall`：发出关于不兼容版本方案的警告（无构建产物）。

如果你遇到真正需要这些脚本的运行时问题，请明确信任它们：

复制

```
bun pm trust @whiskeysockets/baileys protobufjs
```

## 

[​

](https://docs.openclaw.ai/zh-CN/install/bun)

注意事项

-   一些脚本仍然硬编码 pnpm（例如 `docs:build`、`ui:*`、`protocol:check`）。目前请通过 pnpm 运行这些脚本。

[Ansible](https://docs.openclaw.ai/zh-CN/install/ansible)[更新](https://docs.openclaw.ai/zh-CN/install/updating)

⌘I
