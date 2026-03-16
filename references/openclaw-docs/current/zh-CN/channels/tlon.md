<!-- Source: https://docs.openclaw.ai/zh-CN/channels/tlon -->
<!-- Title: Tlon - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/channels/tlon)

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

-   [Tlon（插件）](https://docs.openclaw.ai/zh-CN/channels/tlon)
-   [需要插件](https://docs.openclaw.ai/zh-CN/channels/tlon)
-   [设置](https://docs.openclaw.ai/zh-CN/channels/tlon)
-   [群组频道](https://docs.openclaw.ai/zh-CN/channels/tlon)
-   [访问控制](https://docs.openclaw.ai/zh-CN/channels/tlon)
-   [投递目标（CLI/cron）](https://docs.openclaw.ai/zh-CN/channels/tlon)
-   [注意事项](https://docs.openclaw.ai/zh-CN/channels/tlon)

消息平台

# Tlon

# 

[​

](https://docs.openclaw.ai/zh-CN/channels/tlon)

Tlon（插件）

Tlon 是一个基于 Urbit 构建的去中心化即时通讯工具。OpenClaw 连接到你的 Urbit ship，可以响应私信和群聊消息。群组回复默认需要 @ 提及，并可通过允许列表进一步限制。 状态：通过插件支持。支持私信、群组提及、话题回复和纯文本媒体回退（URL 附加到说明文字）。不支持表情回应、投票和原生媒体上传。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/tlon)

需要插件

Tlon 作为插件提供，不包含在核心安装中。 通过 CLI 安装（npm 仓库）：

复制

```
openclaw plugins install @openclaw/tlon
```

本地检出（从 git 仓库运行时）：

复制

```
openclaw plugins install ./extensions/tlon
```

详情：[插件](https://docs.openclaw.ai/tools/plugin)

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/tlon)

设置

1.  安装 Tlon 插件。
2.  获取你的 ship URL 和登录代码。
3.  配置 `channels.tlon`。
4.  重启 Gateway 网关。
5.  私信机器人或在群组频道中提及它。

最小配置（单账户）：

复制

```
{
  channels: {
    tlon: {
      enabled: true,
      ship: "~sampel-palnet",
      url: "https://your-ship-host",
      code: "lidlut-tabwed-pillex-ridrup",
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/tlon)

群组频道

默认启用自动发现。你也可以手动固定频道：

复制

```
{
  channels: {
    tlon: {
      groupChannels: ["chat/~host-ship/general", "chat/~host-ship/support"],
    },
  },
}
```

禁用自动发现：

复制

```
{
  channels: {
    tlon: {
      autoDiscoverChannels: false,
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/tlon)

访问控制

私信允许列表（空 = 允许全部）：

复制

```
{
  channels: {
    tlon: {
      dmAllowlist: ["~zod", "~nec"],
    },
  },
}
```

群组授权（默认受限）：

复制

```
{
  channels: {
    tlon: {
      defaultAuthorizedShips: ["~zod"],
      authorization: {
        channelRules: {
          "chat/~host-ship/general": {
            mode: "restricted",
            allowedShips: ["~zod", "~nec"],
          },
          "chat/~host-ship/announcements": {
            mode: "open",
          },
        },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/tlon)

投递目标（CLI/cron）

与 `openclaw message send` 或 cron 投递一起使用：

-   私信：`~sampel-palnet` 或 `dm/~sampel-palnet`
-   群组：`chat/~host-ship/channel` 或 `group:~host-ship/channel`

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/tlon)

注意事项

-   群组回复需要提及（例如 `~your-bot-ship`）才能响应。
-   话题回复：如果入站消息在话题中，OpenClaw 会在话题内回复。
-   媒体：`sendMedia` 回退为文本 + URL（无原生上传）。

[Telegram](https://docs.openclaw.ai/zh-CN/channels/telegram)[Twitch](https://docs.openclaw.ai/zh-CN/channels/twitch)

⌘I
