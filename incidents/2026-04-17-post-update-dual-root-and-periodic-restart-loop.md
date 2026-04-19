# 2026-04-17 — Post-update dual-root drift and periodic restart loop

## Summary

After an OpenClaw update, the environment degraded because two different install roots were live at the same time.
A separate periodic sync service also restarted the gateway whenever auth files changed, turning recovery into a repeating restart loop.

## User-visible symptom

- `gateway status` alternated between healthy and failed windows
- the service repeatedly stopped and started
- Telegram health could recover briefly and then disappear again

## What was proved

### 1. CLI path and service path disagreed

One shell entrypoint resolved to one OpenClaw build, while the running service still pointed at another install root.
This created version and entrypoint drift.

### 2. A periodic helper was a real restart source

A scheduled auth-sync or housekeeping unit restarted the gateway whenever local auth state changed.
That meant not every restart came from the watchdog or the gateway itself.

### 3. The secondary restart source amplified watchdog noise

Once the helper restarted the gateway frequently, watchdog probes observed transient unhealthy windows and converted them into more restart churn.

## Correct recovery

1. recanonicalize the environment to one live install root
2. align shell CLI path, canonical binary path, and service entrypoint
3. remove automatic gateway restart from periodic sync tasks unless that restart is truly required
4. re-enable watchdog logic only after the independent restart source is removed
5. if a watchdog probes via CLI, measure real healthy probe latency and set a timeout that matches reality

## Validation

Require all of these:
- CLI version and service entrypoint now agree on one root
- canonical service path is stable
- periodic sync runs no longer restart the gateway
- watchdog logs show healthy cycles rather than threshold restarts
- a real end-to-end probe succeeds

## Operational lesson

For post-update incidents:
- compare every active OpenClaw root separately
- do not stop at `openclaw --version`
- treat periodic auth or sync timers as potential independent restart sources
- do not trust short watchdog probe timeouts until they are measured on a healthy host
