<!-- Source: https://docs.openclaw.ai/gateway/background-process -->
<!-- Title: Background Exec and Process Tool - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/background-process)

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

-   [Background Exec + Process Tool](https://docs.openclaw.ai/gateway/background-process)
-   [exec tool](https://docs.openclaw.ai/gateway/background-process)
-   [Child process bridging](https://docs.openclaw.ai/gateway/background-process)
-   [process tool](https://docs.openclaw.ai/gateway/background-process)
-   [Examples](https://docs.openclaw.ai/gateway/background-process)

Configuration and operations

# Background Exec and Process Tool

# 

[​

](https://docs.openclaw.ai/gateway/background-process)

Background Exec + Process Tool

OpenClaw runs shell commands through the `exec` tool and keeps long‑running tasks in memory. The `process` tool manages those background sessions.

## 

[​

](https://docs.openclaw.ai/gateway/background-process)

exec tool

Key parameters:

-   `command` (required)
-   `yieldMs` (default 10000): auto‑background after this delay
-   `background` (bool): background immediately
-   `timeout` (seconds, default 1800): kill the process after this timeout
-   `elevated` (bool): run on host if elevated mode is enabled/allowed
-   Need a real TTY? Set `pty: true`.
-   `workdir`, `env`

Behavior:

-   Foreground runs return output directly.
-   When backgrounded (explicit or timeout), the tool returns `status: "running"` + `sessionId` and a short tail.
-   Output is kept in memory until the session is polled or cleared.
-   If the `process` tool is disallowed, `exec` runs synchronously and ignores `yieldMs`/`background`.
-   Spawned exec commands receive `OPENCLAW_SHELL=exec` for context-aware shell/profile rules.

## 

[​

](https://docs.openclaw.ai/gateway/background-process)

Child process bridging

When spawning long-running child processes outside the exec/process tools (for example, CLI respawns or gateway helpers), attach the child-process bridge helper so termination signals are forwarded and listeners are detached on exit/error. This avoids orphaned processes on systemd and keeps shutdown behavior consistent across platforms. Environment overrides:

-   `PI_BASH_YIELD_MS`: default yield (ms)
-   `PI_BASH_MAX_OUTPUT_CHARS`: in‑memory output cap (chars)
-   `OPENCLAW_BASH_PENDING_MAX_OUTPUT_CHARS`: pending stdout/stderr cap per stream (chars)
-   `PI_BASH_JOB_TTL_MS`: TTL for finished sessions (ms, bounded to 1m–3h)

Config (preferred):

-   `tools.exec.backgroundMs` (default 10000)
-   `tools.exec.timeoutSec` (default 1800)
-   `tools.exec.cleanupMs` (default 1800000)
-   `tools.exec.notifyOnExit` (default true): enqueue a system event + request heartbeat when a backgrounded exec exits.
-   `tools.exec.notifyOnExitEmptySuccess` (default false): when true, also enqueue completion events for successful backgrounded runs that produced no output.

## 

[​

](https://docs.openclaw.ai/gateway/background-process)

process tool

Actions:

-   `list`: running + finished sessions
-   `poll`: drain new output for a session (also reports exit status)
-   `log`: read the aggregated output (supports `offset` + `limit`)
-   `write`: send stdin (`data`, optional `eof`)
-   `kill`: terminate a background session
-   `clear`: remove a finished session from memory
-   `remove`: kill if running, otherwise clear if finished

Notes:

-   Only backgrounded sessions are listed/persisted in memory.
-   Sessions are lost on process restart (no disk persistence).
-   Session logs are only saved to chat history if you run `process poll/log` and the tool result is recorded.
-   `process` is scoped per agent; it only sees sessions started by that agent.
-   `process list` includes a derived `name` (command verb + target) for quick scans.
-   `process log` uses line-based `offset`/`limit`.
-   When both `offset` and `limit` are omitted, it returns the last 200 lines and includes a paging hint.
-   When `offset` is provided and `limit` is omitted, it returns from `offset` to the end (not capped to 200).

## 

[​

](https://docs.openclaw.ai/gateway/background-process)

Examples

Run a long task and poll later:

Copy

```
{ "tool": "exec", "command": "sleep 5 && echo done", "yieldMs": 1000 }
```

Copy

```
{ "tool": "process", "action": "poll", "sessionId": "<id>" }
```

Start immediately in background:

Copy

```
{ "tool": "exec", "command": "npm run build", "background": true }
```

Send stdin:

Copy

```
{ "tool": "process", "action": "write", "sessionId": "<id>", "data": "y\n" }
```

[Gateway Lock](https://docs.openclaw.ai/gateway/gateway-lock)[Multiple Gateways](https://docs.openclaw.ai/gateway/multiple-gateways)

⌘I
