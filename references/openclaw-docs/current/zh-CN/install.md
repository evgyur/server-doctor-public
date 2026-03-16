<!-- Source: https://docs.openclaw.ai/zh-CN/install -->
<!-- Title: 安装 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/install)

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

-   [安装](https://docs.openclaw.ai/zh-CN/install)
-   [系统要求](https://docs.openclaw.ai/zh-CN/install)
-   [安装方法](https://docs.openclaw.ai/zh-CN/install)
-   [其他安装方法](https://docs.openclaw.ai/zh-CN/install)
-   [安装后](https://docs.openclaw.ai/zh-CN/install)
-   [故障排除：找不到 openclaw](https://docs.openclaw.ai/zh-CN/install)
-   [更新 / 卸载](https://docs.openclaw.ai/zh-CN/install)

安装概览

# 安装

# 

[​

](https://docs.openclaw.ai/zh-CN/install)

安装

已经按照 [入门指南](https://docs.openclaw.ai/start/getting-started) 操作过了吗？那你已经准备好了 —— 本页适用于其他安装方法、特定平台说明以及维护操作。

## 

[​

](https://docs.openclaw.ai/zh-CN/install)

系统要求

-   **[Node 24（推荐）](https://docs.openclaw.ai/install/node)**（出于兼容性考虑，仍支持 Node 22 LTS，目前为 `22.16+`；如果缺失，[安装脚本](https://docs.openclaw.ai/zh-CN/install) 会安装 Node 24）
-   macOS、Linux 或 Windows
-   仅当你从源码构建时需要 `pnpm`

在 Windows 上，我们强烈建议你在 [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install) 下运行 OpenClaw。

## 

[​

](https://docs.openclaw.ai/zh-CN/install)

安装方法

**安装脚本** 是安装 OpenClaw 的推荐方式。它会一步完成 Node 检测、安装和新手引导。

对于 VPS/云主机，尽量避免使用第三方“一键式”市场镜像。优先选择干净的基础 OS 镜像（例如 Ubuntu LTS），然后使用安装脚本自行安装 OpenClaw。

安装脚本

下载 CLI，通过 npm 全局安装，并启动设置向导。

-   macOS / Linux / WSL2
    
-   Windows (PowerShell)
    

复制

```
curl -fsSL https://openclaw.ai/install.sh | bash
```

复制

```
iwr -useb https://openclaw.ai/install.ps1 | iex
```

就这样 —— 脚本会处理 Node 检测、安装和新手引导。如果要跳过新手引导，只安装二进制文件：

-   macOS / Linux / WSL2
    
-   Windows (PowerShell)
    

复制

```
curl -fsSL https://openclaw.ai/install.sh | bash -s -- --no-onboard
```

复制

```
& ([scriptblock]::Create((iwr -useb https://openclaw.ai/install.ps1))) -NoOnboard
```

所有标志、环境变量以及 CI/自动化选项，请参阅 [Installer internals](https://docs.openclaw.ai/install/installer)。

npm / pnpm

如果你已经自行管理 Node，我们推荐使用 Node 24。出于兼容性考虑，OpenClaw 仍支持 Node 22 LTS，目前为 `22.16+`：

-   npm
    
-   pnpm
    

复制

```
npm install -g openclaw@latest
openclaw onboard --install-daemon
```

sharp 构建错误？

如果你全局安装了 libvips（在 macOS 上通过 Homebrew 很常见），并且 `sharp` 失败，请强制使用预构建二进制文件：

复制

```
SHARP_IGNORE_GLOBAL_LIBVIPS=1 npm install -g openclaw@latest
```

如果你看到 `sharp: Please add node-gyp to your dependencies`，请安装构建工具链（macOS：Xcode CLT + `npm install -g node-gyp`），或者使用上面的环境变量。

复制

```
pnpm add -g openclaw@latest
pnpm approve-builds -g        # 批准 openclaw、node-llama-cpp、sharp 等
openclaw onboard --install-daemon
```

`pnpm` 要求对带有构建脚本的包进行显式批准。首次安装出现 “Ignored build scripts” 警告后，运行 `pnpm approve-builds -g` 并选择列出的包。

想通过包管理器安装当前 GitHub `main` 分支最新版本？

复制

```
npm install -g github:openclaw/openclaw#main
```

复制

```
pnpm add -g github:openclaw/openclaw#main
```

从源码

适用于贡献者或任何想从本地检出运行的人。

1

[

](https://docs.openclaw.ai/zh-CN/install)

克隆并构建

克隆 [OpenClaw 仓库](https://github.com/openclaw/openclaw) 并构建：

复制

```
git clone https://github.com/openclaw/openclaw.git
cd openclaw
pnpm install
pnpm ui:build
pnpm build
```

2

[

](https://docs.openclaw.ai/zh-CN/install)

链接 CLI

让 `openclaw` 命令在全局可用：

复制

```
pnpm link --global
```

或者，你也可以跳过链接，直接在仓库内通过 `pnpm openclaw ...` 运行命令。

3

[

](https://docs.openclaw.ai/zh-CN/install)

运行新手引导

复制

```
openclaw onboard --install-daemon
```

更深入的开发工作流请参阅 [Setup](https://docs.openclaw.ai/start/setup)。

## 

[​

](https://docs.openclaw.ai/zh-CN/install)

其他安装方法

[

## Docker

容器化或无头部署。





](https://docs.openclaw.ai/install/docker)[

## Podman

无 root 容器：先运行一次 `setup-podman.sh`，然后运行启动脚本。





](https://docs.openclaw.ai/install/podman)[

## Nix

通过 Nix 进行声明式安装。





](https://docs.openclaw.ai/install/nix)[

## Ansible

自动化批量配置。





](https://docs.openclaw.ai/install/ansible)[

## Bun

通过 Bun 运行时进行仅 CLI 使用。





](https://docs.openclaw.ai/install/bun)

## 

[​

](https://docs.openclaw.ai/zh-CN/install)

安装后

验证一切是否正常工作：

复制

```
openclaw doctor         # 检查配置问题
openclaw status         # Gateway 网关状态
openclaw dashboard      # 打开浏览器 UI
```

如果你需要自定义运行时路径，请使用：

-   `OPENCLAW_HOME` 用于基于主目录的内部路径
-   `OPENCLAW_STATE_DIR` 用于可变状态位置
-   `OPENCLAW_CONFIG_PATH` 用于配置文件位置

有关优先级和完整细节，请参阅 [Environment vars](https://docs.openclaw.ai/help/environment)。

## 

[​

](https://docs.openclaw.ai/zh-CN/install)

故障排除：找不到 `openclaw`

PATH 诊断与修复

快速诊断：

复制

```
node -v
npm -v
npm prefix -g
echo "$PATH"
```

如果 `$(npm prefix -g)/bin`（macOS/Linux）或 `$(npm prefix -g)`（Windows）**不在**你的 `$PATH` 中，那么你的 shell 就找不到全局 npm 二进制文件（包括 `openclaw`）。修复方法 —— 将其添加到你的 shell 启动文件（`~/.zshrc` 或 `~/.bashrc`）中：

复制

```
export PATH="$(npm prefix -g)/bin:$PATH"
```

在 Windows 上，将 `npm prefix -g` 的输出添加到你的 PATH 中。然后打开一个新的终端（或者在 zsh 中运行 `rehash`，在 bash 中运行 `hash -r`）。

## 

[​

](https://docs.openclaw.ai/zh-CN/install)

更新 / 卸载

[

## 更新

让 OpenClaw 保持最新。





](https://docs.openclaw.ai/install/updating)[

## 迁移

迁移到新机器。





](https://docs.openclaw.ai/install/migrating)[

## 卸载

完全移除 OpenClaw。





](https://docs.openclaw.ai/install/uninstall)

[安装器内部机制](https://docs.openclaw.ai/zh-CN/install/installer)

⌘I
