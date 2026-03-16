<!-- Source: https://docs.openclaw.ai/zh-CN/channels/location -->
<!-- Title: 渠道位置解析 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/channels/location)

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

-   [渠道位置解析](https://docs.openclaw.ai/zh-CN/channels/location)
-   [文本格式](https://docs.openclaw.ai/zh-CN/channels/location)
-   [上下文字段](https://docs.openclaw.ai/zh-CN/channels/location)
-   [渠道说明](https://docs.openclaw.ai/zh-CN/channels/location)

配置

# 渠道位置解析

# 

[​

](https://docs.openclaw.ai/zh-CN/channels/location)

渠道位置解析

OpenClaw 将聊天渠道中分享的位置标准化为：

-   附加到入站消息体的可读文本，以及
-   自动回复上下文负载中的结构化字段。

目前支持：

-   **Telegram**（位置图钉 + 地点 + 实时位置）
-   **WhatsApp**（locationMessage + liveLocationMessage）
-   **Matrix**（`m.location` 配合 `geo_uri`）

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/location)

文本格式

位置以友好的行格式呈现，不带括号：

-   图钉：
    -   `📍 48.858844, 2.294351 ±12m`
-   命名地点：
    -   `📍 Eiffel Tower — Champ de Mars, Paris (48.858844, 2.294351 ±12m)`
-   实时分享：
    -   `🛰 Live location: 48.858844, 2.294351 ±12m`

如果渠道包含标题/评论，会附加在下一行：

复制

```
📍 48.858844, 2.294351 ±12m
Meet here
```

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/location)

上下文字段

当存在位置信息时，以下字段会被添加到 `ctx` 中：

-   `LocationLat`（数字）
-   `LocationLon`（数字）
-   `LocationAccuracy`（数字，米；可选）
-   `LocationName`（字符串；可选）
-   `LocationAddress`（字符串；可选）
-   `LocationSource`（`pin | place | live`）
-   `LocationIsLive`（布尔值）

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/location)

渠道说明

-   **Telegram**：地点映射到 `LocationName/LocationAddress`；实时位置使用 `live_period`。
-   **WhatsApp**：`locationMessage.comment` 和 `liveLocationMessage.caption` 作为标题行附加。
-   **Matrix**：`geo_uri` 解析为图钉位置；忽略海拔高度，`LocationIsLive` 始终为 false。

[渠道路由](https://docs.openclaw.ai/zh-CN/channels/channel-routing)[渠道故障排除](https://docs.openclaw.ai/zh-CN/channels/troubleshooting)

⌘I
