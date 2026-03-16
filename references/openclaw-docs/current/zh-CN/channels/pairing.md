<!-- Source: https://docs.openclaw.ai/zh-CN/channels/pairing -->
<!-- Title: 配对 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/channels/pairing)

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

-   [配对](https://docs.openclaw.ai/zh-CN/channels/pairing)
-   [1）私信配对（入站聊天访问）](https://docs.openclaw.ai/zh-CN/channels/pairing)
-   [批准发送者](https://docs.openclaw.ai/zh-CN/channels/pairing)
-   [状态存储位置](https://docs.openclaw.ai/zh-CN/channels/pairing)
-   [2）节点设备配对（iOS/Android/macOS/无头节点）](https://docs.openclaw.ai/zh-CN/channels/pairing)
-   [批准节点设备](https://docs.openclaw.ai/zh-CN/channels/pairing)
-   [状态存储位置](https://docs.openclaw.ai/zh-CN/channels/pairing)
-   [说明](https://docs.openclaw.ai/zh-CN/channels/pairing)
-   [相关文档](https://docs.openclaw.ai/zh-CN/channels/pairing)

配置

# 配对

# 

[​

](https://docs.openclaw.ai/zh-CN/channels/pairing)

配对

“配对”是 OpenClaw 的显式**所有者批准**步骤。它用于两个地方：

1.  **私信配对**（谁被允许与机器人对话）
2.  **节点配对**（哪些设备/节点被允许加入 Gateway 网关网络）

安全上下文：[安全](https://docs.openclaw.ai/gateway/security)

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/pairing)

1）私信配对（入站聊天访问）

当渠道配置为私信策略 `pairing` 时，未知发送者会收到一个短代码，他们的消息**不会被处理**，直到你批准。 默认私信策略记录在：[安全](https://docs.openclaw.ai/gateway/security) 配对代码：

-   8 个字符，大写，无歧义字符（`0O1I`）。
-   **1 小时后过期**。机器人仅在创建新请求时发送配对消息（大约每个发送者每小时一次）。
-   待处理的私信配对请求默认上限为**每个渠道 3 个**；在一个过期或被批准之前，额外的请求将被忽略。

### 

[​

](https://docs.openclaw.ai/zh-CN/channels/pairing)

批准发送者

复制

```
openclaw pairing list telegram
openclaw pairing approve telegram <CODE>
```

支持的渠道：`telegram`、`whatsapp`、`signal`、`imessage`、`discord`、`slack`。

### 

[​

](https://docs.openclaw.ai/zh-CN/channels/pairing)

状态存储位置

存储在 `~/.openclaw/credentials/` 下：

-   待处理请求：`<channel>-pairing.json`
-   已批准允许列表存储：`<channel>-allowFrom.json`

将这些视为敏感信息（它们控制对你助手的访问）。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/pairing)

2）节点设备配对（iOS/Android/macOS/无头节点）

节点作为 `role: node` 的**设备**连接到 Gateway 网关。Gateway 网关创建一个必须被批准的设备配对请求。

### 

[​

](https://docs.openclaw.ai/zh-CN/channels/pairing)

批准节点设备

复制

```
openclaw devices list
openclaw devices approve <requestId>
openclaw devices reject <requestId>
```

### 

[​

](https://docs.openclaw.ai/zh-CN/channels/pairing)

状态存储位置

存储在 `~/.openclaw/devices/` 下：

-   `pending.json`（短期；待处理请求会过期）
-   `paired.json`（已配对设备 + 令牌）

### 

[​

](https://docs.openclaw.ai/zh-CN/channels/pairing)

说明

-   旧版 `node.pair.*` API（CLI：`openclaw nodes pending/approve`）是一个单独的 Gateway 网关拥有的配对存储。WS 节点仍然需要设备配对。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/pairing)

相关文档

-   安全模型 + 提示注入：[安全](https://docs.openclaw.ai/gateway/security)
-   安全更新（运行 doctor）：[更新](https://docs.openclaw.ai/install/updating)
-   渠道配置：
    -   Telegram：[Telegram](https://docs.openclaw.ai/channels/telegram)
    -   WhatsApp：[WhatsApp](https://docs.openclaw.ai/channels/whatsapp)
    -   Signal：[Signal](https://docs.openclaw.ai/channels/signal)
    -   iMessage：[iMessage](https://docs.openclaw.ai/channels/imessage)
    -   Discord：[Discord](https://docs.openclaw.ai/channels/discord)
    -   Slack：[Slack](https://docs.openclaw.ai/channels/slack)

[Zalo Personal](https://docs.openclaw.ai/zh-CN/channels/zalouser)[群组消息](https://docs.openclaw.ai/zh-CN/channels/group-messages)

⌘I
