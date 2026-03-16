<!-- Source: https://docs.openclaw.ai/channels/whatsapp -->
<!-- Title: WhatsApp - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/whatsapp)

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

-   [WhatsApp (Web channel)](https://docs.openclaw.ai/channels/whatsapp)
-   [Quick setup](https://docs.openclaw.ai/channels/whatsapp)
-   [Deployment patterns](https://docs.openclaw.ai/channels/whatsapp)
-   [Runtime model](https://docs.openclaw.ai/channels/whatsapp)
-   [Access control and activation](https://docs.openclaw.ai/channels/whatsapp)
-   [Personal-number and self-chat behavior](https://docs.openclaw.ai/channels/whatsapp)
-   [Message normalization and context](https://docs.openclaw.ai/channels/whatsapp)
-   [Delivery, chunking, and media](https://docs.openclaw.ai/channels/whatsapp)
-   [Acknowledgment reactions](https://docs.openclaw.ai/channels/whatsapp)
-   [Multi-account and credentials](https://docs.openclaw.ai/channels/whatsapp)
-   [Tools, actions, and config writes](https://docs.openclaw.ai/channels/whatsapp)
-   [Troubleshooting](https://docs.openclaw.ai/channels/whatsapp)
-   [Configuration reference pointers](https://docs.openclaw.ai/channels/whatsapp)
-   [Related](https://docs.openclaw.ai/channels/whatsapp)

Messaging platforms

# WhatsApp

# 

[​

](https://docs.openclaw.ai/channels/whatsapp)

WhatsApp (Web channel)

Status: production-ready via WhatsApp Web (Baileys). Gateway owns linked session(s).

[

## Pairing

Default DM policy is pairing for unknown senders.





](https://docs.openclaw.ai/channels/pairing)[

## Channel troubleshooting

Cross-channel diagnostics and repair playbooks.





](https://docs.openclaw.ai/channels/troubleshooting)[

## Gateway configuration

Full channel config patterns and examples.





](https://docs.openclaw.ai/gateway/configuration)

## 

[​

](https://docs.openclaw.ai/channels/whatsapp)

Quick setup

1

[

](https://docs.openclaw.ai/channels/whatsapp)

Configure WhatsApp access policy

Copy

```
{
  channels: {
    whatsapp: {
      dmPolicy: "pairing",
      allowFrom: ["+15551234567"],
      groupPolicy: "allowlist",
      groupAllowFrom: ["+15551234567"],
    },
  },
}
```

2

[

](https://docs.openclaw.ai/channels/whatsapp)

Link WhatsApp (QR)

Copy

```
openclaw channels login --channel whatsapp
```

For a specific account:

Copy

```
openclaw channels login --channel whatsapp --account work
```

3

[

](https://docs.openclaw.ai/channels/whatsapp)

Start the gateway

Copy

```
openclaw gateway
```

4

[

](https://docs.openclaw.ai/channels/whatsapp)

Approve first pairing request (if using pairing mode)

Copy

```
openclaw pairing list whatsapp
openclaw pairing approve whatsapp <CODE>
```

Pairing requests expire after 1 hour. Pending requests are capped at 3 per channel.

OpenClaw recommends running WhatsApp on a separate number when possible. (The channel metadata and setup flow are optimized for that setup, but personal-number setups are also supported.)

## 

[​

](https://docs.openclaw.ai/channels/whatsapp)

Deployment patterns

Dedicated number (recommended)

This is the cleanest operational mode:

-   separate WhatsApp identity for OpenClaw
-   clearer DM allowlists and routing boundaries
-   lower chance of self-chat confusion

Minimal policy pattern:

Copy

```
{
  channels: {
    whatsapp: {
      dmPolicy: "allowlist",
      allowFrom: ["+15551234567"],
    },
  },
}
```

Personal-number fallback

Onboarding supports personal-number mode and writes a self-chat-friendly baseline:

-   `dmPolicy: "allowlist"`
-   `allowFrom` includes your personal number
-   `selfChatMode: true`

In runtime, self-chat protections key off the linked self number and `allowFrom`.

WhatsApp Web-only channel scope

The messaging platform channel is WhatsApp Web-based (`Baileys`) in current OpenClaw channel architecture.There is no separate Twilio WhatsApp messaging channel in the built-in chat-channel registry.

## 

[​

](https://docs.openclaw.ai/channels/whatsapp)

Runtime model

-   Gateway owns the WhatsApp socket and reconnect loop.
-   Outbound sends require an active WhatsApp listener for the target account.
-   Status and broadcast chats are ignored (`@status`, `@broadcast`).
-   Direct chats use DM session rules (`session.dmScope`; default `main` collapses DMs to the agent main session).
-   Group sessions are isolated (`agent:<agentId>:whatsapp:group:<jid>`).

## 

[​

](https://docs.openclaw.ai/channels/whatsapp)

Access control and activation

-   DM policy
    
-   Group policy + allowlists
    
-   Mentions + /activation
    

`channels.whatsapp.dmPolicy` controls direct chat access:

-   `pairing` (default)
-   `allowlist`
-   `open` (requires `allowFrom` to include `"*"`)
-   `disabled`

`allowFrom` accepts E.164-style numbers (normalized internally).Multi-account override: `channels.whatsapp.accounts.<id>.dmPolicy` (and `allowFrom`) take precedence over channel-level defaults for that account.Runtime behavior details:

-   pairings are persisted in channel allow-store and merged with configured `allowFrom`
-   if no allowlist is configured, the linked self number is allowed by default
-   outbound `fromMe` DMs are never auto-paired

Group access has two layers:

1.  **Group membership allowlist** (`channels.whatsapp.groups`)
    -   if `groups` is omitted, all groups are eligible
    -   if `groups` is present, it acts as a group allowlist (`"*"` allowed)
2.  **Group sender policy** (`channels.whatsapp.groupPolicy` + `groupAllowFrom`)
    -   `open`: sender allowlist bypassed
    -   `allowlist`: sender must match `groupAllowFrom` (or `*`)
    -   `disabled`: block all group inbound

Sender allowlist fallback:

-   if `groupAllowFrom` is unset, runtime falls back to `allowFrom` when available
-   sender allowlists are evaluated before mention/reply activation

Note: if no `channels.whatsapp` block exists at all, runtime group-policy fallback is `allowlist` (with a warning log), even if `channels.defaults.groupPolicy` is set.

Group replies require mention by default.Mention detection includes:

-   explicit WhatsApp mentions of the bot identity
-   configured mention regex patterns (`agents.list[].groupChat.mentionPatterns`, fallback `messages.groupChat.mentionPatterns`)
-   implicit reply-to-bot detection (reply sender matches bot identity)

Security note:

-   quote/reply only satisfies mention gating; it does **not** grant sender authorization
-   with `groupPolicy: "allowlist"`, non-allowlisted senders are still blocked even if they reply to an allowlisted user’s message

Session-level activation command:

-   `/activation mention`
-   `/activation always`

`activation` updates session state (not global config). It is owner-gated.

## 

[​

](https://docs.openclaw.ai/channels/whatsapp)

Personal-number and self-chat behavior

When the linked self number is also present in `allowFrom`, WhatsApp self-chat safeguards activate:

-   skip read receipts for self-chat turns
-   ignore mention-JID auto-trigger behavior that would otherwise ping yourself
-   if `messages.responsePrefix` is unset, self-chat replies default to `[{identity.name}]` or `[openclaw]`

## 

[​

](https://docs.openclaw.ai/channels/whatsapp)

Message normalization and context

Inbound envelope + reply context

Incoming WhatsApp messages are wrapped in the shared inbound envelope.If a quoted reply exists, context is appended in this form:

Copy

```
[Replying to <sender> id:<stanzaId>]
<quoted body or media placeholder>
[/Replying]
```

Reply metadata fields are also populated when available (`ReplyToId`, `ReplyToBody`, `ReplyToSender`, sender JID/E.164).

Media placeholders and location/contact extraction

Media-only inbound messages are normalized with placeholders such as:

-   `<media:image>`
-   `<media:video>`
-   `<media:audio>`
-   `<media:document>`
-   `<media:sticker>`

Location and contact payloads are normalized into textual context before routing.

Pending group history injection

For groups, unprocessed messages can be buffered and injected as context when the bot is finally triggered.

-   default limit: `50`
-   config: `channels.whatsapp.historyLimit`
-   fallback: `messages.groupChat.historyLimit`
-   `0` disables

Injection markers:

-   `[Chat messages since your last reply - for context]`
-   `[Current message - respond to this]`

Read receipts

Read receipts are enabled by default for accepted inbound WhatsApp messages.Disable globally:

Copy

```
{
  channels: {
    whatsapp: {
      sendReadReceipts: false,
    },
  },
}
```

Per-account override:

Copy

```
{
  channels: {
    whatsapp: {
      accounts: {
        work: {
          sendReadReceipts: false,
        },
      },
    },
  },
}
```

Self-chat turns skip read receipts even when globally enabled.

## 

[​

](https://docs.openclaw.ai/channels/whatsapp)

Delivery, chunking, and media

Text chunking

-   default chunk limit: `channels.whatsapp.textChunkLimit = 4000`
-   `channels.whatsapp.chunkMode = "length" | "newline"`
-   `newline` mode prefers paragraph boundaries (blank lines), then falls back to length-safe chunking

Outbound media behavior

-   supports image, video, audio (PTT voice-note), and document payloads
-   `audio/ogg` is rewritten to `audio/ogg; codecs=opus` for voice-note compatibility
-   animated GIF playback is supported via `gifPlayback: true` on video sends
-   captions are applied to the first media item when sending multi-media reply payloads
-   media source can be HTTP(S), `file://`, or local paths

Media size limits and fallback behavior

-   inbound media save cap: `channels.whatsapp.mediaMaxMb` (default `50`)
-   outbound media send cap: `channels.whatsapp.mediaMaxMb` (default `50`)
-   per-account overrides use `channels.whatsapp.accounts.<accountId>.mediaMaxMb`
-   images are auto-optimized (resize/quality sweep) to fit limits
-   on media send failure, first-item fallback sends text warning instead of dropping the response silently

## 

[​

](https://docs.openclaw.ai/channels/whatsapp)

Acknowledgment reactions

WhatsApp supports immediate ack reactions on inbound receipt via `channels.whatsapp.ackReaction`.

Copy

```
{
  channels: {
    whatsapp: {
      ackReaction: {
        emoji: "👀",
        direct: true,
        group: "mentions", // always | mentions | never
      },
    },
  },
}
```

Behavior notes:

-   sent immediately after inbound is accepted (pre-reply)
-   failures are logged but do not block normal reply delivery
-   group mode `mentions` reacts on mention-triggered turns; group activation `always` acts as bypass for this check
-   WhatsApp uses `channels.whatsapp.ackReaction` (legacy `messages.ackReaction` is not used here)

## 

[​

](https://docs.openclaw.ai/channels/whatsapp)

Multi-account and credentials

Account selection and defaults

-   account ids come from `channels.whatsapp.accounts`
-   default account selection: `default` if present, otherwise first configured account id (sorted)
-   account ids are normalized internally for lookup

Credential paths and legacy compatibility

-   current auth path: `~/.openclaw/credentials/whatsapp/<accountId>/creds.json`
-   backup file: `creds.json.bak`
-   legacy default auth in `~/.openclaw/credentials/` is still recognized/migrated for default-account flows

Logout behavior

`openclaw channels logout --channel whatsapp [--account <id>]` clears WhatsApp auth state for that account.In legacy auth directories, `oauth.json` is preserved while Baileys auth files are removed.

## 

[​

](https://docs.openclaw.ai/channels/whatsapp)

Tools, actions, and config writes

-   Agent tool support includes WhatsApp reaction action (`react`).
-   Action gates:
    -   `channels.whatsapp.actions.reactions`
    -   `channels.whatsapp.actions.polls`
-   Channel-initiated config writes are enabled by default (disable via `channels.whatsapp.configWrites=false`).

## 

[​

](https://docs.openclaw.ai/channels/whatsapp)

Troubleshooting

Not linked (QR required)

Symptom: channel status reports not linked.Fix:

Copy

```
openclaw channels login --channel whatsapp
openclaw channels status
```

Linked but disconnected / reconnect loop

Symptom: linked account with repeated disconnects or reconnect attempts.Fix:

Copy

```
openclaw doctor
openclaw logs --follow
```

If needed, re-link with `channels login`.

No active listener when sending

Outbound sends fail fast when no active gateway listener exists for the target account.Make sure gateway is running and the account is linked.

Group messages unexpectedly ignored

Check in this order:

-   `groupPolicy`
-   `groupAllowFrom` / `allowFrom`
-   `groups` allowlist entries
-   mention gating (`requireMention` + mention patterns)
-   duplicate keys in `openclaw.json` (JSON5): later entries override earlier ones, so keep a single `groupPolicy` per scope

Bun runtime warning

WhatsApp gateway runtime should use Node. Bun is flagged as incompatible for stable WhatsApp/Telegram gateway operation.

## 

[​

](https://docs.openclaw.ai/channels/whatsapp)

Configuration reference pointers

Primary reference:

-   [Configuration reference - WhatsApp](https://docs.openclaw.ai/gateway/configuration-reference)

High-signal WhatsApp fields:

-   access: `dmPolicy`, `allowFrom`, `groupPolicy`, `groupAllowFrom`, `groups`
-   delivery: `textChunkLimit`, `chunkMode`, `mediaMaxMb`, `sendReadReceipts`, `ackReaction`
-   multi-account: `accounts.<id>.enabled`, `accounts.<id>.authDir`, account-level overrides
-   operations: `configWrites`, `debounceMs`, `web.enabled`, `web.heartbeatSeconds`, `web.reconnect.*`
-   session behavior: `session.dmScope`, `historyLimit`, `dmHistoryLimit`, `dms.<id>.historyLimit`

## 

[​

](https://docs.openclaw.ai/channels/whatsapp)

Related

-   [Pairing](https://docs.openclaw.ai/channels/pairing)
-   [Channel routing](https://docs.openclaw.ai/channels/channel-routing)
-   [Multi-agent routing](https://docs.openclaw.ai/concepts/multi-agent)
-   [Troubleshooting](https://docs.openclaw.ai/channels/troubleshooting)

[Twitch](https://docs.openclaw.ai/channels/twitch)[Zalo](https://docs.openclaw.ai/channels/zalo)

⌘I
