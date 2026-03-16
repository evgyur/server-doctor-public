<!-- Source: https://docs.openclaw.ai/channels/channel-routing -->
<!-- Title: Channel Routing - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/channel-routing)

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

-   [Channels & routing](https://docs.openclaw.ai/channels/channel-routing)
-   [Key terms](https://docs.openclaw.ai/channels/channel-routing)
-   [Session key shapes (examples)](https://docs.openclaw.ai/channels/channel-routing)
-   [Main DM route pinning](https://docs.openclaw.ai/channels/channel-routing)
-   [Routing rules (how an agent is chosen)](https://docs.openclaw.ai/channels/channel-routing)
-   [Broadcast groups (run multiple agents)](https://docs.openclaw.ai/channels/channel-routing)
-   [Config overview](https://docs.openclaw.ai/channels/channel-routing)
-   [Session storage](https://docs.openclaw.ai/channels/channel-routing)
-   [WebChat behavior](https://docs.openclaw.ai/channels/channel-routing)
-   [Reply context](https://docs.openclaw.ai/channels/channel-routing)

Configuration

# Channel Routing

# 

[​

](https://docs.openclaw.ai/channels/channel-routing)

Channels & routing

OpenClaw routes replies **back to the channel where a message came from**. The model does not choose a channel; routing is deterministic and controlled by the host configuration.

## 

[​

](https://docs.openclaw.ai/channels/channel-routing)

Key terms

-   **Channel**: `whatsapp`, `telegram`, `discord`, `slack`, `signal`, `imessage`, `webchat`.
-   **AccountId**: per‑channel account instance (when supported).
-   Optional channel default account: `channels.<channel>.defaultAccount` chooses which account is used when an outbound path does not specify `accountId`.
    -   In multi-account setups, set an explicit default (`defaultAccount` or `accounts.default`) when two or more accounts are configured. Without it, fallback routing may pick the first normalized account ID.
-   **AgentId**: an isolated workspace + session store (“brain”).
-   **SessionKey**: the bucket key used to store context and control concurrency.

## 

[​

](https://docs.openclaw.ai/channels/channel-routing)

Session key shapes (examples)

Direct messages collapse to the agent’s **main** session:

-   `agent:<agentId>:<mainKey>` (default: `agent:main:main`)

Groups and channels remain isolated per channel:

-   Groups: `agent:<agentId>:<channel>:group:<id>`
-   Channels/rooms: `agent:<agentId>:<channel>:channel:<id>`

Threads:

-   Slack/Discord threads append `:thread:<threadId>` to the base key.
-   Telegram forum topics embed `:topic:<topicId>` in the group key.

Examples:

-   `agent:main:telegram:group:-1001234567890:topic:42`
-   `agent:main:discord:channel:123456:thread:987654`

## 

[​

](https://docs.openclaw.ai/channels/channel-routing)

Main DM route pinning

When `session.dmScope` is `main`, direct messages may share one main session. To prevent the session’s `lastRoute` from being overwritten by non-owner DMs, OpenClaw infers a pinned owner from `allowFrom` when all of these are true:

-   `allowFrom` has exactly one non-wildcard entry.
-   The entry can be normalized to a concrete sender ID for that channel.
-   The inbound DM sender does not match that pinned owner.

In that mismatch case, OpenClaw still records inbound session metadata, but it skips updating the main session `lastRoute`.

## 

[​

](https://docs.openclaw.ai/channels/channel-routing)

Routing rules (how an agent is chosen)

Routing picks **one agent** for each inbound message:

1.  **Exact peer match** (`bindings` with `peer.kind` + `peer.id`).
2.  **Parent peer match** (thread inheritance).
3.  **Guild + roles match** (Discord) via `guildId` + `roles`.
4.  **Guild match** (Discord) via `guildId`.
5.  **Team match** (Slack) via `teamId`.
6.  **Account match** (`accountId` on the channel).
7.  **Channel match** (any account on that channel, `accountId: "*"`).
8.  **Default agent** (`agents.list[].default`, else first list entry, fallback to `main`).

When a binding includes multiple match fields (`peer`, `guildId`, `teamId`, `roles`), **all provided fields must match** for that binding to apply. The matched agent determines which workspace and session store are used.

## 

[​

](https://docs.openclaw.ai/channels/channel-routing)

Broadcast groups (run multiple agents)

Broadcast groups let you run **multiple agents** for the same peer **when OpenClaw would normally reply** (for example: in WhatsApp groups, after mention/activation gating). Config:

Copy

```
{
  broadcast: {
    strategy: "parallel",
    "120363403215116621@g.us": ["alfred", "baerbel"],
    "+15555550123": ["support", "logger"],
  },
}
```

See: [Broadcast Groups](https://docs.openclaw.ai/channels/broadcast-groups).

## 

[​

](https://docs.openclaw.ai/channels/channel-routing)

Config overview

-   `agents.list`: named agent definitions (workspace, model, etc.).
-   `bindings`: map inbound channels/accounts/peers to agents.

Example:

Copy

```
{
  agents: {
    list: [{ id: "support", name: "Support", workspace: "~/.openclaw/workspace-support" }],
  },
  bindings: [
    { match: { channel: "slack", teamId: "T123" }, agentId: "support" },
    { match: { channel: "telegram", peer: { kind: "group", id: "-100123" } }, agentId: "support" },
  ],
}
```

## 

[​

](https://docs.openclaw.ai/channels/channel-routing)

Session storage

Session stores live under the state directory (default `~/.openclaw`):

-   `~/.openclaw/agents/<agentId>/sessions/sessions.json`
-   JSONL transcripts live alongside the store

You can override the store path via `session.store` and `{agentId}` templating. Gateway and ACP session discovery also scans disk-backed agent stores under the default `agents/` root and under templated `session.store` roots. Discovered stores must stay inside that resolved agent root and use a regular `sessions.json` file. Symlinks and out-of-root paths are ignored.

## 

[​

](https://docs.openclaw.ai/channels/channel-routing)

WebChat behavior

WebChat attaches to the **selected agent** and defaults to the agent’s main session. Because of this, WebChat lets you see cross‑channel context for that agent in one place.

## 

[​

](https://docs.openclaw.ai/channels/channel-routing)

Reply context

Inbound replies include:

-   `ReplyToId`, `ReplyToBody`, and `ReplyToSender` when available.
-   Quoted context is appended to `Body` as a `[Replying to ...]` block.

This is consistent across channels.

[Broadcast Groups](https://docs.openclaw.ai/channels/broadcast-groups)[Channel Location Parsing](https://docs.openclaw.ai/channels/location)

⌘I
