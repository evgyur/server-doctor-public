<!-- Source: https://docs.openclaw.ai/channels/troubleshooting -->
<!-- Title: Channel Troubleshooting - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/troubleshooting)

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

-   [Channel troubleshooting](https://docs.openclaw.ai/channels/troubleshooting)
-   [Command ladder](https://docs.openclaw.ai/channels/troubleshooting)
-   [WhatsApp](https://docs.openclaw.ai/channels/troubleshooting)
-   [WhatsApp failure signatures](https://docs.openclaw.ai/channels/troubleshooting)
-   [Telegram](https://docs.openclaw.ai/channels/troubleshooting)
-   [Telegram failure signatures](https://docs.openclaw.ai/channels/troubleshooting)
-   [Discord](https://docs.openclaw.ai/channels/troubleshooting)
-   [Discord failure signatures](https://docs.openclaw.ai/channels/troubleshooting)
-   [Slack](https://docs.openclaw.ai/channels/troubleshooting)
-   [Slack failure signatures](https://docs.openclaw.ai/channels/troubleshooting)
-   [iMessage and BlueBubbles](https://docs.openclaw.ai/channels/troubleshooting)
-   [iMessage and BlueBubbles failure signatures](https://docs.openclaw.ai/channels/troubleshooting)
-   [Signal](https://docs.openclaw.ai/channels/troubleshooting)
-   [Signal failure signatures](https://docs.openclaw.ai/channels/troubleshooting)
-   [Matrix](https://docs.openclaw.ai/channels/troubleshooting)
-   [Matrix failure signatures](https://docs.openclaw.ai/channels/troubleshooting)

Configuration

# Channel Troubleshooting

# 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

Channel troubleshooting

Use this page when a channel connects but behavior is wrong.

## 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

Command ladder

Run these in order first:

Copy

```
openclaw status
openclaw gateway status
openclaw logs --follow
openclaw doctor
openclaw channels status --probe
```

Healthy baseline:

-   `Runtime: running`
-   `RPC probe: ok`
-   Channel probe shows connected/ready

## 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

WhatsApp

### 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

WhatsApp failure signatures

| Symptom | Fastest check | Fix |
| --- | --- | --- |
| Connected but no DM replies | `openclaw pairing list whatsapp` | Approve sender or switch DM policy/allowlist. |
| Group messages ignored | Check `requireMention` + mention patterns in config | Mention the bot or relax mention policy for that group. |
| Random disconnect/relogin loops | `openclaw channels status --probe` + logs | Re-login and verify credentials directory is healthy. |

Full troubleshooting: [/channels/whatsapp#troubleshooting-quick](https://docs.openclaw.ai/channels/whatsapp)

## 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

Telegram

### 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

Telegram failure signatures

| Symptom | Fastest check | Fix |
| --- | --- | --- |
| `/start` but no usable reply flow | `openclaw pairing list telegram` | Approve pairing or change DM policy. |
| Bot online but group stays silent | Verify mention requirement and bot privacy mode | Disable privacy mode for group visibility or mention bot. |
| Send failures with network errors | Inspect logs for Telegram API call failures | Fix DNS/IPv6/proxy routing to `api.telegram.org`. |
| `setMyCommands` rejected at startup | Inspect logs for `BOT_COMMANDS_TOO_MUCH` | Reduce plugin/skill/custom Telegram commands or disable native menus. |
| Upgraded and allowlist blocks you | `openclaw security audit` and config allowlists | Run `openclaw doctor --fix` or replace `@username` with numeric sender IDs. |

Full troubleshooting: [/channels/telegram#troubleshooting](https://docs.openclaw.ai/channels/telegram)

## 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

Discord

### 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

Discord failure signatures

| Symptom | Fastest check | Fix |
| --- | --- | --- |
| Bot online but no guild replies | `openclaw channels status --probe` | Allow guild/channel and verify message content intent. |
| Group messages ignored | Check logs for mention gating drops | Mention bot or set guild/channel `requireMention: false`. |
| DM replies missing | `openclaw pairing list discord` | Approve DM pairing or adjust DM policy. |

Full troubleshooting: [/channels/discord#troubleshooting](https://docs.openclaw.ai/channels/discord)

## 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

Slack

### 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

Slack failure signatures

| Symptom | Fastest check | Fix |
| --- | --- | --- |
| Socket mode connected but no responses | `openclaw channels status --probe` | Verify app token + bot token and required scopes. |
| DMs blocked | `openclaw pairing list slack` | Approve pairing or relax DM policy. |
| Channel message ignored | Check `groupPolicy` and channel allowlist | Allow the channel or switch policy to `open`. |

Full troubleshooting: [/channels/slack#troubleshooting](https://docs.openclaw.ai/channels/slack)

## 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

iMessage and BlueBubbles

### 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

iMessage and BlueBubbles failure signatures

| Symptom | Fastest check | Fix |
| --- | --- | --- |
| No inbound events | Verify webhook/server reachability and app permissions | Fix webhook URL or BlueBubbles server state. |
| Can send but no receive on macOS | Check macOS privacy permissions for Messages automation | Re-grant TCC permissions and restart channel process. |
| DM sender blocked | `openclaw pairing list imessage` or `openclaw pairing list bluebubbles` | Approve pairing or update allowlist. |

Full troubleshooting:

-   [/channels/imessage#troubleshooting-macos-privacy-and-security-tcc](https://docs.openclaw.ai/channels/imessage)
-   [/channels/bluebubbles#troubleshooting](https://docs.openclaw.ai/channels/bluebubbles)

## 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

Signal

### 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

Signal failure signatures

| Symptom | Fastest check | Fix |
| --- | --- | --- |
| Daemon reachable but bot silent | `openclaw channels status --probe` | Verify `signal-cli` daemon URL/account and receive mode. |
| DM blocked | `openclaw pairing list signal` | Approve sender or adjust DM policy. |
| Group replies do not trigger | Check group allowlist and mention patterns | Add sender/group or loosen gating. |

Full troubleshooting: [/channels/signal#troubleshooting](https://docs.openclaw.ai/channels/signal)

## 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

Matrix

### 

[​

](https://docs.openclaw.ai/channels/troubleshooting)

Matrix failure signatures

| Symptom | Fastest check | Fix |
| --- | --- | --- |
| Logged in but ignores room messages | `openclaw channels status --probe` | Check `groupPolicy` and room allowlist. |
| DMs do not process | `openclaw pairing list matrix` | Approve sender or adjust DM policy. |
| Encrypted rooms fail | Verify crypto module and encryption settings | Enable encryption support and rejoin/sync room. |

Full troubleshooting: [/channels/matrix#troubleshooting](https://docs.openclaw.ai/channels/matrix)

[Channel Location Parsing](https://docs.openclaw.ai/channels/location)

⌘I
