<!-- Source: https://docs.openclaw.ai/channels/synology-chat -->
<!-- Title: Synology Chat - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/synology-chat)

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

-   [Synology Chat (plugin)](https://docs.openclaw.ai/channels/synology-chat)
-   [Plugin required](https://docs.openclaw.ai/channels/synology-chat)
-   [Quick setup](https://docs.openclaw.ai/channels/synology-chat)
-   [Environment variables](https://docs.openclaw.ai/channels/synology-chat)
-   [DM policy and access control](https://docs.openclaw.ai/channels/synology-chat)
-   [Outbound delivery](https://docs.openclaw.ai/channels/synology-chat)
-   [Multi-account](https://docs.openclaw.ai/channels/synology-chat)
-   [Security notes](https://docs.openclaw.ai/channels/synology-chat)

Messaging platforms

# Synology Chat

# 

[​

](https://docs.openclaw.ai/channels/synology-chat)

Synology Chat (plugin)

Status: supported via plugin as a direct-message channel using Synology Chat webhooks. The plugin accepts inbound messages from Synology Chat outgoing webhooks and sends replies through a Synology Chat incoming webhook.

## 

[​

](https://docs.openclaw.ai/channels/synology-chat)

Plugin required

Synology Chat is plugin-based and not part of the default core channel install. Install from a local checkout:

Copy

```
openclaw plugins install ./extensions/synology-chat
```

Details: [Plugins](https://docs.openclaw.ai/tools/plugin)

## 

[​

](https://docs.openclaw.ai/channels/synology-chat)

Quick setup

1.  Install and enable the Synology Chat plugin.
    -   `openclaw onboard` now shows Synology Chat in the same channel setup list as `openclaw channels add`.
    -   Non-interactive setup: `openclaw channels add --channel synology-chat --token <token> --url <incoming-webhook-url>`
2.  In Synology Chat integrations:
    -   Create an incoming webhook and copy its URL.
    -   Create an outgoing webhook with your secret token.
3.  Point the outgoing webhook URL to your OpenClaw gateway:
    -   `https://gateway-host/webhook/synology` by default.
    -   Or your custom `channels.synology-chat.webhookPath`.
4.  Finish setup in OpenClaw.
    -   Guided: `openclaw onboard`
    -   Direct: `openclaw channels add --channel synology-chat --token <token> --url <incoming-webhook-url>`
5.  Restart gateway and send a DM to the Synology Chat bot.

Minimal config:

Copy

```
{
  channels: {
    "synology-chat": {
      enabled: true,
      token: "synology-outgoing-token",
      incomingUrl: "https://nas.example.com/webapi/entry.cgi?api=SYNO.Chat.External&method=incoming&version=2&token=...",
      webhookPath: "/webhook/synology",
      dmPolicy: "allowlist",
      allowedUserIds: ["123456"],
      rateLimitPerMinute: 30,
      allowInsecureSsl: false,
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/channels/synology-chat)

Environment variables

For the default account, you can use env vars:

-   `SYNOLOGY_CHAT_TOKEN`
-   `SYNOLOGY_CHAT_INCOMING_URL`
-   `SYNOLOGY_NAS_HOST`
-   `SYNOLOGY_ALLOWED_USER_IDS` (comma-separated)
-   `SYNOLOGY_RATE_LIMIT`
-   `OPENCLAW_BOT_NAME`

Config values override env vars.

## 

[​

](https://docs.openclaw.ai/channels/synology-chat)

DM policy and access control

-   `dmPolicy: "allowlist"` is the recommended default.
-   `allowedUserIds` accepts a list (or comma-separated string) of Synology user IDs.
-   In `allowlist` mode, an empty `allowedUserIds` list is treated as misconfiguration and the webhook route will not start (use `dmPolicy: "open"` for allow-all).
-   `dmPolicy: "open"` allows any sender.
-   `dmPolicy: "disabled"` blocks DMs.
-   Pairing approvals work with:
    -   `openclaw pairing list synology-chat`
    -   `openclaw pairing approve synology-chat <CODE>`

## 

[​

](https://docs.openclaw.ai/channels/synology-chat)

Outbound delivery

Use numeric Synology Chat user IDs as targets. Examples:

Copy

```
openclaw message send --channel synology-chat --target 123456 --text "Hello from OpenClaw"
openclaw message send --channel synology-chat --target synology-chat:123456 --text "Hello again"
```

Media sends are supported by URL-based file delivery.

## 

[​

](https://docs.openclaw.ai/channels/synology-chat)

Multi-account

Multiple Synology Chat accounts are supported under `channels.synology-chat.accounts`. Each account can override token, incoming URL, webhook path, DM policy, and limits.

Copy

```
{
  channels: {
    "synology-chat": {
      enabled: true,
      accounts: {
        default: {
          token: "token-a",
          incomingUrl: "https://nas-a.example.com/...token=...",
        },
        alerts: {
          token: "token-b",
          incomingUrl: "https://nas-b.example.com/...token=...",
          webhookPath: "/webhook/synology-alerts",
          dmPolicy: "allowlist",
          allowedUserIds: ["987654"],
        },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/channels/synology-chat)

Security notes

-   Keep `token` secret and rotate it if leaked.
-   Keep `allowInsecureSsl: false` unless you explicitly trust a self-signed local NAS cert.
-   Inbound webhook requests are token-verified and rate-limited per sender.
-   Prefer `dmPolicy: "allowlist"` for production.

[Signal](https://docs.openclaw.ai/channels/signal)[Slack](https://docs.openclaw.ai/channels/slack)

⌘I
