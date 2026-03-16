<!-- Source: https://docs.openclaw.ai/diagnostics/flags -->
<!-- Title: Diagnostics Flags - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/diagnostics/flags)

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

-   [Diagnostics Flags](https://docs.openclaw.ai/diagnostics/flags)
-   [How it works](https://docs.openclaw.ai/diagnostics/flags)
-   [Enable via config](https://docs.openclaw.ai/diagnostics/flags)
-   [Env override (one-off)](https://docs.openclaw.ai/diagnostics/flags)
-   [Where logs go](https://docs.openclaw.ai/diagnostics/flags)
-   [Extract logs](https://docs.openclaw.ai/diagnostics/flags)
-   [Notes](https://docs.openclaw.ai/diagnostics/flags)

Environment and debugging

# Diagnostics Flags

# 

[​

](https://docs.openclaw.ai/diagnostics/flags)

Diagnostics Flags

Diagnostics flags let you enable targeted debug logs without turning on verbose logging everywhere. Flags are opt-in and have no effect unless a subsystem checks them.

## 

[​

](https://docs.openclaw.ai/diagnostics/flags)

How it works

-   Flags are strings (case-insensitive).
-   You can enable flags in config or via an env override.
-   Wildcards are supported:
    -   `telegram.*` matches `telegram.http`
    -   `*` enables all flags

## 

[​

](https://docs.openclaw.ai/diagnostics/flags)

Enable via config

Copy

```
{
  "diagnostics": {
    "flags": ["telegram.http"]
  }
}
```

Multiple flags:

Copy

```
{
  "diagnostics": {
    "flags": ["telegram.http", "gateway.*"]
  }
}
```

Restart the gateway after changing flags.

## 

[​

](https://docs.openclaw.ai/diagnostics/flags)

Env override (one-off)

Copy

```
OPENCLAW_DIAGNOSTICS=telegram.http,telegram.payload
```

Disable all flags:

Copy

```
OPENCLAW_DIAGNOSTICS=0
```

## 

[​

](https://docs.openclaw.ai/diagnostics/flags)

Where logs go

Flags emit logs into the standard diagnostics log file. By default:

Copy

```
/tmp/openclaw/openclaw-YYYY-MM-DD.log
```

If you set `logging.file`, use that path instead. Logs are JSONL (one JSON object per line). Redaction still applies based on `logging.redactSensitive`.

## 

[​

](https://docs.openclaw.ai/diagnostics/flags)

Extract logs

Pick the latest log file:

Copy

```
ls -t /tmp/openclaw/openclaw-*.log | head -n 1
```

Filter for Telegram HTTP diagnostics:

Copy

```
rg "telegram http error" /tmp/openclaw/openclaw-*.log
```

Or tail while reproducing:

Copy

```
tail -f /tmp/openclaw/openclaw-$(date +%F).log | rg "telegram http error"
```

For remote gateways, you can also use `openclaw logs --follow` (see [/cli/logs](https://docs.openclaw.ai/cli/logs)).

## 

[​

](https://docs.openclaw.ai/diagnostics/flags)

Notes

-   If `logging.level` is set higher than `warn`, these logs may be suppressed. Default `info` is fine.
-   Flags are safe to leave enabled; they only affect log volume for the specific subsystem.
-   Use [/logging](https://docs.openclaw.ai/logging) to change log destinations, levels, and redaction.

[Node + tsx Crash](https://docs.openclaw.ai/debug/node-issue)[Node.js](https://docs.openclaw.ai/install/node)

⌘I
