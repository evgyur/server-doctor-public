<!-- Source: https://docs.openclaw.ai/zh-CN/web/tui -->
<!-- Title: TUI - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/web/tui)

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

##### 网关

-   [
    
    Gateway 网关运行手册
    
    
    
    ](https://docs.openclaw.ai/zh-CN/gateway)

##### 远程访问

-   [
    
    远程访问
    
    
    
    ](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [
    
    远程 Gateway 网关设置
    
    
    
    ](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [
    
    Tailscale
    
    
    
    ](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

##### 运维专题

-   [
    
    网络
    
    
    
    ](https://docs.openclaw.ai/zh-CN/network)
-   [
    
    日志
    
    
    
    ](https://docs.openclaw.ai/zh-CN/logging)

##### 安全

-   [
    
    形式化验证（安全模型）
    
    
    
    ](https://docs.openclaw.ai/zh-CN/security/formal-verification)

##### Web 界面

-   [
    
    Web
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web)
-   [
    
    控制 UI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web/control-ui)
-   [
    
    仪表板
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web/dashboard)
-   [
    
    WebChat
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web/webchat)
-   [
    
    TUI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web/tui)

-   [TUI（终端 UI）](https://docs.openclaw.ai/zh-CN/web/tui)
-   [快速开始](https://docs.openclaw.ai/zh-CN/web/tui)
-   [你看到的内容](https://docs.openclaw.ai/zh-CN/web/tui)
-   [心智模型：智能体 + 会话](https://docs.openclaw.ai/zh-CN/web/tui)
-   [发送 + 投递](https://docs.openclaw.ai/zh-CN/web/tui)
-   [选择器 + 覆盖层](https://docs.openclaw.ai/zh-CN/web/tui)
-   [键盘快捷键](https://docs.openclaw.ai/zh-CN/web/tui)
-   [斜杠命令](https://docs.openclaw.ai/zh-CN/web/tui)
-   [本地 shell 命令](https://docs.openclaw.ai/zh-CN/web/tui)
-   [工具输出](https://docs.openclaw.ai/zh-CN/web/tui)
-   [历史 + 流式传输](https://docs.openclaw.ai/zh-CN/web/tui)
-   [连接详情](https://docs.openclaw.ai/zh-CN/web/tui)
-   [选项](https://docs.openclaw.ai/zh-CN/web/tui)
-   [故障排除](https://docs.openclaw.ai/zh-CN/web/tui)
-   [故障排除](https://docs.openclaw.ai/zh-CN/web/tui)

Web 界面

# TUI

# 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

TUI（终端 UI）

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

快速开始

1.  启动 Gateway 网关。

复制

```
openclaw gateway
```

2.  打开 TUI。

复制

```
openclaw tui
```

3.  输入消息并按 Enter。

远程 Gateway 网关：

复制

```
openclaw tui --url ws://<host>:<port> --token <gateway-token>
```

如果你的 Gateway 网关使用密码认证，请使用 `--password`。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

你看到的内容

-   标题栏：连接 URL、当前智能体、当前会话。
-   聊天日志：用户消息、助手回复、系统通知、工具卡片。
-   状态行：连接/运行状态（连接中、运行中、流式传输中、空闲、错误）。
-   页脚：连接状态 + 智能体 + 会话 + 模型 + think/verbose/reasoning + token 计数 + 投递状态。
-   输入：带自动完成的文本编辑器。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

心智模型：智能体 + 会话

-   智能体是唯一的标识符（例如 `main`、`research`）。Gateway 网关公开列表。
-   会话属于当前智能体。
-   会话键存储为 `agent:<agentId>:<sessionKey>`。
    -   如果你输入 `/session main`，TUI 会将其扩展为 `agent:<currentAgent>:main`。
    -   如果你输入 `/session agent:other:main`，你会显式切换到该智能体会话。
-   会话范围：
    -   `per-sender`（默认）：每个智能体有多个会话。
    -   `global`：TUI 始终使用 `global` 会话（选择器可能为空）。
-   当前智能体 + 会话始终在页脚中可见。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

发送 + 投递

-   消息发送到 Gateway 网关；默认情况下不投递到提供商。
-   开启投递：
    -   `/deliver on`
    -   或设置面板
    -   或使用 `openclaw tui --deliver` 启动

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

选择器 + 覆盖层

-   模型选择器：列出可用模型并设置会话覆盖。
-   智能体选择器：选择不同的智能体。
-   会话选择器：仅显示当前智能体的会话。
-   设置：切换投递、工具输出展开和思考可见性。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

键盘快捷键

-   Enter：发送消息
-   Esc：中止活动运行
-   Ctrl+C：清除输入（按两次退出）
-   Ctrl+D：退出
-   Ctrl+L：模型选择器
-   Ctrl+G：智能体选择器
-   Ctrl+P：会话选择器
-   Ctrl+O：切换工具输出展开
-   Ctrl+T：切换思考可见性（重新加载历史）

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

斜杠命令

核心：

-   `/help`
-   `/status`
-   `/agent <id>`（或 `/agents`）
-   `/session <key>`（或 `/sessions`）
-   `/model <provider/model>`（或 `/models`）

会话控制：

-   `/think <off|minimal|low|medium|high>`
-   `/verbose <on|full|off>`
-   `/reasoning <on|off|stream>`
-   `/usage <off|tokens|full>`
-   `/elevated <on|off|ask|full>`（别名：`/elev`）
-   `/activation <mention|always>`
-   `/deliver <on|off>`

会话生命周期：

-   `/new` 或 `/reset`（重置会话）
-   `/abort`（中止活动运行）
-   `/settings`
-   `/exit`

其他 Gateway 网关斜杠命令（例如 `/context`）会转发到 Gateway 网关并显示为系统输出。参见[斜杠命令](https://docs.openclaw.ai/tools/slash-commands)。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

本地 shell 命令

-   以 `!` 为前缀的行会在 TUI 主机上运行本地 shell 命令。
-   TUI 每个会话会提示一次以允许本地执行；拒绝会在该会话中禁用 `!`。
-   命令在 TUI 工作目录中以全新的非交互式 shell 运行（无持久化 `cd`/环境变量）。
-   单独的 `!` 会作为普通消息发送；前导空格不会触发本地执行。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

工具输出

-   工具调用显示为带有参数 + 结果的卡片。
-   Ctrl+O 在折叠/展开视图之间切换。
-   工具运行时，部分更新会流式传输到同一张卡片。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

历史 + 流式传输

-   连接时，TUI 加载最新历史（默认 200 条消息）。
-   流式响应原地更新直到完成。
-   TUI 还监听智能体工具事件以获得更丰富的工具卡片。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

连接详情

-   TUI 以 `mode: "tui"` 向 Gateway 网关注册。
-   重新连接会显示系统消息；事件间隙会在日志中显示。

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

选项

-   `--url <url>`：Gateway 网关 WebSocket URL（默认为配置或 `ws://127.0.0.1:<port>`）
-   `--token <token>`：Gateway 网关令牌（如果需要）
-   `--password <password>`：Gateway 网关密码（如果需要）
-   `--session <key>`：会话键（默认：`main`，或范围为全局时为 `global`）
-   `--deliver`：将助手回复投递到提供商（默认关闭）
-   `--thinking <level>`：覆盖发送的思考级别
-   `--timeout-ms <ms>`：智能体超时（毫秒）（默认为 `agents.defaults.timeoutSeconds`）

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

故障排除

发送消息后没有输出：

-   在 TUI 中运行 `/status` 以确认 Gateway 网关已连接且处于空闲/忙碌状态。
-   检查 Gateway 网关日志：`openclaw logs --follow`。
-   确认智能体可以运行：`openclaw status` 和 `openclaw models status`。
-   如果你期望消息出现在聊天渠道中，请启用投递（`/deliver on` 或 `--deliver`）。
-   `--history-limit <n>`：要加载的历史条目数（默认 200）

## 

[​

](https://docs.openclaw.ai/zh-CN/web/tui)

故障排除

-   `disconnected`：确保 Gateway 网关正在运行且你的 `--url/--token/--password` 正确。
-   选择器中没有智能体：检查 `openclaw agents list` 和你的路由配置。
-   会话选择器为空：你可能处于全局范围或还没有会话。

[WebChat](https://docs.openclaw.ai/zh-CN/web/webchat)

⌘I
