<!-- Source: https://docs.openclaw.ai/concepts/oauth -->
<!-- Title: OAuth - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/concepts/oauth)

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

-   [OAuth](https://docs.openclaw.ai/concepts/oauth)
-   [The token sink (why it exists)](https://docs.openclaw.ai/concepts/oauth)
-   [Storage (where tokens live)](https://docs.openclaw.ai/concepts/oauth)
-   [Anthropic setup-token (subscription auth)](https://docs.openclaw.ai/concepts/oauth)
-   [OAuth exchange (how login works)](https://docs.openclaw.ai/concepts/oauth)
-   [Anthropic setup-token](https://docs.openclaw.ai/concepts/oauth)
-   [OpenAI Codex (ChatGPT OAuth)](https://docs.openclaw.ai/concepts/oauth)
-   [Refresh + expiry](https://docs.openclaw.ai/concepts/oauth)
-   [Multiple accounts (profiles) + routing](https://docs.openclaw.ai/concepts/oauth)
-   [1) Preferred: separate agents](https://docs.openclaw.ai/concepts/oauth)
-   [2) Advanced: multiple profiles in one agent](https://docs.openclaw.ai/concepts/oauth)

Fundamentals

# OAuth

# 

[​

](https://docs.openclaw.ai/concepts/oauth)

OAuth

OpenClaw supports “subscription auth” via OAuth for providers that offer it (notably **OpenAI Codex (ChatGPT OAuth)**). For Anthropic subscriptions, use the **setup-token** flow. Anthropic subscription use outside Claude Code has been restricted for some users in the past, so treat it as a user-choice risk and verify current Anthropic policy yourself. OpenAI Codex OAuth is explicitly supported for use in external tools like OpenClaw. This page explains: For Anthropic in production, API key auth is the safer recommended path over subscription setup-token auth.

-   how the OAuth **token exchange** works (PKCE)
-   where tokens are **stored** (and why)
-   how to handle **multiple accounts** (profiles + per-session overrides)

OpenClaw also supports **provider plugins** that ship their own OAuth or API‑key flows. Run them via:

Copy

```
openclaw models auth login --provider <id>
```

## 

[​

](https://docs.openclaw.ai/concepts/oauth)

The token sink (why it exists)

OAuth providers commonly mint a **new refresh token** during login/refresh flows. Some providers (or OAuth clients) can invalidate older refresh tokens when a new one is issued for the same user/app. Practical symptom:

-   you log in via OpenClaw _and_ via Claude Code / Codex CLI → one of them randomly gets “logged out” later

To reduce that, OpenClaw treats `auth-profiles.json` as a **token sink**:

-   the runtime reads credentials from **one place**
-   we can keep multiple profiles and route them deterministically

## 

[​

](https://docs.openclaw.ai/concepts/oauth)

Storage (where tokens live)

Secrets are stored **per-agent**:

-   Auth profiles (OAuth + API keys + optional value-level refs): `~/.openclaw/agents/<agentId>/agent/auth-profiles.json`
-   Legacy compatibility file: `~/.openclaw/agents/<agentId>/agent/auth.json` (static `api_key` entries are scrubbed when discovered)

Legacy import-only file (still supported, but not the main store):

-   `~/.openclaw/credentials/oauth.json` (imported into `auth-profiles.json` on first use)

All of the above also respect `$OPENCLAW_STATE_DIR` (state dir override). Full reference: [/gateway/configuration](https://docs.openclaw.ai/gateway/configuration) For static secret refs and runtime snapshot activation behavior, see [Secrets Management](https://docs.openclaw.ai/gateway/secrets).

## 

[​

](https://docs.openclaw.ai/concepts/oauth)

Anthropic setup-token (subscription auth)

Anthropic setup-token support is technical compatibility, not a policy guarantee. Anthropic has blocked some subscription usage outside Claude Code in the past. Decide for yourself whether to use subscription auth, and verify Anthropic’s current terms.

Run `claude setup-token` on any machine, then paste it into OpenClaw:

Copy

```
openclaw models auth setup-token --provider anthropic
```

If you generated the token elsewhere, paste it manually:

Copy

```
openclaw models auth paste-token --provider anthropic
```

Verify:

Copy

```
openclaw models status
```

## 

[​

](https://docs.openclaw.ai/concepts/oauth)

OAuth exchange (how login works)

OpenClaw’s interactive login flows are implemented in `@mariozechner/pi-ai` and wired into the wizards/commands.

### 

[​

](https://docs.openclaw.ai/concepts/oauth)

Anthropic setup-token

Flow shape:

1.  run `claude setup-token`
2.  paste the token into OpenClaw
3.  store as a token auth profile (no refresh)

The wizard path is `openclaw onboard` → auth choice `setup-token` (Anthropic).

### 

[​

](https://docs.openclaw.ai/concepts/oauth)

OpenAI Codex (ChatGPT OAuth)

OpenAI Codex OAuth is explicitly supported for use outside the Codex CLI, including OpenClaw workflows. Flow shape (PKCE):

1.  generate PKCE verifier/challenge + random `state`
2.  open `https://auth.openai.com/oauth/authorize?...`
3.  try to capture callback on `http://127.0.0.1:1455/auth/callback`
4.  if callback can’t bind (or you’re remote/headless), paste the redirect URL/code
5.  exchange at `https://auth.openai.com/oauth/token`
6.  extract `accountId` from the access token and store `{ access, refresh, expires, accountId }`

Wizard path is `openclaw onboard` → auth choice `openai-codex`.

## 

[​

](https://docs.openclaw.ai/concepts/oauth)

Refresh + expiry

Profiles store an `expires` timestamp. At runtime:

-   if `expires` is in the future → use the stored access token
-   if expired → refresh (under a file lock) and overwrite the stored credentials

The refresh flow is automatic; you generally don’t need to manage tokens manually.

## 

[​

](https://docs.openclaw.ai/concepts/oauth)

Multiple accounts (profiles) + routing

Two patterns:

### 

[​

](https://docs.openclaw.ai/concepts/oauth)

1) Preferred: separate agents

If you want “personal” and “work” to never interact, use isolated agents (separate sessions + credentials + workspace):

Copy

```
openclaw agents add work
openclaw agents add personal
```

Then configure auth per-agent (wizard) and route chats to the right agent.

### 

[​

](https://docs.openclaw.ai/concepts/oauth)

2) Advanced: multiple profiles in one agent

`auth-profiles.json` supports multiple profile IDs for the same provider. Pick which profile is used:

-   globally via config ordering (`auth.order`)
-   per-session via `/model ...@<profileId>`

Example (session override):

-   `/model Opus@anthropic:work`

How to see what profile IDs exist:

-   `openclaw channels list --json` (shows `auth[]`)

Related docs:

-   [/concepts/model-failover](https://docs.openclaw.ai/concepts/model-failover) (rotation + cooldown rules)
-   [/tools/slash-commands](https://docs.openclaw.ai/tools/slash-commands) (command surface)

[Agent Workspace](https://docs.openclaw.ai/concepts/agent-workspace)[Bootstrapping](https://docs.openclaw.ai/start/bootstrapping)

⌘I
