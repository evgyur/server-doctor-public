<!-- Source: https://docs.openclaw.ai/channels/pairing -->
<!-- Title: Pairing - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/pairing)

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

-   [Pairing](https://docs.openclaw.ai/channels/pairing)
-   [1) DM pairing (inbound chat access)](https://docs.openclaw.ai/channels/pairing)
-   [Approve a sender](https://docs.openclaw.ai/channels/pairing)
-   [Where the state lives](https://docs.openclaw.ai/channels/pairing)
-   [2) Node device pairing (iOS/Android/macOS/headless nodes)](https://docs.openclaw.ai/channels/pairing)
-   [Pair via Telegram (recommended for iOS)](https://docs.openclaw.ai/channels/pairing)
-   [Approve a node device](https://docs.openclaw.ai/channels/pairing)
-   [Node pairing state storage](https://docs.openclaw.ai/channels/pairing)
-   [Notes](https://docs.openclaw.ai/channels/pairing)
-   [Related docs](https://docs.openclaw.ai/channels/pairing)

Configuration

# Pairing

# 

[​

](https://docs.openclaw.ai/channels/pairing)

Pairing

“Pairing” is OpenClaw’s explicit **owner approval** step. It is used in two places:

1.  **DM pairing** (who is allowed to talk to the bot)
2.  **Node pairing** (which devices/nodes are allowed to join the gateway network)

Security context: [Security](https://docs.openclaw.ai/gateway/security)

## 

[​

](https://docs.openclaw.ai/channels/pairing)

1) DM pairing (inbound chat access)

When a channel is configured with DM policy `pairing`, unknown senders get a short code and their message is **not processed** until you approve. Default DM policies are documented in: [Security](https://docs.openclaw.ai/gateway/security) Pairing codes:

-   8 characters, uppercase, no ambiguous chars (`0O1I`).
-   **Expire after 1 hour**. The bot only sends the pairing message when a new request is created (roughly once per hour per sender).
-   Pending DM pairing requests are capped at **3 per channel** by default; additional requests are ignored until one expires or is approved.

### 

[​

](https://docs.openclaw.ai/channels/pairing)

Approve a sender

Copy

```
openclaw pairing list telegram
openclaw pairing approve telegram <CODE>
```

Supported channels: `telegram`, `whatsapp`, `signal`, `imessage`, `discord`, `slack`, `feishu`.

### 

[​

](https://docs.openclaw.ai/channels/pairing)

Where the state lives

Stored under `~/.openclaw/credentials/`:

-   Pending requests: `<channel>-pairing.json`
-   Approved allowlist store:
    -   Default account: `<channel>-allowFrom.json`
    -   Non-default account: `<channel>-<accountId>-allowFrom.json`

Account scoping behavior:

-   Non-default accounts read/write only their scoped allowlist file.
-   Default account uses the channel-scoped unscoped allowlist file.

Treat these as sensitive (they gate access to your assistant).

## 

[​

](https://docs.openclaw.ai/channels/pairing)

2) Node device pairing (iOS/Android/macOS/headless nodes)

Nodes connect to the Gateway as **devices** with `role: node`. The Gateway creates a device pairing request that must be approved.

### 

[​

](https://docs.openclaw.ai/channels/pairing)

Pair via Telegram (recommended for iOS)

If you use the `device-pair` plugin, you can do first-time device pairing entirely from Telegram:

1.  In Telegram, message your bot: `/pair`
2.  The bot replies with two messages: an instruction message and a separate **setup code** message (easy to copy/paste in Telegram).
3.  On your phone, open the OpenClaw iOS app → Settings → Gateway.
4.  Paste the setup code and connect.
5.  Back in Telegram: `/pair approve`

The setup code is a base64-encoded JSON payload that contains:

-   `url`: the Gateway WebSocket URL (`ws://...` or `wss://...`)
-   `bootstrapToken`: a short-lived single-device bootstrap token used for the initial pairing handshake

Treat the setup code like a password while it is valid.

### 

[​

](https://docs.openclaw.ai/channels/pairing)

Approve a node device

Copy

```
openclaw devices list
openclaw devices approve <requestId>
openclaw devices reject <requestId>
```

### 

[​

](https://docs.openclaw.ai/channels/pairing)

Node pairing state storage

Stored under `~/.openclaw/devices/`:

-   `pending.json` (short-lived; pending requests expire)
-   `paired.json` (paired devices + tokens)

### 

[​

](https://docs.openclaw.ai/channels/pairing)

Notes

-   The legacy `node.pair.*` API (CLI: `openclaw nodes pending/approve`) is a separate gateway-owned pairing store. WS nodes still require device pairing.

## 

[​

](https://docs.openclaw.ai/channels/pairing)

Related docs

-   Security model + prompt injection: [Security](https://docs.openclaw.ai/gateway/security)
-   Updating safely (run doctor): [Updating](https://docs.openclaw.ai/install/updating)
-   Channel configs:
    -   Telegram: [Telegram](https://docs.openclaw.ai/channels/telegram)
    -   WhatsApp: [WhatsApp](https://docs.openclaw.ai/channels/whatsapp)
    -   Signal: [Signal](https://docs.openclaw.ai/channels/signal)
    -   BlueBubbles (iMessage): [BlueBubbles](https://docs.openclaw.ai/channels/bluebubbles)
    -   iMessage (legacy): [iMessage](https://docs.openclaw.ai/channels/imessage)
    -   Discord: [Discord](https://docs.openclaw.ai/channels/discord)
    -   Slack: [Slack](https://docs.openclaw.ai/channels/slack)

[Zalo Personal](https://docs.openclaw.ai/channels/zalouser)[Group Messages](https://docs.openclaw.ai/channels/group-messages)

⌘I
