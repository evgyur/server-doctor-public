<!-- Source: https://docs.openclaw.ai/start/wizard -->
<!-- Title: Setup Wizard (CLI) - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/start/wizard)

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

-   [Setup Wizard (CLI)](https://docs.openclaw.ai/start/wizard)
-   [QuickStart vs Advanced](https://docs.openclaw.ai/start/wizard)
-   [What the wizard configures](https://docs.openclaw.ai/start/wizard)
-   [Add another agent](https://docs.openclaw.ai/start/wizard)
-   [Full reference](https://docs.openclaw.ai/start/wizard)
-   [Related docs](https://docs.openclaw.ai/start/wizard)

First steps

# Setup Wizard (CLI)

# 

[​

](https://docs.openclaw.ai/start/wizard)

Setup Wizard (CLI)

The setup wizard is the **recommended** way to set up OpenClaw on macOS, Linux, or Windows (via WSL2; strongly recommended). It configures a local Gateway or a remote Gateway connection, plus channels, skills, and workspace defaults in one guided flow.

Copy

```
openclaw onboard
```

Fastest first chat: open the Control UI (no channel setup needed). Run `openclaw dashboard` and chat in the browser. Docs: [Dashboard](https://docs.openclaw.ai/web/dashboard).

To reconfigure later:

Copy

```
openclaw configure
openclaw agents add <name>
```

`--json` does not imply non-interactive mode. For scripts, use `--non-interactive`.

The setup wizard includes a web search step where you can pick a provider (Perplexity, Brave, Gemini, Grok, or Kimi) and paste your API key so the agent can use `web_search`. You can also configure this later with `openclaw configure --section web`. Docs: [Web tools](https://docs.openclaw.ai/tools/web).

## 

[​

](https://docs.openclaw.ai/start/wizard)

QuickStart vs Advanced

The wizard starts with **QuickStart** (defaults) vs **Advanced** (full control).

-   QuickStart (defaults)
    
-   Advanced (full control)
    

-   Local gateway (loopback)
-   Workspace default (or existing workspace)
-   Gateway port **18789**
-   Gateway auth **Token** (auto‑generated, even on loopback)
-   Tool policy default for new local setups: `tools.profile: "coding"` (existing explicit profile is preserved)
-   DM isolation default: local onboarding writes `session.dmScope: "per-channel-peer"` when unset. Details: [CLI Setup Reference](https://docs.openclaw.ai/start/wizard-cli-reference)
-   Tailscale exposure **Off**
-   Telegram + WhatsApp DMs default to **allowlist** (you’ll be prompted for your phone number)

-   Exposes every step (mode, workspace, gateway, channels, daemon, skills).

## 

[​

](https://docs.openclaw.ai/start/wizard)

What the wizard configures

**Local mode (default)** walks you through these steps:

1.  **Model/Auth** — choose any supported provider/auth flow (API key, OAuth, or setup-token), including Custom Provider (OpenAI-compatible, Anthropic-compatible, or Unknown auto-detect). Pick a default model. Security note: if this agent will run tools or process webhook/hooks content, prefer the strongest latest-generation model available and keep tool policy strict. Weaker/older tiers are easier to prompt-inject. For non-interactive runs, `--secret-input-mode ref` stores env-backed refs in auth profiles instead of plaintext API key values. In non-interactive `ref` mode, the provider env var must be set; passing inline key flags without that env var fails fast. In interactive runs, choosing secret reference mode lets you point at either an environment variable or a configured provider ref (`file` or `exec`), with a fast preflight validation before saving.
2.  **Workspace** — Location for agent files (default `~/.openclaw/workspace`). Seeds bootstrap files.
3.  **Gateway** — Port, bind address, auth mode, Tailscale exposure. In interactive token mode, choose default plaintext token storage or opt into SecretRef. Non-interactive token SecretRef path: `--gateway-token-ref-env <ENV_VAR>`.
4.  **Channels** — WhatsApp, Telegram, Discord, Google Chat, Mattermost, Signal, BlueBubbles, or iMessage.
5.  **Daemon** — Installs a LaunchAgent (macOS) or systemd user unit (Linux/WSL2). If token auth requires a token and `gateway.auth.token` is SecretRef-managed, daemon install validates it but does not persist the resolved token into supervisor service environment metadata. If token auth requires a token and the configured token SecretRef is unresolved, daemon install is blocked with actionable guidance. If both `gateway.auth.token` and `gateway.auth.password` are configured and `gateway.auth.mode` is unset, daemon install is blocked until mode is set explicitly.
6.  **Health check** — Starts the Gateway and verifies it’s running.
7.  **Skills** — Installs recommended skills and optional dependencies.

Re-running the wizard does **not** wipe anything unless you explicitly choose **Reset** (or pass `--reset`). CLI `--reset` defaults to config, credentials, and sessions; use `--reset-scope full` to include workspace. If the config is invalid or contains legacy keys, the wizard asks you to run `openclaw doctor` first.

**Remote mode** only configures the local client to connect to a Gateway elsewhere. It does **not** install or change anything on the remote host.

## 

[​

](https://docs.openclaw.ai/start/wizard)

Add another agent

Use `openclaw agents add <name>` to create a separate agent with its own workspace, sessions, and auth profiles. Running without `--workspace` launches the wizard. What it sets:

-   `agents.list[].name`
-   `agents.list[].workspace`
-   `agents.list[].agentDir`

Notes:

-   Default workspaces follow `~/.openclaw/workspace-<agentId>`.
-   Add `bindings` to route inbound messages (the wizard can do this).
-   Non-interactive flags: `--model`, `--agent-dir`, `--bind`, `--non-interactive`.

## 

[​

](https://docs.openclaw.ai/start/wizard)

Full reference

For detailed step-by-step breakdowns and config outputs, see [CLI Setup Reference](https://docs.openclaw.ai/start/wizard-cli-reference). For non-interactive examples, see [CLI Automation](https://docs.openclaw.ai/start/wizard-cli-automation). For the deeper technical reference, including RPC details, see [Wizard Reference](https://docs.openclaw.ai/reference/wizard).

## 

[​

](https://docs.openclaw.ai/start/wizard)

Related docs

-   CLI command reference: [`openclaw onboard`](https://docs.openclaw.ai/cli/onboard)
-   Onboarding overview: [Onboarding Overview](https://docs.openclaw.ai/start/onboarding-overview)
-   macOS app onboarding: [Onboarding](https://docs.openclaw.ai/start/onboarding)
-   Agent first-run ritual: [Agent Bootstrapping](https://docs.openclaw.ai/start/bootstrapping)

[Onboarding Overview](https://docs.openclaw.ai/start/onboarding-overview)[Onboarding: macOS App](https://docs.openclaw.ai/start/onboarding)

⌘I
