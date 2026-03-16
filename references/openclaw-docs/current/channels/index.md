<!-- Source: https://docs.openclaw.ai/channels/index -->
<!-- Title: Chat Channels - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/index)

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

-   [Chat Channels](https://docs.openclaw.ai/channels/index)
-   [Supported channels](https://docs.openclaw.ai/channels/index)
-   [Notes](https://docs.openclaw.ai/channels/index)

Overview

# Chat Channels

# 

[​

](https://docs.openclaw.ai/channels/index)

Chat Channels

OpenClaw can talk to you on any chat app you already use. Each channel connects via the Gateway. Text is supported everywhere; media and reactions vary by channel.

## 

[​

](https://docs.openclaw.ai/channels/index)

Supported channels

-   [BlueBubbles](https://docs.openclaw.ai/channels/bluebubbles) — **Recommended for iMessage**; uses the BlueBubbles macOS server REST API with full feature support (edit, unsend, effects, reactions, group management — edit currently broken on macOS 26 Tahoe).
-   [Discord](https://docs.openclaw.ai/channels/discord) — Discord Bot API + Gateway; supports servers, channels, and DMs.
-   [Feishu](https://docs.openclaw.ai/channels/feishu) — Feishu/Lark bot via WebSocket (plugin, installed separately).
-   [Google Chat](https://docs.openclaw.ai/channels/googlechat) — Google Chat API app via HTTP webhook.
-   [iMessage (legacy)](https://docs.openclaw.ai/channels/imessage) — Legacy macOS integration via imsg CLI (deprecated, use BlueBubbles for new setups).
-   [IRC](https://docs.openclaw.ai/channels/irc) — Classic IRC servers; channels + DMs with pairing/allowlist controls.
-   [LINE](https://docs.openclaw.ai/channels/line) — LINE Messaging API bot (plugin, installed separately).
-   [Matrix](https://docs.openclaw.ai/channels/matrix) — Matrix protocol (plugin, installed separately).
-   [Mattermost](https://docs.openclaw.ai/channels/mattermost) — Bot API + WebSocket; channels, groups, DMs (plugin, installed separately).
-   [Microsoft Teams](https://docs.openclaw.ai/channels/msteams) — Bot Framework; enterprise support (plugin, installed separately).
-   [Nextcloud Talk](https://docs.openclaw.ai/channels/nextcloud-talk) — Self-hosted chat via Nextcloud Talk (plugin, installed separately).
-   [Nostr](https://docs.openclaw.ai/channels/nostr) — Decentralized DMs via NIP-04 (plugin, installed separately).
-   [Signal](https://docs.openclaw.ai/channels/signal) — signal-cli; privacy-focused.
-   [Synology Chat](https://docs.openclaw.ai/channels/synology-chat) — Synology NAS Chat via outgoing+incoming webhooks (plugin, installed separately).
-   [Slack](https://docs.openclaw.ai/channels/slack) — Bolt SDK; workspace apps.
-   [Telegram](https://docs.openclaw.ai/channels/telegram) — Bot API via grammY; supports groups.
-   [Tlon](https://docs.openclaw.ai/channels/tlon) — Urbit-based messenger (plugin, installed separately).
-   [Twitch](https://docs.openclaw.ai/channels/twitch) — Twitch chat via IRC connection (plugin, installed separately).
-   [WebChat](https://docs.openclaw.ai/web/webchat) — Gateway WebChat UI over WebSocket.
-   [WhatsApp](https://docs.openclaw.ai/channels/whatsapp) — Most popular; uses Baileys and requires QR pairing.
-   [Zalo](https://docs.openclaw.ai/channels/zalo) — Zalo Bot API; Vietnam’s popular messenger (plugin, installed separately).
-   [Zalo Personal](https://docs.openclaw.ai/channels/zalouser) — Zalo personal account via QR login (plugin, installed separately).

## 

[​

](https://docs.openclaw.ai/channels/index)

Notes

-   Channels can run simultaneously; configure multiple and OpenClaw will route per chat.
-   Fastest setup is usually **Telegram** (simple bot token). WhatsApp requires QR pairing and stores more state on disk.
-   Group behavior varies by channel; see [Groups](https://docs.openclaw.ai/channels/groups).
-   DM pairing and allowlists are enforced for safety; see [Security](https://docs.openclaw.ai/gateway/security).
-   Troubleshooting: [Channel troubleshooting](https://docs.openclaw.ai/channels/troubleshooting).
-   Model providers are documented separately; see [Model Providers](https://docs.openclaw.ai/providers/models).

[BlueBubbles](https://docs.openclaw.ai/channels/bluebubbles)

⌘I
