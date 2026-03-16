<!-- Source: https://docs.openclaw.ai/zh-CN/channels/line -->
<!-- Title: LINE - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/channels/line)

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

-   [LINE（插件）](https://docs.openclaw.ai/zh-CN/channels/line)
-   [需要安装插件](https://docs.openclaw.ai/zh-CN/channels/line)
-   [配置步骤](https://docs.openclaw.ai/zh-CN/channels/line)
-   [配置](https://docs.openclaw.ai/zh-CN/channels/line)
-   [访问控制](https://docs.openclaw.ai/zh-CN/channels/line)
-   [消息行为](https://docs.openclaw.ai/zh-CN/channels/line)
-   [渠道数据（富消息）](https://docs.openclaw.ai/zh-CN/channels/line)
-   [故障排除](https://docs.openclaw.ai/zh-CN/channels/line)

消息平台

# LINE

# 

[​

](https://docs.openclaw.ai/zh-CN/channels/line)

LINE（插件）

LINE 通过 LINE Messaging API 连接到 OpenClaw。该插件作为 webhook 接收器在 Gateway 网关上运行，使用你的 channel access token + channel secret 进行身份验证。 状态：通过插件支持。支持私信、群聊、媒体、位置、Flex 消息、模板消息和快捷回复。不支持表情回应和话题回复。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/line)

需要安装插件

安装 LINE 插件：

复制

```
openclaw plugins install @openclaw/line
```

本地检出（从 git 仓库运行时）：

复制

```
openclaw plugins install ./extensions/line
```

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/line)

配置步骤

1.  创建 LINE Developers 账户并打开控制台： [https://developers.line.biz/console/](https://developers.line.biz/console)
2.  创建（或选择）一个 Provider 并添加 **Messaging API** 渠道。
3.  从渠道设置中复制 **Channel access token** 和 **Channel secret**。
4.  在 Messaging API 设置中启用 **Use webhook**。
5.  将 webhook URL 设置为你的 Gateway 网关端点（必须使用 HTTPS）：

复制

```
https://gateway-host/line/webhook
```

Gateway 网关会响应 LINE 的 webhook 验证（GET）和入站事件（POST）。如果你需要自定义路径，请设置 `channels.line.webhookPath` 或 `channels.line.accounts.<id>.webhookPath` 并相应更新 URL。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/line)

配置

最小配置：

复制

```
{
  channels: {
    line: {
      enabled: true,
      channelAccessToken: "LINE_CHANNEL_ACCESS_TOKEN",
      channelSecret: "LINE_CHANNEL_SECRET",
      dmPolicy: "pairing",
    },
  },
}
```

环境变量（仅限默认账户）：

-   `LINE_CHANNEL_ACCESS_TOKEN`
-   `LINE_CHANNEL_SECRET`

Token/secret 文件：

复制

```
{
  channels: {
    line: {
      tokenFile: "/path/to/line-token.txt",
      secretFile: "/path/to/line-secret.txt",
    },
  },
}
```

多账户配置：

复制

```
{
  channels: {
    line: {
      accounts: {
        marketing: {
          channelAccessToken: "...",
          channelSecret: "...",
          webhookPath: "/line/marketing",
        },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/line)

访问控制

私信默认使用配对模式。未知发送者会收到配对码，其消息在获得批准前会被忽略。

复制

```
openclaw pairing list line
openclaw pairing approve line <CODE>
```

允许列表和策略：

-   `channels.line.dmPolicy`：`pairing | allowlist | open | disabled`
-   `channels.line.allowFrom`：私信的允许列表 LINE 用户 ID
-   `channels.line.groupPolicy`：`allowlist | open | disabled`
-   `channels.line.groupAllowFrom`：群组的允许列表 LINE 用户 ID
-   单群组覆盖：`channels.line.groups.<groupId>.allowFrom`

LINE ID 区分大小写。有效 ID 格式如下：

-   用户：`U` + 32 位十六进制字符
-   群组：`C` + 32 位十六进制字符
-   房间：`R` + 32 位十六进制字符

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/line)

消息行为

-   文本按 5000 字符分块。
-   Markdown 格式会被移除；代码块和表格会尽可能转换为 Flex 卡片。
-   流式响应会被缓冲；智能体处理时，LINE 会收到完整分块并显示加载动画。
-   媒体下载受 `channels.line.mediaMaxMb` 限制（默认 10）。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/line)

渠道数据（富消息）

使用 `channelData.line` 发送快捷回复、位置、Flex 卡片或模板消息。

复制

```
{
  text: "Here you go",
  channelData: {
    line: {
      quickReplies: ["Status", "Help"],
      location: {
        title: "Office",
        address: "123 Main St",
        latitude: 35.681236,
        longitude: 139.767125,
      },
      flexMessage: {
        altText: "Status card",
        contents: {
          /* Flex payload */
        },
      },
      templateMessage: {
        type: "confirm",
        text: "Proceed?",
        confirmLabel: "Yes",
        confirmData: "yes",
        cancelLabel: "No",
        cancelData: "no",
      },
    },
  },
}
```

LINE 插件还提供 `/card` 命令用于 Flex 消息预设：

复制

```
/card info "Welcome" "Thanks for joining!"
```

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/line)

故障排除

-   **Webhook 验证失败：** 确保 webhook URL 使用 HTTPS 且 `channelSecret` 与 LINE 控制台中的一致。
-   **没有入站事件：** 确认 webhook 路径与 `channels.line.webhookPath` 匹配，且 Gateway 网关可从 LINE 访问。
-   **媒体下载错误：** 如果媒体超过默认限制，请提高 `channels.line.mediaMaxMb`。

[iMessage](https://docs.openclaw.ai/zh-CN/channels/imessage)[Matrix](https://docs.openclaw.ai/zh-CN/channels/matrix)

⌘I
