<!-- Source: https://docs.openclaw.ai/concepts/multi-agent -->
<!-- Title: Multi-Agent Routing - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/concepts/multi-agent)

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

##### Fundamentals

-   [
    
    Pi Integration Architecture
    
    
    
    ](https://docs.openclaw.ai/pi)
-   [
    
    Gateway Architecture
    
    
    
    ](https://docs.openclaw.ai/concepts/architecture)
-   [
    
    Agent Runtime
    
    
    
    ](https://docs.openclaw.ai/concepts/agent)
-   [
    
    Agent Loop
    
    
    
    ](https://docs.openclaw.ai/concepts/agent-loop)
-   [
    
    System Prompt
    
    
    
    ](https://docs.openclaw.ai/concepts/system-prompt)
-   [
    
    Context
    
    
    
    ](https://docs.openclaw.ai/concepts/context)
-   [
    
    Agent Workspace
    
    
    
    ](https://docs.openclaw.ai/concepts/agent-workspace)
-   [
    
    OAuth
    
    
    
    ](https://docs.openclaw.ai/concepts/oauth)

##### Bootstrapping

-   [
    
    Bootstrapping
    
    
    
    ](https://docs.openclaw.ai/start/bootstrapping)

##### Sessions and memory

-   [
    
    Session Management
    
    
    
    ](https://docs.openclaw.ai/concepts/session)
-   [
    
    Session Pruning
    
    
    
    ](https://docs.openclaw.ai/concepts/session-pruning)
-   [
    
    Session Tools
    
    
    
    ](https://docs.openclaw.ai/concepts/session-tool)
-   [
    
    Memory
    
    
    
    ](https://docs.openclaw.ai/concepts/memory)
-   [
    
    Compaction
    
    
    
    ](https://docs.openclaw.ai/concepts/compaction)

##### Multi-agent

-   [
    
    Multi-Agent Routing
    
    
    
    ](https://docs.openclaw.ai/concepts/multi-agent)
-   [
    
    Presence
    
    
    
    ](https://docs.openclaw.ai/concepts/presence)

##### Messages and delivery

-   [
    
    Messages
    
    
    
    ](https://docs.openclaw.ai/concepts/messages)
-   [
    
    Streaming and Chunking
    
    
    
    ](https://docs.openclaw.ai/concepts/streaming)
-   [
    
    Retry Policy
    
    
    
    ](https://docs.openclaw.ai/concepts/retry)
-   [
    
    Command Queue
    
    
    
    ](https://docs.openclaw.ai/concepts/queue)

-   [Multi-Agent Routing](https://docs.openclaw.ai/concepts/multi-agent)
-   [What is “one agent”?](https://docs.openclaw.ai/concepts/multi-agent)
-   [Paths (quick map)](https://docs.openclaw.ai/concepts/multi-agent)
-   [Single-agent mode (default)](https://docs.openclaw.ai/concepts/multi-agent)
-   [Agent helper](https://docs.openclaw.ai/concepts/multi-agent)
-   [Quick start](https://docs.openclaw.ai/concepts/multi-agent)
-   [Multiple agents = multiple people, multiple personalities](https://docs.openclaw.ai/concepts/multi-agent)
-   [One WhatsApp number, multiple people (DM split)](https://docs.openclaw.ai/concepts/multi-agent)
-   [Routing rules (how messages pick an agent)](https://docs.openclaw.ai/concepts/multi-agent)
-   [Multiple accounts / phone numbers](https://docs.openclaw.ai/concepts/multi-agent)
-   [Concepts](https://docs.openclaw.ai/concepts/multi-agent)
-   [Platform examples](https://docs.openclaw.ai/concepts/multi-agent)
-   [Discord bots per agent](https://docs.openclaw.ai/concepts/multi-agent)
-   [Telegram bots per agent](https://docs.openclaw.ai/concepts/multi-agent)
-   [WhatsApp numbers per agent](https://docs.openclaw.ai/concepts/multi-agent)
-   [Example: WhatsApp daily chat + Telegram deep work](https://docs.openclaw.ai/concepts/multi-agent)
-   [Example: same channel, one peer to Opus](https://docs.openclaw.ai/concepts/multi-agent)
-   [Family agent bound to a WhatsApp group](https://docs.openclaw.ai/concepts/multi-agent)
-   [Per-Agent Sandbox and Tool Configuration](https://docs.openclaw.ai/concepts/multi-agent)

Multi-agent

# Multi-Agent Routing

# 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Multi-Agent Routing

Goal: multiple _isolated_ agents (separate workspace + `agentDir` + sessions), plus multiple channel accounts (e.g. two WhatsApps) in one running Gateway. Inbound is routed to an agent via bindings.

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

What is “one agent”?

An **agent** is a fully scoped brain with its own:

-   **Workspace** (files, AGENTS.md/SOUL.md/USER.md, local notes, persona rules).
-   **State directory** (`agentDir`) for auth profiles, model registry, and per-agent config.
-   **Session store** (chat history + routing state) under `~/.openclaw/agents/<agentId>/sessions`.

Auth profiles are **per-agent**. Each agent reads from its own:

Copy

```
~/.openclaw/agents/<agentId>/agent/auth-profiles.json
```

Main agent credentials are **not** shared automatically. Never reuse `agentDir` across agents (it causes auth/session collisions). If you want to share creds, copy `auth-profiles.json` into the other agent’s `agentDir`. Skills are per-agent via each workspace’s `skills/` folder, with shared skills available from `~/.openclaw/skills`. See [Skills: per-agent vs shared](https://docs.openclaw.ai/tools/skills). The Gateway can host **one agent** (default) or **many agents** side-by-side. **Workspace note:** each agent’s workspace is the **default cwd**, not a hard sandbox. Relative paths resolve inside the workspace, but absolute paths can reach other host locations unless sandboxing is enabled. See [Sandboxing](https://docs.openclaw.ai/gateway/sandboxing).

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Paths (quick map)

-   Config: `~/.openclaw/openclaw.json` (or `OPENCLAW_CONFIG_PATH`)
-   State dir: `~/.openclaw` (or `OPENCLAW_STATE_DIR`)
-   Workspace: `~/.openclaw/workspace` (or `~/.openclaw/workspace-<agentId>`)
-   Agent dir: `~/.openclaw/agents/<agentId>/agent` (or `agents.list[].agentDir`)
-   Sessions: `~/.openclaw/agents/<agentId>/sessions`

### 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Single-agent mode (default)

If you do nothing, OpenClaw runs a single agent:

-   `agentId` defaults to **`main`**.
-   Sessions are keyed as `agent:main:<mainKey>`.
-   Workspace defaults to `~/.openclaw/workspace` (or `~/.openclaw/workspace-<profile>` when `OPENCLAW_PROFILE` is set).
-   State defaults to `~/.openclaw/agents/main/agent`.

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Agent helper

Use the agent wizard to add a new isolated agent:

Copy

```
openclaw agents add work
```

Then add `bindings` (or let the wizard do it) to route inbound messages. Verify with:

Copy

```
openclaw agents list --bindings
```

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Quick start

1

[

](https://docs.openclaw.ai/concepts/multi-agent)

Create each agent workspace

Use the wizard or create workspaces manually:

Copy

```
openclaw agents add coding
openclaw agents add social
```

Each agent gets its own workspace with `SOUL.md`, `AGENTS.md`, and optional `USER.md`, plus a dedicated `agentDir` and session store under `~/.openclaw/agents/<agentId>`.

2

[

](https://docs.openclaw.ai/concepts/multi-agent)

Create channel accounts

Create one account per agent on your preferred channels:

-   Discord: one bot per agent, enable Message Content Intent, copy each token.
-   Telegram: one bot per agent via BotFather, copy each token.
-   WhatsApp: link each phone number per account.

Copy

```
openclaw channels login --channel whatsapp --account work
```

See channel guides: [Discord](https://docs.openclaw.ai/channels/discord), [Telegram](https://docs.openclaw.ai/channels/telegram), [WhatsApp](https://docs.openclaw.ai/channels/whatsapp).

3

[

](https://docs.openclaw.ai/concepts/multi-agent)

Add agents, accounts, and bindings

Add agents under `agents.list`, channel accounts under `channels.<channel>.accounts`, and connect them with `bindings` (examples below).

4

[

](https://docs.openclaw.ai/concepts/multi-agent)

Restart and verify

Copy

```
openclaw gateway restart
openclaw agents list --bindings
openclaw channels status --probe
```

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Multiple agents = multiple people, multiple personalities

With **multiple agents**, each `agentId` becomes a **fully isolated persona**:

-   **Different phone numbers/accounts** (per channel `accountId`).
-   **Different personalities** (per-agent workspace files like `AGENTS.md` and `SOUL.md`).
-   **Separate auth + sessions** (no cross-talk unless explicitly enabled).

This lets **multiple people** share one Gateway server while keeping their AI “brains” and data isolated.

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

One WhatsApp number, multiple people (DM split)

You can route **different WhatsApp DMs** to different agents while staying on **one WhatsApp account**. Match on sender E.164 (like `+15551234567`) with `peer.kind: "direct"`. Replies still come from the same WhatsApp number (no per‑agent sender identity). Important detail: direct chats collapse to the agent’s **main session key**, so true isolation requires **one agent per person**. Example:

Copy

```
{
  agents: {
    list: [
      { id: "alex", workspace: "~/.openclaw/workspace-alex" },
      { id: "mia", workspace: "~/.openclaw/workspace-mia" },
    ],
  },
  bindings: [
    {
      agentId: "alex",
      match: { channel: "whatsapp", peer: { kind: "direct", id: "+15551230001" } },
    },
    {
      agentId: "mia",
      match: { channel: "whatsapp", peer: { kind: "direct", id: "+15551230002" } },
    },
  ],
  channels: {
    whatsapp: {
      dmPolicy: "allowlist",
      allowFrom: ["+15551230001", "+15551230002"],
    },
  },
}
```

Notes:

-   DM access control is **global per WhatsApp account** (pairing/allowlist), not per agent.
-   For shared groups, bind the group to one agent or use [Broadcast groups](https://docs.openclaw.ai/channels/broadcast-groups).

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Routing rules (how messages pick an agent)

Bindings are **deterministic** and **most-specific wins**:

1.  `peer` match (exact DM/group/channel id)
2.  `parentPeer` match (thread inheritance)
3.  `guildId + roles` (Discord role routing)
4.  `guildId` (Discord)
5.  `teamId` (Slack)
6.  `accountId` match for a channel
7.  channel-level match (`accountId: "*"`)
8.  fallback to default agent (`agents.list[].default`, else first list entry, default: `main`)

If multiple bindings match in the same tier, the first one in config order wins. If a binding sets multiple match fields (for example `peer` + `guildId`), all specified fields are required (`AND` semantics). Important account-scope detail:

-   A binding that omits `accountId` matches the default account only.
-   Use `accountId: "*"` for a channel-wide fallback across all accounts.
-   If you later add the same binding for the same agent with an explicit account id, OpenClaw upgrades the existing channel-only binding to account-scoped instead of duplicating it.

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Multiple accounts / phone numbers

Channels that support **multiple accounts** (e.g. WhatsApp) use `accountId` to identify each login. Each `accountId` can be routed to a different agent, so one server can host multiple phone numbers without mixing sessions. If you want a channel-wide default account when `accountId` is omitted, set `channels.<channel>.defaultAccount` (optional). When unset, OpenClaw falls back to `default` if present, otherwise the first configured account id (sorted). Common channels supporting this pattern include:

-   `whatsapp`, `telegram`, `discord`, `slack`, `signal`, `imessage`
-   `irc`, `line`, `googlechat`, `mattermost`, `matrix`, `nextcloud-talk`
-   `bluebubbles`, `zalo`, `zalouser`, `nostr`, `feishu`

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Concepts

-   `agentId`: one “brain” (workspace, per-agent auth, per-agent session store).
-   `accountId`: one channel account instance (e.g. WhatsApp account `"personal"` vs `"biz"`).
-   `binding`: routes inbound messages to an `agentId` by `(channel, accountId, peer)` and optionally guild/team ids.
-   Direct chats collapse to `agent:<agentId>:<mainKey>` (per-agent “main”; `session.mainKey`).

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Platform examples

### 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Discord bots per agent

Each Discord bot account maps to a unique `accountId`. Bind each account to an agent and keep allowlists per bot.

Copy

```
{
  agents: {
    list: [
      { id: "main", workspace: "~/.openclaw/workspace-main" },
      { id: "coding", workspace: "~/.openclaw/workspace-coding" },
    ],
  },
  bindings: [
    { agentId: "main", match: { channel: "discord", accountId: "default" } },
    { agentId: "coding", match: { channel: "discord", accountId: "coding" } },
  ],
  channels: {
    discord: {
      groupPolicy: "allowlist",
      accounts: {
        default: {
          token: "DISCORD_BOT_TOKEN_MAIN",
          guilds: {
            "123456789012345678": {
              channels: {
                "222222222222222222": { allow: true, requireMention: false },
              },
            },
          },
        },
        coding: {
          token: "DISCORD_BOT_TOKEN_CODING",
          guilds: {
            "123456789012345678": {
              channels: {
                "333333333333333333": { allow: true, requireMention: false },
              },
            },
          },
        },
      },
    },
  },
}
```

Notes:

-   Invite each bot to the guild and enable Message Content Intent.
-   Tokens live in `channels.discord.accounts.<id>.token` (default account can use `DISCORD_BOT_TOKEN`).

### 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Telegram bots per agent

Copy

```
{
  agents: {
    list: [
      { id: "main", workspace: "~/.openclaw/workspace-main" },
      { id: "alerts", workspace: "~/.openclaw/workspace-alerts" },
    ],
  },
  bindings: [
    { agentId: "main", match: { channel: "telegram", accountId: "default" } },
    { agentId: "alerts", match: { channel: "telegram", accountId: "alerts" } },
  ],
  channels: {
    telegram: {
      accounts: {
        default: {
          botToken: "123456:ABC...",
          dmPolicy: "pairing",
        },
        alerts: {
          botToken: "987654:XYZ...",
          dmPolicy: "allowlist",
          allowFrom: ["tg:123456789"],
        },
      },
    },
  },
}
```

Notes:

-   Create one bot per agent with BotFather and copy each token.
-   Tokens live in `channels.telegram.accounts.<id>.botToken` (default account can use `TELEGRAM_BOT_TOKEN`).

### 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

WhatsApp numbers per agent

Link each account before starting the gateway:

Copy

```
openclaw channels login --channel whatsapp --account personal
openclaw channels login --channel whatsapp --account biz
```

`~/.openclaw/openclaw.json` (JSON5):

Copy

```
{
  agents: {
    list: [
      {
        id: "home",
        default: true,
        name: "Home",
        workspace: "~/.openclaw/workspace-home",
        agentDir: "~/.openclaw/agents/home/agent",
      },
      {
        id: "work",
        name: "Work",
        workspace: "~/.openclaw/workspace-work",
        agentDir: "~/.openclaw/agents/work/agent",
      },
    ],
  },

  // Deterministic routing: first match wins (most-specific first).
  bindings: [
    { agentId: "home", match: { channel: "whatsapp", accountId: "personal" } },
    { agentId: "work", match: { channel: "whatsapp", accountId: "biz" } },

    // Optional per-peer override (example: send a specific group to work agent).
    {
      agentId: "work",
      match: {
        channel: "whatsapp",
        accountId: "personal",
        peer: { kind: "group", id: "1203630...@g.us" },
      },
    },
  ],

  // Off by default: agent-to-agent messaging must be explicitly enabled + allowlisted.
  tools: {
    agentToAgent: {
      enabled: false,
      allow: ["home", "work"],
    },
  },

  channels: {
    whatsapp: {
      accounts: {
        personal: {
          // Optional override. Default: ~/.openclaw/credentials/whatsapp/personal
          // authDir: "~/.openclaw/credentials/whatsapp/personal",
        },
        biz: {
          // Optional override. Default: ~/.openclaw/credentials/whatsapp/biz
          // authDir: "~/.openclaw/credentials/whatsapp/biz",
        },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Example: WhatsApp daily chat + Telegram deep work

Split by channel: route WhatsApp to a fast everyday agent and Telegram to an Opus agent.

Copy

```
{
  agents: {
    list: [
      {
        id: "chat",
        name: "Everyday",
        workspace: "~/.openclaw/workspace-chat",
        model: "anthropic/claude-sonnet-4-5",
      },
      {
        id: "opus",
        name: "Deep Work",
        workspace: "~/.openclaw/workspace-opus",
        model: "anthropic/claude-opus-4-6",
      },
    ],
  },
  bindings: [
    { agentId: "chat", match: { channel: "whatsapp" } },
    { agentId: "opus", match: { channel: "telegram" } },
  ],
}
```

Notes:

-   If you have multiple accounts for a channel, add `accountId` to the binding (for example `{ channel: "whatsapp", accountId: "personal" }`).
-   To route a single DM/group to Opus while keeping the rest on chat, add a `match.peer` binding for that peer; peer matches always win over channel-wide rules.

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Example: same channel, one peer to Opus

Keep WhatsApp on the fast agent, but route one DM to Opus:

Copy

```
{
  agents: {
    list: [
      {
        id: "chat",
        name: "Everyday",
        workspace: "~/.openclaw/workspace-chat",
        model: "anthropic/claude-sonnet-4-5",
      },
      {
        id: "opus",
        name: "Deep Work",
        workspace: "~/.openclaw/workspace-opus",
        model: "anthropic/claude-opus-4-6",
      },
    ],
  },
  bindings: [
    {
      agentId: "opus",
      match: { channel: "whatsapp", peer: { kind: "direct", id: "+15551234567" } },
    },
    { agentId: "chat", match: { channel: "whatsapp" } },
  ],
}
```

Peer bindings always win, so keep them above the channel-wide rule.

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Family agent bound to a WhatsApp group

Bind a dedicated family agent to a single WhatsApp group, with mention gating and a tighter tool policy:

Copy

```
{
  agents: {
    list: [
      {
        id: "family",
        name: "Family",
        workspace: "~/.openclaw/workspace-family",
        identity: { name: "Family Bot" },
        groupChat: {
          mentionPatterns: ["@family", "@familybot", "@Family Bot"],
        },
        sandbox: {
          mode: "all",
          scope: "agent",
        },
        tools: {
          allow: [
            "exec",
            "read",
            "sessions_list",
            "sessions_history",
            "sessions_send",
            "sessions_spawn",
            "session_status",
          ],
          deny: ["write", "edit", "apply_patch", "browser", "canvas", "nodes", "cron"],
        },
      },
    ],
  },
  bindings: [
    {
      agentId: "family",
      match: {
        channel: "whatsapp",
        peer: { kind: "group", id: "120363999999999999@g.us" },
      },
    },
  ],
}
```

Notes:

-   Tool allow/deny lists are **tools**, not skills. If a skill needs to run a binary, ensure `exec` is allowed and the binary exists in the sandbox.
-   For stricter gating, set `agents.list[].groupChat.mentionPatterns` and keep group allowlists enabled for the channel.

## 

[​

](https://docs.openclaw.ai/concepts/multi-agent)

Per-Agent Sandbox and Tool Configuration

Starting with v2026.1.6, each agent can have its own sandbox and tool restrictions:

Copy

```
{
  agents: {
    list: [
      {
        id: "personal",
        workspace: "~/.openclaw/workspace-personal",
        sandbox: {
          mode: "off",  // No sandbox for personal agent
        },
        // No tool restrictions - all tools available
      },
      {
        id: "family",
        workspace: "~/.openclaw/workspace-family",
        sandbox: {
          mode: "all",     // Always sandboxed
          scope: "agent",  // One container per agent
          docker: {
            // Optional one-time setup after container creation
            setupCommand: "apt-get update && apt-get install -y git curl",
          },
        },
        tools: {
          allow: ["read"],                    // Only read tool
          deny: ["exec", "write", "edit", "apply_patch"],    // Deny others
        },
      },
    ],
  },
}
```

Note: `setupCommand` lives under `sandbox.docker` and runs once on container creation. Per-agent `sandbox.docker.*` overrides are ignored when the resolved scope is `"shared"`. **Benefits:**

-   **Security isolation**: Restrict tools for untrusted agents
-   **Resource control**: Sandbox specific agents while keeping others on host
-   **Flexible policies**: Different permissions per agent

Note: `tools.elevated` is **global** and sender-based; it is not configurable per agent. If you need per-agent boundaries, use `agents.list[].tools` to deny `exec`. For group targeting, use `agents.list[].groupChat.mentionPatterns` so @mentions map cleanly to the intended agent. See [Multi-Agent Sandbox & Tools](https://docs.openclaw.ai/tools/multi-agent-sandbox-tools) for detailed examples.

[Compaction](https://docs.openclaw.ai/concepts/compaction)[Presence](https://docs.openclaw.ai/concepts/presence)

⌘I
