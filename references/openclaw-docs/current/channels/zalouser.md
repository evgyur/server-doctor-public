<!-- Source: https://docs.openclaw.ai/channels/zalouser -->
<!-- Title: Zalo Personal - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/zalouser)

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

-   [Zalo Personal (unofficial)](https://docs.openclaw.ai/channels/zalouser)
-   [Plugin required](https://docs.openclaw.ai/channels/zalouser)
-   [Quick setup (beginner)](https://docs.openclaw.ai/channels/zalouser)
-   [What it is](https://docs.openclaw.ai/channels/zalouser)
-   [Naming](https://docs.openclaw.ai/channels/zalouser)
-   [Finding IDs (directory)](https://docs.openclaw.ai/channels/zalouser)
-   [Limits](https://docs.openclaw.ai/channels/zalouser)
-   [Access control (DMs)](https://docs.openclaw.ai/channels/zalouser)
-   [Group access (optional)](https://docs.openclaw.ai/channels/zalouser)
-   [Group mention gating](https://docs.openclaw.ai/channels/zalouser)
-   [Multi-account](https://docs.openclaw.ai/channels/zalouser)
-   [Typing, reactions, and delivery acknowledgements](https://docs.openclaw.ai/channels/zalouser)
-   [Troubleshooting](https://docs.openclaw.ai/channels/zalouser)

Messaging platforms

# Zalo Personal

# 

[​

](https://docs.openclaw.ai/channels/zalouser)

Zalo Personal (unofficial)

Status: experimental. This integration automates a **personal Zalo account** via native `zca-js` inside OpenClaw.

> **Warning:** This is an unofficial integration and may result in account suspension/ban. Use at your own risk.

## 

[​

](https://docs.openclaw.ai/channels/zalouser)

Plugin required

Zalo Personal ships as a plugin and is not bundled with the core install.

-   Install via CLI: `openclaw plugins install @openclaw/zalouser`
-   Or from a source checkout: `openclaw plugins install ./extensions/zalouser`
-   Details: [Plugins](https://docs.openclaw.ai/tools/plugin)

No external `zca`/`openzca` CLI binary is required.

## 

[​

](https://docs.openclaw.ai/channels/zalouser)

Quick setup (beginner)

1.  Install the plugin (see above).
2.  Login (QR, on the Gateway machine):
    -   `openclaw channels login --channel zalouser`
    -   Scan the QR code with the Zalo mobile app.
3.  Enable the channel:

Copy

```
{
  channels: {
    zalouser: {
      enabled: true,
      dmPolicy: "pairing",
    },
  },
}
```

4.  Restart the Gateway (or finish setup).
5.  DM access defaults to pairing; approve the pairing code on first contact.

## 

[​

](https://docs.openclaw.ai/channels/zalouser)

What it is

-   Runs entirely in-process via `zca-js`.
-   Uses native event listeners to receive inbound messages.
-   Sends replies directly through the JS API (text/media/link).
-   Designed for “personal account” use cases where Zalo Bot API is not available.

## 

[​

](https://docs.openclaw.ai/channels/zalouser)

Naming

Channel id is `zalouser` to make it explicit this automates a **personal Zalo user account** (unofficial). We keep `zalo` reserved for a potential future official Zalo API integration.

## 

[​

](https://docs.openclaw.ai/channels/zalouser)

Finding IDs (directory)

Use the directory CLI to discover peers/groups and their IDs:

Copy

```
openclaw directory self --channel zalouser
openclaw directory peers list --channel zalouser --query "name"
openclaw directory groups list --channel zalouser --query "work"
```

## 

[​

](https://docs.openclaw.ai/channels/zalouser)

Limits

-   Outbound text is chunked to ~2000 characters (Zalo client limits).
-   Streaming is blocked by default.

## 

[​

](https://docs.openclaw.ai/channels/zalouser)

Access control (DMs)

`channels.zalouser.dmPolicy` supports: `pairing | allowlist | open | disabled` (default: `pairing`). `channels.zalouser.allowFrom` accepts user IDs or names. During setup, names are resolved to IDs using the plugin’s in-process contact lookup. Approve via:

-   `openclaw pairing list zalouser`
-   `openclaw pairing approve zalouser <code>`

## 

[​

](https://docs.openclaw.ai/channels/zalouser)

Group access (optional)

-   Default: `channels.zalouser.groupPolicy = "open"` (groups allowed). Use `channels.defaults.groupPolicy` to override the default when unset.
-   Restrict to an allowlist with:
    -   `channels.zalouser.groupPolicy = "allowlist"`
    -   `channels.zalouser.groups` (keys should be stable group IDs; names are resolved to IDs on startup when possible)
    -   `channels.zalouser.groupAllowFrom` (controls which senders in allowed groups can trigger the bot)
-   Block all groups: `channels.zalouser.groupPolicy = "disabled"`.
-   The configure wizard can prompt for group allowlists.
-   On startup, OpenClaw resolves group/user names in allowlists to IDs and logs the mapping.
-   Group allowlist matching is ID-only by default. Unresolved names are ignored for auth unless `channels.zalouser.dangerouslyAllowNameMatching: true` is enabled.
-   `channels.zalouser.dangerouslyAllowNameMatching: true` is a break-glass compatibility mode that re-enables mutable group-name matching.
-   If `groupAllowFrom` is unset, runtime falls back to `allowFrom` for group sender checks.
-   Sender checks apply to both normal group messages and control commands (for example `/new`, `/reset`).

Example:

Copy

```
{
  channels: {
    zalouser: {
      groupPolicy: "allowlist",
      groupAllowFrom: ["1471383327500481391"],
      groups: {
        "123456789": { allow: true },
        "Work Chat": { allow: true },
      },
    },
  },
}
```

### 

[​

](https://docs.openclaw.ai/channels/zalouser)

Group mention gating

-   `channels.zalouser.groups.<group>.requireMention` controls whether group replies require a mention.
-   Resolution order: exact group id/name -> normalized group slug -> `*` -> default (`true`).
-   This applies both to allowlisted groups and open group mode.
-   Authorized control commands (for example `/new`) can bypass mention gating.
-   When a group message is skipped because mention is required, OpenClaw stores it as pending group history and includes it on the next processed group message.
-   Group history limit defaults to `messages.groupChat.historyLimit` (fallback `50`). You can override per account with `channels.zalouser.historyLimit`.

Example:

Copy

```
{
  channels: {
    zalouser: {
      groupPolicy: "allowlist",
      groups: {
        "*": { allow: true, requireMention: true },
        "Work Chat": { allow: true, requireMention: false },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/channels/zalouser)

Multi-account

Accounts map to `zalouser` profiles in OpenClaw state. Example:

Copy

```
{
  channels: {
    zalouser: {
      enabled: true,
      defaultAccount: "default",
      accounts: {
        work: { enabled: true, profile: "work" },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/channels/zalouser)

Typing, reactions, and delivery acknowledgements

-   OpenClaw sends a typing event before dispatching a reply (best-effort).
-   Message reaction action `react` is supported for `zalouser` in channel actions.
    -   Use `remove: true` to remove a specific reaction emoji from a message.
    -   Reaction semantics: [Reactions](https://docs.openclaw.ai/tools/reactions)
-   For inbound messages that include event metadata, OpenClaw sends delivered + seen acknowledgements (best-effort).

## 

[​

](https://docs.openclaw.ai/channels/zalouser)

Troubleshooting

**Login doesn’t stick:**

-   `openclaw channels status --probe`
-   Re-login: `openclaw channels logout --channel zalouser && openclaw channels login --channel zalouser`

**Allowlist/group name didn’t resolve:**

-   Use numeric IDs in `allowFrom`/`groupAllowFrom`/`groups`, or exact friend/group names.

**Upgraded from old CLI-based setup:**

-   Remove any old external `zca` process assumptions.
-   The channel now runs fully in OpenClaw without external CLI binaries.

[Zalo](https://docs.openclaw.ai/channels/zalo)[Pairing](https://docs.openclaw.ai/channels/pairing)

⌘I
