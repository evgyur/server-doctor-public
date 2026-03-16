<!-- Source: https://docs.openclaw.ai/zh-CN/channels/channel-routing -->
<!-- Title: 渠道路由 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/channels/channel-routing)

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

##### 概览

-   [
    
    聊天渠道
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels)

##### 消息平台

-   [
    
    BlueBubbles
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/bluebubbles)
-   [
    
    Discord
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/discord)
-   [
    
    飞书
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/feishu)
-   [
    
    grammY
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/grammy)
-   [
    
    Google Chat
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/googlechat)
-   [
    
    iMessage
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/imessage)
-   [
    
    LINE
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/line)
-   [
    
    Matrix
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/matrix)
-   [
    
    Mattermost
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/mattermost)
-   [
    
    Microsoft Teams
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/msteams)
-   [
    
    Nextcloud Talk
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)
-   [
    
    Nostr
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/nostr)
-   [
    
    Signal
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/signal)
-   [
    
    Slack
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/slack)
-   [
    
    Telegram
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/telegram)
-   [
    
    Tlon
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/tlon)
-   [
    
    Twitch
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/twitch)
-   [
    
    WhatsApp
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/whatsapp)
-   [
    
    Zalo
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/zalo)
-   [
    
    Zalo Personal
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/zalouser)

##### 配置

-   [
    
    配对
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/pairing)
-   [
    
    群组消息
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/group-messages)
-   [
    
    群组
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/groups)
-   [
    
    广播群组
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/broadcast-groups)
-   [
    
    渠道路由
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/channel-routing)
-   [
    
    渠道位置解析
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/location)
-   [
    
    渠道故障排除
    
    
    
    ](https://docs.openclaw.ai/zh-CN/channels/troubleshooting)

-   [渠道与路由](https://docs.openclaw.ai/zh-CN/channels/channel-routing)
-   [关键术语](https://docs.openclaw.ai/zh-CN/channels/channel-routing)
-   [会话键格式（示例）](https://docs.openclaw.ai/zh-CN/channels/channel-routing)
-   [路由规则（如何选择智能体）](https://docs.openclaw.ai/zh-CN/channels/channel-routing)
-   [广播组（运行多个智能体）](https://docs.openclaw.ai/zh-CN/channels/channel-routing)
-   [配置概览](https://docs.openclaw.ai/zh-CN/channels/channel-routing)
-   [会话存储](https://docs.openclaw.ai/zh-CN/channels/channel-routing)
-   [WebChat 行为](https://docs.openclaw.ai/zh-CN/channels/channel-routing)
-   [回复上下文](https://docs.openclaw.ai/zh-CN/channels/channel-routing)

配置

# 渠道路由

# 

[​

](https://docs.openclaw.ai/zh-CN/channels/channel-routing)

渠道与路由

OpenClaw 将回复**路由回消息来源的渠道**。模型不会选择渠道；路由是确定性的，由主机配置控制。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/channel-routing)

关键术语

-   **渠道**：`whatsapp`、`telegram`、`discord`、`slack`、`signal`、`imessage`、`webchat`。
-   **AccountId**：每个渠道的账户实例（在支持的情况下）。
-   **AgentId**：隔离的工作区 + 会话存储（“大脑”）。
-   **SessionKey**：用于存储上下文和控制并发的桶键。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/channel-routing)

会话键格式（示例）

私信会折叠到智能体的**主**会话：

-   `agent:<agentId>:<mainKey>`（默认：`agent:main:main`）

群组和渠道按渠道隔离：

-   群组：`agent:<agentId>:<channel>:group:<id>`
-   渠道/房间：`agent:<agentId>:<channel>:channel:<id>`

线程：

-   Slack/Discord 线程会在基础键后追加 `:thread:<threadId>`。
-   Telegram 论坛主题在群组键中嵌入 `:topic:<topicId>`。

示例：

-   `agent:main:telegram:group:-1001234567890:topic:42`
-   `agent:main:discord:channel:123456:thread:987654`

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/channel-routing)

路由规则（如何选择智能体）

路由为每条入站消息选择**一个智能体**：

1.  **精确对端匹配**（`bindings` 中的 `peer.kind` + `peer.id`）。
2.  **Guild 匹配**（Discord）通过 `guildId`。
3.  **Team 匹配**（Slack）通过 `teamId`。
4.  **账户匹配**（渠道上的 `accountId`）。
5.  **渠道匹配**（该渠道上的任意账户）。
6.  **默认智能体**（`agents.list[].default`，否则取列表第一项，兜底为 `main`）。

匹配到的智能体决定使用哪个工作区和会话存储。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/channel-routing)

广播组（运行多个智能体）

广播组允许你为同一对端运行**多个智能体**，**在 OpenClaw 正常回复时**触发（例如：在 WhatsApp 群组中，经过提及/激活门控之后）。 配置：

复制

```
{
  broadcast: {
    strategy: "parallel",
    "120363403215116621@g.us": ["alfred", "baerbel"],
    "+15555550123": ["support", "logger"],
  },
}
```

参见：[广播组](https://docs.openclaw.ai/channels/broadcast-groups)。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/channel-routing)

配置概览

-   `agents.list`：命名的智能体定义（工作区、模型等）。
-   `bindings`：将入站渠道/账户/对端映射到智能体。

示例：

复制

```
{
  agents: {
    list: [{ id: "support", name: "Support", workspace: "~/.openclaw/workspace-support" }],
  },
  bindings: [
    { match: { channel: "slack", teamId: "T123" }, agentId: "support" },
    { match: { channel: "telegram", peer: { kind: "group", id: "-100123" } }, agentId: "support" },
  ],
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/channel-routing)

会话存储

会话存储位于状态目录下（默认 `~/.openclaw`）：

-   `~/.openclaw/agents/<agentId>/sessions/sessions.json`
-   JSONL 记录文件与存储位于同一目录

你可以通过 `session.store` 和 `{agentId}` 模板来覆盖存储路径。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/channel-routing)

WebChat 行为

WebChat 连接到**所选智能体**，并默认使用该智能体的主会话。因此，WebChat 让你可以在一个地方查看该智能体的跨渠道上下文。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/channel-routing)

回复上下文

入站回复包含：

-   `ReplyToId`、`ReplyToBody` 和 `ReplyToSender`（在可用时）。
-   引用的上下文会以 `[Replying to ...]` 块的形式追加到 `Body` 中。

这在所有渠道中保持一致。

[广播群组](https://docs.openclaw.ai/zh-CN/channels/broadcast-groups)[渠道位置解析](https://docs.openclaw.ai/zh-CN/channels/location)

⌘I
