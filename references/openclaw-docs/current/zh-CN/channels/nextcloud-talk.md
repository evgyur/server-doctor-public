<!-- Source: https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk -->
<!-- Title: Nextcloud Talk - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)

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

-   [Nextcloud Talk（插件）](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)
-   [需要插件](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)
-   [快速设置（新手）](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)
-   [注意事项](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)
-   [访问控制（私信）](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)
-   [房间（群组）](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)
-   [功能支持](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)
-   [配置参考（Nextcloud Talk）](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)

消息平台

# Nextcloud Talk

# 

[​

](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)

Nextcloud Talk（插件）

状态：通过插件支持（webhook 机器人）。支持私信、房间、表情回应和 Markdown 消息。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)

需要插件

Nextcloud Talk 以插件形式提供，不包含在核心安装包中。 通过 CLI 安装（npm 仓库）：

复制

```
openclaw plugins install @openclaw/nextcloud-talk
```

本地检出安装（从 git 仓库运行时）：

复制

```
openclaw plugins install ./extensions/nextcloud-talk
```

如果你在配置/新手引导过程中选择了 Nextcloud Talk，并且检测到 git 检出， OpenClaw 将自动提供本地安装路径。 详情：[插件](https://docs.openclaw.ai/tools/plugin)

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)

快速设置（新手）

1.  安装 Nextcloud Talk 插件。
2.  在你的 Nextcloud 服务器上创建机器人：
    
    复制
    
    ```
    ./occ talk:bot:install "OpenClaw" "<shared-secret>" "<webhook-url>" --feature reaction
    ```
    
3.  在目标房间设置中启用机器人。
4.  配置 OpenClaw：
    -   配置项：`channels.nextcloud-talk.baseUrl` + `channels.nextcloud-talk.botSecret`
    -   或环境变量：`NEXTCLOUD_TALK_BOT_SECRET`（仅默认账户）
5.  重启 Gateway 网关（或完成新手引导）。

最小配置：

复制

```
{
  channels: {
    "nextcloud-talk": {
      enabled: true,
      baseUrl: "https://cloud.example.com",
      botSecret: "shared-secret",
      dmPolicy: "pairing",
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)

注意事项

-   机器人无法主动发起私信。用户必须先向机器人发送消息。
-   Webhook URL 必须可被 Gateway 网关访问；如果在代理后面，请设置 `webhookPublicUrl`。
-   机器人 API 不支持媒体上传；媒体以 URL 形式发送。
-   Webhook 载荷无法区分私信和房间；设置 `apiUser` + `apiPassword` 以启用房间类型查询（否则私信将被视为房间）。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)

访问控制（私信）

-   默认：`channels.nextcloud-talk.dmPolicy = "pairing"`。未知发送者将收到配对码。
-   批准方式：
    -   `openclaw pairing list nextcloud-talk`
    -   `openclaw pairing approve nextcloud-talk <CODE>`
-   公开私信：`channels.nextcloud-talk.dmPolicy="open"` 加上 `channels.nextcloud-talk.allowFrom=["*"]`。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)

房间（群组）

-   默认：`channels.nextcloud-talk.groupPolicy = "allowlist"`（需要提及触发）。
-   使用 `channels.nextcloud-talk.rooms` 设置房间白名单：

复制

```
{
  channels: {
    "nextcloud-talk": {
      rooms: {
        "room-token": { requireMention: true },
      },
    },
  },
}
```

-   如需禁止所有房间，保持白名单为空或设置 `channels.nextcloud-talk.groupPolicy="disabled"`。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)

功能支持

| 功能 | 状态 |
| --- | --- |
| 私信 | 支持 |
| 房间 | 支持 |
| 话题 | 不支持 |
| 媒体 | 仅 URL |
| 表情回应 | 支持 |
| 原生命令 | 不支持 |

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/nextcloud-talk)

配置参考（Nextcloud Talk）

完整配置：[配置](https://docs.openclaw.ai/gateway/configuration) 提供商选项：

-   `channels.nextcloud-talk.enabled`：启用/禁用渠道启动。
-   `channels.nextcloud-talk.baseUrl`：Nextcloud 实例 URL。
-   `channels.nextcloud-talk.botSecret`：机器人共享密钥。
-   `channels.nextcloud-talk.botSecretFile`：密钥文件路径。
-   `channels.nextcloud-talk.apiUser`：用于房间查询的 API 用户（私信检测）。
-   `channels.nextcloud-talk.apiPassword`：用于房间查询的 API/应用密码。
-   `channels.nextcloud-talk.apiPasswordFile`：API 密码文件路径。
-   `channels.nextcloud-talk.webhookPort`：webhook 监听端口（默认：8788）。
-   `channels.nextcloud-talk.webhookHost`：webhook 主机（默认：0.0.0.0）。
-   `channels.nextcloud-talk.webhookPath`：webhook 路径（默认：/nextcloud-talk-webhook）。
-   `channels.nextcloud-talk.webhookPublicUrl`：外部可达的 webhook URL。
-   `channels.nextcloud-talk.dmPolicy`：`pairing | allowlist | open | disabled`。
-   `channels.nextcloud-talk.allowFrom`：私信白名单（用户 ID）。`open` 需要 `"*"`。
-   `channels.nextcloud-talk.groupPolicy`：`allowlist | open | disabled`。
-   `channels.nextcloud-talk.groupAllowFrom`：群组白名单（用户 ID）。
-   `channels.nextcloud-talk.rooms`：每个房间的设置和白名单。
-   `channels.nextcloud-talk.historyLimit`：群组历史记录限制（0 表示禁用）。
-   `channels.nextcloud-talk.dmHistoryLimit`：私信历史记录限制（0 表示禁用）。
-   `channels.nextcloud-talk.dms`：每个私信的覆盖设置（historyLimit）。
-   `channels.nextcloud-talk.textChunkLimit`：出站文本分块大小（字符数）。
-   `channels.nextcloud-talk.chunkMode`：`length`（默认）或 `newline`，在长度分块前按空行（段落边界）分割。
-   `channels.nextcloud-talk.blockStreaming`：禁用此渠道的分块流式传输。
-   `channels.nextcloud-talk.blockStreamingCoalesce`：分块流式传输合并调优。
-   `channels.nextcloud-talk.mediaMaxMb`：入站媒体大小上限（MB）。

[Microsoft Teams](https://docs.openclaw.ai/zh-CN/channels/msteams)[Nostr](https://docs.openclaw.ai/zh-CN/channels/nostr)

⌘I
