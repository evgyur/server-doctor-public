<!-- Source: https://docs.openclaw.ai/gateway/multiple-gateways -->
<!-- Title: Multiple Gateways - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/multiple-gateways)

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

-   [Multiple Gateways (same host)](https://docs.openclaw.ai/gateway/multiple-gateways)
-   [Isolation checklist (required)](https://docs.openclaw.ai/gateway/multiple-gateways)
-   [Recommended: profiles (--profile)](https://docs.openclaw.ai/gateway/multiple-gateways)
-   [Rescue-bot guide](https://docs.openclaw.ai/gateway/multiple-gateways)
-   [How to install (rescue bot)](https://docs.openclaw.ai/gateway/multiple-gateways)
-   [Port mapping (derived)](https://docs.openclaw.ai/gateway/multiple-gateways)
-   [Browser/CDP notes (common footgun)](https://docs.openclaw.ai/gateway/multiple-gateways)
-   [Manual env example](https://docs.openclaw.ai/gateway/multiple-gateways)
-   [Quick checks](https://docs.openclaw.ai/gateway/multiple-gateways)

Configuration and operations

# Multiple Gateways

# 

[​

](https://docs.openclaw.ai/gateway/multiple-gateways)

Multiple Gateways (same host)

Most setups should use one Gateway because a single Gateway can handle multiple messaging connections and agents. If you need stronger isolation or redundancy (e.g., a rescue bot), run separate Gateways with isolated profiles/ports.

## 

[​

](https://docs.openclaw.ai/gateway/multiple-gateways)

Isolation checklist (required)

-   `OPENCLAW_CONFIG_PATH` — per-instance config file
-   `OPENCLAW_STATE_DIR` — per-instance sessions, creds, caches
-   `agents.defaults.workspace` — per-instance workspace root
-   `gateway.port` (or `--port`) — unique per instance
-   Derived ports (browser/canvas) must not overlap

If these are shared, you will hit config races and port conflicts.

## 

[​

](https://docs.openclaw.ai/gateway/multiple-gateways)

Recommended: profiles (`--profile`)

Profiles auto-scope `OPENCLAW_STATE_DIR` + `OPENCLAW_CONFIG_PATH` and suffix service names.

Copy

```
# main
openclaw --profile main setup
openclaw --profile main gateway --port 18789

# rescue
openclaw --profile rescue setup
openclaw --profile rescue gateway --port 19001
```

Per-profile services:

Copy

```
openclaw --profile main gateway install
openclaw --profile rescue gateway install
```

## 

[​

](https://docs.openclaw.ai/gateway/multiple-gateways)

Rescue-bot guide

Run a second Gateway on the same host with its own:

-   profile/config
-   state dir
-   workspace
-   base port (plus derived ports)

This keeps the rescue bot isolated from the main bot so it can debug or apply config changes if the primary bot is down. Port spacing: leave at least 20 ports between base ports so the derived browser/canvas/CDP ports never collide.

### 

[​

](https://docs.openclaw.ai/gateway/multiple-gateways)

How to install (rescue bot)

Copy

```
# Main bot (existing or fresh, without --profile param)
# Runs on port 18789 + Chrome CDC/Canvas/... Ports
openclaw onboard
openclaw gateway install

# Rescue bot (isolated profile + ports)
openclaw --profile rescue onboard
# Notes:
# - workspace name will be postfixed with -rescue per default
# - Port should be at least 18789 + 20 Ports,
#   better choose completely different base port, like 19789,
# - rest of the onboarding is the same as normal

# To install the service (if not happened automatically during setup)
openclaw --profile rescue gateway install
```

## 

[​

](https://docs.openclaw.ai/gateway/multiple-gateways)

Port mapping (derived)

Base port = `gateway.port` (or `OPENCLAW_GATEWAY_PORT` / `--port`).

-   browser control service port = base + 2 (loopback only)
-   canvas host is served on the Gateway HTTP server (same port as `gateway.port`)
-   Browser profile CDP ports auto-allocate from `browser.controlPort + 9 .. + 108`

If you override any of these in config or env, you must keep them unique per instance.

## 

[​

](https://docs.openclaw.ai/gateway/multiple-gateways)

Browser/CDP notes (common footgun)

-   Do **not** pin `browser.cdpUrl` to the same values on multiple instances.
-   Each instance needs its own browser control port and CDP range (derived from its gateway port).
-   If you need explicit CDP ports, set `browser.profiles.<name>.cdpPort` per instance.
-   Remote Chrome: use `browser.profiles.<name>.cdpUrl` (per profile, per instance).

## 

[​

](https://docs.openclaw.ai/gateway/multiple-gateways)

Manual env example

Copy

```
OPENCLAW_CONFIG_PATH=~/.openclaw/main.json \
OPENCLAW_STATE_DIR=~/.openclaw-main \
openclaw gateway --port 18789

OPENCLAW_CONFIG_PATH=~/.openclaw/rescue.json \
OPENCLAW_STATE_DIR=~/.openclaw-rescue \
openclaw gateway --port 19001
```

## 

[​

](https://docs.openclaw.ai/gateway/multiple-gateways)

Quick checks

Copy

```
openclaw --profile main status
openclaw --profile rescue status
openclaw --profile rescue browser status
```

[Background Exec and Process Tool](https://docs.openclaw.ai/gateway/background-process)[Troubleshooting](https://docs.openclaw.ai/gateway/troubleshooting)

⌘I
