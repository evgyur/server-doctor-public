# OpenClaw Incident Response

Use this reference when a Telegram bot is slow, unresponsive, partially working, or failing after startup.

## Symptom buckets

### 1. Process is down

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

#### Recovery

- first check whether the new upstream build already includes an equivalent fix
- if not, re-apply the minimal host-local compatibility patch required for that environment
- avoid broad rewrites while transport is already unstable
- document clearly when a patch is local containment rather than a universal upstream fix

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
