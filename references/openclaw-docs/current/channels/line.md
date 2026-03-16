<!-- Source: https://docs.openclaw.ai/channels/line -->
<!-- Title: LINE - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/line)

[OpenClaw home page![light logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)![dark logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)](https://docs.openclaw.ai/)

[Get started

](https://docs.openclaw.ai/)[Install

](https://docs.openclaw.ai/install)[Channels

](https://docs.openclaw.ai/channels)[Agents

](https://docs.openclaw.ai/pi)[Tools

](https://docs.openclaw.ai/tools)[Models

](https://docs.openclaw.ai/providers)[Platforms

](https://docs.openclaw.ai/platforms)[Gateway & Ops

](https://docs.openclaw.ai/gateway)[Reference

](https://docs.openclaw.ai/cli)[Help

](https://docs.openclaw.ai/help)

##### Overview

-   [
    
    Chat Channels
    
    
    
    ](https://docs.openclaw.ai/channels)

##### Messaging platforms

-   [
    
    BlueBubbles
    
    
    
    ](https://docs.openclaw.ai/channels/bluebubbles)
-   [
    
    Discord
    
    
    
    ](https://docs.openclaw.ai/channels/discord)
-   [
    
    Feishu
    
    
    
    ](https://docs.openclaw.ai/channels/feishu)
-   [
    
    Google Chat
    
    
    
    ](https://docs.openclaw.ai/channels/googlechat)
-   [
    
    iMessage
    
    
    
    ](https://docs.openclaw.ai/channels/imessage)
-   [
    
    IRC
    
    
    
    ](https://docs.openclaw.ai/channels/irc)
-   [
    
    LINE
    
    
    
    ](https://docs.openclaw.ai/channels/line)
-   [
    
    Matrix
    
    
    
    ](https://docs.openclaw.ai/channels/matrix)
-   [
    
    Mattermost
    
    
    
    ](https://docs.openclaw.ai/channels/mattermost)
-   [
    
    Microsoft Teams
    
    
    
    ](https://docs.openclaw.ai/channels/msteams)
-   [
    
    Nextcloud Talk
    
    
    
    ](https://docs.openclaw.ai/channels/nextcloud-talk)
-   [
    
    Nostr
    
    
    
    ](https://docs.openclaw.ai/channels/nostr)
-   [
    
    Signal
    
    
    
    ](https://docs.openclaw.ai/channels/signal)
-   [
    
    Synology Chat
    
    
    
    ](https://docs.openclaw.ai/channels/synology-chat)
-   [
    
    Slack
    
    
    
    ](https://docs.openclaw.ai/channels/slack)
-   [
    
    Telegram
    
    
    
    ](https://docs.openclaw.ai/channels/telegram)
-   [
    
    Tlon
    
    
    
    ](https://docs.openclaw.ai/channels/tlon)
-   [
    
    Twitch
    
    
    
    ](https://docs.openclaw.ai/channels/twitch)
-   [
    
    WhatsApp
    
    
    
    ](https://docs.openclaw.ai/channels/whatsapp)
-   [
    
    Zalo
    
    
    
    ](https://docs.openclaw.ai/channels/zalo)
-   [
    
    Zalo Personal
    
    
    
    ](https://docs.openclaw.ai/channels/zalouser)

##### Configuration

-   [
    
    Pairing
    
    
    
    ](https://docs.openclaw.ai/channels/pairing)
-   [
    
    Group Messages
    
    
    
    ](https://docs.openclaw.ai/channels/group-messages)
-   [
    
    Groups
    
    
    
    ](https://docs.openclaw.ai/channels/groups)
-   [
    
    Broadcast Groups
    
    
    
    ](https://docs.openclaw.ai/channels/broadcast-groups)
-   [
    
    Channel Routing
    
    
    
    ](https://docs.openclaw.ai/channels/channel-routing)
-   [
    
    Channel Location Parsing
    
    
    
    ](https://docs.openclaw.ai/channels/location)
-   [
    
    Channel Troubleshooting
    
    
    
    ](https://docs.openclaw.ai/channels/troubleshooting)

-   [LINE (plugin)](https://docs.openclaw.ai/channels/line)
-   [Plugin required](https://docs.openclaw.ai/channels/line)
-   [Setup](https://docs.openclaw.ai/channels/line)
-   [Configure](https://docs.openclaw.ai/channels/line)
-   [Access control](https://docs.openclaw.ai/channels/line)
-   [Message behavior](https://docs.openclaw.ai/channels/line)
-   [Channel data (rich messages)](https://docs.openclaw.ai/channels/line)
-   [Troubleshooting](https://docs.openclaw.ai/channels/line)

Messaging platforms

# LINE

# 

[​

](https://docs.openclaw.ai/channels/line)

LINE (plugin)

LINE connects to OpenClaw via the LINE Messaging API. The plugin runs as a webhook receiver on the gateway and uses your channel access token + channel secret for authentication. Status: supported via plugin. Direct messages, group chats, media, locations, Flex messages, template messages, and quick replies are supported. Reactions and threads are not supported.

## 

[​

](https://docs.openclaw.ai/channels/line)

Plugin required

Install the LINE plugin:

Copy

```
openclaw plugins install @openclaw/line
```

Local checkout (when running from a git repo):

Copy

```
openclaw plugins install ./extensions/line
```

## 

[​

](https://docs.openclaw.ai/channels/line)

Setup

1.  Create a LINE Developers account and open the Console: [https://developers.line.biz/console/](https://developers.line.biz/console)
2.  Create (or pick) a Provider and add a **Messaging API** channel.
3.  Copy the **Channel access token** and **Channel secret** from the channel settings.
4.  Enable **Use webhook** in the Messaging API settings.
5.  Set the webhook URL to your gateway endpoint (HTTPS required):

Copy

```
https://gateway-host/line/webhook
```

The gateway responds to LINE’s webhook verification (GET) and inbound events (POST). If you need a custom path, set `channels.line.webhookPath` or `channels.line.accounts.<id>.webhookPath` and update the URL accordingly. Security note:

-   LINE signature verification is body-dependent (HMAC over the raw body), so OpenClaw applies strict pre-auth body limits and timeout before verification.

## 

[​

](https://docs.openclaw.ai/channels/line)

Configure

Minimal config:

Copy

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

Env vars (default account only):

-   `LINE_CHANNEL_ACCESS_TOKEN`
-   `LINE_CHANNEL_SECRET`

Token/secret files:

Copy

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

`tokenFile` and `secretFile` must point to regular files. Symlinks are rejected. Multiple accounts:

Copy

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

](https://docs.openclaw.ai/channels/line)

Access control

Direct messages default to pairing. Unknown senders get a pairing code and their messages are ignored until approved.

Copy

```
openclaw pairing list line
openclaw pairing approve line <CODE>
```

Allowlists and policies:

-   `channels.line.dmPolicy`: `pairing | allowlist | open | disabled`
-   `channels.line.allowFrom`: allowlisted LINE user IDs for DMs
-   `channels.line.groupPolicy`: `allowlist | open | disabled`
-   `channels.line.groupAllowFrom`: allowlisted LINE user IDs for groups
-   Per-group overrides: `channels.line.groups.<groupId>.allowFrom`
-   Runtime note: if `channels.line` is completely missing, runtime falls back to `groupPolicy="allowlist"` for group checks (even if `channels.defaults.groupPolicy` is set).

LINE IDs are case-sensitive. Valid IDs look like:

-   User: `U` + 32 hex chars
-   Group: `C` + 32 hex chars
-   Room: `R` + 32 hex chars

## 

[​

](https://docs.openclaw.ai/channels/line)

Message behavior

-   Text is chunked at 5000 characters.
-   Markdown formatting is stripped; code blocks and tables are converted into Flex cards when possible.
-   Streaming responses are buffered; LINE receives full chunks with a loading animation while the agent works.
-   Media downloads are capped by `channels.line.mediaMaxMb` (default 10).

## 

[​

](https://docs.openclaw.ai/channels/line)

Channel data (rich messages)

Use `channelData.line` to send quick replies, locations, Flex cards, or template messages.

Copy

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

The LINE plugin also ships a `/card` command for Flex message presets:

Copy

```
/card info "Welcome" "Thanks for joining!"
```

## 

[​

](https://docs.openclaw.ai/channels/line)

Troubleshooting

-   **Webhook verification fails:** ensure the webhook URL is HTTPS and the `channelSecret` matches the LINE console.
-   **No inbound events:** confirm the webhook path matches `channels.line.webhookPath` and that the gateway is reachable from LINE.
-   **Media download errors:** raise `channels.line.mediaMaxMb` if media exceeds the default limit.

[IRC](https://docs.openclaw.ai/channels/irc)[Matrix](https://docs.openclaw.ai/channels/matrix)

⌘I
