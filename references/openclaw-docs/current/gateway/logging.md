<!-- Source: https://docs.openclaw.ai/gateway/logging -->
<!-- Title: Logging - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/logging)

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
-   -   [
        
        Configuration
        
        
        
        ](https://docs.openclaw.ai/gateway/configuration)
    -   [
        
        Configuration Reference
        
        
        
        ](https://docs.openclaw.ai/gateway/configuration-reference)
    -   [
        
        Configuration Examples
        
        
        
        ](https://docs.openclaw.ai/gateway/configuration-examples)
    -   [
        
        Authentication
        
        
        
        ](https://docs.openclaw.ai/gateway/authentication)
    -   [
        
        Auth credential semantics
        
        
        
        ](https://docs.openclaw.ai/auth-credential-semantics)
    -   [
        
        Secrets Management
        
        
        
        ](https://docs.openclaw.ai/gateway/secrets)
    -   [
        
        Secrets Apply Plan Contract
        
        
        
        ](https://docs.openclaw.ai/gateway/secrets-plan-contract)
    -   [
        
        Trusted proxy auth
        
        
        
        ](https://docs.openclaw.ai/gateway/trusted-proxy-auth)
    -   [
        
        Health Checks
        
        
        
        ](https://docs.openclaw.ai/gateway/health)
    -   [
        
        Heartbeat
        
        
        
        ](https://docs.openclaw.ai/gateway/heartbeat)
    -   [
        
        Doctor
        
        
        
        ](https://docs.openclaw.ai/gateway/doctor)
    -   [
        
        Logging
        
        
        
        ](https://docs.openclaw.ai/gateway/logging)
    -   [
        
        Gateway Lock
        
        
        
        ](https://docs.openclaw.ai/gateway/gateway-lock)
    -   [
        
        Background Exec and Process Tool
        
        
        
        ](https://docs.openclaw.ai/gateway/background-process)
    -   [
        
        Multiple Gateways
        
        
        
        ](https://docs.openclaw.ai/gateway/multiple-gateways)
    -   [
        
        Troubleshooting
        
        
        
        ](https://docs.openclaw.ai/gateway/troubleshooting)

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

-   [Logging](https://docs.openclaw.ai/gateway/logging)
-   [File-based logger](https://docs.openclaw.ai/gateway/logging)
-   [Console capture](https://docs.openclaw.ai/gateway/logging)
-   [Tool summary redaction](https://docs.openclaw.ai/gateway/logging)
-   [Gateway WebSocket logs](https://docs.openclaw.ai/gateway/logging)
-   [WS log style](https://docs.openclaw.ai/gateway/logging)
-   [Console formatting (subsystem logging)](https://docs.openclaw.ai/gateway/logging)

Configuration and operations

# Logging

# 

[​

](https://docs.openclaw.ai/gateway/logging)

Logging

For a user-facing overview (CLI + Control UI + config), see [/logging](https://docs.openclaw.ai/logging). OpenClaw has two log “surfaces”:

-   **Console output** (what you see in the terminal / Debug UI).
-   **File logs** (JSON lines) written by the gateway logger.

## 

[​

](https://docs.openclaw.ai/gateway/logging)

File-based logger

-   Default rolling log file is under `/tmp/openclaw/` (one file per day): `openclaw-YYYY-MM-DD.log`
    -   Date uses the gateway host’s local timezone.
-   The log file path and level can be configured via `~/.openclaw/openclaw.json`:
    -   `logging.file`
    -   `logging.level`

The file format is one JSON object per line. The Control UI Logs tab tails this file via the gateway (`logs.tail`). CLI can do the same:

Copy

```
openclaw logs --follow
```

**Verbose vs. log levels**

-   **File logs** are controlled exclusively by `logging.level`.
-   `--verbose` only affects **console verbosity** (and WS log style); it does **not** raise the file log level.
-   To capture verbose-only details in file logs, set `logging.level` to `debug` or `trace`.

## 

[​

](https://docs.openclaw.ai/gateway/logging)

Console capture

The CLI captures `console.log/info/warn/error/debug/trace` and writes them to file logs, while still printing to stdout/stderr. You can tune console verbosity independently via:

-   `logging.consoleLevel` (default `info`)
-   `logging.consoleStyle` (`pretty` | `compact` | `json`)

## 

[​

](https://docs.openclaw.ai/gateway/logging)

Tool summary redaction

Verbose tool summaries (e.g. `🛠️ Exec: ...`) can mask sensitive tokens before they hit the console stream. This is **tools-only** and does not alter file logs.

-   `logging.redactSensitive`: `off` | `tools` (default: `tools`)
-   `logging.redactPatterns`: array of regex strings (overrides defaults)
    -   Use raw regex strings (auto `gi`), or `/pattern/flags` if you need custom flags.
    -   Matches are masked by keeping the first 6 + last 4 chars (length >= 18), otherwise `***`.
    -   Defaults cover common key assignments, CLI flags, JSON fields, bearer headers, PEM blocks, and popular token prefixes.

## 

[​

](https://docs.openclaw.ai/gateway/logging)

Gateway WebSocket logs

The gateway prints WebSocket protocol logs in two modes:

-   **Normal mode (no `--verbose`)**: only “interesting” RPC results are printed:
    -   errors (`ok=false`)
    -   slow calls (default threshold: `>= 50ms`)
    -   parse errors
-   **Verbose mode (`--verbose`)**: prints all WS request/response traffic.

### 

[​

](https://docs.openclaw.ai/gateway/logging)

WS log style

`openclaw gateway` supports a per-gateway style switch:

-   `--ws-log auto` (default): normal mode is optimized; verbose mode uses compact output
-   `--ws-log compact`: compact output (paired request/response) when verbose
-   `--ws-log full`: full per-frame output when verbose
-   `--compact`: alias for `--ws-log compact`

Examples:

Copy

```
# optimized (only errors/slow)
openclaw gateway

# show all WS traffic (paired)
openclaw gateway --verbose --ws-log compact

# show all WS traffic (full meta)
openclaw gateway --verbose --ws-log full
```

## 

[​

](https://docs.openclaw.ai/gateway/logging)

Console formatting (subsystem logging)

The console formatter is **TTY-aware** and prints consistent, prefixed lines. Subsystem loggers keep output grouped and scannable. Behavior:

-   **Subsystem prefixes** on every line (e.g. `[gateway]`, `[canvas]`, `[tailscale]`)
-   **Subsystem colors** (stable per subsystem) plus level coloring
-   **Color when output is a TTY or the environment looks like a rich terminal** (`TERM`/`COLORTERM`/`TERM_PROGRAM`), respects `NO_COLOR`
-   **Shortened subsystem prefixes**: drops leading `gateway/` + `channels/`, keeps last 2 segments (e.g. `whatsapp/outbound`)
-   **Sub-loggers by subsystem** (auto prefix + structured field `{ subsystem }`)
-   **`logRaw()`** for QR/UX output (no prefix, no formatting)
-   **Console styles** (e.g. `pretty | compact | json`)
-   **Console log level** separate from file log level (file keeps full detail when `logging.level` is set to `debug`/`trace`)
-   **WhatsApp message bodies** are logged at `debug` (use `--verbose` to see them)

This keeps existing file logs stable while making interactive output scannable.

[Doctor](https://docs.openclaw.ai/gateway/doctor)[Gateway Lock](https://docs.openclaw.ai/gateway/gateway-lock)

⌘I
