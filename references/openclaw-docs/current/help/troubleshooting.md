<!-- Source: https://docs.openclaw.ai/help/troubleshooting -->
<!-- Title: Troubleshooting - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/help/troubleshooting)

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

-   [Troubleshooting](https://docs.openclaw.ai/help/troubleshooting)
-   [First 60 seconds](https://docs.openclaw.ai/help/troubleshooting)
-   [Anthropic long context 429](https://docs.openclaw.ai/help/troubleshooting)
-   [Plugin install fails with missing openclaw extensions](https://docs.openclaw.ai/help/troubleshooting)
-   [Decision tree](https://docs.openclaw.ai/help/troubleshooting)

Help

# Troubleshooting

# 

[​

](https://docs.openclaw.ai/help/troubleshooting)

Troubleshooting

If you only have 2 minutes, use this page as a triage front door.

## 

[​

](https://docs.openclaw.ai/help/troubleshooting)

First 60 seconds

Run this exact ladder in order:

Copy

```
openclaw status
openclaw status --all
openclaw gateway probe
openclaw gateway status
openclaw doctor
openclaw channels status --probe
openclaw logs --follow
```

Good output in one line:

-   `openclaw status` → shows configured channels and no obvious auth errors.
-   `openclaw status --all` → full report is present and shareable.
-   `openclaw gateway probe` → expected gateway target is reachable (`Reachable: yes`). `RPC: limited - missing scope: operator.read` is degraded diagnostics, not a connect failure.
-   `openclaw gateway status` → `Runtime: running` and `RPC probe: ok`.
-   `openclaw doctor` → no blocking config/service errors.
-   `openclaw channels status --probe` → channels report `connected` or `ready`.
-   `openclaw logs --follow` → steady activity, no repeating fatal errors.

## 

[​

](https://docs.openclaw.ai/help/troubleshooting)

Anthropic long context 429

If you see: `HTTP 429: rate_limit_error: Extra usage is required for long context requests`, go to [/gateway/troubleshooting#anthropic-429-extra-usage-required-for-long-context](https://docs.openclaw.ai/gateway/troubleshooting).

## 

[​

](https://docs.openclaw.ai/help/troubleshooting)

Plugin install fails with missing openclaw extensions

If install fails with `package.json missing openclaw.extensions`, the plugin package is using an old shape that OpenClaw no longer accepts. Fix in the plugin package:

1.  Add `openclaw.extensions` to `package.json`.
2.  Point entries at built runtime files (usually `./dist/index.js`).
3.  Republish the plugin and run `openclaw plugins install <npm-spec>` again.

Example:

Copy

```
{
  "name": "@openclaw/my-plugin",
  "version": "1.2.3",
  "openclaw": {
    "extensions": ["./dist/index.js"]
  }
}
```

Reference: [/tools/plugin#distribution-npm](https://docs.openclaw.ai/tools/plugin)

## 

[​

](https://docs.openclaw.ai/help/troubleshooting)

Decision tree

No replies

Copy

```
openclaw status
openclaw gateway status
openclaw channels status --probe
openclaw pairing list --channel <channel> [--account <id>]
openclaw logs --follow
```

Good output looks like:

-   `Runtime: running`
-   `RPC probe: ok`
-   Your channel shows connected/ready in `channels status --probe`
-   Sender appears approved (or DM policy is open/allowlist)

Common log signatures:

-   `drop guild message (mention required` → mention gating blocked the message in Discord.
-   `pairing request` → sender is unapproved and waiting for DM pairing approval.
-   `blocked` / `allowlist` in channel logs → sender, room, or group is filtered.

Deep pages:

-   [/gateway/troubleshooting#no-replies](https://docs.openclaw.ai/gateway/troubleshooting)
-   [/channels/troubleshooting](https://docs.openclaw.ai/channels/troubleshooting)
-   [/channels/pairing](https://docs.openclaw.ai/channels/pairing)

Dashboard or Control UI will not connect

Copy

```
openclaw status
openclaw gateway status
openclaw logs --follow
openclaw doctor
openclaw channels status --probe
```

Good output looks like:

-   `Dashboard: http://...` is shown in `openclaw gateway status`
-   `RPC probe: ok`
-   No auth loop in logs

Common log signatures:

-   `device identity required` → HTTP/non-secure context cannot complete device auth.
-   `AUTH_TOKEN_MISMATCH` with retry hints (`canRetryWithDeviceToken=true`) → one trusted device-token retry may occur automatically.
-   repeated `unauthorized` after that retry → wrong token/password, auth mode mismatch, or stale paired device token.
-   `gateway connect failed:` → UI is targeting the wrong URL/port or unreachable gateway.

Deep pages:

-   [/gateway/troubleshooting#dashboard-control-ui-connectivity](https://docs.openclaw.ai/gateway/troubleshooting)
-   [/web/control-ui](https://docs.openclaw.ai/web/control-ui)
-   [/gateway/authentication](https://docs.openclaw.ai/gateway/authentication)

Gateway will not start or service installed but not running

Copy

```
openclaw status
openclaw gateway status
openclaw logs --follow
openclaw doctor
openclaw channels status --probe
```

Good output looks like:

-   `Service: ... (loaded)`
-   `Runtime: running`
-   `RPC probe: ok`

Common log signatures:

-   `Gateway start blocked: set gateway.mode=local` → gateway mode is unset/remote.
-   `refusing to bind gateway ... without auth` → non-loopback bind without token/password.
-   `another gateway instance is already listening` or `EADDRINUSE` → port already taken.

Deep pages:

-   [/gateway/troubleshooting#gateway-service-not-running](https://docs.openclaw.ai/gateway/troubleshooting)
-   [/gateway/background-process](https://docs.openclaw.ai/gateway/background-process)
-   [/gateway/configuration](https://docs.openclaw.ai/gateway/configuration)

Channel connects but messages do not flow

Copy

```
openclaw status
openclaw gateway status
openclaw logs --follow
openclaw doctor
openclaw channels status --probe
```

Good output looks like:

-   Channel transport is connected.
-   Pairing/allowlist checks pass.
-   Mentions are detected where required.

Common log signatures:

-   `mention required` → group mention gating blocked processing.
-   `pairing` / `pending` → DM sender is not approved yet.
-   `not_in_channel`, `missing_scope`, `Forbidden`, `401/403` → channel permission token issue.

Deep pages:

-   [/gateway/troubleshooting#channel-connected-messages-not-flowing](https://docs.openclaw.ai/gateway/troubleshooting)
-   [/channels/troubleshooting](https://docs.openclaw.ai/channels/troubleshooting)

Cron or heartbeat did not fire or did not deliver

Copy

```
openclaw status
openclaw gateway status
openclaw cron status
openclaw cron list
openclaw cron runs --id <jobId> --limit 20
openclaw logs --follow
```

Good output looks like:

-   `cron.status` shows enabled with a next wake.
-   `cron runs` shows recent `ok` entries.
-   Heartbeat is enabled and not outside active hours.

Common log signatures:

-   `cron: scheduler disabled; jobs will not run automatically` → cron is disabled.
-   `heartbeat skipped` with `reason=quiet-hours` → outside configured active hours.
-   `requests-in-flight` → main lane busy; heartbeat wake was deferred.
-   `unknown accountId` → heartbeat delivery target account does not exist.

Deep pages:

-   [/gateway/troubleshooting#cron-and-heartbeat-delivery](https://docs.openclaw.ai/gateway/troubleshooting)
-   [/automation/troubleshooting](https://docs.openclaw.ai/automation/troubleshooting)
-   [/gateway/heartbeat](https://docs.openclaw.ai/gateway/heartbeat)

Node is paired but tool fails camera canvas screen exec

Copy

```
openclaw status
openclaw gateway status
openclaw nodes status
openclaw nodes describe --node <idOrNameOrIp>
openclaw logs --follow
```

Good output looks like:

-   Node is listed as connected and paired for role `node`.
-   Capability exists for the command you are invoking.
-   Permission state is granted for the tool.

Common log signatures:

-   `NODE_BACKGROUND_UNAVAILABLE` → bring node app to foreground.
-   `*_PERMISSION_REQUIRED` → OS permission was denied/missing.
-   `SYSTEM_RUN_DENIED: approval required` → exec approval is pending.
-   `SYSTEM_RUN_DENIED: allowlist miss` → command not on exec allowlist.

Deep pages:

-   [/gateway/troubleshooting#node-paired-tool-fails](https://docs.openclaw.ai/gateway/troubleshooting)
-   [/nodes/troubleshooting](https://docs.openclaw.ai/nodes/troubleshooting)
-   [/tools/exec-approvals](https://docs.openclaw.ai/tools/exec-approvals)

Browser tool fails

Copy

```
openclaw status
openclaw gateway status
openclaw browser status
openclaw logs --follow
openclaw doctor
```

Good output looks like:

-   Browser status shows `running: true` and a chosen browser/profile.
-   `openclaw` starts, or `user` can see local Chrome tabs.

Common log signatures:

-   `Failed to start Chrome CDP on port` → local browser launch failed.
-   `browser.executablePath not found` → configured binary path is wrong.
-   `No Chrome tabs found for profile="user"` → the Chrome MCP attach profile has no open local Chrome tabs.
-   `Browser attachOnly is enabled ... not reachable` → attach-only profile has no live CDP target.

Deep pages:

-   [/gateway/troubleshooting#browser-tool-fails](https://docs.openclaw.ai/gateway/troubleshooting)
-   [/tools/browser-linux-troubleshooting](https://docs.openclaw.ai/tools/browser-linux-troubleshooting)
-   [/tools/browser-wsl2-windows-remote-cdp-troubleshooting](https://docs.openclaw.ai/tools/browser-wsl2-windows-remote-cdp-troubleshooting)

[Help](https://docs.openclaw.ai/help)[FAQ](https://docs.openclaw.ai/help/faq)

⌘I
