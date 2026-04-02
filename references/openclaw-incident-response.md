# OpenClaw Incident Response

Use this reference when a Telegram bot is slow, unresponsive, partially working, or failing after startup.

Before making strong health, outage, or recovery claims, also read:

- `references/health-claims-and-evidence.md`
- `references/outage-classification.md`

## Claim discipline

- separate spec correctness from ops quality
- confirm the canonical runtime target before strong health wording:
  - host
  - owner
  - unit, launch agent, container, or process tree
  - runtime directory or state directory
  - live port, socket, or endpoint
- treat permission-limited visibility as `visibility-limited` or `unknown`, not outage proof
- direct live probes and canonical runtime health beat stale legacy checks unless a stronger contradiction appears
- restart alone is not recovery; require post-action proof

## Symptom buckets

### 1. Process is down

Only use this bucket after the canonical target is confirmed.

Checks:

```bash
ps aux | grep -Ei 'openclaw|gateway' | grep -v grep
systemctl status <service> --no-pager
launchctl list | grep -Ei 'openclaw|gateway'
```

Likely causes:

- crashed process
- failed boot dependency
- broken service definition
- missing environment after reboot

### 2. Process is up, but Telegram does not respond

Checks:

```bash
journalctl -u <service> -n 200 --no-pager
tail -n 200 <logfile>
```

Look for:

- authentication failures
- Telegram delivery errors
- network timeouts
- upstream model failures
- stale sockets
- queue backlog

### 3. Bot replies slowly

Look for:

- provider latency
- repeated retries
- model failover loops
- blocked dependencies
- CPU or memory pressure
- container restarts

### 4. Some features work, others fail

This often indicates a dependency problem rather than a gateway problem.

Check:

- local HTTP dependencies
- helper bots
- sidecar APIs
- databases
- browser-control endpoints
- cron or scheduler jobs

## Recovery order

1. Capture recent logs.
2. Confirm the dependency graph.
3. Restart the smallest failing component first.
4. Verify the gateway only after dependencies are healthy.
5. Re-test with a known-safe command.

Do not call recovery confirmed until a post-action live probe succeeds on the canonical path.

## Concrete scenarios

### 5. Stale session model override

#### Symptoms

- global config already points at the desired model
- one chat or one Telegram lane still behaves as if it uses an older or unsupported model
- some sessions fail while others on the same host work

#### Why this happens

OpenClaw can keep per-session model state even after the main config was corrected. Fixing the default model does not always clear an older session override.

#### Checks

```bash
rg -n '"modelOverride"|"model"' ~/.openclaw/agents/*/sessions/sessions.json
rg -n 'unsupported|unknown model|fallback' ~/.openclaw/logs /tmp/openclaw 2>/dev/null
```

#### Recovery

- identify which session still carries the old override
- clear or replace that override with a supported model
- restart the gateway only if the runtime does not pick up the state change cleanly
- if the main defaults are wrong as well, normalize them first with a targeted config edit or a helper such as `scripts/normalize-openclaw-models.py`

#### Validation

- the affected session no longer reports the stale model
- a fresh control prompt in the same chat uses the intended model without fallback

### 6. Per-agent auth-profile drift

#### Symptoms

- Telegram shows one model as selected, but runtime falls back to another provider
- one agent still works while another agent on the same host falls back or reports expired auth
- failures cluster by agent rather than by whole host

#### Why this happens

Some OpenClaw installs keep auth state separately per agent under `~/.openclaw/agents/*/agent/auth-profiles.json`. One agent can refresh OAuth successfully while another keeps an older token set and enters cooldown.

#### Checks

```bash
find ~/.openclaw/agents -path '*/agent/auth-profiles.json' -print
rg -n 'expired|fallback|auth' ~/.openclaw/logs /tmp/openclaw 2>/dev/null
```

Manually compare the same profile id across agent auth stores:

- refresh token presence
- expiry timestamp
- recent last-used state
- auth cooldown or failure counters

#### Recovery

- choose the freshest working profile as the canonical source
- sync drifted agents to that profile
- clear stale auth cooldown state only for the affected provider/profile
- back up every modified auth store before writing changes

Public helper:

```bash
./scripts/openclaw-auth-profile-sync.sh --dry-run --host <ssh-host> --profile-id <provider:profile>
./scripts/openclaw-auth-profile-sync.sh --apply --host <ssh-host> --profile-id <provider:profile>
./scripts/openclaw-auth-profile-sync.sh --validate --host <ssh-host> --profile-id <provider:profile>
```

#### Validation

- the inspected agents now share one consistent profile payload for the affected provider
- cooldown state is cleared only where appropriate
- a live Telegram probe no longer falls back to another provider

### 7. Post-update Telegram transport regression

#### Symptoms

- Telegram transport became unreliable immediately after `openclaw update`, reinstall, or package refresh
- startup succeeds but long-polling stalls, outbound send operations fail, or provider/plugin startup regresses
- the host was stable before the package replacement

#### Why this happens

An update can replace the installed runtime bundles and discard local compatibility fixes or behavior that the current environment depended on.

#### Checks

```bash
openclaw --version
openclaw gateway status
rg -n 'Polling stall detected|sendMessage failed|sendChatAction failed|failed to load plugin|channel exited' ~/.openclaw/logs /tmp/openclaw 2>/dev/null
```

Also compare:

- package version before and after the incident, if known
- whether installed `dist/` bundles changed recently
- whether the regression started exactly after a refresh event

On macOS LaunchAgent installs, also check whether the update replaced the startup path or leaked proxy env into Telegram traffic:

```bash
plutil -p ~/Library/LaunchAgents/ai.openclaw.gateway.plist 2>/dev/null | sed -n '1,160p'
launchctl print gui/$UID/ai.openclaw.gateway 2>/dev/null | grep -E 'Program|HTTP_PROXY|HTTPS_PROXY|ALL_PROXY|NO_PROXY|no_proxy'
```

Red flags:

- `ProgramArguments` now point directly to `node .../openclaw/dist/entry.js` instead of the host-local wrapper that used to harden env startup
- the LaunchAgent plist now contains duplicated provider or bot secrets that previously lived only in `~/.openclaw/.env`
- launchd injects `HTTP_PROXY` / `HTTPS_PROXY` / `ALL_PROXY` and `NO_PROXY` no longer includes `api.telegram.org`
- `openclaw status --deep` shows `Telegram WARN` while `curl https://api.telegram.org` and a direct token `getMe` probe from the host still succeed
- logs show `deleteWebhook`, `deleteMyCommands`, `setMyCommands`, or `This operation was aborted` immediately after the update

#### Recovery

- first check whether the new upstream build already includes an equivalent fix
- if not, re-apply the minimal host-local compatibility patch required for that environment
- avoid broad rewrites while transport is already unstable
- document clearly when a patch is local containment rather than a universal upstream fix

For macOS LaunchAgent drift after update:

- keep the new OpenClaw version if the runtime itself is healthy
- restore a wrapper startup path that sources `~/.openclaw/.env` instead of duplicating secrets into the plist
- clear `HTTP_PROXY`, `HTTPS_PROXY`, and `ALL_PROXY` inside the wrapper before starting OpenClaw
- set `NO_PROXY` and `no_proxy` to include `api.telegram.org,127.0.0.1,localhost`
- reload the LaunchAgent and validate with both `openclaw gateway status` and `openclaw status --deep`
- if logs show repeated Telegram native-command churn or `BOT_COMMANDS_TOO_MUCH`, either reduce commands or set `channels.telegram.commands.native=false`

Public helper:

```bash
./scripts/openclaw-telegram-transport-hotfix.sh --dry-run --host <ssh-host>
./scripts/openclaw-telegram-transport-hotfix.sh --apply --host <ssh-host>
./scripts/openclaw-telegram-transport-hotfix.sh --validate --host <ssh-host>
```

#### Validation

- gateway runtime is healthy after restart
- Telegram provider starts normally
- no immediate recurrence of the outbound transport errors in a control window longer than the old stall interval
- on macOS, the active LaunchAgent no longer stores provider secrets directly in `EnvironmentVariables`
- on macOS, a fresh `openclaw status --deep` shows `Telegram OK` after the wrapper/env recovery

### 8. Bootstrap-bloat and startup-tax

#### Symptoms

- a fresh session is much slower than follow-up turns
- the bot spends the first response reading multiple large memory or policy files before answering
- `/fast` or lower thinking does not materially improve the first turn

#### Why this happens

Bootstrap files can drift from concise startup guidance into runbooks, incident logs, policy dumps, or domain playbooks. That turns every new session into a heavy preload.

#### Checks

Look for explicit reads of bootstrap and memory files near session start, and inspect the size and role of the startup files themselves:

```bash
wc -c AGENTS.md TOOLS.md SOUL.md MEMORY.md 2>/dev/null
rg -n 'read|AGENTS.md|TOOLS.md|SOUL.md|MEMORY.md|LEARNINGS|workflow' ~/.openclaw/agents/*/sessions/*.jsonl 2>/dev/null
```

Questions to answer:

- which files are read on every new session
- which of those files are operational runbooks rather than bootstrap guidance
- whether one slow first turn is startup-tax while later turns are normal

#### Recovery

- keep bootstrap files short and role-specific
- move incident-response, host-ops, and domain-specific playbooks out of startup files
- keep only the minimum session-start routing, safety, and index information in bootstrap context
- if defaults and agent bindings are part of the drift, use a narrow config-normalization helper instead of broad manual rewrites

Public helper example:

```bash
python3 ./scripts/normalize-openclaw-models.py ~/.openclaw/openclaw.json \
  --primary <provider/model> \
  --fallback <provider/model> \
  --alias <alias> \
  --agent-id <agent-id>
```

#### Validation

- new-session startup reads fewer and smaller files
- fresh-session first-response latency drops materially
- workflow or safety rules still exist, but now live in the right documents

### 9. Duplicate OpenClaw runtime on macOS

#### Symptoms

- `which -a openclaw` shows multiple installs
- LaunchAgent points into one runtime while interactive shells use another
- restarts appear to work, but behavior differs between manual runs and launchd-managed runs

#### Why this happens

macOS automation nodes often accumulate multiple OpenClaw installs across Homebrew, `npm -g`, or `~/.nvm`. Launchd and shell PATHs then disagree about which runtime is canonical.

#### Checks

```bash
which -a openclaw
launchctl print gui/$(id -u)/ai.openclaw.gateway 2>/dev/null | egrep 'program =|path =|args ='
find ~/.nvm -path '*/lib/node_modules/openclaw/dist/index.js' 2>/dev/null
```

Also verify the Node runtime used by the active LaunchAgent and compare it with the shell's `openclaw`.

#### Recovery

- choose one canonical install path
- reinstall or re-register the gateway from that canonical runtime
- remove or disable duplicate installs and stale shims
- verify that launchd and interactive shells now resolve to the same intended runtime

Public helper:

```bash
./scripts/macos-single-openclaw-runtime.sh --dry-run
./scripts/macos-single-openclaw-runtime.sh --apply
```

#### Validation

- launchd no longer points at a duplicate or stale runtime
- duplicate installs are gone or fully inactive
- `openclaw gateway status` and a real control command behave consistently after restart

### 10. Runtime bundle corruption or partial package replacement

#### Symptoms

- gateway fails with `MODULE_NOT_FOUND` or keeps surfacing a new missing chunk after each attempted fix
- the service can be revived only by temporarily pointing it at a different local OpenClaw install
- the intended install tree exists, but its `dist/` bundle looks suspiciously incomplete

#### Why this happens

This is usually not a one-file breakage.

A manual copy, interrupted update, partial rollback, or local experiment can leave the canonical OpenClaw package only half-restored. In that state, restoring one missing entrypoint often just reveals the next missing compiled chunk.

#### Checks

Confirm the canonical runtime first, then inspect whether the installed bundle is complete enough to be believable:

```bash
systemctl --user cat openclaw-gateway 2>/dev/null | sed -n '1,160p'
openclaw gateway status
find /path/to/canonical/openclaw/dist -type f | wc -l
ls -lah /path/to/canonical/openclaw/dist | sed -n '1,80p'
```

Also compare:

- the `ExecStart` path in the active unit or launch agent
- the live PID command line after restart
- whether a nearby package backup or fresh reinstall contains far more runtime files than the broken tree
- whether the next boot failure keeps changing from one missing module to another

Red flags:

- the active service points at one runtime tree, but emergency recovery keeps using another
- `dist/` contains only a handful of files when a full package should contain many generated chunks
- restoring one file only changes the missing-module error to a different file

#### Recovery

- do not normalize the emergency alternate runtime path as the final fix
- do not start with one-file restore unless the breakage is proven to be isolated
- restore or reinstall the entire canonical OpenClaw package from a trusted same-version build or local package backup
- point the service back to the canonical runtime only after the full package is restored
- restart and validate from the canonical path, not just the temporary workaround path

#### Validation

- the canonical service is `active`
- `openclaw gateway status` is healthy on the intended runtime
- the live PID command line matches the canonical install path
- provider startup no longer fails on shifting `MODULE_NOT_FOUND` errors

### 11. Plugin runtime contract drift after restart or update

#### Symptoms

- the gateway stays up, but one plugin, bound thread, or channel-specific feature goes silent
- logs show plugin exceptions such as `Cannot read properties of undefined (...)`
- the failure clusters around channel helpers like typing, send, topic rename, or other runtime-specific helpers
- broad transport checks look healthy while one plugin path still fails

#### Why this happens

A plugin can depend on runtime helper surfaces that are optional, moved, or changed across OpenClaw versions and host environments.

That creates a dangerous partial-failure pattern: the gateway is alive enough to receive the event, but the plugin crashes when it touches a helper that is no longer present in the live runtime contract.

#### Checks

```bash
openclaw gateway status
rg -n 'Cannot read properties of undefined|failed to load plugin|plugin.*error|message:transcribed|message:preprocessed' ~/.openclaw/logs /tmp/openclaw 2>/dev/null
rg -n 'runtime\.channel\.|typing\.|sendMessage|renameTopic|resolve.*Token' /path/to/plugin/source /path/to/plugin/runtime 2>/dev/null
```

Ask these questions:

- is the gateway healthy while only one plugin path fails
- does the plugin assume a channel-specific runtime object always exists
- did the issue start right after a restart, update, redeploy, or host move
- was only the live deployed copy patched while the source tree stayed stale, or vice versa

#### Recovery

- treat this as a plugin compatibility incident, not automatically as a full transport outage
- replace hard assumptions about channel-specific runtime helpers with compatibility fallbacks where possible
- prefer stable plugin SDK helpers or generic APIs over host-specific runtime import paths
- wrap non-critical hook boundaries so one bad event degrades locally instead of crashing the whole plugin path
- if the environment has both a deployed runtime copy and a source repo, patch both or the regression will return on the next deploy

#### Validation

- gateway restarts cleanly
- fresh logs no longer show the `undefined` helper crash pattern
- the previously silent bound thread or plugin feature replies again on a real control path
- the maintained source tree passes its relevant tests or build checks

### 12. Duplicate runtimes, duplicate supervisors, or wrong-target diagnosis

#### Symptoms

- one health check says the gateway is healthy, but Telegram or another user-facing path still shows polling conflicts, stale behavior, or inconsistent results
- manual restarts appear to help briefly, but the same transport conflict or duplicate-listener symptom comes back
- shell commands and service-manager state appear to point at different OpenClaw installs, ports, or launch targets

#### Why this happens

Some hosts accidentally end up with two OpenClaw runtimes or two supervisors managing the same environment.

Common patterns:

- user-level service plus system-level service
- launch agent plus manual shell process
- old install plus new install on different paths
- two runtimes sharing one state directory or one Telegram token

This creates false diagnosis loops. One runtime can look healthy while the other is the one actually colliding, polling, or serving stale behavior.

#### Checks

Confirm the canonical target first, then verify that there is only one active owner for the affected runtime and state:

```bash
ps -ef | grep -Ei 'openclaw|gateway' | grep -v grep
ss -tulpn | grep -Ei 'openclaw|127\.0\.0\.1:'
systemctl --user status openclaw-gateway --no-pager -l 2>/dev/null
systemctl status openclaw-gateway --no-pager -l 2>/dev/null
```

Also compare:

- `which -a openclaw`
- the active service `ExecStart`
- the live PID command line
- the active listener ports
- the runtime directory or shared state directory used by each process

Red flags:

- two OpenClaw process trees at the same time
- one manager reports healthy while another still owns a conflicting process
- the shell CLI resolves to one install while the service uses another
- duplicate runtimes share one state directory or the same transport credentials

#### Recovery

- choose one canonical runtime path and one canonical supervisor
- disable or remove the duplicate runtime or duplicate supervisor before changing auth, transport, or plugin code
- re-check listeners and process trees after the stop action; do not assume disable alone removed the old runtime
- only after duplication is gone should you continue with transport or provider debugging

#### Validation

- exactly one intended OpenClaw runtime remains active for the affected environment
- the canonical service manager view, PID path, and listener ports agree with each other
- fresh logs no longer show duplicate-polling or duplicate-runtime conflict symptoms
- a real control probe behaves consistently after restart

### 13. Recovery validation: prove the fix on the real path

#### Symptoms

- the unit is `active`, but users still report silence, delays, or partial failures
- logs are quieter after restart, but there is no end-to-end proof that the broken path works again
- the operator is tempted to declare success based only on service-manager green state

#### Why this matters

Restart is an action, not evidence.

OpenClaw incidents often recover partially: the main process comes back, but the original broken path may still be jammed, misrouted, degraded, or attached to the wrong runtime.

#### Minimum validation ladder

Use the strongest available post-fix proof in this order:

1. real user-facing probe on the originally broken path
2. canonical gateway health or RPC check
3. matching process-manager and listener state
4. fresh logs that stay clean during a short control window

#### Checks

```bash
openclaw gateway status
journalctl --user -u openclaw-gateway --since '-5 min' --no-pager 2>/dev/null | tail -n 120
```

Then verify all of these where applicable:

- the originally broken chat, plugin path, or transport action now succeeds
- the canonical runtime path is the one actually serving
- no immediate recurrence appears in the first control window after restart
- residual degradation is called out explicitly instead of hidden behind a green status

#### Recovery wording rules

Allowed:

- `The service is back on the canonical runtime, but end-to-end recovery is still being verified.`
- `Availability recovered; one degraded path is still being watched.`
- `Restart succeeded, but recovery is not confirmed until the real control probe passes.`

Avoid:

- `Recovered.` immediately after restart
- `Healthy.` based only on `systemctl active`
- `Fixed.` when only a shallow probe is green

### 14. Post-update elevated approval drift: global vs per-agent gating

#### Symptoms

- after an update, one chat or one agent suddenly asks for approval on nearly every elevated action
- another chat on the same host still runs elevated commands without the same friction
- the operator suspects `agents.defaults.elevatedDefault`, but changing or inspecting it does not explain the difference

#### Why this happens

In current OpenClaw setups, elevated execution is usually controlled by global and per-agent `tools.elevated` policy, not by assuming that `agents.defaults.elevatedDefault` is the deciding switch.

That means behavior can differ by agent even on the same host:

- global `tools.elevated` defines the baseline capability
- per-agent `tools.elevated` can further restrict that capability
- sender allowlists under `tools.elevated.allowFrom.<channel>` can differ between the global policy and the agent-specific override

So a post-update approval surprise is often an agent-routing or agent-policy issue, not a missing default toggle.

#### Checks

Look at both the global and per-agent policy, and verify which agent actually handled the request:

```bash
rg -n 'elevatedDefault|tools\.elevated|allowFrom' ~/.openclaw/openclaw.json 2>/dev/null
openclaw gateway status
```

Confirm:

- whether `agents.defaults.elevatedDefault` is actually set
- whether global `tools.elevated.enabled` is on
- whether global `tools.elevated.allowFrom.<channel>` includes the intended sender class
- whether the selected agent has its own `tools.elevated` block that narrows access
- whether the request was routed to a different agent after the update

#### Recovery

- do not assume `agents.defaults.elevatedDefault` is the root cause
- first identify which agent handled the request
- compare the global elevated policy with that agent's own `tools.elevated` override
- if behavior drift appeared after an update or routing change, align the intended agent policy instead of widening elevated access everywhere
- keep the fix narrow: adjust the relevant agent or allowlist rather than opening elevated globally without need

#### Validation

- the same sender now sees consistent elevated behavior on the intended agent
- a different agent with stricter policy stays strict if that is intentional
- approval prompts now match the configured policy instead of surprising the operator

## What to avoid

- do not rotate secrets during first response unless compromise is suspected
- do not wipe state directories to “start fresh”
- do not delete sessions, volumes, or compose stacks without evidence
- do not publish raw logs if they may contain tokens or private routing data

## Public-safe incident summary format

- symptom
- scope
- confirmed healthy components
- confirmed failing components
- probable root cause
- recovery action taken
- residual risk
