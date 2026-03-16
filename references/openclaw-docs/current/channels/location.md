<!-- Source: https://docs.openclaw.ai/channels/location -->
<!-- Title: Channel Location Parsing - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/location)

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

-   [Channel location parsing](https://docs.openclaw.ai/channels/location)
-   [Text formatting](https://docs.openclaw.ai/channels/location)
-   [Context fields](https://docs.openclaw.ai/channels/location)
-   [Channel notes](https://docs.openclaw.ai/channels/location)

Configuration

# Channel Location Parsing

# 

[​

](https://docs.openclaw.ai/channels/location)

Channel location parsing

OpenClaw normalizes shared locations from chat channels into:

-   human-readable text appended to the inbound body, and
-   structured fields in the auto-reply context payload.

Currently supported:

-   **Telegram** (location pins + venues + live locations)
-   **WhatsApp** (locationMessage + liveLocationMessage)
-   **Matrix** (`m.location` with `geo_uri`)

## 

[​

](https://docs.openclaw.ai/channels/location)

Text formatting

Locations are rendered as friendly lines without brackets:

-   Pin:
    -   `📍 48.858844, 2.294351 ±12m`
-   Named place:
    -   `📍 Eiffel Tower — Champ de Mars, Paris (48.858844, 2.294351 ±12m)`
-   Live share:
    -   `🛰 Live location: 48.858844, 2.294351 ±12m`

If the channel includes a caption/comment, it is appended on the next line:

Copy

```
📍 48.858844, 2.294351 ±12m
Meet here
```

## 

[​

](https://docs.openclaw.ai/channels/location)

Context fields

When a location is present, these fields are added to `ctx`:

-   `LocationLat` (number)
-   `LocationLon` (number)
-   `LocationAccuracy` (number, meters; optional)
-   `LocationName` (string; optional)
-   `LocationAddress` (string; optional)
-   `LocationSource` (`pin | place | live`)
-   `LocationIsLive` (boolean)

## 

[​

](https://docs.openclaw.ai/channels/location)

Channel notes

-   **Telegram**: venues map to `LocationName/LocationAddress`; live locations use `live_period`.
-   **WhatsApp**: `locationMessage.comment` and `liveLocationMessage.caption` are appended as the caption line.
-   **Matrix**: `geo_uri` is parsed as a pin location; altitude is ignored and `LocationIsLive` is always false.

[Channel Routing](https://docs.openclaw.ai/channels/channel-routing)[Channel Troubleshooting](https://docs.openclaw.ai/channels/troubleshooting)

⌘I
