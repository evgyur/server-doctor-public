# OpenClaw Update Workflow

Use this reference for any `openclaw update`, reinstall, package refresh, or runtime replacement.

## Goal
Update the intended OpenClaw runtime without losing transport health, auth continuity, correct targeting, or private environment hygiene.

## Non-negotiable rule
Do not call an OpenClaw update successful until post-update verification is complete.

Treat an update as a workflow, not a single command:

1. confirm target
2. capture pre-update evidence
3. run the smallest intended update
4. verify installed version
5. verify the running runtime
6. run host-specific post-update checks
7. run a real end-to-end probe
8. document any reusable new failure pattern

## Pre-update checklist
1. confirm the canonical target:
   - host
   - runtime owner
   - service manager
   - working directory or state directory
   - live gateway port if relevant
2. capture pre-update evidence:
   - `openclaw --version`
   - `openclaw gateway status`
   - active service status
   - recent gateway logs
   - one real end-to-end Telegram or operator-facing probe when possible
3. identify rollback or safe-stop path:
   - package rollback
   - pinned version reinstall
   - service-unit or LaunchAgent restore
   - host-local compatibility patch re-apply if that is part of the known environment

## Update execution
Perform the smallest intended update only.

Examples:
- `openclaw update`
- package manager refresh followed by service restart
- reinstall of the current OpenClaw package

Do not combine unrelated config cleanup with the update unless the drift is proven relevant.

## Post-update verification
Verify all of these before declaring success:
1. installed version is the intended one
2. canonical runtime restarted cleanly
3. expected port or socket is owned by the intended runtime
4. shell CLI, service entrypoint, and live PID command line all point at the intended install root
5. logs do not show immediate transport, auth, or plugin regressions
6. no external restart automation is causing fresh restart churn
7. a real end-to-end probe succeeds

If the update is run with `--no-restart` on a global npm install, the old live
gateway can briefly import from the newly swapped package tree. Doctor or health
checks may then show transient `ERR_MODULE_NOT_FOUND` / missing-bundle warnings
until the controlled gateway restart completes. Treat that as a pre-restart
state only; it is not acceptable final evidence. Restart the canonical gateway
and require clean post-restart health plus an end-to-end probe.

## Common post-update regressions to check
- Telegram transport regression
- wrapper or startup-path drift on macOS LaunchAgent installs
- duplicated or leaked environment variables
- auth-profile drift across agents
- stale session model override
- duplicate runtime polling the same bot token
- gateway CLI talking to the wrong port
- shell `openclaw` resolving to a stale install while the service runs a newer build, or the reverse
- external watchdog/timer/path units restarting the gateway independently of the product runtime
- local extension hotpatches dropped by plugin reinstall or extension refresh
- deployed plugin copy patched while the maintained source tree stays stale, or vice versa
- chat/group binding drift after config rewrite or migration
- product-native health/watchdog signals confused with separate host-local restart automation
- local hooks that synchronously call back into the same gateway through `openclaw infer --gateway`

## macOS-specific checks
After updates on LaunchAgent installs, inspect:
- `ProgramArguments`
- `EnvironmentVariables`
- live launchd proxy environment
- `openclaw status --deep`

Do not trust only `gateway status` when Telegram can be degraded independently.

## Gateway CPU after hook or plugin changes

After an update, distinguish current CPU from lifetime averages. `ps %cpu` can
stay high after a short loop has ended because it averages over the process
lifetime. Use a current thread-level view before declaring the gateway hot:

```bash
top -H -p "$(systemctl --user show -p MainPID --value openclaw-gateway.service)"
```

If current gateway CPU stays near one core and logs point at local hook or
plugin work, check whether a hook is synchronously calling back into the same
gateway:

```bash
journalctl --user -u openclaw-gateway --since '10 minutes ago' --no-pager | \
  grep -E 'nativeHook.invoke|openclaw-infer|liveness warning|hook'
ps -eo pid,ppid,etime,%cpu,%mem,rss,cmd | \
  grep -E 'openclaw-infer|openclaw.*gateway|python.*hook|node.*hook' | grep -v grep
```

Avoid running `openclaw infer ... --gateway` synchronously from a gateway hook.
For message preprocessing hooks, prefer local deterministic extraction by
default and gate LLM extraction behind an explicit environment flag. If LLM
extraction is required, move it to an asynchronous worker or a separate runtime
lane so the gateway hook does not recursively depend on the same gateway event
loop it is blocking.

## Completion language
Allowed:
- `update applied and post-update verification passed`
- `runtime restarted and Telegram probe succeeded`

Not enough on its own:
- `update finished`
- `service restarted`
- `package upgraded`

## Group/chat routing guard after updates

If a Telegram group or channel must always route to a dedicated agent/skill, treat that binding as a post-update invariant.

Public-safe invariant shape:

- the dedicated agent exists
- the agent includes the intended skill
- the channel binding maps the exact peer to that agent
- the peer config keeps only a short routing guard in its system prompt
- detailed workflow rules live in the skill itself, not duplicated in the chat prompt

Why this matters:

- config migrations and doctor repairs can preserve the process while silently losing a binding
- copying long workflow rules into a group prompt creates drift when the canonical skill changes
- a healthy gateway can still answer through the wrong generic agent

Validation pattern:

```bash
python3 ./scripts/ensure-telegram-group-agent-binding.py \
  --config ~/.openclaw/openclaw.json \
  --chat-id '<telegram-group-id>' \
  --agent-id '<agent-id>' \
  --skill-id '<skill-id>' \
  --agent-name '<display-name>' \
  --agent-workspace '<workspace-path>' \
  --skill-source '<canonical-skill-path>' \
  --dry-run
```

After applying a changed binding, restart or reload through the canonical service manager and send a real message in the affected group. Confirm it lands in the dedicated agent session, not a default or generic agent.

## Built-in health versus host-local watchdogs

Do not conflate product-native health monitoring with separate host-local restart automation.

Healthy post-update evidence can include product-native checks such as:

```bash
openclaw status --deep
openclaw health --json
openclaw logs --plain | grep -E 'health-monitor|probe|Telegram OK'
```

But extra host-local watchdogs, timers, path units, or auth-sync jobs that restart the gateway can become a second supervisor layer. If the gateway restarts repeatedly after an update, first identify the restart source before changing transport, auth, or model config.

## If a new failure pattern appears
- capture evidence
- add the reusable lesson to the appropriate runbook or incident note
- do not leave the lesson only in chat history
