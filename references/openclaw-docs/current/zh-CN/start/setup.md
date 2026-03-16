<!-- Source: https://docs.openclaw.ai/zh-CN/start/setup -->
<!-- Title: 设置 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/start/setup)

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

##### 帮助

-   [
    
    帮助
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help)
-   [
    
    故障排除
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
-   [
    
    常见问题
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help/faq)

##### 社区

-   [
    
    OpenClaw 传说
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/lore)

##### 环境与调试

-   [
    
    环境变量
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help/environment)
-   [
    
    调试
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help/debugging)
-   [
    
    测试
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help/testing)
-   [
    
    脚本
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help/scripts)
-   [
    
    Node + tsx 崩溃
    
    
    
    ](https://docs.openclaw.ai/zh-CN/debug/node-issue)
-   [
    
    诊断标志
    
    
    
    ](https://docs.openclaw.ai/zh-CN/diagnostics/flags)

##### Node 运行时

-   [
    
    Node.js
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/node)

##### 压缩机制内部参考

-   [
    
    会话管理深入了解
    
    
    
    ](https://docs.openclaw.ai/zh-CN/reference/session-management-compaction)

##### 开发者设置

-   [
    
    设置
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/setup)
-   [
    
    Pi 开发工作流程
    
    
    
    ](https://docs.openclaw.ai/zh-CN/pi-dev)

##### 文档元信息

-   [
    
    文档导航中心
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/hubs)
-   [
    
    文档目录
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/docs-directory)
-   [
    
    AGENTS
    
    
    
    ](https://docs.openclaw.ai/zh-CN/AGENTS)

-   [设置](https://docs.openclaw.ai/zh-CN/start/setup)
-   [太长不看](https://docs.openclaw.ai/zh-CN/start/setup)
-   [先决条件（从源码）](https://docs.openclaw.ai/zh-CN/start/setup)
-   [个性化策略（让更新不会造成问题）](https://docs.openclaw.ai/zh-CN/start/setup)
-   [稳定工作流（macOS 应用优先）](https://docs.openclaw.ai/zh-CN/start/setup)
-   [前沿工作流（在终端中运行 Gateway 网关）](https://docs.openclaw.ai/zh-CN/start/setup)
-   [0)（可选）也从源码运行 macOS 应用](https://docs.openclaw.ai/zh-CN/start/setup)
-   [1) 启动开发 Gateway 网关](https://docs.openclaw.ai/zh-CN/start/setup)
-   [2) 将 macOS 应用指向你正在运行的 Gateway 网关](https://docs.openclaw.ai/zh-CN/start/setup)
-   [3) 验证](https://docs.openclaw.ai/zh-CN/start/setup)
-   [常见陷阱](https://docs.openclaw.ai/zh-CN/start/setup)
-   [凭证存储映射](https://docs.openclaw.ai/zh-CN/start/setup)
-   [更新（不破坏你的设置）](https://docs.openclaw.ai/zh-CN/start/setup)
-   [Linux（systemd 用户服务）](https://docs.openclaw.ai/zh-CN/start/setup)
-   [相关文档](https://docs.openclaw.ai/zh-CN/start/setup)

开发者设置

# 设置

# 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

设置

最后更新：2026-01-01

## 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

太长不看

-   **个性化设置存放在仓库之外：** `~/.openclaw/workspace`（工作区）+ `~/.openclaw/openclaw.json`（配置）。
-   **稳定工作流：** 安装 macOS 应用；让它运行内置的 Gateway 网关。
-   **前沿工作流：** 通过 `pnpm gateway:watch` 自己运行 Gateway 网关，然后让 macOS 应用以本地模式连接。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

先决条件（从源码）

-   Node `>=22`
-   `pnpm`
-   Docker（可选；仅用于容器化设置/e2e — 参阅 [Docker](https://docs.openclaw.ai/install/docker)）

## 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

个性化策略（让更新不会造成问题）

如果你想要”100% 为我定制”_并且_易于更新，将你的自定义内容保存在：

-   **配置：** `~/.openclaw/openclaw.json`（JSON/JSON5 格式）
-   **工作区：** `~/.openclaw/workspace`（Skills、提示、记忆；将其设为私有 git 仓库）

引导一次：

复制

```
openclaw setup
```

在此仓库内部，使用本地 CLI 入口：

复制

```
openclaw setup
```

如果你还没有全局安装，通过 `pnpm openclaw setup` 运行它。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

稳定工作流（macOS 应用优先）

1.  安装并启动 **OpenClaw.app**（菜单栏）。
2.  完成新手引导/权限检查清单（TCC 提示）。
3.  确保 Gateway 网关是**本地**并正在运行（应用管理它）。
4.  链接表面（示例：WhatsApp）：

复制

```
openclaw channels login
```

5.  完整性检查：

复制

```
openclaw health
```

如果你的构建版本中没有新手引导：

-   运行 `openclaw setup`，然后 `openclaw channels login`，然后手动启动 Gateway 网关（`openclaw gateway`）。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

前沿工作流（在终端中运行 Gateway 网关）

目标：开发 TypeScript Gateway 网关，获得热重载，保持 macOS 应用 UI 连接。

### 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

0)（可选）也从源码运行 macOS 应用

如果你也想让 macOS 应用保持前沿：

复制

```
./scripts/restart-mac.sh
```

### 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

1) 启动开发 Gateway 网关

复制

```
pnpm install
pnpm gateway:watch
```

`gateway:watch` 以监视模式运行 Gateway 网关，并在 TypeScript 更改时重新加载。

### 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

2) 将 macOS 应用指向你正在运行的 Gateway 网关

在 **OpenClaw.app** 中：

-   连接模式：**本地** 应用将连接到在配置端口上运行的 Gateway 网关。

### 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

3) 验证

-   应用内 Gateway 网关状态应显示 **“Using existing gateway …”**
-   或通过 CLI：

复制

```
openclaw health
```

### 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

常见陷阱

-   **端口错误：** Gateway 网关 WS 默认为 `ws://127.0.0.1:18789`；保持应用 + CLI 在同一端口上。
-   **状态存储位置：**
    -   凭证：`~/.openclaw/credentials/`
    -   会话：`~/.openclaw/agents/<agentId>/sessions/`
    -   日志：`/tmp/openclaw/`

## 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

凭证存储映射

在调试认证或决定备份什么时使用此映射：

-   **WhatsApp**：`~/.openclaw/credentials/whatsapp/<accountId>/creds.json`
-   **Telegram bot token**：配置/环境变量或 `channels.telegram.tokenFile`
-   **Discord bot token**：配置/环境变量（尚不支持令牌文件）
-   **Slack tokens**：配置/环境变量（`channels.slack.*`）
-   **配对允许列表**：`~/.openclaw/credentials/<channel>-allowFrom.json`
-   **模型认证配置文件**：`~/.openclaw/agents/<agentId>/agent/auth-profiles.json`
-   **旧版 OAuth 导入**：`~/.openclaw/credentials/oauth.json` 更多详情：[安全](https://docs.openclaw.ai/gateway/security)。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

更新（不破坏你的设置）

-   将 `~/.openclaw/workspace` 和 `~/.openclaw/` 保持为”你的东西”；不要将个人提示/配置放入 `openclaw` 仓库。
-   更新源码：`git pull` + `pnpm install`（当锁文件更改时）+ 继续使用 `pnpm gateway:watch`。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

Linux（systemd 用户服务）

Linux 安装使用 systemd **用户**服务。默认情况下，systemd 在注销/空闲时停止用户服务，这会终止 Gateway 网关。新手引导会尝试为你启用 lingering（可能提示 sudo）。如果仍然关闭，运行：

复制

```
sudo loginctl enable-linger $USER
```

对于常驻或多用户服务器，考虑使用**系统**服务而不是用户服务（不需要 lingering）。参阅 [Gateway 网关运行手册](https://docs.openclaw.ai/gateway) 了解 systemd 说明。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/setup)

相关文档

-   [Gateway 网关运行手册](https://docs.openclaw.ai/gateway)（标志、监督、端口）
-   [Gateway 网关配置](https://docs.openclaw.ai/gateway/configuration)（配置模式 + 示例）
-   [Discord](https://docs.openclaw.ai/channels/discord) 和 [Telegram](https://docs.openclaw.ai/channels/telegram)（回复标签 + replyToMode 设置）
-   [OpenClaw 助手设置](https://docs.openclaw.ai/start/openclaw)
-   [macOS 应用](https://docs.openclaw.ai/platforms/macos)（Gateway 网关生命周期）

[会话管理深入了解](https://docs.openclaw.ai/zh-CN/reference/session-management-compaction)[Pi 开发工作流程](https://docs.openclaw.ai/zh-CN/pi-dev)

⌘I
