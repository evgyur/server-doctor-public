<!-- Source: https://docs.openclaw.ai/zh-CN/install/installer -->
<!-- Title: 安装器内部机制 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/install/installer)

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

-   [安装器内部机制](https://docs.openclaw.ai/zh-CN/install/installer)
-   [快速命令](https://docs.openclaw.ai/zh-CN/install/installer)
-   [install.sh](https://docs.openclaw.ai/zh-CN/install/installer)
-   [流程（install.sh）](https://docs.openclaw.ai/zh-CN/install/installer)
-   [源码检出检测](https://docs.openclaw.ai/zh-CN/install/installer)
-   [示例（install.sh）](https://docs.openclaw.ai/zh-CN/install/installer)
-   [install-cli.sh](https://docs.openclaw.ai/zh-CN/install/installer)
-   [流程（install-cli.sh）](https://docs.openclaw.ai/zh-CN/install/installer)
-   [示例（install-cli.sh）](https://docs.openclaw.ai/zh-CN/install/installer)
-   [install.ps1](https://docs.openclaw.ai/zh-CN/install/installer)
-   [流程（install.ps1）](https://docs.openclaw.ai/zh-CN/install/installer)
-   [示例（install.ps1）](https://docs.openclaw.ai/zh-CN/install/installer)
-   [CI 和自动化](https://docs.openclaw.ai/zh-CN/install/installer)
-   [故障排除](https://docs.openclaw.ai/zh-CN/install/installer)

安装概览

# 安装器内部机制

# 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

安装器内部机制

OpenClaw 提供三个安装脚本，由 `openclaw.ai` 提供。

| 脚本 | 平台 | 功能 |
| --- | --- | --- |
| [`install.sh`](https://docs.openclaw.ai/zh-CN/install/installer) | macOS / Linux / WSL | 如有需要则安装 Node，通过 npm（默认）或 git 安装 OpenClaw，并可运行新手引导。 |
| [`install-cli.sh`](https://docs.openclaw.ai/zh-CN/install/installer) | macOS / Linux / WSL | 将 Node + OpenClaw 安装到本地前缀（`~/.openclaw`）中。无需 root。 |
| [`install.ps1`](https://docs.openclaw.ai/zh-CN/install/installer) | Windows（PowerShell） | 如有需要则安装 Node，通过 npm（默认）或 git 安装 OpenClaw，并可运行新手引导。 |

## 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

快速命令

-   install.sh
    
-   install-cli.sh
    
-   install.ps1
    

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash
```

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash -s -- --help
```

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash
```

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash -s -- --help
```

复制

```
iwr -useb https://openclaw.ai/install.ps1 | iex
```

复制

```
& ([scriptblock]::Create((iwr -useb https://openclaw.ai/install.ps1))) -Tag beta -NoOnboard -DryRun
```

如果安装成功但在新终端中找不到 `openclaw`，请参见 [Node.js 故障排除](https://docs.openclaw.ai/install/node)。

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

install.sh

推荐用于大多数 macOS/Linux/WSL 上的交互式安装。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

流程（install.sh）

1

[

](https://docs.openclaw.ai/zh-CN/install/installer)

检测操作系统

支持 macOS 和 Linux（包括 WSL）。如果检测到 macOS，则会在缺少 Homebrew 时安装它。

2

[

](https://docs.openclaw.ai/zh-CN/install/installer)

默认确保使用 Node.js 24

检查 Node 版本，并在需要时安装 Node 24（macOS 上使用 Homebrew，Linux apt/dnf/yum 上使用 NodeSource 设置脚本）。为了兼容性，OpenClaw 仍支持 Node 22 LTS，目前为 `22.16+`。

3

[

](https://docs.openclaw.ai/zh-CN/install/installer)

确保安装 Git

如果缺少 Git，则安装它。

4

[

](https://docs.openclaw.ai/zh-CN/install/installer)

安装 OpenClaw

-   `npm` 方法（默认）：全局 npm 安装
-   `git` 方法：克隆/更新仓库，使用 pnpm 安装依赖，构建，然后将包装器安装到 `~/.local/bin/openclaw`

5

[

](https://docs.openclaw.ai/zh-CN/install/installer)

安装后任务

-   在升级和 git 安装时运行 `openclaw doctor --non-interactive`（尽力而为）
-   在适当情况下尝试运行新手引导（有 TTY、未禁用新手引导，并且 bootstrap/配置检查通过）
-   默认设置 `SHARP_IGNORE_GLOBAL_LIBVIPS=1`

### 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

源码检出检测

如果在 OpenClaw 检出目录中运行（`package.json` + `pnpm-workspace.yaml`），脚本会提供：

-   使用检出目录（`git`），或
-   使用全局安装（`npm`）

如果没有可用 TTY 且未设置安装方法，它将默认使用 `npm` 并发出警告。 对于无效的方法选择或无效的 `--install-method` 值，脚本会以退出码 `2` 退出。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

示例（install.sh）

-   默认
    
-   跳过新手引导
    
-   Git 安装
    
-   通过 npm 安装 GitHub main
    
-   试运行
    

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash
```

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash -s -- --no-onboard
```

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash -s -- --install-method git
```

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash -s -- --version main
```

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash -s -- --dry-run
```

标志参考

| 标志 | 说明 |
| --- | --- |
| `--install-method npm|git` | 选择安装方法（默认：`npm`）。别名：`--method` |
| `--npm` | npm 方法快捷方式 |
| `--git` | git 方法快捷方式。别名：`--github` |
| `--version <version|dist-tag|spec>` | npm 版本、dist-tag 或包规范（默认：`latest`） |
| `--beta` | 如有可用则使用 beta dist-tag，否则回退到 `latest` |
| `--git-dir <path>` | 检出目录（默认：`~/openclaw`）。别名：`--dir` |
| `--no-git-update` | 对现有检出跳过 `git pull` |
| `--no-prompt` | 禁用提示 |
| `--no-onboard` | 跳过新手引导 |
| `--onboard` | 启用新手引导 |
| `--dry-run` | 打印操作但不应用更改 |
| `--verbose` | 启用调试输出（`set -x`、npm notice 级别日志） |
| `--help` | 显示用法（`-h`） |

环境变量参考

| 变量 | 说明 |
| --- | --- |
| `OPENCLAW_INSTALL_METHOD=git|npm` | 安装方法 |
| `OPENCLAW_VERSION=latest|next|main|<semver>|<spec>` | npm 版本、dist-tag 或包规范 |
| `OPENCLAW_BETA=0|1` | 如有可用则使用 beta |
| `OPENCLAW_GIT_DIR=<path>` | 检出目录 |
| `OPENCLAW_GIT_UPDATE=0|1` | 切换 git 更新 |
| `OPENCLAW_NO_PROMPT=1` | 禁用提示 |
| `OPENCLAW_NO_ONBOARD=1` | 跳过新手引导 |
| `OPENCLAW_DRY_RUN=1` | 试运行模式 |
| `OPENCLAW_VERBOSE=1` | 调试模式 |
| `OPENCLAW_NPM_LOGLEVEL=error|warn|notice` | npm 日志级别 |
| `SHARP_IGNORE_GLOBAL_LIBVIPS=0|1` | 控制 sharp/libvips 行为（默认：`1`） |

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

install-cli.sh

适用于你希望所有内容都放在本地前缀（默认 `~/.openclaw`）下，并且不依赖系统 Node 的环境。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

流程（install-cli.sh）

1

[

](https://docs.openclaw.ai/zh-CN/install/installer)

安装本地 Node 运行时

将固定的受支持 Node tarball（当前默认 `22.22.0`）下载到 `<prefix>/tools/node-v<version>`，并验证 SHA-256。

2

[

](https://docs.openclaw.ai/zh-CN/install/installer)

确保安装 Git

如果缺少 Git，则尝试在 Linux 上通过 apt/dnf/yum 安装，或在 macOS 上通过 Homebrew 安装。

3

[

](https://docs.openclaw.ai/zh-CN/install/installer)

在前缀下安装 OpenClaw

使用 `--prefix <prefix>` 通过 npm 安装，然后将包装器写入 `<prefix>/bin/openclaw`。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

示例（install-cli.sh）

-   默认
    
-   自定义前缀 + 版本
    
-   自动化 JSON 输出
    
-   运行新手引导
    

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash
```

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash -s -- --prefix /opt/openclaw --version latest
```

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash -s -- --json --prefix /opt/openclaw
```

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash -s -- --onboard
```

标志参考

| 标志 | 说明 |
| --- | --- |
| `--prefix <path>` | 安装前缀（默认：`~/.openclaw`） |
| `--version <ver>` | OpenClaw 版本或 dist-tag（默认：`latest`） |
| `--node-version <ver>` | Node 版本（默认：`22.22.0`） |
| `--json` | 输出 NDJSON 事件 |
| `--onboard` | 安装后运行 `openclaw onboard` |
| `--no-onboard` | 跳过新手引导（默认） |
| `--set-npm-prefix` | 在 Linux 上，如果当前前缀不可写，则强制将 npm 前缀设为 `~/.npm-global` |
| `--help` | 显示用法（`-h`） |

环境变量参考

| 变量 | 说明 |
| --- | --- |
| `OPENCLAW_PREFIX=<path>` | 安装前缀 |
| `OPENCLAW_VERSION=<ver>` | OpenClaw 版本或 dist-tag |
| `OPENCLAW_NODE_VERSION=<ver>` | Node 版本 |
| `OPENCLAW_NO_ONBOARD=1` | 跳过新手引导 |
| `OPENCLAW_NPM_LOGLEVEL=error|warn|notice` | npm 日志级别 |
| `OPENCLAW_GIT_DIR=<path>` | 旧版清理查找路径（用于删除旧的 `Peekaboo` 子模块检出） |
| `SHARP_IGNORE_GLOBAL_LIBVIPS=0|1` | 控制 sharp/libvips 行为（默认：`1`） |

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

install.ps1

### 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

流程（install.ps1）

1

[

](https://docs.openclaw.ai/zh-CN/install/installer)

确保 PowerShell + Windows 环境

需要 PowerShell 5+。

2

[

](https://docs.openclaw.ai/zh-CN/install/installer)

默认确保使用 Node.js 24

如果缺少，则依次尝试通过 winget、Chocolatey、Scoop 安装。为了兼容性，Node 22 LTS（当前为 `22.16+`）仍然受支持。

3

[

](https://docs.openclaw.ai/zh-CN/install/installer)

安装 OpenClaw

-   `npm` 方法（默认）：使用所选 `-Tag` 进行全局 npm 安装
-   `git` 方法：克隆/更新仓库，使用 pnpm 安装/构建，并将包装器安装到 `%USERPROFILE%\.local\bin\openclaw.cmd`

4

[

](https://docs.openclaw.ai/zh-CN/install/installer)

安装后任务

在可能情况下将所需 bin 目录添加到用户 PATH，然后在升级和 git 安装时运行 `openclaw doctor --non-interactive`（尽力而为）。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

示例（install.ps1）

-   默认
    
-   Git 安装
    
-   通过 npm 安装 GitHub main
    
-   自定义 git 目录
    
-   试运行
    
-   调试跟踪
    

复制

```
iwr -useb https://openclaw.ai/install.ps1 | iex
```

复制

```
& ([scriptblock]::Create((iwr -useb https://openclaw.ai/install.ps1))) -InstallMethod git
```

复制

```
& ([scriptblock]::Create((iwr -useb https://openclaw.ai/install.ps1))) -Tag main
```

复制

```
& ([scriptblock]::Create((iwr -useb https://openclaw.ai/install.ps1))) -InstallMethod git -GitDir "C:\openclaw"
```

复制

```
& ([scriptblock]::Create((iwr -useb https://openclaw.ai/install.ps1))) -DryRun
```

复制

```
# install.ps1 目前还没有专门的 -Verbose 标志。
Set-PSDebug -Trace 1
& ([scriptblock]::Create((iwr -useb https://openclaw.ai/install.ps1))) -NoOnboard
Set-PSDebug -Trace 0
```

标志参考

| 标志 | 说明 |
| --- | --- |
| `-InstallMethod npm|git` | 安装方法（默认：`npm`） |
| `-Tag <tag|version|spec>` | npm dist-tag、版本或包规范（默认：`latest`） |
| `-GitDir <path>` | 检出目录（默认：`%USERPROFILE%\openclaw`） |
| `-NoOnboard` | 跳过新手引导 |
| `-NoGitUpdate` | 跳过 `git pull` |
| `-DryRun` | 仅打印操作 |

环境变量参考

| 变量 | 说明 |
| --- | --- |
| `OPENCLAW_INSTALL_METHOD=git|npm` | 安装方法 |
| `OPENCLAW_GIT_DIR=<path>` | 检出目录 |
| `OPENCLAW_NO_ONBOARD=1` | 跳过新手引导 |
| `OPENCLAW_GIT_UPDATE=0` | 禁用 git pull |
| `OPENCLAW_DRY_RUN=1` | 试运行模式 |

如果使用 `-InstallMethod git` 且缺少 Git，脚本会退出并打印 Git for Windows 链接。

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

CI 和自动化

使用非交互式标志/环境变量以实现可预测的运行。

-   install.sh（非交互式 npm）
    
-   install.sh（非交互式 git）
    
-   install-cli.sh（JSON）
    
-   install.ps1（跳过新手引导）
    

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash -s -- --no-prompt --no-onboard
```

复制

```
OPENCLAW_INSTALL_METHOD=git OPENCLAW_NO_PROMPT=1 \
  curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash
```

复制

```
curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install-cli.sh | bash -s -- --json --prefix /opt/openclaw
```

复制

```
& ([scriptblock]::Create((iwr -useb https://openclaw.ai/install.ps1))) -NoOnboard
```

* * *

## 

[​

](https://docs.openclaw.ai/zh-CN/install/installer)

故障排除

为什么需要 Git？

`git` 安装方法需要 Git。对于 `npm` 安装，仍然会检查/安装 Git，以避免当依赖使用 git URL 时出现 `spawn git ENOENT` 失败。

为什么 npm 在 Linux 上会遇到 EACCES？

某些 Linux 设置会将 npm 全局前缀指向 root 拥有的路径。`install.sh` 可以将前缀切换到 `~/.npm-global`，并将 PATH 导出追加到 shell rc 文件中（如果这些文件存在）。

sharp/libvips 问题

这些脚本默认设置 `SHARP_IGNORE_GLOBAL_LIBVIPS=1`，以避免 sharp 针对系统 libvips 进行构建。若要覆盖：

复制

```
SHARP_IGNORE_GLOBAL_LIBVIPS=0 curl -fsSL --proto '=https' --tlsv1.2 https://openclaw.ai/install.sh | bash
```

Windows：“npm error spawn git / ENOENT”

安装 Git for Windows，重新打开 PowerShell，然后重新运行安装器。

Windows：“openclaw is not recognized”

运行 `npm config get prefix`，并将该目录添加到你的用户 PATH（Windows 上不需要 `\bin` 后缀），然后重新打开 PowerShell。

Windows：如何获取详细安装器输出

`install.ps1` 目前没有提供 `-Verbose` 开关。 对于脚本级诊断，请使用 PowerShell 跟踪：

复制

```
Set-PSDebug -Trace 1
& ([scriptblock]::Create((iwr -useb https://openclaw.ai/install.ps1))) -NoOnboard
Set-PSDebug -Trace 0
```

安装后找不到 openclaw

通常是 PATH 问题。请参见 [Node.js 故障排除](https://docs.openclaw.ai/install/node)。

[安装](https://docs.openclaw.ai/zh-CN/install)[Docker](https://docs.openclaw.ai/zh-CN/install/docker)

⌘I
