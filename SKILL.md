---
name: server-doctor
description: Use when auditing or repairing Linux or macOS hosts that run OpenClaw, Telegram bots, or related automation. Start with host/runtime/access mapping, then use focused references for incidents, updates, Task Flow, and safe public documentation.
---

# Server Doctor

Use this skill to inspect and stabilize hosts that run:

- OpenClaw gateways
- Telegram bots
- background automation
- Dockerized bot services
- user-space processes
- `systemd` or `launchd` services

This public version is intentionally generic. It does not assume any specific hostnames, users, IPs, bot usernames, chat IDs, directories, or credentials.

## Core rule

Keep `SKILL.md` focused. Read the matching reference before acting.

Direct-DM guardrail:

- if a server operation is likely to take more than a brief bounded check, do not hold the user's DM lane open for the full operation
- acknowledge quickly, then move the real work into a durable task, subagent, Task Flow branch, or other detached path
- treat updates, repairs, multi-host probes, restart/soak work, and post-checks as async-by-default in DM-like channels

Before detailed routing, read:
- `references/routing-stack.md`
- `references/principal-architecture.md`
- `references/server-doctor-fast-paths.md` for common routes
- `references/server-doctor-command-layer.md` for implemented public commands
- `references/core/INDEX.md` when present
- `references/overlays/INDEX.md` when present
- `incidents/INDEX.md`

Use them to keep doctrine, runbooks, overlays, incident memory, and command entrypoints separated.

When delegating server work to Claude Code, Codex, subagents, or another ops/coding agent, first read `references/agent-tasking-for-server-ops.md`. It defines the public-safe task contract: raw evidence, target/access path, root-cause-first investigation, minimal mutation, debug reset, and proof before “fixed”.

For a live service deployed from Git, read `references/repo-backed-runtime-update-workflow.md` before updating. It covers live-checkout proof, dirty-state backup, disposable-worktree integration, ancestry checks, detached restart, and end-to-end verification without exposing private fork details.

Before moving any lesson from a private runbook or incident into this repository, read `references/public-sanitization-checklist.md` and run `scripts/check-public-safety.py` against the added lines.

## Non-negotiable warning

This skill is severely limited without access to the relevant bots, servers, containers, or local project directories.

If the operator cannot show where the bots live or cannot provide a safe way to inspect them, the skill may still help reason about likely causes, but it will be partially blind and often operationally weak. Say that plainly up front.

The skill should therefore start by building an environment map and an access map before attempting deeper diagnosis or repair.

Operational diagnosis must separate:

- spec correctness:
  - correct host, runtime, owner, and service target
  - correct source of truth
  - current direct evidence
  - wording that matches only what the evidence proves
- ops quality:
  - healthy
  - degraded
  - partial failure
  - unstable
  - down

Do not jump from partial visibility or target uncertainty straight to outage language.

## After-action rule

After any `server-doctor` task, run a documentation feedback pass before completion.

If the work produced reusable information, update the matching public-safe reference automatically before closing the task. Keep environment-specific facts, private hostnames, chat IDs, tokens, and local paths out of public docs; convert them into general patterns, placeholders, or sanitized incident lessons.

## Primary goals

1. Build a usable map of hosts, local machines, bots, runtimes, and safe access paths.
2. Identify what is actually running on each reachable machine.
3. Determine which Unix user owns each bot or service.
4. Classify runtime style:
   - `systemd`
   - `launchd`
   - Docker / Compose
   - direct user-space process
   - terminal multiplexer session
5. Locate logs, configs, restart paths, and dependencies.
6. Capture operational risks without leaking secrets.

## Workflow

## Principal-grade architecture

`server-doctor-public` should behave as a layered system, not a flat bundle of notes.

Routing order:
1. doctrine anchor
2. platform runbook
3. environment overlay
4. dated incident note

Placement rule:
- reusable ops law -> doctrine
- reusable platform workflow -> runbook
- environment-specific fact -> overlay
- one-off historical example -> incident note

For design quality checks, use:
- `references/principal-rubric.md`
- `references/review-gate.md`
- `scripts/review_placement.py`

### 1. Access & Inventory Preflight

Before running normal diagnostics, ask the operator for the minimum map needed to be useful.

Collect whatever is already known:

- which servers, VPSes, Macs, PCs, NAS devices, or local laptops are in scope
- which bots or automations are believed to run on each machine
- which Unix user, container, service account, or local profile owns each runtime
- any known working directories, Compose projects, unit names, launch agents, cron jobs, or repo checkouts
- how the agent can safely reach each target:
  - `ssh`
  - `tailscale`
  - local shell
  - `docker exec`
  - `kubectl exec`
  - `systemctl --user`
  - terminal multiplexer
  - jump host / bastion
  - operator-provided command output only

Use a compact intake like this:

```text
Host or machine:
Role:
Known bots/services:
Runtime owner:
Known paths or service names:
Safe access method:
Missing information:
```

Do not demand that secrets be pasted into public chat. The requirement is access, not credential leakage. Work with the operator to establish a safe connection path.

### 2. Declare map status

If the operator has not provided enough information to reach the environment, explicitly warn that the skill will be limited until access improves.

Track one of these states:

- `mapped` - host, runtime, and access path are known
- `partial map` - some facts are known, but ownership, location, or access is missing
- `unreachable` - the target exists, but there is no current safe access path

When in `partial map`, keep going with whatever is reachable, but always list the missing facts blocking reliable repair.

In `partial map` mode:

- record confirmed facts separately from assumptions
- list unknowns explicitly
- ask for the next highest-value access detail that would unlock diagnosis or repair

### 3. Establish host context

Start with low-risk inspection:

```bash
hostname
whoami
uname -a
uptime
pwd
```

On Linux:

```bash
df -h
free -h
ps -eo user,pid,ppid,cmd --sort=user
ss -tulpn
```

On macOS:

```bash
sw_vers
df -h
ps aux
launchctl list
```

If the task is local rather than remote, adapt the same checks to the local shell.

### 4. Discover runtimes

Check for service managers and containers.

Linux:

```bash
systemctl --failed
systemctl list-units --type=service --all
docker ps -a
docker compose ls
```

macOS:

```bash
launchctl list | grep -Ei 'openclaw|bot|agent|telegram'
ls -la ~/Library/LaunchAgents
```

Multiplexers and direct processes:

```bash
tmux ls
screen -ls
ps aux | grep -Ei 'openclaw|telegram|bot|node|python' | grep -v grep
```

### 5. Locate project state and bot directories

Typical areas to inspect:

- `~/.openclaw`
- `~/workspace`
- `/opt/...`
- project directories containing `docker-compose.yml`, `compose.yaml`, `package.json`, `pyproject.toml`, `requirements.txt`

Useful searches:

```bash
find ~ -maxdepth 3 -type d | grep -Ei 'openclaw|bot|telegram'
find /opt -maxdepth 4 -type f 2>/dev/null | grep -Ei 'openclaw|compose|docker|telegram'
```

Also inspect any operator-provided checkout or local path directly if the bot is run from a workstation instead of a server.

### 6. Confirm Telegram-facing services

When a service interacts with Telegram, document:

- host or local machine
- owning Unix user
- runtime style
- process or service name
- working directory
- safe access path used to reach it
- log path
- restart command
- whether a Telegram bot username is confirmed

If a Telegram username is confirmed, record it only in the operator's private inventory unless the user explicitly wants a public-safe example.

### 7. Build the operational map

For each discovered service, capture:

- host role
- host or local machine name
- user
- service name
- bot name or function
- runtime
- access method
- startup mechanism
- function
- dependencies
- known failure modes
- safe operator commands for status/logs/restart
- unknowns still blocking deeper work

The map should make it obvious:

- where each bot lives
- how to connect to it safely
- what starts it
- where logs live
- how to restart it
- what is still unknown

## Documentation rules

- Never publish passwords, tokens, chat IDs, session strings, private SSH config, or provider API keys.
- Never require the operator to paste secrets into the skill document itself.
- Do not copy `.env`, `openclaw.json`, service unit files, or bot configs verbatim into public docs.
- Redact:
  - IP addresses
  - domains
  - email addresses
  - Telegram usernames
  - internal bot names
  - hostnames
  - user names if they identify private environments
- Prefer phrases like `main OpenClaw gateway`, `content publishing bot`, `maintenance bot`, and `private Telegram channel`.

## Incident handling

For OpenClaw or Telegram incidents:

1. confirm which host or local machine owns the failing runtime
2. confirm that a safe access path actually exists
3. read `references/health-claims-and-evidence.md` before making strong health or outage claims
4. read `references/outage-classification.md` when you need to label health state, degradation, recovery, or escalation level
5. confirm the canonical runtime target before strong claims:
   - host
   - owner
   - unit, launch agent, container, or process tree
   - runtime directory or state directory
   - live port, socket, or endpoint
6. confirm whether the main process is running
7. inspect recent logs
8. classify the failure before changing anything major:
   - process down
   - Telegram transport broken
   - auth or model fallback
   - queue starvation or provider delay
   - bootstrap bloat or startup tax
   - dependency failure
9. identify whether failure is transport, auth, upstream model, Telegram delivery, dependency, or operator-access related
10. if the symptom matches a known narrow remediation in `references/openclaw-incident-response.md`, explicitly offer to apply that remediation instead of stopping at diagnosis
11. verify restart path
12. document impact, recovery, and remaining unknowns

Claim discipline:

- incomplete visibility is not outage proof
- direct live probe beats stale legacy checks unless a stronger contradiction appears
- wrong runtime path, old port, duplicate runtime, or mirror copy must be ruled out before outage wording
- degraded, partial failure, unstable, and down are distinct labels
- restart alone is not recovery

Read `references/openclaw-incident-response.md` for concrete public-safe scenarios including:

- stale session model override
- per-agent auth-profile drift
- post-update Telegram transport regression
- bootstrap-bloat and startup-tax
- duplicate OpenClaw runtime on macOS
- macOS LaunchAgent drift after OpenClaw update (wrapper replaced, secrets duplicated, proxy env leaked)
- stale shell shims or split install roots after update
- external watchdog or auth-sync automation causing restart churn
- plugin/source drift between deployed runtime copies and maintained source trees
- group/chat binding drift after config migration
- post-update elevated approval drift caused by global vs per-agent `tools.elevated` policy

When a known scenario has a narrow fix path, prefer language like:

- `I found the likely cause and can apply the narrow fix now.`
- `I can align the intended agent instead of widening access globally.`

Do not stop at pure diagnosis when the likely remediation is already clear and low-risk.

Public helper scripts in this repo:

- `scripts/normalize-openclaw-models.py`
  - normalize model defaults and optional per-agent bindings
- `scripts/openclaw-auth-profile-sync.sh`
  - inspect, sync, and validate per-agent auth-profile drift for a chosen profile id
- `scripts/openclaw-bootstrap-hygiene.sh`
  - inspect and normalize bootstrap drift in `AGENTS.md` and `TOOLS.md`
- `scripts/ensure-telegram-group-agent-binding.py`
  - parameterized public-safe guard for keeping one Telegram group bound to one dedicated agent/skill without hard-coded private IDs
- `scripts/openclaw-telegram-transport-hotfix.sh`
  - re-apply a host-local Telegram transport compatibility patch after updates
- `scripts/macos-single-openclaw-runtime.sh`
  - collapse a macOS host back to one canonical OpenClaw runtime

When the target is a macOS LaunchAgent install, include these checks after any `openclaw update` or package refresh:

- inspect `ProgramArguments` to see whether the updater replaced a host-local wrapper with direct `node .../dist/entry.js`
- inspect `EnvironmentVariables` for duplicated secrets that should still live only in `~/.openclaw/.env`
- inspect live launchd env for `HTTP_PROXY` / `HTTPS_PROXY` / `ALL_PROXY` drift and verify `NO_PROXY` still covers `api.telegram.org`
- verify `openclaw status --deep` rather than trusting only `gateway status`, because RPC can stay green while Telegram is degraded

### Public OpenClaw docs snapshot

Prefer the vendored Markdown snapshot of `https://docs.openclaw.ai` before falling back to live browsing when the repo checkout is available.

Snapshot artifacts:

- `references/openclaw-docs/current/`
- `references/openclaw-docs/FILELIST.md`
- `references/openclaw-docs/state.json`

Operating rules:

- treat the snapshot as upstream/vendored material, separate from authored Server Doctor doctrine;
- check `references/openclaw-docs/FILELIST.md` first for page discovery;
- verify snapshot freshness from `state.json` before relying on version-sensitive details;
- if the snapshot is missing or stale, say so plainly and use the live public documentation;
- do not add a private documentation submodule or operator-specific refresh dependency to this public repository.

Load these references when needed:

Core doctrine:
- `references/routine-admin.md`
- `references/openclaw-host-audit.md`
- `references/health-claims-and-evidence.md`
- `references/outage-classification.md`

Platform runbooks:
- `references/openclaw-incident-response.md`
- `references/openclaw-update-workflow.md`
- `references/repo-backed-runtime-update-workflow.md`
- `references/openclaw-taskflow-ops.md`
- `references/security-forensics.md`
- `references/onboarding.md`

Public boundary:
- `references/public-sanitization-checklist.md`

Environment overlays:
- `references/hosts-inventory.md`
- `references/bot-service-map.md`

Incident memory:
- `incidents/INDEX.md`

## Output Contract

A good output from this skill should give the operator:

- target and access path used;
- map state: `mapped`, `partial map`, or `unreachable`;
- host-by-host or machine-by-machine map;
- bot/service-to-host map when relevant;
- runtime owner and startup mechanism for each service inspected;
- evidence gathered, including commands/probes and result state;
- spec correctness separated from operational health;
- changes made, files/services touched, and verification performed;
- restart/log commands or rollback path when relevant;
- current risks and known unknowns;
- a clear statement when the work is being done in `partial map` mode.

The result should be readable, operationally useful, and safe to share publicly.

## Quick Test Checklist

Before calling server-doctor work done:

- [ ] Matching route/reference was selected before deep action.
- [ ] Target host/runtime/source of truth was verified with direct evidence.
- [ ] Raw logs/errors were used when available, not only paraphrases.
- [ ] Spec correctness and operational health are separated in the report.
- [ ] Any mutation was followed by the same probe or an equivalent end-to-end check.
- [ ] No secrets, private IDs, raw private payloads, or local-only paths were introduced into public docs.
- [ ] Reusable lessons were written into a public-safe reference.

## Done Criteria

A server-doctor task is complete when:

- [ ] the correct host/runtime/source-of-truth is identified or the missing access is named;
- [ ] findings are backed by direct evidence or clearly labeled assumptions;
- [ ] destructive, public, or production actions were avoided or explicitly scoped;
- [ ] health/recovery claims match the strength of the evidence;
- [ ] validation passed, or any remaining failure is named with a safe next step;
- [ ] public documentation updates contain reusable patterns, not private operational details.
