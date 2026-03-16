<!-- Source: https://docs.openclaw.ai/start/setup -->
<!-- Title: Setup - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/start/setup)

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

##### Help

-   [
    
    Help
    
    
    
    ](https://docs.openclaw.ai/help)
-   [
    
    Troubleshooting
    
    
    
    ](https://docs.openclaw.ai/help/troubleshooting)
-   [
    
    FAQ
    
    
    
    ](https://docs.openclaw.ai/help/faq)

##### Community

-   [
    
    OpenClaw Lore
    
    
    
    ](https://docs.openclaw.ai/start/lore)

##### Environment and debugging

-   [
    
    Environment Variables
    
    
    
    ](https://docs.openclaw.ai/help/environment)
-   [
    
    Debugging
    
    
    
    ](https://docs.openclaw.ai/help/debugging)
-   [
    
    Testing
    
    
    
    ](https://docs.openclaw.ai/help/testing)
-   [
    
    Scripts
    
    
    
    ](https://docs.openclaw.ai/help/scripts)
-   [
    
    Node + tsx Crash
    
    
    
    ](https://docs.openclaw.ai/debug/node-issue)
-   [
    
    Diagnostics Flags
    
    
    
    ](https://docs.openclaw.ai/diagnostics/flags)

##### Node runtime

-   [
    
    Node.js
    
    
    
    ](https://docs.openclaw.ai/install/node)

##### Compaction internals

-   [
    
    Session Management Deep Dive
    
    
    
    ](https://docs.openclaw.ai/reference/session-management-compaction)

##### Developer setup

-   [
    
    Setup
    
    
    
    ](https://docs.openclaw.ai/start/setup)
-   [
    
    Pi Development Workflow
    
    
    
    ](https://docs.openclaw.ai/pi-dev)

##### Contributing

-   [
    
    CI Pipeline
    
    
    
    ](https://docs.openclaw.ai/ci)

##### Docs meta

-   [
    
    Docs Hubs
    
    
    
    ](https://docs.openclaw.ai/start/hubs)
-   [
    
    Docs directory
    
    
    
    ](https://docs.openclaw.ai/start/docs-directory)

-   [Setup](https://docs.openclaw.ai/start/setup)
-   [TL;DR](https://docs.openclaw.ai/start/setup)
-   [Prereqs (from source)](https://docs.openclaw.ai/start/setup)
-   [Tailoring strategy (so updates don’t hurt)](https://docs.openclaw.ai/start/setup)
-   [Run the Gateway from this repo](https://docs.openclaw.ai/start/setup)
-   [Stable workflow (macOS app first)](https://docs.openclaw.ai/start/setup)
-   [Bleeding edge workflow (Gateway in a terminal)](https://docs.openclaw.ai/start/setup)
-   [0) (Optional) Run the macOS app from source too](https://docs.openclaw.ai/start/setup)
-   [1) Start the dev Gateway](https://docs.openclaw.ai/start/setup)
-   [2) Point the macOS app at your running Gateway](https://docs.openclaw.ai/start/setup)
-   [3) Verify](https://docs.openclaw.ai/start/setup)
-   [Common footguns](https://docs.openclaw.ai/start/setup)
-   [Credential storage map](https://docs.openclaw.ai/start/setup)
-   [Updating (without wrecking your setup)](https://docs.openclaw.ai/start/setup)
-   [Linux (systemd user service)](https://docs.openclaw.ai/start/setup)
-   [Related docs](https://docs.openclaw.ai/start/setup)

Developer setup

# Setup

# 

[​

](https://docs.openclaw.ai/start/setup)

Setup

If you are setting up for the first time, start with [Getting Started](https://docs.openclaw.ai/start/getting-started). For wizard details, see [Onboarding Wizard](https://docs.openclaw.ai/start/wizard).

Last updated: 2026-01-01

## 

[​

](https://docs.openclaw.ai/start/setup)

TL;DR

-   **Tailoring lives outside the repo:** `~/.openclaw/workspace` (workspace) + `~/.openclaw/openclaw.json` (config).
-   **Stable workflow:** install the macOS app; let it run the bundled Gateway.
-   **Bleeding edge workflow:** run the Gateway yourself via `pnpm gateway:watch`, then let the macOS app attach in Local mode.

## 

[​

](https://docs.openclaw.ai/start/setup)

Prereqs (from source)

-   Node `>=22`
-   `pnpm`
-   Docker (optional; only for containerized setup/e2e — see [Docker](https://docs.openclaw.ai/install/docker))

## 

[​

](https://docs.openclaw.ai/start/setup)

Tailoring strategy (so updates don’t hurt)

If you want “100% tailored to me” _and_ easy updates, keep your customization in:

-   **Config:** `~/.openclaw/openclaw.json` (JSON/JSON5-ish)
-   **Workspace:** `~/.openclaw/workspace` (skills, prompts, memories; make it a private git repo)

Bootstrap once:

Copy

```
openclaw setup
```

From inside this repo, use the local CLI entry:

Copy

```
openclaw setup
```

If you don’t have a global install yet, run it via `pnpm openclaw setup`.

## 

[​

](https://docs.openclaw.ai/start/setup)

Run the Gateway from this repo

After `pnpm build`, you can run the packaged CLI directly:

Copy

```
node openclaw.mjs gateway --port 18789 --verbose
```

## 

[​

](https://docs.openclaw.ai/start/setup)

Stable workflow (macOS app first)

1.  Install + launch **OpenClaw.app** (menu bar).
2.  Complete the onboarding/permissions checklist (TCC prompts).
3.  Ensure Gateway is **Local** and running (the app manages it).
4.  Link surfaces (example: WhatsApp):

Copy

```
openclaw channels login
```

5.  Sanity check:

Copy

```
openclaw health
```

If onboarding is not available in your build:

-   Run `openclaw setup`, then `openclaw channels login`, then start the Gateway manually (`openclaw gateway`).

## 

[​

](https://docs.openclaw.ai/start/setup)

Bleeding edge workflow (Gateway in a terminal)

Goal: work on the TypeScript Gateway, get hot reload, keep the macOS app UI attached.

### 

[​

](https://docs.openclaw.ai/start/setup)

0) (Optional) Run the macOS app from source too

If you also want the macOS app on the bleeding edge:

Copy

```
./scripts/restart-mac.sh
```

### 

[​

](https://docs.openclaw.ai/start/setup)

1) Start the dev Gateway

Copy

```
pnpm install
pnpm gateway:watch
```

`gateway:watch` runs the gateway in watch mode and reloads on relevant source, config, and bundled-plugin metadata changes.

### 

[​

](https://docs.openclaw.ai/start/setup)

2) Point the macOS app at your running Gateway

In **OpenClaw.app**:

-   Connection Mode: **Local** The app will attach to the running gateway on the configured port.

### 

[​

](https://docs.openclaw.ai/start/setup)

3) Verify

-   In-app Gateway status should read **“Using existing gateway …”**
-   Or via CLI:

Copy

```
openclaw health
```

### 

[​

](https://docs.openclaw.ai/start/setup)

Common footguns

-   **Wrong port:** Gateway WS defaults to `ws://127.0.0.1:18789`; keep app + CLI on the same port.
-   **Where state lives:**
    -   Credentials: `~/.openclaw/credentials/`
    -   Sessions: `~/.openclaw/agents/<agentId>/sessions/`
    -   Logs: `/tmp/openclaw/`

## 

[​

](https://docs.openclaw.ai/start/setup)

Credential storage map

Use this when debugging auth or deciding what to back up:

-   **WhatsApp**: `~/.openclaw/credentials/whatsapp/<accountId>/creds.json`
-   **Telegram bot token**: config/env or `channels.telegram.tokenFile` (regular file only; symlinks rejected)
-   **Discord bot token**: config/env or SecretRef (env/file/exec providers)
-   **Slack tokens**: config/env (`channels.slack.*`)
-   **Pairing allowlists**:
    -   `~/.openclaw/credentials/<channel>-allowFrom.json` (default account)
    -   `~/.openclaw/credentials/<channel>-<accountId>-allowFrom.json` (non-default accounts)
-   **Model auth profiles**: `~/.openclaw/agents/<agentId>/agent/auth-profiles.json`
-   **File-backed secrets payload (optional)**: `~/.openclaw/secrets.json`
-   **Legacy OAuth import**: `~/.openclaw/credentials/oauth.json` More detail: [Security](https://docs.openclaw.ai/gateway/security).

## 

[​

](https://docs.openclaw.ai/start/setup)

Updating (without wrecking your setup)

-   Keep `~/.openclaw/workspace` and `~/.openclaw/` as “your stuff”; don’t put personal prompts/config into the `openclaw` repo.
-   Updating source: `git pull` + `pnpm install` (when lockfile changed) + keep using `pnpm gateway:watch`.

## 

[​

](https://docs.openclaw.ai/start/setup)

Linux (systemd user service)

Linux installs use a systemd **user** service. By default, systemd stops user services on logout/idle, which kills the Gateway. Onboarding attempts to enable lingering for you (may prompt for sudo). If it’s still off, run:

Copy

```
sudo loginctl enable-linger $USER
```

For always-on or multi-user servers, consider a **system** service instead of a user service (no lingering needed). See [Gateway runbook](https://docs.openclaw.ai/gateway) for the systemd notes.

## 

[​

](https://docs.openclaw.ai/start/setup)

Related docs

-   [Gateway runbook](https://docs.openclaw.ai/gateway) (flags, supervision, ports)
-   [Gateway configuration](https://docs.openclaw.ai/gateway/configuration) (config schema + examples)
-   [Discord](https://docs.openclaw.ai/channels/discord) and [Telegram](https://docs.openclaw.ai/channels/telegram) (reply tags + replyToMode settings)
-   [OpenClaw assistant setup](https://docs.openclaw.ai/start/openclaw)
-   [macOS app](https://docs.openclaw.ai/platforms/macos) (gateway lifecycle)

[Session Management Deep Dive](https://docs.openclaw.ai/reference/session-management-compaction)[Pi Development Workflow](https://docs.openclaw.ai/pi-dev)

⌘I
