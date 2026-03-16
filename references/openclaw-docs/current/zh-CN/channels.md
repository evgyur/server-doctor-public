<!-- Source: https://docs.openclaw.ai/zh-CN/channels -->
<!-- Title: 聊天渠道 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/channels)

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

-   [聊天渠道](https://docs.openclaw.ai/zh-CN/channels)
-   [支持的渠道](https://docs.openclaw.ai/zh-CN/channels)
-   [注意事项](https://docs.openclaw.ai/zh-CN/channels)

概览

# 聊天渠道

# 

[​

](https://docs.openclaw.ai/zh-CN/channels)

聊天渠道

OpenClaw 可以在你已经使用的任何聊天应用上与你交流。每个渠道通过 Gateway 网关连接。 所有渠道都支持文本；媒体和表情回应的支持因渠道而异。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels)

支持的渠道

-   [BlueBubbles](https://docs.openclaw.ai/channels/bluebubbles) — **推荐用于 iMessage**；使用 BlueBubbles macOS 服务器 REST API，功能完整（编辑、撤回、特效、回应、群组管理——编辑功能在 macOS 26 Tahoe 上目前不可用）。
-   [Discord](https://docs.openclaw.ai/channels/discord) — Discord Bot API + Gateway；支持服务器、频道和私信。
-   [飞书](https://docs.openclaw.ai/channels/feishu) — 飞书（Lark）机器人（插件，需单独安装）。
-   [Google Chat](https://docs.openclaw.ai/channels/googlechat) — 通过 HTTP webhook 的 Google Chat API 应用。
-   [iMessage（旧版）](https://docs.openclaw.ai/channels/imessage) — 通过 imsg CLI 的旧版 macOS 集成（已弃用，新设置请使用 BlueBubbles）。
-   [LINE](https://docs.openclaw.ai/channels/line) — LINE Messaging API 机器人（插件，需单独安装）。
-   [Matrix](https://docs.openclaw.ai/channels/matrix) — Matrix 协议（插件，需单独安装）。
-   [Mattermost](https://docs.openclaw.ai/channels/mattermost) — Bot API + WebSocket；频道、群组、私信（插件，需单独安装）。
-   [Microsoft Teams](https://docs.openclaw.ai/channels/msteams) — Bot Framework；企业支持（插件，需单独安装）。
-   [Nextcloud Talk](https://docs.openclaw.ai/channels/nextcloud-talk) — 通过 Nextcloud Talk 的自托管聊天（插件，需单独安装）。
-   [Nostr](https://docs.openclaw.ai/channels/nostr) — 通过 NIP-04 的去中心化私信（插件，需单独安装）。
-   [Signal](https://docs.openclaw.ai/channels/signal) — signal-cli；注重隐私。
-   [Slack](https://docs.openclaw.ai/channels/slack) — Bolt SDK；工作区应用。
-   [Telegram](https://docs.openclaw.ai/channels/telegram) — 通过 grammY 使用 Bot API；支持群组。
-   [Tlon](https://docs.openclaw.ai/channels/tlon) — 基于 Urbit 的消息应用（插件，需单独安装）。
-   [Twitch](https://docs.openclaw.ai/channels/twitch) — 通过 IRC 连接的 Twitch 聊天（插件，需单独安装）。
-   [WebChat](https://docs.openclaw.ai/web/webchat) — 基于 WebSocket 的 Gateway 网关 WebChat 界面。
-   [WhatsApp](https://docs.openclaw.ai/channels/whatsapp) — 最受欢迎；使用 Baileys，需要二维码配对。
-   [Zalo](https://docs.openclaw.ai/channels/zalo) — Zalo Bot API；越南流行的消息应用（插件，需单独安装）。
-   [Zalo Personal](https://docs.openclaw.ai/channels/zalouser) — 通过二维码登录的 Zalo 个人账号（插件，需单独安装）。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels)

注意事项

-   渠道可以同时运行；配置多个渠道后，OpenClaw 会按聊天进行路由。
-   最快的设置方式通常是 **Telegram**（简单的机器人令牌）。WhatsApp 需要二维码配对， 并在磁盘上存储更多状态。
-   群组行为因渠道而异；参见[群组](https://docs.openclaw.ai/channels/groups)。
-   为安全起见，私信配对和允许列表会被强制执行；参见[安全](https://docs.openclaw.ai/gateway/security)。
-   Telegram 内部机制：[grammY 说明](https://docs.openclaw.ai/channels/grammy)。
-   故障排除：[渠道故障排除](https://docs.openclaw.ai/channels/troubleshooting)。
-   模型提供商单独记录；参见[模型提供商](https://docs.openclaw.ai/providers/models)。

[BlueBubbles](https://docs.openclaw.ai/zh-CN/channels/bluebubbles)

⌘I
