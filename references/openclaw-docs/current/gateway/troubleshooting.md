<!-- Source: https://docs.openclaw.ai/gateway/troubleshooting -->
<!-- Title: Troubleshooting - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/troubleshooting)

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

-   [Gateway troubleshooting](https://docs.openclaw.ai/gateway/troubleshooting)
-   [Command ladder](https://docs.openclaw.ai/gateway/troubleshooting)
-   [Anthropic 429 extra usage required for long context](https://docs.openclaw.ai/gateway/troubleshooting)
-   [No replies](https://docs.openclaw.ai/gateway/troubleshooting)
-   [Dashboard control ui connectivity](https://docs.openclaw.ai/gateway/troubleshooting)
-   [Auth detail codes quick map](https://docs.openclaw.ai/gateway/troubleshooting)
-   [Gateway service not running](https://docs.openclaw.ai/gateway/troubleshooting)
-   [Channel connected messages not flowing](https://docs.openclaw.ai/gateway/troubleshooting)
-   [Cron and heartbeat delivery](https://docs.openclaw.ai/gateway/troubleshooting)
-   [Node paired tool fails](https://docs.openclaw.ai/gateway/troubleshooting)
-   [Browser tool fails](https://docs.openclaw.ai/gateway/troubleshooting)
-   [If you upgraded and something suddenly broke](https://docs.openclaw.ai/gateway/troubleshooting)
-   [1) Auth and URL override behavior changed](https://docs.openclaw.ai/gateway/troubleshooting)
-   [2) Bind and auth guardrails are stricter](https://docs.openclaw.ai/gateway/troubleshooting)
-   [3) Pairing and device identity state changed](https://docs.openclaw.ai/gateway/troubleshooting)

Configuration and operations

# Troubleshooting

# 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

Gateway troubleshooting

This page is the deep runbook. Start at [/help/troubleshooting](https://docs.openclaw.ai/help/troubleshooting) if you want the fast triage flow first.

## 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

Command ladder

Run these first, in this order:

Copy

```
openclaw status
openclaw gateway status
openclaw logs --follow
openclaw doctor
openclaw channels status --probe
```

Expected healthy signals:

-   `openclaw gateway status` shows `Runtime: running` and `RPC probe: ok`.
-   `openclaw doctor` reports no blocking config/service issues.
-   `openclaw channels status --probe` shows connected/ready channels.

## 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

Anthropic 429 extra usage required for long context

Use this when logs/errors include: `HTTP 429: rate_limit_error: Extra usage is required for long context requests`.

Copy

```
openclaw logs --follow
openclaw models status
openclaw config get agents.defaults.models
```

Look for:

-   Selected Anthropic Opus/Sonnet model has `params.context1m: true`.
-   Current Anthropic credential is not eligible for long-context usage.
-   Requests fail only on long sessions/model runs that need the 1M beta path.

Fix options:

1.  Disable `context1m` for that model to fall back to the normal context window.
2.  Use an Anthropic API key with billing, or enable Anthropic Extra Usage on the subscription account.
3.  Configure fallback models so runs continue when Anthropic long-context requests are rejected.

Related:

-   [/providers/anthropic](https://docs.openclaw.ai/providers/anthropic)
-   [/reference/token-use](https://docs.openclaw.ai/reference/token-use)
-   [/help/faq#why-am-i-seeing-http-429-ratelimiterror-from-anthropic](https://docs.openclaw.ai/help/faq)

## 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

No replies

If channels are up but nothing answers, check routing and policy before reconnecting anything.

Copy

```
openclaw status
openclaw channels status --probe
openclaw pairing list --channel <channel> [--account <id>]
openclaw config get channels
openclaw logs --follow
```

Look for:

-   Pairing pending for DM senders.
-   Group mention gating (`requireMention`, `mentionPatterns`).
-   Channel/group allowlist mismatches.

Common signatures:

-   `drop guild message (mention required` → group message ignored until mention.
-   `pairing request` → sender needs approval.
-   `blocked` / `allowlist` → sender/channel was filtered by policy.

Related:

-   [/channels/troubleshooting](https://docs.openclaw.ai/channels/troubleshooting)
-   [/channels/pairing](https://docs.openclaw.ai/channels/pairing)
-   [/channels/groups](https://docs.openclaw.ai/channels/groups)

## 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

Dashboard control ui connectivity

When dashboard/control UI will not connect, validate URL, auth mode, and secure context assumptions.

Copy

```
openclaw gateway status
openclaw status
openclaw logs --follow
openclaw doctor
openclaw gateway status --json
```

Look for:

-   Correct probe URL and dashboard URL.
-   Auth mode/token mismatch between client and gateway.
-   HTTP usage where device identity is required.

Common signatures:

-   `device identity required` → non-secure context or missing device auth.
-   `device nonce required` / `device nonce mismatch` → client is not completing the challenge-based device auth flow (`connect.challenge` + `device.nonce`).
-   `device signature invalid` / `device signature expired` → client signed the wrong payload (or stale timestamp) for the current handshake.
-   `AUTH_TOKEN_MISMATCH` with `canRetryWithDeviceToken=true` → client can do one trusted retry with cached device token.
-   repeated `unauthorized` after that retry → shared token/device token drift; refresh token config and re-approve/rotate device token if needed.
-   `gateway connect failed:` → wrong host/port/url target.

### 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

Auth detail codes quick map

Use `error.details.code` from the failed `connect` response to pick the next action:

| Detail code | Meaning | Recommended action |
| --- | --- | --- |
| `AUTH_TOKEN_MISSING` | Client did not send a required shared token. | Paste/set token in the client and retry. For dashboard paths: `openclaw config get gateway.auth.token` then paste into Control UI settings. |
| `AUTH_TOKEN_MISMATCH` | Shared token did not match gateway auth token. | If `canRetryWithDeviceToken=true`, allow one trusted retry. If still failing, run the [token drift recovery checklist](https://docs.openclaw.ai/cli/devices). |
| `AUTH_DEVICE_TOKEN_MISMATCH` | Cached per-device token is stale or revoked. | Rotate/re-approve device token using [devices CLI](https://docs.openclaw.ai/cli/devices), then reconnect. |
| `PAIRING_REQUIRED` | Device identity is known but not approved for this role. | Approve pending request: `openclaw devices list` then `openclaw devices approve <requestId>`. |

Device auth v2 migration check:

Copy

```
openclaw --version
openclaw doctor
openclaw gateway status
```

If logs show nonce/signature errors, update the connecting client and verify it:

1.  waits for `connect.challenge`
2.  signs the challenge-bound payload
3.  sends `connect.params.device.nonce` with the same challenge nonce

Related:

-   [/web/control-ui](https://docs.openclaw.ai/web/control-ui)
-   [/gateway/authentication](https://docs.openclaw.ai/gateway/authentication)
-   [/gateway/remote](https://docs.openclaw.ai/gateway/remote)
-   [/cli/devices](https://docs.openclaw.ai/cli/devices)

## 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

Gateway service not running

Use this when service is installed but process does not stay up.

Copy

```
openclaw gateway status
openclaw status
openclaw logs --follow
openclaw doctor
openclaw gateway status --deep
```

Look for:

-   `Runtime: stopped` with exit hints.
-   Service config mismatch (`Config (cli)` vs `Config (service)`).
-   Port/listener conflicts.

Common signatures:

-   `Gateway start blocked: set gateway.mode=local` → local gateway mode is not enabled. Fix: set `gateway.mode="local"` in your config (or run `openclaw configure`). If you are running OpenClaw via Podman using the dedicated `openclaw` user, the config lives at `~openclaw/.openclaw/openclaw.json`.
-   `refusing to bind gateway ... without auth` → non-loopback bind without token/password.
-   `another gateway instance is already listening` / `EADDRINUSE` → port conflict.

Related:

-   [/gateway/background-process](https://docs.openclaw.ai/gateway/background-process)
-   [/gateway/configuration](https://docs.openclaw.ai/gateway/configuration)
-   [/gateway/doctor](https://docs.openclaw.ai/gateway/doctor)

## 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

Channel connected messages not flowing

If channel state is connected but message flow is dead, focus on policy, permissions, and channel specific delivery rules.

Copy

```
openclaw channels status --probe
openclaw pairing list --channel <channel> [--account <id>]
openclaw status --deep
openclaw logs --follow
openclaw config get channels
```

Look for:

-   DM policy (`pairing`, `allowlist`, `open`, `disabled`).
-   Group allowlist and mention requirements.
-   Missing channel API permissions/scopes.

Common signatures:

-   `mention required` → message ignored by group mention policy.
-   `pairing` / pending approval traces → sender is not approved.
-   `missing_scope`, `not_in_channel`, `Forbidden`, `401/403` → channel auth/permissions issue.

Related:

-   [/channels/troubleshooting](https://docs.openclaw.ai/channels/troubleshooting)
-   [/channels/whatsapp](https://docs.openclaw.ai/channels/whatsapp)
-   [/channels/telegram](https://docs.openclaw.ai/channels/telegram)
-   [/channels/discord](https://docs.openclaw.ai/channels/discord)

## 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

Cron and heartbeat delivery

If cron or heartbeat did not run or did not deliver, verify scheduler state first, then delivery target.

Copy

```
openclaw cron status
openclaw cron list
openclaw cron runs --id <jobId> --limit 20
openclaw system heartbeat last
openclaw logs --follow
```

Look for:

-   Cron enabled and next wake present.
-   Job run history status (`ok`, `skipped`, `error`).
-   Heartbeat skip reasons (`quiet-hours`, `requests-in-flight`, `alerts-disabled`).

Common signatures:

-   `cron: scheduler disabled; jobs will not run automatically` → cron disabled.
-   `cron: timer tick failed` → scheduler tick failed; check file/log/runtime errors.
-   `heartbeat skipped` with `reason=quiet-hours` → outside active hours window.
-   `heartbeat: unknown accountId` → invalid account id for heartbeat delivery target.
-   `heartbeat skipped` with `reason=dm-blocked` → heartbeat target resolved to a DM-style destination while `agents.defaults.heartbeat.directPolicy` (or per-agent override) is set to `block`.

Related:

-   [/automation/troubleshooting](https://docs.openclaw.ai/automation/troubleshooting)
-   [/automation/cron-jobs](https://docs.openclaw.ai/automation/cron-jobs)
-   [/gateway/heartbeat](https://docs.openclaw.ai/gateway/heartbeat)

## 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

Node paired tool fails

If a node is paired but tools fail, isolate foreground, permission, and approval state.

Copy

```
openclaw nodes status
openclaw nodes describe --node <idOrNameOrIp>
openclaw approvals get --node <idOrNameOrIp>
openclaw logs --follow
openclaw status
```

Look for:

-   Node online with expected capabilities.
-   OS permission grants for camera/mic/location/screen.
-   Exec approvals and allowlist state.

Common signatures:

-   `NODE_BACKGROUND_UNAVAILABLE` → node app must be in foreground.
-   `*_PERMISSION_REQUIRED` / `LOCATION_PERMISSION_REQUIRED` → missing OS permission.
-   `SYSTEM_RUN_DENIED: approval required` → exec approval pending.
-   `SYSTEM_RUN_DENIED: allowlist miss` → command blocked by allowlist.

Related:

-   [/nodes/troubleshooting](https://docs.openclaw.ai/nodes/troubleshooting)
-   [/nodes/index](https://docs.openclaw.ai/nodes/index)
-   [/tools/exec-approvals](https://docs.openclaw.ai/tools/exec-approvals)

## 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

Browser tool fails

Use this when browser tool actions fail even though the gateway itself is healthy.

Copy

```
openclaw browser status
openclaw browser start --browser-profile openclaw
openclaw browser profiles
openclaw logs --follow
openclaw doctor
```

Look for:

-   Valid browser executable path.
-   CDP profile reachability.
-   Local Chrome availability for `existing-session` / `user` profiles.

Common signatures:

-   `Failed to start Chrome CDP on port` → browser process failed to launch.
-   `browser.executablePath not found` → configured path is invalid.
-   `No Chrome tabs found for profile="user"` → the Chrome MCP attach profile has no open local Chrome tabs.
-   `Browser attachOnly is enabled ... not reachable` → attach-only profile has no reachable target.

Related:

-   [/tools/browser-linux-troubleshooting](https://docs.openclaw.ai/tools/browser-linux-troubleshooting)
-   [/tools/browser](https://docs.openclaw.ai/tools/browser)

## 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

If you upgraded and something suddenly broke

Most post-upgrade breakage is config drift or stricter defaults now being enforced.

### 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

1) Auth and URL override behavior changed

Copy

```
openclaw gateway status
openclaw config get gateway.mode
openclaw config get gateway.remote.url
openclaw config get gateway.auth.mode
```

What to check:

-   If `gateway.mode=remote`, CLI calls may be targeting remote while your local service is fine.
-   Explicit `--url` calls do not fall back to stored credentials.

Common signatures:

-   `gateway connect failed:` → wrong URL target.
-   `unauthorized` → endpoint reachable but wrong auth.

### 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

2) Bind and auth guardrails are stricter

Copy

```
openclaw config get gateway.bind
openclaw config get gateway.auth.token
openclaw gateway status
openclaw logs --follow
```

What to check:

-   Non-loopback binds (`lan`, `tailnet`, `custom`) need auth configured.
-   Old keys like `gateway.token` do not replace `gateway.auth.token`.

Common signatures:

-   `refusing to bind gateway ... without auth` → bind+auth mismatch.
-   `RPC probe: failed` while runtime is running → gateway alive but inaccessible with current auth/url.

### 

[​

](https://docs.openclaw.ai/gateway/troubleshooting)

3) Pairing and device identity state changed

Copy

```
openclaw devices list
openclaw pairing list --channel <channel> [--account <id>]
openclaw logs --follow
openclaw doctor
```

What to check:

-   Pending device approvals for dashboard/nodes.
-   Pending DM pairing approvals after policy or identity changes.

Common signatures:

-   `device identity required` → device auth not satisfied.
-   `pairing required` → sender/device must be approved.

If the service config and runtime still disagree after checks, reinstall service metadata from the same profile/state directory:

Copy

```
openclaw gateway install --force
openclaw gateway restart
```

Related:

-   [/gateway/pairing](https://docs.openclaw.ai/gateway/pairing)
-   [/gateway/authentication](https://docs.openclaw.ai/gateway/authentication)
-   [/gateway/background-process](https://docs.openclaw.ai/gateway/background-process)

[Multiple Gateways](https://docs.openclaw.ai/gateway/multiple-gateways)[Security](https://docs.openclaw.ai/gateway/security)

⌘I
