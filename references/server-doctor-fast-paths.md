# Server Doctor Fast Paths

Use this reference after the root `SKILL.md` has selected the `server-doctor` route and before opening large environment-specific runbooks.

Always choose one doctrine anchor first, before piling on platform- or host-specific notes.

## Simple host health check

If the user asks for a simple host health check:

1. Build or confirm the access map from `SKILL.md`.
2. Read `references/routine-admin.md`.
3. Mark the map state as `mapped`, `partial map`, or `unreachable`.
4. Run the low-risk first-check baseline.
5. Only then go deeper into service-specific diagnostics.

Minimum first-check evidence:

```bash
hostname
whoami
uname -a
uptime
df -h
free -h 2>/dev/null || true
ps -eo user,pid,ppid,cmd --sort=user 2>/dev/null | head -80
```

On macOS, use `sw_vers`, `launchctl list`, and `ps aux` instead of Linux-only probes.

## OpenClaw incident

If the user asks about an OpenClaw issue:

1. Read `references/health-claims-and-evidence.md`.
2. Read `references/outage-classification.md`.
3. Read `references/openclaw-incident-response.md`.
4. If the issue started during or after an update, also read `references/openclaw-update-workflow.md`.
5. Verify the target host/runtime/source of truth before making outage claims.
6. Require both runtime evidence and an end-to-end user-visible probe before claiming recovery.
7. Update the relevant public-safe reference if the incident produced a reusable lesson.

## OpenClaw update

If the user asks to update OpenClaw:

1. Read `references/openclaw-update-workflow.md` first.
2. Capture pre-update evidence.
3. Confirm the active checkout/package/runtime owner.
4. Perform the update through the documented workflow.
5. Verify installed version and running runtime both switched as intended.
6. Run post-update checks.
7. Validate with a real end-to-end probe before claiming success.

Do not call an update successful just because the package command exited 0.

## Telegram-facing automation

If the issue is Telegram delivery, routing, or silence:

1. Confirm the exact bot/account/channel/topic target without exposing tokens.
2. Separate “runtime is alive” from “message delivery is proven”.
3. Inspect webhook/polling ownership and port conflicts before restart loops.
4. Check whether the bot is allowed to send/read in the target chat.
5. Use a fetch-back or user-visible probe when possible.
6. Report the proof target and message/probe result, not just logs.

## Slow or stuck agent sessions

If the issue is latency, stalled sessions, or runaway context:

1. Capture the session/run id, timestamps, and first stuck log line.
2. Check whether the problem is global or isolated to one session/agent.
3. Prefer resetting only the affected session over restarting the whole gateway.
4. Check for prompt/context bloat, failing compaction, noisy hooks, and runaway cron/log ingestion.
5. Verify with a fresh short request after mitigation.

## Multi-tenant host caution

On hosts with several bots/users/services:

- identify the Unix owner, working directory, unit name, and port owner before changing anything;
- do not deduplicate services that merely look similar unless they share the same configured token/state;
- avoid broad restarts when a user-specific process or session reset is enough.

## Operator policy notes

- Do not assume a permissive group or execution setting is a defect; some operators intentionally accept higher risk for a private automation lane.
- If the operator confirms a policy is intentional, record it as policy and focus on runtime behavior rather than style policing.
- If a policy weakens safety in a public or shared environment, call out the risk and propose a safer default.
