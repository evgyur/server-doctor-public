<!-- Source: https://docs.openclaw.ai/channels/imessage -->
<!-- Title: iMessage - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/channels/imessage)

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

-   [iMessage (legacy: imsg)](https://docs.openclaw.ai/channels/imessage)
-   [Quick setup](https://docs.openclaw.ai/channels/imessage)
-   [Requirements and permissions (macOS)](https://docs.openclaw.ai/channels/imessage)
-   [Access control and routing](https://docs.openclaw.ai/channels/imessage)
-   [Deployment patterns](https://docs.openclaw.ai/channels/imessage)
-   [Media, chunking, and delivery targets](https://docs.openclaw.ai/channels/imessage)
-   [Config writes](https://docs.openclaw.ai/channels/imessage)
-   [Troubleshooting](https://docs.openclaw.ai/channels/imessage)
-   [Configuration reference pointers](https://docs.openclaw.ai/channels/imessage)

Messaging platforms

# iMessage

# 

[​

](https://docs.openclaw.ai/channels/imessage)

iMessage (legacy: imsg)

For new iMessage deployments, use [BlueBubbles](https://docs.openclaw.ai/channels/bluebubbles).The `imsg` integration is legacy and may be removed in a future release.

Status: legacy external CLI integration. Gateway spawns `imsg rpc` and communicates over JSON-RPC on stdio (no separate daemon/port).

[

## BlueBubbles (recommended)

Preferred iMessage path for new setups.





](https://docs.openclaw.ai/channels/bluebubbles)[

## Pairing

iMessage DMs default to pairing mode.





](https://docs.openclaw.ai/channels/pairing)[

## Configuration reference

Full iMessage field reference.





](https://docs.openclaw.ai/gateway/configuration-reference)

## 

[​

](https://docs.openclaw.ai/channels/imessage)

Quick setup

-   Local Mac (fast path)
    
-   Remote Mac over SSH
    

1

[

](https://docs.openclaw.ai/channels/imessage)

Install and verify imsg

Copy

```
brew install steipete/tap/imsg
imsg rpc --help
```

2

[

](https://docs.openclaw.ai/channels/imessage)

Configure OpenClaw

Copy

```
{
  channels: {
    imessage: {
      enabled: true,
      cliPath: "/usr/local/bin/imsg",
      dbPath: "/Users/<you>/Library/Messages/chat.db",
    },
  },
}
```

3

[

](https://docs.openclaw.ai/channels/imessage)

Start gateway

Copy

```
openclaw gateway
```

4

[

](https://docs.openclaw.ai/channels/imessage)

Approve first DM pairing (default dmPolicy)

Copy

```
openclaw pairing list imessage
openclaw pairing approve imessage <CODE>
```

Pairing requests expire after 1 hour.

OpenClaw only requires a stdio-compatible `cliPath`, so you can point `cliPath` at a wrapper script that SSHes to a remote Mac and runs `imsg`.

Copy

```
#!/usr/bin/env bash
exec ssh -T gateway-host imsg "$@"
```

Recommended config when attachments are enabled:

Copy

```
{
  channels: {
    imessage: {
      enabled: true,
      cliPath: "~/.openclaw/scripts/imsg-ssh",
      remoteHost: "user@gateway-host", // used for SCP attachment fetches
      includeAttachments: true,
      // Optional: override allowed attachment roots.
      // Defaults include /Users/*/Library/Messages/Attachments
      attachmentRoots: ["/Users/*/Library/Messages/Attachments"],
      remoteAttachmentRoots: ["/Users/*/Library/Messages/Attachments"],
    },
  },
}
```

If `remoteHost` is not set, OpenClaw attempts to auto-detect it by parsing the SSH wrapper script. `remoteHost` must be `host` or `user@host` (no spaces or SSH options). OpenClaw uses strict host-key checking for SCP, so the relay host key must already exist in `~/.ssh/known_hosts`. Attachment paths are validated against allowed roots (`attachmentRoots` / `remoteAttachmentRoots`).

## 

[​

](https://docs.openclaw.ai/channels/imessage)

Requirements and permissions (macOS)

-   Messages must be signed in on the Mac running `imsg`.
-   Full Disk Access is required for the process context running OpenClaw/`imsg` (Messages DB access).
-   Automation permission is required to send messages through Messages.app.

Permissions are granted per process context. If gateway runs headless (LaunchAgent/SSH), run a one-time interactive command in that same context to trigger prompts:

Copy

```
imsg chats --limit 1
# or
imsg send <handle> "test"
```

## 

[​

](https://docs.openclaw.ai/channels/imessage)

Access control and routing

-   DM policy
    
-   Group policy + mentions
    
-   Sessions and deterministic replies
    

`channels.imessage.dmPolicy` controls direct messages:

-   `pairing` (default)
-   `allowlist`
-   `open` (requires `allowFrom` to include `"*"`)
-   `disabled`

Allowlist field: `channels.imessage.allowFrom`.Allowlist entries can be handles or chat targets (`chat_id:*`, `chat_guid:*`, `chat_identifier:*`).

`channels.imessage.groupPolicy` controls group handling:

-   `allowlist` (default when configured)
-   `open`
-   `disabled`

Group sender allowlist: `channels.imessage.groupAllowFrom`.Runtime fallback: if `groupAllowFrom` is unset, iMessage group sender checks fall back to `allowFrom` when available. Runtime note: if `channels.imessage` is completely missing, runtime falls back to `groupPolicy="allowlist"` and logs a warning (even if `channels.defaults.groupPolicy` is set).Mention gating for groups:

-   iMessage has no native mention metadata
-   mention detection uses regex patterns (`agents.list[].groupChat.mentionPatterns`, fallback `messages.groupChat.mentionPatterns`)
-   with no configured patterns, mention gating cannot be enforced

Control commands from authorized senders can bypass mention gating in groups.

-   DMs use direct routing; groups use group routing.
-   With default `session.dmScope=main`, iMessage DMs collapse into the agent main session.
-   Group sessions are isolated (`agent:<agentId>:imessage:group:<chat_id>`).
-   Replies route back to iMessage using originating channel/target metadata.

Group-ish thread behavior:Some multi-participant iMessage threads can arrive with `is_group=false`. If that `chat_id` is explicitly configured under `channels.imessage.groups`, OpenClaw treats it as group traffic (group gating + group session isolation).

## 

[​

](https://docs.openclaw.ai/channels/imessage)

Deployment patterns

Dedicated bot macOS user (separate iMessage identity)

Use a dedicated Apple ID and macOS user so bot traffic is isolated from your personal Messages profile.Typical flow:

1.  Create/sign in a dedicated macOS user.
2.  Sign into Messages with the bot Apple ID in that user.
3.  Install `imsg` in that user.
4.  Create SSH wrapper so OpenClaw can run `imsg` in that user context.
5.  Point `channels.imessage.accounts.<id>.cliPath` and `.dbPath` to that user profile.

First run may require GUI approvals (Automation + Full Disk Access) in that bot user session.

Remote Mac over Tailscale (example)

Common topology:

-   gateway runs on Linux/VM
-   iMessage + `imsg` runs on a Mac in your tailnet
-   `cliPath` wrapper uses SSH to run `imsg`
-   `remoteHost` enables SCP attachment fetches

Example:

Copy

```
{
  channels: {
    imessage: {
      enabled: true,
      cliPath: "~/.openclaw/scripts/imsg-ssh",
      remoteHost: "bot@mac-mini.tailnet-1234.ts.net",
      includeAttachments: true,
      dbPath: "/Users/bot/Library/Messages/chat.db",
    },
  },
}
```

Copy

```
#!/usr/bin/env bash
exec ssh -T bot@mac-mini.tailnet-1234.ts.net imsg "$@"
```

Use SSH keys so both SSH and SCP are non-interactive. Ensure the host key is trusted first (for example `ssh bot@mac-mini.tailnet-1234.ts.net`) so `known_hosts` is populated.

Multi-account pattern

iMessage supports per-account config under `channels.imessage.accounts`.Each account can override fields such as `cliPath`, `dbPath`, `allowFrom`, `groupPolicy`, `mediaMaxMb`, history settings, and attachment root allowlists.

## 

[​

](https://docs.openclaw.ai/channels/imessage)

Media, chunking, and delivery targets

Attachments and media

-   inbound attachment ingestion is optional: `channels.imessage.includeAttachments`
-   remote attachment paths can be fetched via SCP when `remoteHost` is set
-   attachment paths must match allowed roots:
    -   `channels.imessage.attachmentRoots` (local)
    -   `channels.imessage.remoteAttachmentRoots` (remote SCP mode)
    -   default root pattern: `/Users/*/Library/Messages/Attachments`
-   SCP uses strict host-key checking (`StrictHostKeyChecking=yes`)
-   outbound media size uses `channels.imessage.mediaMaxMb` (default 16 MB)

Outbound chunking

-   text chunk limit: `channels.imessage.textChunkLimit` (default 4000)
-   chunk mode: `channels.imessage.chunkMode`
    -   `length` (default)
    -   `newline` (paragraph-first splitting)

Addressing formats

Preferred explicit targets:

-   `chat_id:123` (recommended for stable routing)
-   `chat_guid:...`
-   `chat_identifier:...`

Handle targets are also supported:

-   `imessage:+1555...`
-   `sms:+1555...`
-   `user@example.com`

Copy

```
imsg chats --limit 20
```

## 

[​

](https://docs.openclaw.ai/channels/imessage)

Config writes

iMessage allows channel-initiated config writes by default (for `/config set|unset` when `commands.config: true`). Disable:

Copy

```
{
  channels: {
    imessage: {
      configWrites: false,
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/channels/imessage)

Troubleshooting

imsg not found or RPC unsupported

Validate the binary and RPC support:

Copy

```
imsg rpc --help
openclaw channels status --probe
```

If probe reports RPC unsupported, update `imsg`.

DMs are ignored

Check:

-   `channels.imessage.dmPolicy`
-   `channels.imessage.allowFrom`
-   pairing approvals (`openclaw pairing list imessage`)

Group messages are ignored

Check:

-   `channels.imessage.groupPolicy`
-   `channels.imessage.groupAllowFrom`
-   `channels.imessage.groups` allowlist behavior
-   mention pattern configuration (`agents.list[].groupChat.mentionPatterns`)

Remote attachments fail

Check:

-   `channels.imessage.remoteHost`
-   `channels.imessage.remoteAttachmentRoots`
-   SSH/SCP key auth from the gateway host
-   host key exists in `~/.ssh/known_hosts` on the gateway host
-   remote path readability on the Mac running Messages

macOS permission prompts were missed

Re-run in an interactive GUI terminal in the same user/session context and approve prompts:

Copy

```
imsg chats --limit 1
imsg send <handle> "test"
```

Confirm Full Disk Access + Automation are granted for the process context that runs OpenClaw/`imsg`.

## 

[​

](https://docs.openclaw.ai/channels/imessage)

Configuration reference pointers

-   [Configuration reference - iMessage](https://docs.openclaw.ai/gateway/configuration-reference)
-   [Gateway configuration](https://docs.openclaw.ai/gateway/configuration)
-   [Pairing](https://docs.openclaw.ai/channels/pairing)
-   [BlueBubbles](https://docs.openclaw.ai/channels/bluebubbles)

[Google Chat](https://docs.openclaw.ai/channels/googlechat)[IRC](https://docs.openclaw.ai/channels/irc)

⌘I
