<!-- Source: https://docs.openclaw.ai/channels/nextcloud-talk -->
<!-- Title: Nextcloud Talk - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/nextcloud-talk)

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

-   [Nextcloud Talk (plugin)](https://docs.openclaw.ai/channels/nextcloud-talk)
-   [Plugin required](https://docs.openclaw.ai/channels/nextcloud-talk)
-   [Quick setup (beginner)](https://docs.openclaw.ai/channels/nextcloud-talk)
-   [Notes](https://docs.openclaw.ai/channels/nextcloud-talk)
-   [Access control (DMs)](https://docs.openclaw.ai/channels/nextcloud-talk)
-   [Rooms (groups)](https://docs.openclaw.ai/channels/nextcloud-talk)
-   [Capabilities](https://docs.openclaw.ai/channels/nextcloud-talk)
-   [Configuration reference (Nextcloud Talk)](https://docs.openclaw.ai/channels/nextcloud-talk)

Messaging platforms

# Nextcloud Talk

# 

[​

](https://docs.openclaw.ai/channels/nextcloud-talk)

Nextcloud Talk (plugin)

Status: supported via plugin (webhook bot). Direct messages, rooms, reactions, and markdown messages are supported.

## 

[​

](https://docs.openclaw.ai/channels/nextcloud-talk)

Plugin required

Nextcloud Talk ships as a plugin and is not bundled with the core install. Install via CLI (npm registry):

Copy

```
openclaw plugins install @openclaw/nextcloud-talk
```

Local checkout (when running from a git repo):

Copy

```
openclaw plugins install ./extensions/nextcloud-talk
```

If you choose Nextcloud Talk during setup and a git checkout is detected, OpenClaw will offer the local install path automatically. Details: [Plugins](https://docs.openclaw.ai/tools/plugin)

## 

[​

](https://docs.openclaw.ai/channels/nextcloud-talk)

Quick setup (beginner)

1.  Install the Nextcloud Talk plugin.
2.  On your Nextcloud server, create a bot:
    
    Copy
    
    ```
    ./occ talk:bot:install "OpenClaw" "<shared-secret>" "<webhook-url>" --feature reaction
    ```
    
3.  Enable the bot in the target room settings.
4.  Configure OpenClaw:
    -   Config: `channels.nextcloud-talk.baseUrl` + `channels.nextcloud-talk.botSecret`
    -   Or env: `NEXTCLOUD_TALK_BOT_SECRET` (default account only)
5.  Restart the gateway (or finish setup).

Minimal config:

Copy

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

](https://docs.openclaw.ai/channels/nextcloud-talk)

Notes

-   Bots cannot initiate DMs. The user must message the bot first.
-   Webhook URL must be reachable by the Gateway; set `webhookPublicUrl` if behind a proxy.
-   Media uploads are not supported by the bot API; media is sent as URLs.
-   The webhook payload does not distinguish DMs vs rooms; set `apiUser` + `apiPassword` to enable room-type lookups (otherwise DMs are treated as rooms).

## 

[​

](https://docs.openclaw.ai/channels/nextcloud-talk)

Access control (DMs)

-   Default: `channels.nextcloud-talk.dmPolicy = "pairing"`. Unknown senders get a pairing code.
-   Approve via:
    -   `openclaw pairing list nextcloud-talk`
    -   `openclaw pairing approve nextcloud-talk <CODE>`
-   Public DMs: `channels.nextcloud-talk.dmPolicy="open"` plus `channels.nextcloud-talk.allowFrom=["*"]`.
-   `allowFrom` matches Nextcloud user IDs only; display names are ignored.

## 

[​

](https://docs.openclaw.ai/channels/nextcloud-talk)

Rooms (groups)

-   Default: `channels.nextcloud-talk.groupPolicy = "allowlist"` (mention-gated).
-   Allowlist rooms with `channels.nextcloud-talk.rooms`:

Copy

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

-   To allow no rooms, keep the allowlist empty or set `channels.nextcloud-talk.groupPolicy="disabled"`.

## 

[​

](https://docs.openclaw.ai/channels/nextcloud-talk)

Capabilities

| Feature | Status |
| --- | --- |
| Direct messages | Supported |
| Rooms | Supported |
| Threads | Not supported |
| Media | URL-only |
| Reactions | Supported |
| Native commands | Not supported |

## 

[​

](https://docs.openclaw.ai/channels/nextcloud-talk)

Configuration reference (Nextcloud Talk)

Full configuration: [Configuration](https://docs.openclaw.ai/gateway/configuration) Provider options:

-   `channels.nextcloud-talk.enabled`: enable/disable channel startup.
-   `channels.nextcloud-talk.baseUrl`: Nextcloud instance URL.
-   `channels.nextcloud-talk.botSecret`: bot shared secret.
-   `channels.nextcloud-talk.botSecretFile`: regular-file secret path. Symlinks are rejected.
-   `channels.nextcloud-talk.apiUser`: API user for room lookups (DM detection).
-   `channels.nextcloud-talk.apiPassword`: API/app password for room lookups.
-   `channels.nextcloud-talk.apiPasswordFile`: API password file path.
-   `channels.nextcloud-talk.webhookPort`: webhook listener port (default: 8788).
-   `channels.nextcloud-talk.webhookHost`: webhook host (default: 0.0.0.0).
-   `channels.nextcloud-talk.webhookPath`: webhook path (default: /nextcloud-talk-webhook).
-   `channels.nextcloud-talk.webhookPublicUrl`: externally reachable webhook URL.
-   `channels.nextcloud-talk.dmPolicy`: `pairing | allowlist | open | disabled`.
-   `channels.nextcloud-talk.allowFrom`: DM allowlist (user IDs). `open` requires `"*"`.
-   `channels.nextcloud-talk.groupPolicy`: `allowlist | open | disabled`.
-   `channels.nextcloud-talk.groupAllowFrom`: group allowlist (user IDs).
-   `channels.nextcloud-talk.rooms`: per-room settings and allowlist.
-   `channels.nextcloud-talk.historyLimit`: group history limit (0 disables).
-   `channels.nextcloud-talk.dmHistoryLimit`: DM history limit (0 disables).
-   `channels.nextcloud-talk.dms`: per-DM overrides (historyLimit).
-   `channels.nextcloud-talk.textChunkLimit`: outbound text chunk size (chars).
-   `channels.nextcloud-talk.chunkMode`: `length` (default) or `newline` to split on blank lines (paragraph boundaries) before length chunking.
-   `channels.nextcloud-talk.blockStreaming`: disable block streaming for this channel.
-   `channels.nextcloud-talk.blockStreamingCoalesce`: block streaming coalesce tuning.
-   `channels.nextcloud-talk.mediaMaxMb`: inbound media cap (MB).

[Microsoft Teams](https://docs.openclaw.ai/channels/msteams)[Nostr](https://docs.openclaw.ai/channels/nostr)

⌘I
