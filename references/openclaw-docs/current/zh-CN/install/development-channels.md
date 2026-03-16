<!-- Source: https://docs.openclaw.ai/zh-CN/install/development-channels -->
<!-- Title: 开发渠道 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/install/development-channels)

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

-   [开发渠道](https://docs.openclaw.ai/zh-CN/install/development-channels)
-   [切换渠道](https://docs.openclaw.ai/zh-CN/install/development-channels)
-   [插件和渠道](https://docs.openclaw.ai/zh-CN/install/development-channels)
-   [标签最佳实践](https://docs.openclaw.ai/zh-CN/install/development-channels)
-   [macOS 应用可用性](https://docs.openclaw.ai/zh-CN/install/development-channels)

高级

# 开发渠道

# 

[​

](https://docs.openclaw.ai/zh-CN/install/development-channels)

开发渠道

最后更新：2026-01-21 OpenClaw 提供三个更新渠道：

-   **stable**：npm dist-tag `latest`。
-   **beta**：npm dist-tag `beta`（测试中的构建）。
-   **dev**：`main` 的移动头（git）。npm dist-tag：`dev`（发布时）。

我们将构建发布到 **beta**，进行测试，然后**将经过验证的构建提升到 `latest`**， 版本号不变——dist-tag 是 npm 安装的数据源。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/development-channels)

切换渠道

Git checkout：

复制

```
openclaw update --channel stable
openclaw update --channel beta
openclaw update --channel dev
```

-   `stable`/`beta` 检出最新匹配的标签（通常是同一个标签）。
-   `dev` 切换到 `main` 并在上游基础上 rebase。

npm/pnpm 全局安装：

复制

```
openclaw update --channel stable
openclaw update --channel beta
openclaw update --channel dev
```

这会通过相应的 npm dist-tag（`latest`、`beta`、`dev`）进行更新。 当你使用 `--channel` **显式**切换渠道时，OpenClaw 还会对齐安装方式：

-   `dev` 确保有一个 git checkout（默认 `~/openclaw`，可通过 `OPENCLAW_GIT_DIR` 覆盖）， 更新它，并从该 checkout 安装全局 CLI。
-   `stable`/`beta` 使用匹配的 dist-tag 从 npm 安装。

提示：如果你想同时使用 stable + dev，保留两个克隆并将 Gateway 网关指向 stable 那个。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/development-channels)

插件和渠道

当你使用 `openclaw update` 切换渠道时，OpenClaw 还会同步插件来源：

-   `dev` 优先使用 git checkout 中的内置插件。
-   `stable` 和 `beta` 恢复 npm 安装的插件包。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/development-channels)

标签最佳实践

-   为你希望 git checkout 落在的发布版本打标签（`vYYYY.M.D` 或 `vYYYY.M.D-<patch>`）。
-   保持标签不可变：永远不要移动或重用标签。
-   npm dist-tag 仍然是 npm 安装的数据源：
    -   `latest` → stable
    -   `beta` → 候选构建
    -   `dev` → main 快照（可选）

## 

[​

](https://docs.openclaw.ai/zh-CN/install/development-channels)

macOS 应用可用性

Beta 和 dev 构建可能**不**包含 macOS 应用发布。这没问题：

-   git 标签和 npm dist-tag 仍然可以发布。
-   在发布说明或变更日志中注明”此 beta 无 macOS 构建”。

[在 Northflank 上部署](https://docs.openclaw.ai/zh-CN/install/northflank)

⌘I
