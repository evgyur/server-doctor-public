<!-- Source: https://docs.openclaw.ai/gateway -->
<!-- Title: Gateway Runbook - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway)

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

-   [Gateway runbook](https://docs.openclaw.ai/gateway)
-   [5-minute local startup](https://docs.openclaw.ai/gateway)
-   [Runtime model](https://docs.openclaw.ai/gateway)
-   [Port and bind precedence](https://docs.openclaw.ai/gateway)
-   [Hot reload modes](https://docs.openclaw.ai/gateway)
-   [Operator command set](https://docs.openclaw.ai/gateway)
-   [Remote access](https://docs.openclaw.ai/gateway)
-   [Supervision and service lifecycle](https://docs.openclaw.ai/gateway)
-   [Multiple gateways on one host](https://docs.openclaw.ai/gateway)
-   [Dev profile quick path](https://docs.openclaw.ai/gateway)
-   [Protocol quick reference (operator view)](https://docs.openclaw.ai/gateway)
-   [Operational checks](https://docs.openclaw.ai/gateway)
-   [Liveness](https://docs.openclaw.ai/gateway)
-   [Readiness](https://docs.openclaw.ai/gateway)
-   [Gap recovery](https://docs.openclaw.ai/gateway)
-   [Common failure signatures](https://docs.openclaw.ai/gateway)
-   [Safety guarantees](https://docs.openclaw.ai/gateway)

Gateway

# Gateway Runbook

# 

[​

](https://docs.openclaw.ai/gateway)

Gateway runbook

Use this page for day-1 startup and day-2 operations of the Gateway service.

[

## Deep troubleshooting

Symptom-first diagnostics with exact command ladders and log signatures.





](https://docs.openclaw.ai/gateway/troubleshooting)[

## Configuration

Task-oriented setup guide + full configuration reference.





](https://docs.openclaw.ai/gateway/configuration)[

## Secrets management

SecretRef contract, runtime snapshot behavior, and migrate/reload operations.





](https://docs.openclaw.ai/gateway/secrets)[

## Secrets plan contract

Exact `secrets apply` target/path rules and ref-only auth-profile behavior.





](https://docs.openclaw.ai/gateway/secrets-plan-contract)

## 

[​

](https://docs.openclaw.ai/gateway)

5-minute local startup

1

[

](https://docs.openclaw.ai/gateway)

Start the Gateway

Copy

```
openclaw gateway --port 18789
# debug/trace mirrored to stdio
openclaw gateway --port 18789 --verbose
# force-kill listener on selected port, then start
openclaw gateway --force
```

2

[

](https://docs.openclaw.ai/gateway)

Verify service health

Copy

```
openclaw gateway status
openclaw status
openclaw logs --follow
```

Healthy baseline: `Runtime: running` and `RPC probe: ok`.

3

[

](https://docs.openclaw.ai/gateway)

Validate channel readiness

Copy

```
openclaw channels status --probe
```

Gateway config reload watches the active config file path (resolved from profile/state defaults, or `OPENCLAW_CONFIG_PATH` when set). Default mode is `gateway.reload.mode="hybrid"`.

## 

[​

](https://docs.openclaw.ai/gateway)

Runtime model

-   One always-on process for routing, control plane, and channel connections.
-   Single multiplexed port for:
    -   WebSocket control/RPC
    -   HTTP APIs (OpenAI-compatible, Responses, tools invoke)
    -   Control UI and hooks
-   Default bind mode: `loopback`.
-   Auth is required by default (`gateway.auth.token` / `gateway.auth.password`, or `OPENCLAW_GATEWAY_TOKEN` / `OPENCLAW_GATEWAY_PASSWORD`).

### 

[​

](https://docs.openclaw.ai/gateway)

Port and bind precedence

| Setting | Resolution order |
| --- | --- |
| Gateway port | `--port` → `OPENCLAW_GATEWAY_PORT` → `gateway.port` → `18789` |
| Bind mode | CLI/override → `gateway.bind` → `loopback` |

### 

[​

](https://docs.openclaw.ai/gateway)

Hot reload modes

| `gateway.reload.mode` | Behavior |
| --- | --- |
| `off` | No config reload |
| `hot` | Apply only hot-safe changes |
| `restart` | Restart on reload-required changes |
| `hybrid` (default) | Hot-apply when safe, restart when required |

## 

[​

](https://docs.openclaw.ai/gateway)

Operator command set

Copy

```
openclaw gateway status
openclaw gateway status --deep
openclaw gateway status --json
openclaw gateway install
openclaw gateway restart
openclaw gateway stop
openclaw secrets reload
openclaw logs --follow
openclaw doctor
```

## 

[​

](https://docs.openclaw.ai/gateway)

Remote access

Preferred: Tailscale/VPN. Fallback: SSH tunnel.

Copy

```
ssh -N -L 18789:127.0.0.1:18789 user@host
```

Then connect clients to `ws://127.0.0.1:18789` locally.

If gateway auth is configured, clients still must send auth (`token`/`password`) even over SSH tunnels.

See: [Remote Gateway](https://docs.openclaw.ai/gateway/remote), [Authentication](https://docs.openclaw.ai/gateway/authentication), [Tailscale](https://docs.openclaw.ai/gateway/tailscale).

## 

[​

](https://docs.openclaw.ai/gateway)

Supervision and service lifecycle

Use supervised runs for production-like reliability.

-   macOS (launchd)
    
-   Linux (systemd user)
    
-   Linux (system service)
    

Copy

```
openclaw gateway install
openclaw gateway status
openclaw gateway restart
openclaw gateway stop
```

LaunchAgent labels are `ai.openclaw.gateway` (default) or `ai.openclaw.<profile>` (named profile). `openclaw doctor` audits and repairs service config drift.

Copy

```
openclaw gateway install
systemctl --user enable --now openclaw-gateway[-<profile>].service
openclaw gateway status
```

For persistence after logout, enable lingering:

Copy

```
sudo loginctl enable-linger <user>
```

Use a system unit for multi-user/always-on hosts.

Copy

```
sudo systemctl daemon-reload
sudo systemctl enable --now openclaw-gateway[-<profile>].service
```

## 

[​

](https://docs.openclaw.ai/gateway)

Multiple gateways on one host

Most setups should run **one** Gateway. Use multiple only for strict isolation/redundancy (for example a rescue profile). Checklist per instance:

-   Unique `gateway.port`
-   Unique `OPENCLAW_CONFIG_PATH`
-   Unique `OPENCLAW_STATE_DIR`
-   Unique `agents.defaults.workspace`

Example:

Copy

```
OPENCLAW_CONFIG_PATH=~/.openclaw/a.json OPENCLAW_STATE_DIR=~/.openclaw-a openclaw gateway --port 19001
OPENCLAW_CONFIG_PATH=~/.openclaw/b.json OPENCLAW_STATE_DIR=~/.openclaw-b openclaw gateway --port 19002
```

See: [Multiple gateways](https://docs.openclaw.ai/gateway/multiple-gateways).

### 

[​

](https://docs.openclaw.ai/gateway)

Dev profile quick path

Copy

```
openclaw --dev setup
openclaw --dev gateway --allow-unconfigured
openclaw --dev status
```

Defaults include isolated state/config and base gateway port `19001`.

## 

[​

](https://docs.openclaw.ai/gateway)

Protocol quick reference (operator view)

-   First client frame must be `connect`.
-   Gateway returns `hello-ok` snapshot (`presence`, `health`, `stateVersion`, `uptimeMs`, limits/policy).
-   Requests: `req(method, params)` → `res(ok/payload|error)`.
-   Common events: `connect.challenge`, `agent`, `chat`, `presence`, `tick`, `health`, `heartbeat`, `shutdown`.

Agent runs are two-stage:

1.  Immediate accepted ack (`status:"accepted"`)
2.  Final completion response (`status:"ok"|"error"`), with streamed `agent` events in between.

See full protocol docs: [Gateway Protocol](https://docs.openclaw.ai/gateway/protocol).

## 

[​

](https://docs.openclaw.ai/gateway)

Operational checks

### 

[​

](https://docs.openclaw.ai/gateway)

Liveness

-   Open WS and send `connect`.
-   Expect `hello-ok` response with snapshot.

### 

[​

](https://docs.openclaw.ai/gateway)

Readiness

Copy

```
openclaw gateway status
openclaw channels status --probe
openclaw health
```

### 

[​

](https://docs.openclaw.ai/gateway)

Gap recovery

Events are not replayed. On sequence gaps, refresh state (`health`, `system-presence`) before continuing.

## 

[​

](https://docs.openclaw.ai/gateway)

Common failure signatures

| Signature | Likely issue |
| --- | --- |
| `refusing to bind gateway ... without auth` | Non-loopback bind without token/password |
| `another gateway instance is already listening` / `EADDRINUSE` | Port conflict |
| `Gateway start blocked: set gateway.mode=local` | Config set to remote mode |
| `unauthorized` during connect | Auth mismatch between client and gateway |

For full diagnosis ladders, use [Gateway Troubleshooting](https://docs.openclaw.ai/gateway/troubleshooting).

## 

[​

](https://docs.openclaw.ai/gateway)

Safety guarantees

-   Gateway protocol clients fail fast when Gateway is unavailable (no implicit direct-channel fallback).
-   Invalid/non-connect first frames are rejected and closed.
-   Graceful shutdown emits `shutdown` event before socket close.

* * *

Related:

-   [Troubleshooting](https://docs.openclaw.ai/gateway/troubleshooting)
-   [Background Process](https://docs.openclaw.ai/gateway/background-process)
-   [Configuration](https://docs.openclaw.ai/gateway/configuration)
-   [Health](https://docs.openclaw.ai/gateway/health)
-   [Doctor](https://docs.openclaw.ai/gateway/doctor)
-   [Authentication](https://docs.openclaw.ai/gateway/authentication)

[Configuration](https://docs.openclaw.ai/gateway/configuration)

⌘I
