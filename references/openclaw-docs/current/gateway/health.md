<!-- Source: https://docs.openclaw.ai/gateway/health -->
<!-- Title: Health Checks - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/health)

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

-   [Health Checks (CLI)](https://docs.openclaw.ai/gateway/health)
-   [Quick checks](https://docs.openclaw.ai/gateway/health)
-   [Deep diagnostics](https://docs.openclaw.ai/gateway/health)
-   [Health monitor config](https://docs.openclaw.ai/gateway/health)
-   [When something fails](https://docs.openclaw.ai/gateway/health)
-   [Dedicated “health” command](https://docs.openclaw.ai/gateway/health)

Configuration and operations

# Health Checks

# 

[​

](https://docs.openclaw.ai/gateway/health)

Health Checks (CLI)

Short guide to verify channel connectivity without guessing.

## 

[​

](https://docs.openclaw.ai/gateway/health)

Quick checks

-   `openclaw status` — local summary: gateway reachability/mode, update hint, linked channel auth age, sessions + recent activity.
-   `openclaw status --all` — full local diagnosis (read-only, color, safe to paste for debugging).
-   `openclaw status --deep` — also probes the running Gateway (per-channel probes when supported).
-   `openclaw health --json` — asks the running Gateway for a full health snapshot (WS-only; no direct Baileys socket).
-   Send `/status` as a standalone message in WhatsApp/WebChat to get a status reply without invoking the agent.
-   Logs: tail `/tmp/openclaw/openclaw-*.log` and filter for `web-heartbeat`, `web-reconnect`, `web-auto-reply`, `web-inbound`.

## 

[​

](https://docs.openclaw.ai/gateway/health)

Deep diagnostics

-   Creds on disk: `ls -l ~/.openclaw/credentials/whatsapp/<accountId>/creds.json` (mtime should be recent).
-   Session store: `ls -l ~/.openclaw/agents/<agentId>/sessions/sessions.json` (path can be overridden in config). Count and recent recipients are surfaced via `status`.
-   Relink flow: `openclaw channels logout && openclaw channels login --verbose` when status codes 409–515 or `loggedOut` appear in logs. (Note: the QR login flow auto-restarts once for status 515 after pairing.)

## 

[​

](https://docs.openclaw.ai/gateway/health)

Health monitor config

-   `gateway.channelHealthCheckMinutes`: how often the gateway checks channel health. Default: `5`. Set `0` to disable health-monitor restarts globally.
-   `gateway.channelStaleEventThresholdMinutes`: how long a connected channel can stay idle before the health monitor treats it as stale and restarts it. Default: `30`. Keep this greater than or equal to `gateway.channelHealthCheckMinutes`.
-   `gateway.channelMaxRestartsPerHour`: rolling one-hour cap for health-monitor restarts per channel/account. Default: `10`.
-   `channels.<provider>.healthMonitor.enabled`: disable health-monitor restarts for a specific channel while leaving global monitoring enabled.
-   `channels.<provider>.accounts.<accountId>.healthMonitor.enabled`: multi-account override that wins over the channel-level setting.
-   These per-channel overrides apply to the built-in channel monitors that expose them today: Discord, Google Chat, iMessage, Microsoft Teams, Signal, Slack, Telegram, and WhatsApp.

## 

[​

](https://docs.openclaw.ai/gateway/health)

When something fails

-   `logged out` or status 409–515 → relink with `openclaw channels logout` then `openclaw channels login`.
-   Gateway unreachable → start it: `openclaw gateway --port 18789` (use `--force` if the port is busy).
-   No inbound messages → confirm linked phone is online and the sender is allowed (`channels.whatsapp.allowFrom`); for group chats, ensure allowlist + mention rules match (`channels.whatsapp.groups`, `agents.list[].groupChat.mentionPatterns`).

## 

[​

](https://docs.openclaw.ai/gateway/health)

Dedicated “health” command

`openclaw health --json` asks the running Gateway for its health snapshot (no direct channel sockets from the CLI). It reports linked creds/auth age when available, per-channel probe summaries, session-store summary, and a probe duration. It exits non-zero if the Gateway is unreachable or the probe fails/timeouts. Use `--timeout <ms>` to override the 10s default.

[Trusted proxy auth](https://docs.openclaw.ai/gateway/trusted-proxy-auth)[Heartbeat](https://docs.openclaw.ai/gateway/heartbeat)

⌘I
