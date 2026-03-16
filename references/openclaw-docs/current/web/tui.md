<!-- Source: https://docs.openclaw.ai/web/tui -->
<!-- Title: TUI - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/web/tui)

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

##### Gateway

-   [
    
    Gateway Runbook
    
    
    
    ](https://docs.openclaw.ai/gateway)

##### Remote access

-   [
    
    Remote Access
    
    
    
    ](https://docs.openclaw.ai/gateway/remote)
-   [
    
    Remote Gateway Setup
    
    
    
    ](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [
    
    Tailscale
    
    
    
    ](https://docs.openclaw.ai/gateway/tailscale)

##### Security

-   [
    
    Formal Verification (Security Models)
    
    
    
    ](https://docs.openclaw.ai/security/formal-verification)
-   [
    
    THREAT MODEL ATLAS
    
    
    
    ](https://docs.openclaw.ai/security/THREAT-MODEL-ATLAS)
-   [
    
    CONTRIBUTING THREAT MODEL
    
    
    
    ](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

##### Web interfaces

-   [
    
    Web
    
    
    
    ](https://docs.openclaw.ai/web)
-   [
    
    Control UI
    
    
    
    ](https://docs.openclaw.ai/web/control-ui)
-   [
    
    Dashboard
    
    
    
    ](https://docs.openclaw.ai/web/dashboard)
-   [
    
    WebChat
    
    
    
    ](https://docs.openclaw.ai/web/webchat)
-   [
    
    TUI
    
    
    
    ](https://docs.openclaw.ai/web/tui)

-   [TUI (Terminal UI)](https://docs.openclaw.ai/web/tui)
-   [Quick start](https://docs.openclaw.ai/web/tui)
-   [What you see](https://docs.openclaw.ai/web/tui)
-   [Mental model: agents + sessions](https://docs.openclaw.ai/web/tui)
-   [Sending + delivery](https://docs.openclaw.ai/web/tui)
-   [Pickers + overlays](https://docs.openclaw.ai/web/tui)
-   [Keyboard shortcuts](https://docs.openclaw.ai/web/tui)
-   [Slash commands](https://docs.openclaw.ai/web/tui)
-   [Local shell commands](https://docs.openclaw.ai/web/tui)
-   [Tool output](https://docs.openclaw.ai/web/tui)
-   [Terminal colors](https://docs.openclaw.ai/web/tui)
-   [History + streaming](https://docs.openclaw.ai/web/tui)
-   [Connection details](https://docs.openclaw.ai/web/tui)
-   [Options](https://docs.openclaw.ai/web/tui)
-   [Troubleshooting](https://docs.openclaw.ai/web/tui)
-   [Connection troubleshooting](https://docs.openclaw.ai/web/tui)

Web interfaces

# TUI

# 

[​

](https://docs.openclaw.ai/web/tui)

TUI (Terminal UI)

## 

[​

](https://docs.openclaw.ai/web/tui)

Quick start

1.  Start the Gateway.

Copy

```
openclaw gateway
```

2.  Open the TUI.

Copy

```
openclaw tui
```

3.  Type a message and press Enter.

Remote Gateway:

Copy

```
openclaw tui --url ws://<host>:<port> --token <gateway-token>
```

Use `--password` if your Gateway uses password auth.

## 

[​

](https://docs.openclaw.ai/web/tui)

What you see

-   Header: connection URL, current agent, current session.
-   Chat log: user messages, assistant replies, system notices, tool cards.
-   Status line: connection/run state (connecting, running, streaming, idle, error).
-   Footer: connection state + agent + session + model + think/fast/verbose/reasoning + token counts + deliver.
-   Input: text editor with autocomplete.

## 

[​

](https://docs.openclaw.ai/web/tui)

Mental model: agents + sessions

-   Agents are unique slugs (e.g. `main`, `research`). The Gateway exposes the list.
-   Sessions belong to the current agent.
-   Session keys are stored as `agent:<agentId>:<sessionKey>`.
    -   If you type `/session main`, the TUI expands it to `agent:<currentAgent>:main`.
    -   If you type `/session agent:other:main`, you switch to that agent session explicitly.
-   Session scope:
    -   `per-sender` (default): each agent has many sessions.
    -   `global`: the TUI always uses the `global` session (the picker may be empty).
-   The current agent + session are always visible in the footer.

## 

[​

](https://docs.openclaw.ai/web/tui)

Sending + delivery

-   Messages are sent to the Gateway; delivery to providers is off by default.
-   Turn delivery on:
    -   `/deliver on`
    -   or the Settings panel
    -   or start with `openclaw tui --deliver`

## 

[​

](https://docs.openclaw.ai/web/tui)

Pickers + overlays

-   Model picker: list available models and set the session override.
-   Agent picker: choose a different agent.
-   Session picker: shows only sessions for the current agent.
-   Settings: toggle deliver, tool output expansion, and thinking visibility.

## 

[​

](https://docs.openclaw.ai/web/tui)

Keyboard shortcuts

-   Enter: send message
-   Esc: abort active run
-   Ctrl+C: clear input (press twice to exit)
-   Ctrl+D: exit
-   Ctrl+L: model picker
-   Ctrl+G: agent picker
-   Ctrl+P: session picker
-   Ctrl+O: toggle tool output expansion
-   Ctrl+T: toggle thinking visibility (reloads history)

## 

[​

](https://docs.openclaw.ai/web/tui)

Slash commands

Core:

-   `/help`
-   `/status`
-   `/agent <id>` (or `/agents`)
-   `/session <key>` (or `/sessions`)
-   `/model <provider/model>` (or `/models`)

Session controls:

-   `/think <off|minimal|low|medium|high>`
-   `/fast <status|on|off>`
-   `/verbose <on|full|off>`
-   `/reasoning <on|off|stream>`
-   `/usage <off|tokens|full>`
-   `/elevated <on|off|ask|full>` (alias: `/elev`)
-   `/activation <mention|always>`
-   `/deliver <on|off>`

Session lifecycle:

-   `/new` or `/reset` (reset the session)
-   `/abort` (abort the active run)
-   `/settings`
-   `/exit`

Other Gateway slash commands (for example, `/context`) are forwarded to the Gateway and shown as system output. See [Slash commands](https://docs.openclaw.ai/tools/slash-commands).

## 

[​

](https://docs.openclaw.ai/web/tui)

Local shell commands

-   Prefix a line with `!` to run a local shell command on the TUI host.
-   The TUI prompts once per session to allow local execution; declining keeps `!` disabled for the session.
-   Commands run in a fresh, non-interactive shell in the TUI working directory (no persistent `cd`/env).
-   Local shell commands receive `OPENCLAW_SHELL=tui-local` in their environment.
-   A lone `!` is sent as a normal message; leading spaces do not trigger local exec.

## 

[​

](https://docs.openclaw.ai/web/tui)

Tool output

-   Tool calls show as cards with args + results.
-   Ctrl+O toggles between collapsed/expanded views.
-   While tools run, partial updates stream into the same card.

## 

[​

](https://docs.openclaw.ai/web/tui)

Terminal colors

-   The TUI keeps assistant body text in your terminal’s default foreground so dark and light terminals both stay readable.
-   If your terminal uses a light background and auto-detection is wrong, set `OPENCLAW_THEME=light` before launching `openclaw tui`.
-   To force the original dark palette instead, set `OPENCLAW_THEME=dark`.

## 

[​

](https://docs.openclaw.ai/web/tui)

History + streaming

-   On connect, the TUI loads the latest history (default 200 messages).
-   Streaming responses update in place until finalized.
-   The TUI also listens to agent tool events for richer tool cards.

## 

[​

](https://docs.openclaw.ai/web/tui)

Connection details

-   The TUI registers with the Gateway as `mode: "tui"`.
-   Reconnects show a system message; event gaps are surfaced in the log.

## 

[​

](https://docs.openclaw.ai/web/tui)

Options

-   `--url <url>`: Gateway WebSocket URL (defaults to config or `ws://127.0.0.1:<port>`)
-   `--token <token>`: Gateway token (if required)
-   `--password <password>`: Gateway password (if required)
-   `--session <key>`: Session key (default: `main`, or `global` when scope is global)
-   `--deliver`: Deliver assistant replies to the provider (default off)
-   `--thinking <level>`: Override thinking level for sends
-   `--timeout-ms <ms>`: Agent timeout in ms (defaults to `agents.defaults.timeoutSeconds`)

Note: when you set `--url`, the TUI does not fall back to config or environment credentials. Pass `--token` or `--password` explicitly. Missing explicit credentials is an error.

## 

[​

](https://docs.openclaw.ai/web/tui)

Troubleshooting

No output after sending a message:

-   Run `/status` in the TUI to confirm the Gateway is connected and idle/busy.
-   Check the Gateway logs: `openclaw logs --follow`.
-   Confirm the agent can run: `openclaw status` and `openclaw models status`.
-   If you expect messages in a chat channel, enable delivery (`/deliver on` or `--deliver`).
-   `--history-limit <n>`: History entries to load (default 200)

## 

[​

](https://docs.openclaw.ai/web/tui)

Connection troubleshooting

-   `disconnected`: ensure the Gateway is running and your `--url/--token/--password` are correct.
-   No agents in picker: check `openclaw agents list` and your routing config.
-   Empty session picker: you might be in global scope or have no sessions yet.

[WebChat](https://docs.openclaw.ai/web/webchat)

⌘I
