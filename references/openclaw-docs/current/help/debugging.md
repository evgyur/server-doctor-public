<!-- Source: https://docs.openclaw.ai/help/debugging -->
<!-- Title: Debugging - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/help/debugging)

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

-   [Debugging](https://docs.openclaw.ai/help/debugging)
-   [Runtime debug overrides](https://docs.openclaw.ai/help/debugging)
-   [Gateway watch mode](https://docs.openclaw.ai/help/debugging)
-   [Dev profile + dev gateway (—dev)](https://docs.openclaw.ai/help/debugging)
-   [Raw stream logging (OpenClaw)](https://docs.openclaw.ai/help/debugging)
-   [Raw chunk logging (pi-mono)](https://docs.openclaw.ai/help/debugging)
-   [Safety notes](https://docs.openclaw.ai/help/debugging)

Environment and debugging

# Debugging

# 

[​

](https://docs.openclaw.ai/help/debugging)

Debugging

This page covers debugging helpers for streaming output, especially when a provider mixes reasoning into normal text.

## 

[​

](https://docs.openclaw.ai/help/debugging)

Runtime debug overrides

Use `/debug` in chat to set **runtime-only** config overrides (memory, not disk). `/debug` is disabled by default; enable with `commands.debug: true`. This is handy when you need to toggle obscure settings without editing `openclaw.json`. Examples:

Copy

```
/debug show
/debug set messages.responsePrefix="[openclaw]"
/debug unset messages.responsePrefix
/debug reset
```

`/debug reset` clears all overrides and returns to the on-disk config.

## 

[​

](https://docs.openclaw.ai/help/debugging)

Gateway watch mode

For fast iteration, run the gateway under the file watcher:

Copy

```
pnpm gateway:watch
```

This maps to:

Copy

```
node scripts/watch-node.mjs gateway --force
```

The watcher restarts on build-relevant files under `src/`, extension source files, extension `package.json` and `openclaw.plugin.json` metadata, `tsconfig.json`, `package.json`, and `tsdown.config.ts`. Extension metadata changes restart the gateway without forcing a `tsdown` rebuild; source and config changes still rebuild `dist` first. Add any gateway CLI flags after `gateway:watch` and they will be passed through on each restart.

## 

[​

](https://docs.openclaw.ai/help/debugging)

Dev profile + dev gateway (—dev)

Use the dev profile to isolate state and spin up a safe, disposable setup for debugging. There are **two** `--dev` flags:

-   **Global `--dev` (profile):** isolates state under `~/.openclaw-dev` and defaults the gateway port to `19001` (derived ports shift with it).
-   **`gateway --dev`: tells the Gateway to auto-create a default config + workspace** when missing (and skip BOOTSTRAP.md).

Recommended flow (dev profile + dev bootstrap):

Copy

```
pnpm gateway:dev
OPENCLAW_PROFILE=dev openclaw tui
```

If you don’t have a global install yet, run the CLI via `pnpm openclaw ...`. What this does:

1.  **Profile isolation** (global `--dev`)
    -   `OPENCLAW_PROFILE=dev`
    -   `OPENCLAW_STATE_DIR=~/.openclaw-dev`
    -   `OPENCLAW_CONFIG_PATH=~/.openclaw-dev/openclaw.json`
    -   `OPENCLAW_GATEWAY_PORT=19001` (browser/canvas shift accordingly)
2.  **Dev bootstrap** (`gateway --dev`)
    -   Writes a minimal config if missing (`gateway.mode=local`, bind loopback).
    -   Sets `agent.workspace` to the dev workspace.
    -   Sets `agent.skipBootstrap=true` (no BOOTSTRAP.md).
    -   Seeds the workspace files if missing: `AGENTS.md`, `SOUL.md`, `TOOLS.md`, `IDENTITY.md`, `USER.md`, `HEARTBEAT.md`.
    -   Default identity: **C3‑PO** (protocol droid).
    -   Skips channel providers in dev mode (`OPENCLAW_SKIP_CHANNELS=1`).

Reset flow (fresh start):

Copy

```
pnpm gateway:dev:reset
```

Note: `--dev` is a **global** profile flag and gets eaten by some runners. If you need to spell it out, use the env var form:

Copy

```
OPENCLAW_PROFILE=dev openclaw gateway --dev --reset
```

`--reset` wipes config, credentials, sessions, and the dev workspace (using `trash`, not `rm`), then recreates the default dev setup. Tip: if a non‑dev gateway is already running (launchd/systemd), stop it first:

Copy

```
openclaw gateway stop
```

## 

[​

](https://docs.openclaw.ai/help/debugging)

Raw stream logging (OpenClaw)

OpenClaw can log the **raw assistant stream** before any filtering/formatting. This is the best way to see whether reasoning is arriving as plain text deltas (or as separate thinking blocks). Enable it via CLI:

Copy

```
pnpm gateway:watch --raw-stream
```

Optional path override:

Copy

```
pnpm gateway:watch --raw-stream --raw-stream-path ~/.openclaw/logs/raw-stream.jsonl
```

Equivalent env vars:

Copy

```
OPENCLAW_RAW_STREAM=1
OPENCLAW_RAW_STREAM_PATH=~/.openclaw/logs/raw-stream.jsonl
```

Default file: `~/.openclaw/logs/raw-stream.jsonl`

## 

[​

](https://docs.openclaw.ai/help/debugging)

Raw chunk logging (pi-mono)

To capture **raw OpenAI-compat chunks** before they are parsed into blocks, pi-mono exposes a separate logger:

Copy

```
PI_RAW_STREAM=1
```

Optional path:

Copy

```
PI_RAW_STREAM_PATH=~/.pi-mono/logs/raw-openai-completions.jsonl
```

Default file: `~/.pi-mono/logs/raw-openai-completions.jsonl`

> Note: this is only emitted by processes using pi-mono’s `openai-completions` provider.

## 

[​

](https://docs.openclaw.ai/help/debugging)

Safety notes

-   Raw stream logs can include full prompts, tool output, and user data.
-   Keep logs local and delete them after debugging.
-   If you share logs, scrub secrets and PII first.

[Environment Variables](https://docs.openclaw.ai/help/environment)[Testing](https://docs.openclaw.ai/help/testing)

⌘I
