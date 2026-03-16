<!-- Source: https://docs.openclaw.ai/channels/tlon -->
<!-- Title: Tlon - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/tlon)

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

-   [Tlon (plugin)](https://docs.openclaw.ai/channels/tlon)
-   [Plugin required](https://docs.openclaw.ai/channels/tlon)
-   [Setup](https://docs.openclaw.ai/channels/tlon)
-   [Private/LAN ships](https://docs.openclaw.ai/channels/tlon)
-   [Group channels](https://docs.openclaw.ai/channels/tlon)
-   [Access control](https://docs.openclaw.ai/channels/tlon)
-   [Owner and approval system](https://docs.openclaw.ai/channels/tlon)
-   [Auto-accept settings](https://docs.openclaw.ai/channels/tlon)
-   [Delivery targets (CLI/cron)](https://docs.openclaw.ai/channels/tlon)
-   [Bundled skill](https://docs.openclaw.ai/channels/tlon)
-   [Capabilities](https://docs.openclaw.ai/channels/tlon)
-   [Troubleshooting](https://docs.openclaw.ai/channels/tlon)
-   [Configuration reference](https://docs.openclaw.ai/channels/tlon)
-   [Notes](https://docs.openclaw.ai/channels/tlon)

Messaging platforms

# Tlon

# 

[​

](https://docs.openclaw.ai/channels/tlon)

Tlon (plugin)

Tlon is a decentralized messenger built on Urbit. OpenClaw connects to your Urbit ship and can respond to DMs and group chat messages. Group replies require an @ mention by default and can be further restricted via allowlists. Status: supported via plugin. DMs, group mentions, thread replies, rich text formatting, and image uploads are supported. Reactions and polls are not yet supported.

## 

[​

](https://docs.openclaw.ai/channels/tlon)

Plugin required

Tlon ships as a plugin and is not bundled with the core install. Install via CLI (npm registry):

Copy

```
openclaw plugins install @openclaw/tlon
```

Local checkout (when running from a git repo):

Copy

```
openclaw plugins install ./extensions/tlon
```

Details: [Plugins](https://docs.openclaw.ai/tools/plugin)

## 

[​

](https://docs.openclaw.ai/channels/tlon)

Setup

1.  Install the Tlon plugin.
2.  Gather your ship URL and login code.
3.  Configure `channels.tlon`.
4.  Restart the gateway.
5.  DM the bot or mention it in a group channel.

Minimal config (single account):

Copy

```
{
  channels: {
    tlon: {
      enabled: true,
      ship: "~sampel-palnet",
      url: "https://your-ship-host",
      code: "lidlut-tabwed-pillex-ridrup",
      ownerShip: "~your-main-ship", // recommended: your ship, always allowed
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/channels/tlon)

Private/LAN ships

By default, OpenClaw blocks private/internal hostnames and IP ranges for SSRF protection. If your ship is running on a private network (localhost, LAN IP, or internal hostname), you must explicitly opt in:

Copy

```
{
  channels: {
    tlon: {
      url: "http://localhost:8080",
      allowPrivateNetwork: true,
    },
  },
}
```

This applies to URLs like:

-   `http://localhost:8080`
-   `http://192.168.x.x:8080`
-   `http://my-ship.local:8080`

⚠️ Only enable this if you trust your local network. This setting disables SSRF protections for requests to your ship URL.

## 

[​

](https://docs.openclaw.ai/channels/tlon)

Group channels

Auto-discovery is enabled by default. You can also pin channels manually:

Copy

```
{
  channels: {
    tlon: {
      groupChannels: ["chat/~host-ship/general", "chat/~host-ship/support"],
    },
  },
}
```

Disable auto-discovery:

Copy

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

](https://docs.openclaw.ai/channels/tlon)

Access control

DM allowlist (empty = no DMs allowed, use `ownerShip` for approval flow):

Copy

```
{
  channels: {
    tlon: {
      dmAllowlist: ["~zod", "~nec"],
    },
  },
}
```

Group authorization (restricted by default):

Copy

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

](https://docs.openclaw.ai/channels/tlon)

Owner and approval system

Set an owner ship to receive approval requests when unauthorized users try to interact:

Copy

```
{
  channels: {
    tlon: {
      ownerShip: "~your-main-ship",
    },
  },
}
```

The owner ship is **automatically authorized everywhere** — DM invites are auto-accepted and channel messages are always allowed. You don’t need to add the owner to `dmAllowlist` or `defaultAuthorizedShips`. When set, the owner receives DM notifications for:

-   DM requests from ships not in the allowlist
-   Mentions in channels without authorization
-   Group invite requests

## 

[​

](https://docs.openclaw.ai/channels/tlon)

Auto-accept settings

Auto-accept DM invites (for ships in dmAllowlist):

Copy

```
{
  channels: {
    tlon: {
      autoAcceptDmInvites: true,
    },
  },
}
```

Auto-accept group invites:

Copy

```
{
  channels: {
    tlon: {
      autoAcceptGroupInvites: true,
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/channels/tlon)

Delivery targets (CLI/cron)

Use these with `openclaw message send` or cron delivery:

-   DM: `~sampel-palnet` or `dm/~sampel-palnet`
-   Group: `chat/~host-ship/channel` or `group:~host-ship/channel`

## 

[​

](https://docs.openclaw.ai/channels/tlon)

Bundled skill

The Tlon plugin includes a bundled skill ([`@tloncorp/tlon-skill`](https://github.com/tloncorp/tlon-skill)) that provides CLI access to Tlon operations:

-   **Contacts**: get/update profiles, list contacts
-   **Channels**: list, create, post messages, fetch history
-   **Groups**: list, create, manage members
-   **DMs**: send messages, react to messages
-   **Reactions**: add/remove emoji reactions to posts and DMs
-   **Settings**: manage plugin permissions via slash commands

The skill is automatically available when the plugin is installed.

## 

[​

](https://docs.openclaw.ai/channels/tlon)

Capabilities

| Feature | Status |
| --- | --- |
| Direct messages | ✅ Supported |
| Groups/channels | ✅ Supported (mention-gated by default) |
| Threads | ✅ Supported (auto-replies in thread) |
| Rich text | ✅ Markdown converted to Tlon format |
| Images | ✅ Uploaded to Tlon storage |
| Reactions | ✅ Via [bundled skill](https://docs.openclaw.ai/channels/tlon) |
| Polls | ❌ Not yet supported |
| Native commands | ✅ Supported (owner-only by default) |

## 

[​

](https://docs.openclaw.ai/channels/tlon)

Troubleshooting

Run this ladder first:

Copy

```
openclaw status
openclaw gateway status
openclaw logs --follow
openclaw doctor
```

Common failures:

-   **DMs ignored**: sender not in `dmAllowlist` and no `ownerShip` configured for approval flow.
-   **Group messages ignored**: channel not discovered or sender not authorized.
-   **Connection errors**: check ship URL is reachable; enable `allowPrivateNetwork` for local ships.
-   **Auth errors**: verify login code is current (codes rotate).

## 

[​

](https://docs.openclaw.ai/channels/tlon)

Configuration reference

Full configuration: [Configuration](https://docs.openclaw.ai/gateway/configuration) Provider options:

-   `channels.tlon.enabled`: enable/disable channel startup.
-   `channels.tlon.ship`: bot’s Urbit ship name (e.g. `~sampel-palnet`).
-   `channels.tlon.url`: ship URL (e.g. `https://sampel-palnet.tlon.network`).
-   `channels.tlon.code`: ship login code.
-   `channels.tlon.allowPrivateNetwork`: allow localhost/LAN URLs (SSRF bypass).
-   `channels.tlon.ownerShip`: owner ship for approval system (always authorized).
-   `channels.tlon.dmAllowlist`: ships allowed to DM (empty = none).
-   `channels.tlon.autoAcceptDmInvites`: auto-accept DMs from allowlisted ships.
-   `channels.tlon.autoAcceptGroupInvites`: auto-accept all group invites.
-   `channels.tlon.autoDiscoverChannels`: auto-discover group channels (default: true).
-   `channels.tlon.groupChannels`: manually pinned channel nests.
-   `channels.tlon.defaultAuthorizedShips`: ships authorized for all channels.
-   `channels.tlon.authorization.channelRules`: per-channel auth rules.
-   `channels.tlon.showModelSignature`: append model name to messages.

## 

[​

](https://docs.openclaw.ai/channels/tlon)

Notes

-   Group replies require a mention (e.g. `~your-bot-ship`) to respond.
-   Thread replies: if the inbound message is in a thread, OpenClaw replies in-thread.
-   Rich text: Markdown formatting (bold, italic, code, headers, lists) is converted to Tlon’s native format.
-   Images: URLs are uploaded to Tlon storage and embedded as image blocks.

[Telegram](https://docs.openclaw.ai/channels/telegram)[Twitch](https://docs.openclaw.ai/channels/twitch)

⌘I
