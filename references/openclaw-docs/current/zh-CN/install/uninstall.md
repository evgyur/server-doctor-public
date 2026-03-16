<!-- Source: https://docs.openclaw.ai/zh-CN/install/uninstall -->
<!-- Title: 卸载 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/install/uninstall)

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

-   [卸载](https://docs.openclaw.ai/zh-CN/install/uninstall)
-   [简单方式（CLI 仍已安装）](https://docs.openclaw.ai/zh-CN/install/uninstall)
-   [手动服务移除（CLI 未安装）](https://docs.openclaw.ai/zh-CN/install/uninstall)
-   [macOS（launchd）](https://docs.openclaw.ai/zh-CN/install/uninstall)
-   [Linux（systemd 用户单元）](https://docs.openclaw.ai/zh-CN/install/uninstall)
-   [Windows（计划任务）](https://docs.openclaw.ai/zh-CN/install/uninstall)
-   [普通安装 vs 源码检出](https://docs.openclaw.ai/zh-CN/install/uninstall)
-   [普通安装（install.sh / npm / pnpm / bun）](https://docs.openclaw.ai/zh-CN/install/uninstall)
-   [源码检出（git clone）](https://docs.openclaw.ai/zh-CN/install/uninstall)

维护

# 卸载

# 

[​

](https://docs.openclaw.ai/zh-CN/install/uninstall)

卸载

两种方式：

-   如果 `openclaw` 仍已安装，使用**简单方式**。
-   如果 CLI 已删除但服务仍在运行，使用**手动服务移除**。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/uninstall)

简单方式（CLI 仍已安装）

推荐：使用内置卸载程序：

复制

```
openclaw uninstall
```

非交互式（自动化 / npx）：

复制

```
openclaw uninstall --all --yes --non-interactive
npx -y openclaw uninstall --all --yes --non-interactive
```

手动步骤（效果相同）：

1.  停止 Gateway 网关服务：

复制

```
openclaw gateway stop
```

2.  卸载 Gateway 网关服务（launchd/systemd/schtasks）：

复制

```
openclaw gateway uninstall
```

3.  删除状态 + 配置：

复制

```
rm -rf "${OPENCLAW_STATE_DIR:-$HOME/.openclaw}"
```

如果你将 `OPENCLAW_CONFIG_PATH` 设置为状态目录外的自定义位置，也请删除该文件。

4.  删除你的工作区（可选，移除智能体文件）：

复制

```
rm -rf ~/.openclaw/workspace
```

5.  移除 CLI 安装（选择你使用的那个）：

复制

```
npm rm -g openclaw
pnpm remove -g openclaw
bun remove -g openclaw
```

6.  如果你安装了 macOS 应用：

复制

```
rm -rf /Applications/OpenClaw.app
```

注意事项：

-   如果你使用了配置文件（`--profile` / `OPENCLAW_PROFILE`），对每个状态目录重复步骤 3（默认为 `~/.openclaw-<profile>`）。
-   在远程模式下，状态目录位于 **Gateway 网关主机**上，因此也需要在那里运行步骤 1-4。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/uninstall)

手动服务移除（CLI 未安装）

如果 Gateway 网关服务持续运行但 `openclaw` 缺失，请使用此方法。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/uninstall)

macOS（launchd）

默认标签是 `bot.molt.gateway`（或 `bot.molt.<profile>`；旧版 `com.openclaw.*` 可能仍然存在）：

复制

```
launchctl bootout gui/$UID/bot.molt.gateway
rm -f ~/Library/LaunchAgents/bot.molt.gateway.plist
```

如果你使用了配置文件，请将标签和 plist 名称替换为 `bot.molt.<profile>`。如果存在任何旧版 `com.openclaw.*` plist，请将其移除。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/uninstall)

Linux（systemd 用户单元）

默认单元名称是 `openclaw-gateway.service`（或 `openclaw-gateway-<profile>.service`）：

复制

```
systemctl --user disable --now openclaw-gateway.service
rm -f ~/.config/systemd/user/openclaw-gateway.service
systemctl --user daemon-reload
```

### 

[​

](https://docs.openclaw.ai/zh-CN/install/uninstall)

Windows（计划任务）

默认任务名称是 `OpenClaw Gateway`（或 `OpenClaw Gateway (<profile>)`）。 任务脚本位于你的状态目录下。

复制

```
schtasks /Delete /F /TN "OpenClaw Gateway"
Remove-Item -Force "$env:USERPROFILE\.openclaw\gateway.cmd"
```

如果你使用了配置文件，请删除匹配的任务名称和 `~\.openclaw-<profile>\gateway.cmd`。

## 

[​

](https://docs.openclaw.ai/zh-CN/install/uninstall)

普通安装 vs 源码检出

### 

[​

](https://docs.openclaw.ai/zh-CN/install/uninstall)

普通安装（install.sh / npm / pnpm / bun）

如果你使用了 `https://openclaw.ai/install.sh` 或 `install.ps1`，CLI 是通过 `npm install -g openclaw@latest` 安装的。 使用 `npm rm -g openclaw` 移除（或 `pnpm remove -g` / `bun remove -g`，如果你是用那种方式安装的）。

### 

[​

](https://docs.openclaw.ai/zh-CN/install/uninstall)

源码检出（git clone）

如果你从仓库检出运行（`git clone` + `openclaw ...` / `bun run openclaw ...`）：

1.  在删除仓库**之前**卸载 Gateway 网关服务（使用上面的简单方式或手动服务移除）。
2.  删除仓库目录。
3.  按上述方式移除状态 + 工作区。

[迁移指南](https://docs.openclaw.ai/zh-CN/install/migrating)[VPS 托管](https://docs.openclaw.ai/zh-CN/vps)

⌘I
