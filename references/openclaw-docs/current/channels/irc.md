<!-- Source: https://docs.openclaw.ai/channels/irc -->
<!-- Title: IRC - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/irc)

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

-   [Quick start](https://docs.openclaw.ai/channels/irc)
-   [Security defaults](https://docs.openclaw.ai/channels/irc)
-   [Access control](https://docs.openclaw.ai/channels/irc)
-   [Common gotcha: allowFrom is for DMs, not channels](https://docs.openclaw.ai/channels/irc)
-   [Reply triggering (mentions)](https://docs.openclaw.ai/channels/irc)
-   [Security note (recommended for public channels)](https://docs.openclaw.ai/channels/irc)
-   [Same tools for everyone in the channel](https://docs.openclaw.ai/channels/irc)
-   [Different tools per sender (owner gets more power)](https://docs.openclaw.ai/channels/irc)
-   [NickServ](https://docs.openclaw.ai/channels/irc)
-   [Environment variables](https://docs.openclaw.ai/channels/irc)
-   [Troubleshooting](https://docs.openclaw.ai/channels/irc)

Messaging platforms

# IRC

Connect OpenClaw to IRC channels and direct messages.

Use IRC when you want OpenClaw in classic channels (`#room`) and direct messages. IRC ships as an extension plugin, but it is configured in the main config under `channels.irc`.

## 

[​

](https://docs.openclaw.ai/channels/irc)

Quick start

1.  Enable IRC config in `~/.openclaw/openclaw.json`.
2.  Set at least:

Copy

```
{
  "channels": {
    "irc": {
      "enabled": true,
      "host": "irc.libera.chat",
      "port": 6697,
      "tls": true,
      "nick": "openclaw-bot",
      "channels": ["#openclaw"]
    }
  }
}
```

3.  Start/restart gateway:

Copy

```
openclaw gateway run
```

## 

[​

](https://docs.openclaw.ai/channels/irc)

Security defaults

-   `channels.irc.dmPolicy` defaults to `"pairing"`.
-   `channels.irc.groupPolicy` defaults to `"allowlist"`.
-   With `groupPolicy="allowlist"`, set `channels.irc.groups` to define allowed channels.
-   Use TLS (`channels.irc.tls=true`) unless you intentionally accept plaintext transport.

## 

[​

](https://docs.openclaw.ai/channels/irc)

Access control

There are two separate “gates” for IRC channels:

1.  **Channel access** (`groupPolicy` + `groups`): whether the bot accepts messages from a channel at all.
2.  **Sender access** (`groupAllowFrom` / per-channel `groups["#channel"].allowFrom`): who is allowed to trigger the bot inside that channel.

Config keys:

-   DM allowlist (DM sender access): `channels.irc.allowFrom`
-   Group sender allowlist (channel sender access): `channels.irc.groupAllowFrom`
-   Per-channel controls (channel + sender + mention rules): `channels.irc.groups["#channel"]`
-   `channels.irc.groupPolicy="open"` allows unconfigured channels (**still mention-gated by default**)

Allowlist entries should use stable sender identities (`nick!user@host`). Bare nick matching is mutable and only enabled when `channels.irc.dangerouslyAllowNameMatching: true`.

### 

[​

](https://docs.openclaw.ai/channels/irc)

Common gotcha: `allowFrom` is for DMs, not channels

If you see logs like:

-   `irc: drop group sender alice!ident@host (policy=allowlist)`

…it means the sender wasn’t allowed for **group/channel** messages. Fix it by either:

-   setting `channels.irc.groupAllowFrom` (global for all channels), or
-   setting per-channel sender allowlists: `channels.irc.groups["#channel"].allowFrom`

Example (allow anyone in `#tuirc-dev` to talk to the bot):

Copy

```
{
  channels: {
    irc: {
      groupPolicy: "allowlist",
      groups: {
        "#tuirc-dev": { allowFrom: ["*"] },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/channels/irc)

Reply triggering (mentions)

Even if a channel is allowed (via `groupPolicy` + `groups`) and the sender is allowed, OpenClaw defaults to **mention-gating** in group contexts. That means you may see logs like `drop channel … (missing-mention)` unless the message includes a mention pattern that matches the bot. To make the bot reply in an IRC channel **without needing a mention**, disable mention gating for that channel:

Copy

```
{
  channels: {
    irc: {
      groupPolicy: "allowlist",
      groups: {
        "#tuirc-dev": {
          requireMention: false,
          allowFrom: ["*"],
        },
      },
    },
  },
}
```

Or to allow **all** IRC channels (no per-channel allowlist) and still reply without mentions:

Copy

```
{
  channels: {
    irc: {
      groupPolicy: "open",
      groups: {
        "*": { requireMention: false, allowFrom: ["*"] },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/channels/irc)

Security note (recommended for public channels)

If you allow `allowFrom: ["*"]` in a public channel, anyone can prompt the bot. To reduce risk, restrict tools for that channel.

### 

[​

](https://docs.openclaw.ai/channels/irc)

Same tools for everyone in the channel

Copy

```
{
  channels: {
    irc: {
      groups: {
        "#tuirc-dev": {
          allowFrom: ["*"],
          tools: {
            deny: ["group:runtime", "group:fs", "gateway", "nodes", "cron", "browser"],
          },
        },
      },
    },
  },
}
```

### 

[​

](https://docs.openclaw.ai/channels/irc)

Different tools per sender (owner gets more power)

Use `toolsBySender` to apply a stricter policy to `"*"` and a looser one to your nick:

Copy

```
{
  channels: {
    irc: {
      groups: {
        "#tuirc-dev": {
          allowFrom: ["*"],
          toolsBySender: {
            "*": {
              deny: ["group:runtime", "group:fs", "gateway", "nodes", "cron", "browser"],
            },
            "id:eigen": {
              deny: ["gateway", "nodes", "cron"],
            },
          },
        },
      },
    },
  },
}
```

Notes:

-   `toolsBySender` keys should use `id:` for IRC sender identity values: `id:eigen` or `id:eigen!~eigen@174.127.248.171` for stronger matching.
-   Legacy unprefixed keys are still accepted and matched as `id:` only.
-   The first matching sender policy wins; `"*"` is the wildcard fallback.

For more on group access vs mention-gating (and how they interact), see: [/channels/groups](https://docs.openclaw.ai/channels/groups).

## 

[​

](https://docs.openclaw.ai/channels/irc)

NickServ

To identify with NickServ after connect:

Copy

```
{
  "channels": {
    "irc": {
      "nickserv": {
        "enabled": true,
        "service": "NickServ",
        "password": "your-nickserv-password"
      }
    }
  }
}
```

Optional one-time registration on connect:

Copy

```
{
  "channels": {
    "irc": {
      "nickserv": {
        "register": true,
        "registerEmail": "bot@example.com"
      }
    }
  }
}
```

Disable `register` after the nick is registered to avoid repeated REGISTER attempts.

## 

[​

](https://docs.openclaw.ai/channels/irc)

Environment variables

Default account supports:

-   `IRC_HOST`
-   `IRC_PORT`
-   `IRC_TLS`
-   `IRC_NICK`
-   `IRC_USERNAME`
-   `IRC_REALNAME`
-   `IRC_PASSWORD`
-   `IRC_CHANNELS` (comma-separated)
-   `IRC_NICKSERV_PASSWORD`
-   `IRC_NICKSERV_REGISTER_EMAIL`

## 

[​

](https://docs.openclaw.ai/channels/irc)

Troubleshooting

-   If the bot connects but never replies in channels, verify `channels.irc.groups` **and** whether mention-gating is dropping messages (`missing-mention`). If you want it to reply without pings, set `requireMention:false` for the channel.
-   If login fails, verify nick availability and server password.
-   If TLS fails on a custom network, verify host/port and certificate setup.

[iMessage](https://docs.openclaw.ai/channels/imessage)[LINE](https://docs.openclaw.ai/channels/line)

⌘I
