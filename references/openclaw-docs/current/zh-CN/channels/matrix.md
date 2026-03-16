<!-- Source: https://docs.openclaw.ai/zh-CN/channels/matrix -->
<!-- Title: Matrix - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/channels/matrix)

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

-   [Matrix（插件）](https://docs.openclaw.ai/zh-CN/channels/matrix)
-   [需要插件](https://docs.openclaw.ai/zh-CN/channels/matrix)
-   [设置](https://docs.openclaw.ai/zh-CN/channels/matrix)
-   [加密（E2EE）](https://docs.openclaw.ai/zh-CN/channels/matrix)
-   [路由模型](https://docs.openclaw.ai/zh-CN/channels/matrix)
-   [访问控制（私信）](https://docs.openclaw.ai/zh-CN/channels/matrix)
-   [房间（群组）](https://docs.openclaw.ai/zh-CN/channels/matrix)
-   [话题](https://docs.openclaw.ai/zh-CN/channels/matrix)
-   [功能](https://docs.openclaw.ai/zh-CN/channels/matrix)
-   [配置参考（Matrix）](https://docs.openclaw.ai/zh-CN/channels/matrix)

消息平台

# Matrix

# 

[​

](https://docs.openclaw.ai/zh-CN/channels/matrix)

Matrix（插件）

Matrix 是一个开放的去中心化消息协议。OpenClaw 以 Matrix **用户**身份连接到任意主服务器，因此你需要为机器人创建一个 Matrix 账户。登录后，你可以直接私信机器人或邀请它加入房间（Matrix”群组”）。Beeper 也是一个有效的客户端选项，但它需要启用 E2EE。 状态：通过插件（@vector-im/matrix-bot-sdk）支持。支持私信、房间、话题、媒体、表情回应、投票（发送 + poll-start 作为文本）、位置和 E2EE（需要加密支持）。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/matrix)

需要插件

Matrix 作为插件提供，不包含在核心安装中。 通过 CLI 安装（npm 仓库）：

复制

```
openclaw plugins install @openclaw/matrix
```

本地检出（从 git 仓库运行时）：

复制

```
openclaw plugins install ./extensions/matrix
```

如果你在配置/新手引导期间选择 Matrix 并检测到 git 检出，OpenClaw 将自动提供本地安装路径。 详情：[插件](https://docs.openclaw.ai/tools/plugin)

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/matrix)

设置

1.  安装 Matrix 插件：
    -   从 npm：`openclaw plugins install @openclaw/matrix`
    -   从本地检出：`openclaw plugins install ./extensions/matrix`
2.  在主服务器上创建 Matrix 账户：
    -   在 [https://matrix.org/ecosystem/hosting/](https://matrix.org/ecosystem/hosting) 浏览托管选项
    -   或自行托管。
3.  获取机器人账户的访问令牌：
    
    -   在你的主服务器上使用 `curl` 调用 Matrix 登录 API：
    
    复制
    
    ```
    curl --request POST \
      --url https://matrix.example.org/_matrix/client/v3/login \
      --header 'Content-Type: application/json' \
      --data '{
      "type": "m.login.password",
      "identifier": {
        "type": "m.id.user",
        "user": "your-user-name"
      },
      "password": "your-password"
    }'
    ```
    
    -   将 `matrix.example.org` 替换为你的主服务器 URL。
    -   或设置 `channels.matrix.userId` + `channels.matrix.password`：OpenClaw 会调用相同的登录端点，将访问令牌存储在 `~/.openclaw/credentials/matrix/credentials.json`，并在下次启动时重用。
4.  配置凭证：
    -   环境变量：`MATRIX_HOMESERVER`、`MATRIX_ACCESS_TOKEN`（或 `MATRIX_USER_ID` + `MATRIX_PASSWORD`）
    -   或配置：`channels.matrix.*`
    -   如果两者都设置，配置优先。
    -   使用访问令牌时：用户 ID 通过 `/whoami` 自动获取。
    -   设置时，`channels.matrix.userId` 应为完整的 Matrix ID（示例：`@bot:example.org`）。
5.  重启 Gateway 网关（或完成新手引导）。
6.  从任何 Matrix 客户端（Element、Beeper 等；参见 [https://matrix.org/ecosystem/clients/）与机器人开始私信或邀请它加入房间。Beeper](https://matrix.org/ecosystem/clients/%EF%BC%89%E4%B8%8E%E6%9C%BA%E5%99%A8%E4%BA%BA%E5%BC%80%E5%A7%8B%E7%A7%81%E4%BF%A1%E6%88%96%E9%82%80%E8%AF%B7%E5%AE%83%E5%8A%A0%E5%85%A5%E6%88%BF%E9%97%B4%E3%80%82Beeper) 需要 E2EE，因此请设置 `channels.matrix.encryption: true` 并验证设备。

最小配置（访问令牌，用户 ID 自动获取）：

复制

```
{
  channels: {
    matrix: {
      enabled: true,
      homeserver: "https://matrix.example.org",
      accessToken: "syt_***",
      dm: { policy: "pairing" },
    },
  },
}
```

E2EE 配置（启用端到端加密）：

复制

```
{
  channels: {
    matrix: {
      enabled: true,
      homeserver: "https://matrix.example.org",
      accessToken: "syt_***",
      encryption: true,
      dm: { policy: "pairing" },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/matrix)

加密（E2EE）

通过 Rust 加密 SDK **支持**端到端加密。 使用 `channels.matrix.encryption: true` 启用：

-   如果加密模块加载成功，加密房间会自动解密。
-   发送到加密房间时，出站媒体会被加密。
-   首次连接时，OpenClaw 会向你的其他会话请求设备验证。
-   在另一个 Matrix 客户端（Element 等）中验证设备以启用密钥共享。
-   如果无法加载加密模块，E2EE 将被禁用，加密房间将无法解密；OpenClaw 会记录警告。
-   如果你看到缺少加密模块的错误（例如 `@matrix-org/matrix-sdk-crypto-nodejs-*`），请允许 `@matrix-org/matrix-sdk-crypto-nodejs` 的构建脚本并运行 `pnpm rebuild @matrix-org/matrix-sdk-crypto-nodejs`，或使用 `node node_modules/@matrix-org/matrix-sdk-crypto-nodejs/download-lib.js` 获取二进制文件。

加密状态按账户 + 访问令牌存储在 `~/.openclaw/matrix/accounts/<account>/<homeserver>__<user>/<token-hash>/crypto/`（SQLite 数据库）。同步状态存储在同目录的 `bot-storage.json` 中。如果访问令牌（设备）更改，将创建新的存储，机器人必须重新验证才能访问加密房间。 **设备验证：** 启用 E2EE 时，机器人将在启动时向你的其他会话请求验证。打开 Element（或其他客户端）并批准验证请求以建立信任。验证后，机器人可以解密加密房间中的消息。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/matrix)

路由模型

-   回复始终返回到 Matrix。
-   私信共享智能体的主会话；房间映射到群组会话。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/matrix)

访问控制（私信）

-   默认：`channels.matrix.dm.policy = "pairing"`。未知发送者会收到配对码。
-   通过以下方式批准：
    -   `openclaw pairing list matrix`
    -   `openclaw pairing approve matrix <CODE>`
-   公开私信：`channels.matrix.dm.policy="open"` 加上 `channels.matrix.dm.allowFrom=["*"]`。
-   `channels.matrix.dm.allowFrom` 仅接受完整 Matrix 用户 ID（例如 `@user:server`）。向导仅在目录搜索得到唯一精确匹配时将显示名称解析为用户 ID。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/matrix)

房间（群组）

-   默认：`channels.matrix.groupPolicy = "allowlist"`（提及门控）。使用 `channels.defaults.groupPolicy` 在未设置时覆盖默认值。
-   使用 `channels.matrix.groups` 配置房间允许列表（房间 ID 或别名；名称仅在目录搜索得到唯一精确匹配时解析为 ID）：

复制

```
{
  channels: {
    matrix: {
      groupPolicy: "allowlist",
      groups: {
        "!roomId:example.org": { allow: true },
        "#alias:example.org": { allow: true },
      },
      groupAllowFrom: ["@owner:example.org"],
    },
  },
}
```

-   `requireMention: false` 启用该房间的自动回复。
-   `groups."*"` 可以设置跨房间的提及门控默认值。
-   `groupAllowFrom` 限制哪些发送者可以在房间中触发机器人（需完整 Matrix 用户 ID）。
-   每个房间的 `users` 允许列表可以进一步限制特定房间内的发送者（需完整 Matrix 用户 ID）。
-   配置向导会提示输入房间允许列表（房间 ID、别名或名称），仅在精确且唯一匹配时解析名称。
-   启动时，OpenClaw 将允许列表中的房间/用户名称解析为 ID 并记录映射；未解析的条目不会参与允许列表匹配。
-   默认自动加入邀请；使用 `channels.matrix.autoJoin` 和 `channels.matrix.autoJoinAllowlist` 控制。
-   要**禁止所有房间**，设置 `channels.matrix.groupPolicy: "disabled"`（或保持空的允许列表）。
-   旧版键名：`channels.matrix.rooms`（与 `groups` 相同的结构）。

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/matrix)

话题

-   支持回复话题。
-   `channels.matrix.threadReplies` 控制回复是否保持在话题中：
    -   `off`、`inbound`（默认）、`always`
-   `channels.matrix.replyToMode` 控制不在话题中回复时的 reply-to 元数据：
    -   `off`（默认）、`first`、`all`

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/matrix)

功能

| 功能 | 状态 |
| --- | --- |
| 私信 | ✅ 支持 |
| 房间 | ✅ 支持 |
| 话题 | ✅ 支持 |
| 媒体 | ✅ 支持 |
| E2EE | ✅ 支持（需要加密模块） |
| 表情回应 | ✅ 支持（通过工具发送/读取） |
| 投票 | ✅ 支持发送；入站投票开始转换为文本（响应/结束被忽略） |
| 位置 | ✅ 支持（geo URI；忽略海拔） |
| 原生命令 | ✅ 支持 |

## 

[​

](https://docs.openclaw.ai/zh-CN/channels/matrix)

配置参考（Matrix）

完整配置：[配置](https://docs.openclaw.ai/gateway/configuration) 提供商选项：

-   `channels.matrix.enabled`：启用/禁用渠道启动。
-   `channels.matrix.homeserver`：主服务器 URL。
-   `channels.matrix.userId`：Matrix 用户 ID（使用访问令牌时可选）。
-   `channels.matrix.accessToken`：访问令牌。
-   `channels.matrix.password`：登录密码（令牌会被存储）。
-   `channels.matrix.deviceName`：设备显示名称。
-   `channels.matrix.encryption`：启用 E2EE（默认：false）。
-   `channels.matrix.initialSyncLimit`：初始同步限制。
-   `channels.matrix.threadReplies`：`off | inbound | always`（默认：inbound）。
-   `channels.matrix.textChunkLimit`：出站文本分块大小（字符）。
-   `channels.matrix.chunkMode`：`length`（默认）或 `newline` 在长度分块前按空行（段落边界）分割。
-   `channels.matrix.dm.policy`：`pairing | allowlist | open | disabled`（默认：pairing）。
-   `channels.matrix.dm.allowFrom`：私信允许列表（需完整 Matrix 用户 ID）。`open` 需要 `"*"`。向导在可能时将名称解析为 ID。
-   `channels.matrix.groupPolicy`：`allowlist | open | disabled`（默认：allowlist）。
-   `channels.matrix.groupAllowFrom`：群组消息的允许发送者列表（需完整 Matrix 用户 ID）。
-   `channels.matrix.allowlistOnly`：强制私信 + 房间使用允许列表规则。
-   `channels.matrix.groups`：群组允许列表 + 每个房间的设置映射。
-   `channels.matrix.rooms`：旧版群组允许列表/配置。
-   `channels.matrix.replyToMode`：话题/标签的 reply-to 模式。
-   `channels.matrix.mediaMaxMb`：入站/出站媒体上限（MB）。
-   `channels.matrix.autoJoin`：邀请处理（`always | allowlist | off`，默认：always）。
-   `channels.matrix.autoJoinAllowlist`：自动加入的允许房间 ID/别名。
-   `channels.matrix.actions`：每个操作的工具限制（reactions/messages/pins/memberInfo/channelInfo）。

[LINE](https://docs.openclaw.ai/zh-CN/channels/line)[Mattermost](https://docs.openclaw.ai/zh-CN/channels/mattermost)

⌘I
