<!-- Source: https://docs.openclaw.ai/channels/zalo -->
<!-- Title: Zalo - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/zalo)

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

-   [Zalo (Bot API)](https://docs.openclaw.ai/channels/zalo)
-   [Plugin required](https://docs.openclaw.ai/channels/zalo)
-   [Quick setup (beginner)](https://docs.openclaw.ai/channels/zalo)
-   [What it is](https://docs.openclaw.ai/channels/zalo)
-   [Setup (fast path)](https://docs.openclaw.ai/channels/zalo)
-   [1) Create a bot token (Zalo Bot Platform)](https://docs.openclaw.ai/channels/zalo)
-   [2) Configure the token (env or config)](https://docs.openclaw.ai/channels/zalo)
-   [How it works (behavior)](https://docs.openclaw.ai/channels/zalo)
-   [Limits](https://docs.openclaw.ai/channels/zalo)
-   [Access control (DMs)](https://docs.openclaw.ai/channels/zalo)
-   [DM access](https://docs.openclaw.ai/channels/zalo)
-   [Access control (Groups)](https://docs.openclaw.ai/channels/zalo)
-   [Long-polling vs webhook](https://docs.openclaw.ai/channels/zalo)
-   [Supported message types](https://docs.openclaw.ai/channels/zalo)
-   [Capabilities](https://docs.openclaw.ai/channels/zalo)
-   [Delivery targets (CLI/cron)](https://docs.openclaw.ai/channels/zalo)
-   [Troubleshooting](https://docs.openclaw.ai/channels/zalo)
-   [Configuration reference (Zalo)](https://docs.openclaw.ai/channels/zalo)

Messaging platforms

# Zalo

# 

[​

](https://docs.openclaw.ai/channels/zalo)

Zalo (Bot API)

Status: experimental. DMs are supported. The [Capabilities](https://docs.openclaw.ai/channels/zalo) section below reflects current Marketplace-bot behavior.

## 

[​

](https://docs.openclaw.ai/channels/zalo)

Plugin required

Zalo ships as a plugin and is not bundled with the core install.

-   Install via CLI: `openclaw plugins install @openclaw/zalo`
-   Or select **Zalo** during setup and confirm the install prompt
-   Details: [Plugins](https://docs.openclaw.ai/tools/plugin)

## 

[​

](https://docs.openclaw.ai/channels/zalo)

Quick setup (beginner)

1.  Install the Zalo plugin:
    -   From a source checkout: `openclaw plugins install ./extensions/zalo`
    -   From npm (if published): `openclaw plugins install @openclaw/zalo`
    -   Or pick **Zalo** in setup and confirm the install prompt
2.  Set the token:
    -   Env: `ZALO_BOT_TOKEN=...`
    -   Or config: `channels.zalo.accounts.default.botToken: "..."`.
3.  Restart the gateway (or finish setup).
4.  DM access is pairing by default; approve the pairing code on first contact.

Minimal config:

Copy

```
{
  channels: {
    zalo: {
      enabled: true,
      accounts: {
        default: {
          botToken: "12345689:abc-xyz",
          dmPolicy: "pairing",
        },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/channels/zalo)

What it is

Zalo is a Vietnam-focused messaging app; its Bot API lets the Gateway run a bot for 1:1 conversations. It is a good fit for support or notifications where you want deterministic routing back to Zalo. This page reflects current OpenClaw behavior for **Zalo Bot Creator / Marketplace bots**. **Zalo Official Account (OA) bots** are a different Zalo product surface and may behave differently.

-   A Zalo Bot API channel owned by the Gateway.
-   Deterministic routing: replies go back to Zalo; the model never chooses channels.
-   DMs share the agent’s main session.
-   The [Capabilities](https://docs.openclaw.ai/channels/zalo) section below shows current Marketplace-bot support.

## 

[​

](https://docs.openclaw.ai/channels/zalo)

Setup (fast path)

### 

[​

](https://docs.openclaw.ai/channels/zalo)

1) Create a bot token (Zalo Bot Platform)

1.  Go to [https://bot.zaloplatforms.com](https://bot.zaloplatforms.com/) and sign in.
2.  Create a new bot and configure its settings.
3.  Copy the full bot token (typically `numeric_id:secret`). For Marketplace bots, the usable runtime token may appear in the bot’s welcome message after creation.

### 

[​

](https://docs.openclaw.ai/channels/zalo)

2) Configure the token (env or config)

Example:

Copy

```
{
  channels: {
    zalo: {
      enabled: true,
      accounts: {
        default: {
          botToken: "12345689:abc-xyz",
          dmPolicy: "pairing",
        },
      },
    },
  },
}
```

If you later move to a Zalo bot surface where groups are available, you can add group-specific config such as `groupPolicy` and `groupAllowFrom` explicitly. For current Marketplace-bot behavior, see [Capabilities](https://docs.openclaw.ai/channels/zalo). Env option: `ZALO_BOT_TOKEN=...` (works for the default account only). Multi-account support: use `channels.zalo.accounts` with per-account tokens and optional `name`.

3.  Restart the gateway. Zalo starts when a token is resolved (env or config).
4.  DM access defaults to pairing. Approve the code when the bot is first contacted.

## 

[​

](https://docs.openclaw.ai/channels/zalo)

How it works (behavior)

-   Inbound messages are normalized into the shared channel envelope with media placeholders.
-   Replies always route back to the same Zalo chat.
-   Long-polling by default; webhook mode available with `channels.zalo.webhookUrl`.

## 

[​

](https://docs.openclaw.ai/channels/zalo)

Limits

-   Outbound text is chunked to 2000 characters (Zalo API limit).
-   Media downloads/uploads are capped by `channels.zalo.mediaMaxMb` (default 5).
-   Streaming is blocked by default due to the 2000 char limit making streaming less useful.

## 

[​

](https://docs.openclaw.ai/channels/zalo)

Access control (DMs)

### 

[​

](https://docs.openclaw.ai/channels/zalo)

DM access

-   Default: `channels.zalo.dmPolicy = "pairing"`. Unknown senders receive a pairing code; messages are ignored until approved (codes expire after 1 hour).
-   Approve via:
    -   `openclaw pairing list zalo`
    -   `openclaw pairing approve zalo <CODE>`
-   Pairing is the default token exchange. Details: [Pairing](https://docs.openclaw.ai/channels/pairing)
-   `channels.zalo.allowFrom` accepts numeric user IDs (no username lookup available).

## 

[​

](https://docs.openclaw.ai/channels/zalo)

Access control (Groups)

For **Zalo Bot Creator / Marketplace bots**, group support was not available in practice because the bot could not be added to a group at all. That means the group-related config keys below exist in the schema, but were not usable for Marketplace bots:

-   `channels.zalo.groupPolicy` controls group inbound handling: `open | allowlist | disabled`.
-   `channels.zalo.groupAllowFrom` restricts which sender IDs can trigger the bot in groups.
-   If `groupAllowFrom` is unset, Zalo falls back to `allowFrom` for sender checks.
-   Runtime note: if `channels.zalo` is missing entirely, runtime still falls back to `groupPolicy="allowlist"` for safety.

The group policy values (when group access is available on your bot surface) are:

-   `groupPolicy: "disabled"` — blocks all group messages.
-   `groupPolicy: "open"` — allows any group member (mention-gated).
-   `groupPolicy: "allowlist"` — fail-closed default; only allowed senders are accepted.

If you are using a different Zalo bot product surface and have verified working group behavior, document that separately rather than assuming it matches the Marketplace-bot flow.

## 

[​

](https://docs.openclaw.ai/channels/zalo)

Long-polling vs webhook

-   Default: long-polling (no public URL required).
-   Webhook mode: set `channels.zalo.webhookUrl` and `channels.zalo.webhookSecret`.
    -   The webhook secret must be 8-256 characters.
    -   Webhook URL must use HTTPS.
    -   Zalo sends events with `X-Bot-Api-Secret-Token` header for verification.
    -   Gateway HTTP handles webhook requests at `channels.zalo.webhookPath` (defaults to the webhook URL path).
    -   Requests must use `Content-Type: application/json` (or `+json` media types).
    -   Duplicate events (`event_name + message_id`) are ignored for a short replay window.
    -   Burst traffic is rate-limited per path/source and may return HTTP 429.

**Note:** getUpdates (polling) and webhook are mutually exclusive per Zalo API docs.

## 

[​

](https://docs.openclaw.ai/channels/zalo)

Supported message types

For a quick support snapshot, see [Capabilities](https://docs.openclaw.ai/channels/zalo). The notes below add detail where the behavior needs extra context.

-   **Text messages**: Full support with 2000 character chunking.
-   **Plain URLs in text**: Behave like normal text input.
-   **Link previews / rich link cards**: See the Marketplace-bot status in [Capabilities](https://docs.openclaw.ai/channels/zalo); they did not reliably trigger a reply.
-   **Image messages**: See the Marketplace-bot status in [Capabilities](https://docs.openclaw.ai/channels/zalo); inbound image handling was unreliable (typing indicator without a final reply).
-   **Stickers**: See the Marketplace-bot status in [Capabilities](https://docs.openclaw.ai/channels/zalo).
-   **Voice notes / audio files / video / generic file attachments**: See the Marketplace-bot status in [Capabilities](https://docs.openclaw.ai/channels/zalo).
-   **Unsupported types**: Logged (for example, messages from protected users).

## 

[​

](https://docs.openclaw.ai/channels/zalo)

Capabilities

This table summarizes current **Zalo Bot Creator / Marketplace bot** behavior in OpenClaw.

| Feature | Status |
| --- | --- |
| Direct messages | ✅ Supported |
| Groups | ❌ Not available for Marketplace bots |
| Media (inbound images) | ⚠️ Limited / verify in your environment |
| Media (outbound images) | ⚠️ Not re-tested for Marketplace bots |
| Plain URLs in text | ✅ Supported |
| Link previews | ⚠️ Unreliable for Marketplace bots |
| Reactions | ❌ Not supported |
| Stickers | ⚠️ No agent reply for Marketplace bots |
| Voice notes / audio / video | ⚠️ No agent reply for Marketplace bots |
| File attachments | ⚠️ No agent reply for Marketplace bots |
| Threads | ❌ Not supported |
| Polls | ❌ Not supported |
| Native commands | ❌ Not supported |
| Streaming | ⚠️ Blocked (2000 char limit) |

## 

[​

](https://docs.openclaw.ai/channels/zalo)

Delivery targets (CLI/cron)

-   Use a chat id as the target.
-   Example: `openclaw message send --channel zalo --target 123456789 --message "hi"`.

## 

[​

](https://docs.openclaw.ai/channels/zalo)

Troubleshooting

**Bot doesn’t respond:**

-   Check that the token is valid: `openclaw channels status --probe`
-   Verify the sender is approved (pairing or allowFrom)
-   Check gateway logs: `openclaw logs --follow`

**Webhook not receiving events:**

-   Ensure webhook URL uses HTTPS
-   Verify secret token is 8-256 characters
-   Confirm the gateway HTTP endpoint is reachable on the configured path
-   Check that getUpdates polling is not running (they’re mutually exclusive)

## 

[​

](https://docs.openclaw.ai/channels/zalo)

Configuration reference (Zalo)

Full configuration: [Configuration](https://docs.openclaw.ai/gateway/configuration) The flat top-level keys (`channels.zalo.botToken`, `channels.zalo.dmPolicy`, and similar) are a legacy single-account shorthand. Prefer `channels.zalo.accounts.<id>.*` for new configs. Both forms are still documented here because they exist in the schema. Provider options:

-   `channels.zalo.enabled`: enable/disable channel startup.
-   `channels.zalo.botToken`: bot token from Zalo Bot Platform.
-   `channels.zalo.tokenFile`: read token from a regular file path. Symlinks are rejected.
-   `channels.zalo.dmPolicy`: `pairing | allowlist | open | disabled` (default: pairing).
-   `channels.zalo.allowFrom`: DM allowlist (user IDs). `open` requires `"*"`. The wizard will ask for numeric IDs.
-   `channels.zalo.groupPolicy`: `open | allowlist | disabled` (default: allowlist). Present in config; see [Capabilities](https://docs.openclaw.ai/channels/zalo) and [Access control (Groups)](https://docs.openclaw.ai/channels/zalo) for current Marketplace-bot behavior.
-   `channels.zalo.groupAllowFrom`: group sender allowlist (user IDs). Falls back to `allowFrom` when unset.
-   `channels.zalo.mediaMaxMb`: inbound/outbound media cap (MB, default 5).
-   `channels.zalo.webhookUrl`: enable webhook mode (HTTPS required).
-   `channels.zalo.webhookSecret`: webhook secret (8-256 chars).
-   `channels.zalo.webhookPath`: webhook path on the gateway HTTP server.
-   `channels.zalo.proxy`: proxy URL for API requests.

Multi-account options:

-   `channels.zalo.accounts.<id>.botToken`: per-account token.
-   `channels.zalo.accounts.<id>.tokenFile`: per-account regular token file. Symlinks are rejected.
-   `channels.zalo.accounts.<id>.name`: display name.
-   `channels.zalo.accounts.<id>.enabled`: enable/disable account.
-   `channels.zalo.accounts.<id>.dmPolicy`: per-account DM policy.
-   `channels.zalo.accounts.<id>.allowFrom`: per-account allowlist.
-   `channels.zalo.accounts.<id>.groupPolicy`: per-account group policy. Present in config; see [Capabilities](https://docs.openclaw.ai/channels/zalo) and [Access control (Groups)](https://docs.openclaw.ai/channels/zalo) for current Marketplace-bot behavior.
-   `channels.zalo.accounts.<id>.groupAllowFrom`: per-account group sender allowlist.
-   `channels.zalo.accounts.<id>.webhookUrl`: per-account webhook URL.
-   `channels.zalo.accounts.<id>.webhookSecret`: per-account webhook secret.
-   `channels.zalo.accounts.<id>.webhookPath`: per-account webhook path.
-   `channels.zalo.accounts.<id>.proxy`: per-account proxy URL.

[WhatsApp](https://docs.openclaw.ai/channels/whatsapp)[Zalo Personal](https://docs.openclaw.ai/channels/zalouser)

⌘I
