# OpenClaw Update Workflow

Use this reference for any `openclaw update`, reinstall, package refresh, or runtime replacement.

## Goal
Update the intended OpenClaw runtime without losing transport health, auth continuity, or correct targeting.

## Non-negotiable rule
Do not call an OpenClaw update successful until post-update verification is complete.

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
4. logs do not show immediate transport, auth, or plugin regressions
5. a real end-to-end probe succeeds

## Common post-update regressions to check
- Telegram transport regression
- wrapper or startup-path drift on macOS LaunchAgent installs
- duplicated or leaked environment variables
- auth-profile drift across agents
- stale session model override
- duplicate runtime polling the same bot token
- gateway CLI talking to the wrong port

## macOS-specific checks
After updates on LaunchAgent installs, inspect:
- `ProgramArguments`
- `EnvironmentVariables`
- live launchd proxy environment
- `openclaw status --deep`

Do not trust only `gateway status` when Telegram can be degraded independently.

## Completion language
Allowed:
- `update applied and post-update verification passed`
- `runtime restarted and Telegram probe succeeded`

Not enough on its own:
- `update finished`
- `service restarted`
- `package upgraded`

## If a new failure pattern appears
- capture evidence
- add the reusable lesson to the appropriate runbook or incident note
- do not leave the lesson only in chat history
