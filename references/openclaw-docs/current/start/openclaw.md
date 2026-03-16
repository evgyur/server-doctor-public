<!-- Source: https://docs.openclaw.ai/start/openclaw -->
<!-- Title: Personal Assistant Setup - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/start/openclaw)

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

##### Home

-   [
    
    OpenClaw
    
    
    
    ](https://docs.openclaw.ai/)

##### Overview

-   [
    
    Showcase
    
    
    
    ](https://docs.openclaw.ai/start/showcase)

##### Core concepts

-   [
    
    Features
    
    
    
    ](https://docs.openclaw.ai/concepts/features)

##### First steps

-   [
    
    Getting Started
    
    
    
    ](https://docs.openclaw.ai/start/getting-started)
-   [
    
    Onboarding Overview
    
    
    
    ](https://docs.openclaw.ai/start/onboarding-overview)
-   [
    
    Onboarding: CLI
    
    
    
    ](https://docs.openclaw.ai/start/wizard)
-   [
    
    Onboarding: macOS App
    
    
    
    ](https://docs.openclaw.ai/start/onboarding)

##### Guides

-   [
    
    Personal Assistant Setup
    
    
    
    ](https://docs.openclaw.ai/start/openclaw)
-   [
    
    CLI reference
    
    
    
    ](https://docs.openclaw.ai/start/wizard-cli-reference)
-   [
    
    CLI automation
    
    
    
    ](https://docs.openclaw.ai/start/wizard-cli-automation)

-   [Building a personal assistant with OpenClaw](https://docs.openclaw.ai/start/openclaw)
-   [⚠️ Safety first](https://docs.openclaw.ai/start/openclaw)
-   [Prerequisites](https://docs.openclaw.ai/start/openclaw)
-   [The two-phone setup (recommended)](https://docs.openclaw.ai/start/openclaw)
-   [5-minute quick start](https://docs.openclaw.ai/start/openclaw)
-   [Give the agent a workspace (AGENTS)](https://docs.openclaw.ai/start/openclaw)
-   [The config that turns it into “an assistant”](https://docs.openclaw.ai/start/openclaw)
-   [Sessions and memory](https://docs.openclaw.ai/start/openclaw)
-   [Heartbeats (proactive mode)](https://docs.openclaw.ai/start/openclaw)
-   [Media in and out](https://docs.openclaw.ai/start/openclaw)
-   [Operations checklist](https://docs.openclaw.ai/start/openclaw)
-   [Next steps](https://docs.openclaw.ai/start/openclaw)

Guides

# Personal Assistant Setup

# 

[​

](https://docs.openclaw.ai/start/openclaw)

Building a personal assistant with OpenClaw

OpenClaw is a WhatsApp + Telegram + Discord + iMessage gateway for **Pi** agents. Plugins add Mattermost. This guide is the “personal assistant” setup: one dedicated WhatsApp number that behaves like your always-on agent.

## 

[​

](https://docs.openclaw.ai/start/openclaw)

⚠️ Safety first

You’re putting an agent in a position to:

-   run commands on your machine (depending on your Pi tool setup)
-   read/write files in your workspace
-   send messages back out via WhatsApp/Telegram/Discord/Mattermost (plugin)

Start conservative:

-   Always set `channels.whatsapp.allowFrom` (never run open-to-the-world on your personal Mac).
-   Use a dedicated WhatsApp number for the assistant.
-   Heartbeats now default to every 30 minutes. Disable until you trust the setup by setting `agents.defaults.heartbeat.every: "0m"`.

## 

[​

](https://docs.openclaw.ai/start/openclaw)

Prerequisites

-   OpenClaw installed and onboarded — see [Getting Started](https://docs.openclaw.ai/start/getting-started) if you haven’t done this yet
-   A second phone number (SIM/eSIM/prepaid) for the assistant

## 

[​

](https://docs.openclaw.ai/start/openclaw)

The two-phone setup (recommended)

You want this: If you link your personal WhatsApp to OpenClaw, every message to you becomes “agent input”. That’s rarely what you want.

## 

[​

](https://docs.openclaw.ai/start/openclaw)

5-minute quick start

1.  Pair WhatsApp Web (shows QR; scan with the assistant phone):

Copy

```
openclaw channels login
```

2.  Start the Gateway (leave it running):

Copy

```
openclaw gateway --port 18789
```

3.  Put a minimal config in `~/.openclaw/openclaw.json`:

Copy

```
{
  channels: { whatsapp: { allowFrom: ["+15555550123"] } },
}
```

Now message the assistant number from your allowlisted phone. When onboarding finishes, we auto-open the dashboard and print a clean (non-tokenized) link. If it prompts for auth, paste the token from `gateway.auth.token` into Control UI settings. To reopen later: `openclaw dashboard`.

## 

[​

](https://docs.openclaw.ai/start/openclaw)

Give the agent a workspace (AGENTS)

OpenClaw reads operating instructions and “memory” from its workspace directory. By default, OpenClaw uses `~/.openclaw/workspace` as the agent workspace, and will create it (plus starter `AGENTS.md`, `SOUL.md`, `TOOLS.md`, `IDENTITY.md`, `USER.md`, `HEARTBEAT.md`) automatically on setup/first agent run. `BOOTSTRAP.md` is only created when the workspace is brand new (it should not come back after you delete it). `MEMORY.md` is optional (not auto-created); when present, it is loaded for normal sessions. Subagent sessions only inject `AGENTS.md` and `TOOLS.md`. Tip: treat this folder like OpenClaw’s “memory” and make it a git repo (ideally private) so your `AGENTS.md` + memory files are backed up. If git is installed, brand-new workspaces are auto-initialized.

Copy

```
openclaw setup
```

Full workspace layout + backup guide: [Agent workspace](https://docs.openclaw.ai/concepts/agent-workspace) Memory workflow: [Memory](https://docs.openclaw.ai/concepts/memory) Optional: choose a different workspace with `agents.defaults.workspace` (supports `~`).

Copy

```
{
  agent: {
    workspace: "~/.openclaw/workspace",
  },
}
```

If you already ship your own workspace files from a repo, you can disable bootstrap file creation entirely:

Copy

```
{
  agent: {
    skipBootstrap: true,
  },
}
```

## 

[​

](https://docs.openclaw.ai/start/openclaw)

The config that turns it into “an assistant”

OpenClaw defaults to a good assistant setup, but you’ll usually want to tune:

-   persona/instructions in `SOUL.md`
-   thinking defaults (if desired)
-   heartbeats (once you trust it)

Example:

Copy

```
{
  logging: { level: "info" },
  agent: {
    model: "anthropic/claude-opus-4-6",
    workspace: "~/.openclaw/workspace",
    thinkingDefault: "high",
    timeoutSeconds: 1800,
    // Start with 0; enable later.
    heartbeat: { every: "0m" },
  },
  channels: {
    whatsapp: {
      allowFrom: ["+15555550123"],
      groups: {
        "*": { requireMention: true },
      },
    },
  },
  routing: {
    groupChat: {
      mentionPatterns: ["@openclaw", "openclaw"],
    },
  },
  session: {
    scope: "per-sender",
    resetTriggers: ["/new", "/reset"],
    reset: {
      mode: "daily",
      atHour: 4,
      idleMinutes: 10080,
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/start/openclaw)

Sessions and memory

-   Session files: `~/.openclaw/agents/<agentId>/sessions/{{SessionId}}.jsonl`
-   Session metadata (token usage, last route, etc): `~/.openclaw/agents/<agentId>/sessions/sessions.json` (legacy: `~/.openclaw/sessions/sessions.json`)
-   `/new` or `/reset` starts a fresh session for that chat (configurable via `resetTriggers`). If sent alone, the agent replies with a short hello to confirm the reset.
-   `/compact [instructions]` compacts the session context and reports the remaining context budget.

## 

[​

](https://docs.openclaw.ai/start/openclaw)

Heartbeats (proactive mode)

By default, OpenClaw runs a heartbeat every 30 minutes with the prompt: `Read HEARTBEAT.md if it exists (workspace context). Follow it strictly. Do not infer or repeat old tasks from prior chats. If nothing needs attention, reply HEARTBEAT_OK.` Set `agents.defaults.heartbeat.every: "0m"` to disable.

-   If `HEARTBEAT.md` exists but is effectively empty (only blank lines and markdown headers like `# Heading`), OpenClaw skips the heartbeat run to save API calls.
-   If the file is missing, the heartbeat still runs and the model decides what to do.
-   If the agent replies with `HEARTBEAT_OK` (optionally with short padding; see `agents.defaults.heartbeat.ackMaxChars`), OpenClaw suppresses outbound delivery for that heartbeat.
-   By default, heartbeat delivery to DM-style `user:<id>` targets is allowed. Set `agents.defaults.heartbeat.directPolicy: "block"` to suppress direct-target delivery while keeping heartbeat runs active.
-   Heartbeats run full agent turns — shorter intervals burn more tokens.

Copy

```
{
  agent: {
    heartbeat: { every: "30m" },
  },
}
```

## 

[​

](https://docs.openclaw.ai/start/openclaw)

Media in and out

Inbound attachments (images/audio/docs) can be surfaced to your command via templates:

-   `{{MediaPath}}` (local temp file path)
-   `{{MediaUrl}}` (pseudo-URL)
-   `{{Transcript}}` (if audio transcription is enabled)

Outbound attachments from the agent: include `MEDIA:<path-or-url>` on its own line (no spaces). Example:

Copy

```
Here’s the screenshot.
MEDIA:https://example.com/screenshot.png
```

OpenClaw extracts these and sends them as media alongside the text.

## 

[​

](https://docs.openclaw.ai/start/openclaw)

Operations checklist

Copy

```
openclaw status          # local status (creds, sessions, queued events)
openclaw status --all    # full diagnosis (read-only, pasteable)
openclaw status --deep   # adds gateway health probes (Telegram + Discord)
openclaw health --json   # gateway health snapshot (WS)
```

Logs live under `/tmp/openclaw/` (default: `openclaw-YYYY-MM-DD.log`).

## 

[​

](https://docs.openclaw.ai/start/openclaw)

Next steps

-   WebChat: [WebChat](https://docs.openclaw.ai/web/webchat)
-   Gateway ops: [Gateway runbook](https://docs.openclaw.ai/gateway)
-   Cron + wakeups: [Cron jobs](https://docs.openclaw.ai/automation/cron-jobs)
-   macOS menu bar companion: [OpenClaw macOS app](https://docs.openclaw.ai/platforms/macos)
-   iOS node app: [iOS app](https://docs.openclaw.ai/platforms/ios)
-   Android node app: [Android app](https://docs.openclaw.ai/platforms/android)
-   Windows status: [Windows (WSL2)](https://docs.openclaw.ai/platforms/windows)
-   Linux status: [Linux app](https://docs.openclaw.ai/platforms/linux)
-   Security: [Security](https://docs.openclaw.ai/gateway/security)

[Onboarding: macOS App](https://docs.openclaw.ai/start/onboarding)[CLI reference](https://docs.openclaw.ai/start/wizard-cli-reference)

⌘I
