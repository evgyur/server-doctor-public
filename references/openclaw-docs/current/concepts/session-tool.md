<!-- Source: https://docs.openclaw.ai/concepts/session-tool -->
<!-- Title: Session Tools - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/concepts/session-tool)

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

-   [Session Tools](https://docs.openclaw.ai/concepts/session-tool)
-   [Tool Names](https://docs.openclaw.ai/concepts/session-tool)
-   [Key Model](https://docs.openclaw.ai/concepts/session-tool)
-   [sessions\_list](https://docs.openclaw.ai/concepts/session-tool)
-   [sessions\_history](https://docs.openclaw.ai/concepts/session-tool)
-   [sessions\_send](https://docs.openclaw.ai/concepts/session-tool)
-   [Channel Field](https://docs.openclaw.ai/concepts/session-tool)
-   [Security / Send Policy](https://docs.openclaw.ai/concepts/session-tool)
-   [sessions\_spawn](https://docs.openclaw.ai/concepts/session-tool)
-   [Sandbox Session Visibility](https://docs.openclaw.ai/concepts/session-tool)

Sessions and memory

# Session Tools

# 

[​

](https://docs.openclaw.ai/concepts/session-tool)

Session Tools

Goal: small, hard-to-misuse tool set so agents can list sessions, fetch history, and send to another session.

## 

[​

](https://docs.openclaw.ai/concepts/session-tool)

Tool Names

-   `sessions_list`
-   `sessions_history`
-   `sessions_send`
-   `sessions_spawn`

## 

[​

](https://docs.openclaw.ai/concepts/session-tool)

Key Model

-   Main direct chat bucket is always the literal key `"main"` (resolved to the current agent’s main key).
-   Group chats use `agent:<agentId>:<channel>:group:<id>` or `agent:<agentId>:<channel>:channel:<id>` (pass the full key).
-   Cron jobs use `cron:<job.id>`.
-   Hooks use `hook:<uuid>` unless explicitly set.
-   Node sessions use `node-<nodeId>` unless explicitly set.

`global` and `unknown` are reserved values and are never listed. If `session.scope = "global"`, we alias it to `main` for all tools so callers never see `global`.

## 

[​

](https://docs.openclaw.ai/concepts/session-tool)

sessions\_list

List sessions as an array of rows. Parameters:

-   `kinds?: string[]` filter: any of `"main" | "group" | "cron" | "hook" | "node" | "other"`
-   `limit?: number` max rows (default: server default, clamp e.g. 200)
-   `activeMinutes?: number` only sessions updated within N minutes
-   `messageLimit?: number` 0 = no messages (default 0); >0 = include last N messages

Behavior:

-   `messageLimit > 0` fetches `chat.history` per session and includes the last N messages.
-   Tool results are filtered out in list output; use `sessions_history` for tool messages.
-   When running in a **sandboxed** agent session, session tools default to **spawned-only visibility** (see below).

Row shape (JSON):

-   `key`: session key (string)
-   `kind`: `main | group | cron | hook | node | other`
-   `channel`: `whatsapp | telegram | discord | signal | imessage | webchat | internal | unknown`
-   `displayName` (group display label if available)
-   `updatedAt` (ms)
-   `sessionId`
-   `model`, `contextTokens`, `totalTokens`
-   `thinkingLevel`, `verboseLevel`, `systemSent`, `abortedLastRun`
-   `sendPolicy` (session override if set)
-   `lastChannel`, `lastTo`
-   `deliveryContext` (normalized `{ channel, to, accountId }` when available)
-   `transcriptPath` (best-effort path derived from store dir + sessionId)
-   `messages?` (only when `messageLimit > 0`)

## 

[​

](https://docs.openclaw.ai/concepts/session-tool)

sessions\_history

Fetch transcript for one session. Parameters:

-   `sessionKey` (required; accepts session key or `sessionId` from `sessions_list`)
-   `limit?: number` max messages (server clamps)
-   `includeTools?: boolean` (default false)

Behavior:

-   `includeTools=false` filters `role: "toolResult"` messages.
-   Returns messages array in the raw transcript format.
-   When given a `sessionId`, OpenClaw resolves it to the corresponding session key (missing ids error).

## 

[​

](https://docs.openclaw.ai/concepts/session-tool)

sessions\_send

Send a message into another session. Parameters:

-   `sessionKey` (required; accepts session key or `sessionId` from `sessions_list`)
-   `message` (required)
-   `timeoutSeconds?: number` (default >0; 0 = fire-and-forget)

Behavior:

-   `timeoutSeconds = 0`: enqueue and return `{ runId, status: "accepted" }`.
-   `timeoutSeconds > 0`: wait up to N seconds for completion, then return `{ runId, status: "ok", reply }`.
-   If wait times out: `{ runId, status: "timeout", error }`. Run continues; call `sessions_history` later.
-   If the run fails: `{ runId, status: "error", error }`.
-   Announce delivery runs after the primary run completes and is best-effort; `status: "ok"` does not guarantee the announce was delivered.
-   Waits via gateway `agent.wait` (server-side) so reconnects don’t drop the wait.
-   Agent-to-agent message context is injected for the primary run.
-   Inter-session messages are persisted with `message.provenance.kind = "inter_session"` so transcript readers can distinguish routed agent instructions from external user input.
-   After the primary run completes, OpenClaw runs a **reply-back loop**:
    -   Round 2+ alternates between requester and target agents.
    -   Reply exactly `REPLY_SKIP` to stop the ping‑pong.
    -   Max turns is `session.agentToAgent.maxPingPongTurns` (0–5, default 5).
-   Once the loop ends, OpenClaw runs the **agent‑to‑agent announce step** (target agent only):
    -   Reply exactly `ANNOUNCE_SKIP` to stay silent.
    -   Any other reply is sent to the target channel.
    -   Announce step includes the original request + round‑1 reply + latest ping‑pong reply.

## 

[​

](https://docs.openclaw.ai/concepts/session-tool)

Channel Field

-   For groups, `channel` is the channel recorded on the session entry.
-   For direct chats, `channel` maps from `lastChannel`.
-   For cron/hook/node, `channel` is `internal`.
-   If missing, `channel` is `unknown`.

## 

[​

](https://docs.openclaw.ai/concepts/session-tool)

Security / Send Policy

Policy-based blocking by channel/chat type (not per session id).

Copy

```
{
  "session": {
    "sendPolicy": {
      "rules": [
        {
          "match": { "channel": "discord", "chatType": "group" },
          "action": "deny"
        }
      ],
      "default": "allow"
    }
  }
}
```

Runtime override (per session entry):

-   `sendPolicy: "allow" | "deny"` (unset = inherit config)
-   Settable via `sessions.patch` or owner-only `/send on|off|inherit` (standalone message).

Enforcement points:

-   `chat.send` / `agent` (gateway)
-   auto-reply delivery logic

## 

[​

](https://docs.openclaw.ai/concepts/session-tool)

sessions\_spawn

Spawn a sub-agent run in an isolated session and announce the result back to the requester chat channel. Parameters:

-   `task` (required)
-   `label?` (optional; used for logs/UI)
-   `agentId?` (optional; spawn under another agent id if allowed)
-   `model?` (optional; overrides the sub-agent model; invalid values error)
-   `thinking?` (optional; overrides thinking level for the sub-agent run)
-   `runTimeoutSeconds?` (defaults to `agents.defaults.subagents.runTimeoutSeconds` when set, otherwise `0`; when set, aborts the sub-agent run after N seconds)
-   `thread?` (default false; request thread-bound routing for this spawn when supported by the channel/plugin)
-   `mode?` (`run|session`; defaults to `run`, but defaults to `session` when `thread=true`; `mode="session"` requires `thread=true`)
-   `cleanup?` (`delete|keep`, default `keep`)
-   `sandbox?` (`inherit|require`, default `inherit`; `require` rejects spawn unless the target child runtime is sandboxed)
-   `attachments?` (optional array of inline files; subagent runtime only, ACP rejects). Each entry: `{ name, content, encoding?: "utf8" | "base64", mimeType? }`. Files are materialized into the child workspace at `.openclaw/attachments/<uuid>/`. Returns a receipt with sha256 per file.
-   `attachAs?` (optional; `{ mountPath? }` hint reserved for future mount implementations)

Allowlist:

-   `agents.list[].subagents.allowAgents`: list of agent ids allowed via `agentId` (`["*"]` to allow any). Default: only the requester agent.
-   Sandbox inheritance guard: if the requester session is sandboxed, `sessions_spawn` rejects targets that would run unsandboxed.

Discovery:

-   Use `agents_list` to discover which agent ids are allowed for `sessions_spawn`.

Behavior:

-   Starts a new `agent:<agentId>:subagent:<uuid>` session with `deliver: false`.
-   Sub-agents default to the full tool set **minus session tools** (configurable via `tools.subagents.tools`).
-   Sub-agents are not allowed to call `sessions_spawn` (no sub-agent → sub-agent spawning).
-   Always non-blocking: returns `{ status: "accepted", runId, childSessionKey }` immediately.
-   With `thread=true`, channel plugins can bind delivery/routing to a thread target (Discord support is controlled by `session.threadBindings.*` and `channels.discord.threadBindings.*`).
-   After completion, OpenClaw runs a sub-agent **announce step** and posts the result to the requester chat channel.
    -   If the assistant final reply is empty, the latest `toolResult` from sub-agent history is included as `Result`.
-   Reply exactly `ANNOUNCE_SKIP` during the announce step to stay silent.
-   Announce replies are normalized to `Status`/`Result`/`Notes`; `Status` comes from runtime outcome (not model text).
-   Sub-agent sessions are auto-archived after `agents.defaults.subagents.archiveAfterMinutes` (default: 60).
-   Announce replies include a stats line (runtime, tokens, sessionKey/sessionId, transcript path, and optional cost).

## 

[​

](https://docs.openclaw.ai/concepts/session-tool)

Sandbox Session Visibility

Session tools can be scoped to reduce cross-session access. Default behavior:

-   `tools.sessions.visibility` defaults to `tree` (current session + spawned subagent sessions).
-   For sandboxed sessions, `agents.defaults.sandbox.sessionToolsVisibility` can hard-clamp visibility.

Config:

Copy

```
{
  tools: {
    sessions: {
      // "self" | "tree" | "agent" | "all"
      // default: "tree"
      visibility: "tree",
    },
  },
  agents: {
    defaults: {
      sandbox: {
        // default: "spawned"
        sessionToolsVisibility: "spawned", // or "all"
      },
    },
  },
}
```

Notes:

-   `self`: only the current session key.
-   `tree`: current session + sessions spawned by the current session.
-   `agent`: any session belonging to the current agent id.
-   `all`: any session (cross-agent access still requires `tools.agentToAgent`).
-   When a session is sandboxed and `sessionToolsVisibility="spawned"`, OpenClaw clamps visibility to `tree` even if you set `tools.sessions.visibility="all"`.

[Session Pruning](https://docs.openclaw.ai/concepts/session-pruning)[Memory](https://docs.openclaw.ai/concepts/memory)

⌘I
