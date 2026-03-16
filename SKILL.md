---
name: server-doctor
description: Use when auditing or repairing Linux or macOS hosts that run OpenClaw, Telegram bots, or related automation, especially when the operator needs to map hosts, runtimes, and safe access paths before diagnosis.
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

## Non-negotiable warning

This skill is severely limited without access to the relevant bots, servers, containers, or local project directories.

If the operator cannot show where the bots live or cannot provide a safe way to inspect them, the skill may still help reason about likely causes, but it will be partially blind and often operationally weak. Say that plainly up front.

The skill should therefore start by building an environment map and an access map before attempting deeper diagnosis or repair.

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
3. confirm whether the main process is running
4. inspect recent logs
5. identify whether failure is transport, auth, upstream model, Telegram delivery, dependency, or operator-access related
6. verify restart path
7. document impact, recovery, and remaining unknowns

### Public OpenClaw docs mirror

Prefer a local Markdown mirror of `https://docs.openclaw.ai` before falling back to live browsing when the repo checkout is available.

Tooling:

- submodule: `tools/chip-docs-local`
- source manifest: `sources/openclaw.yaml`
- refresh command from the repo root: `npm run sync-openclaw-docs`
- materialized snapshot root: `references/openclaw-docs/`

Expected mirror artifacts:

- `references/openclaw-docs/current/`
- `references/openclaw-docs/FILELIST.md`
- `references/openclaw-docs/state.json`

Operating rules:

- if `tools/chip-docs-local` is missing, say that the local docs toolchain is unavailable instead of pretending the mirror exists
- if dependencies are not installed in the submodule, run `npm --prefix tools/chip-docs-local install` before the sync command
- use the local mirror as the default documentation source during diagnosis when it is present and fresh enough for the task
- check `references/openclaw-docs/FILELIST.md` first for page discovery
- if the mirror is missing or stale and local shell access exists, refresh it with `npm run sync-openclaw-docs`
- if the refresh fails, say so plainly and fall back to live public docs

Load these references when needed:

- `references/openclaw-host-audit.md`
- `references/openclaw-incident-response.md`

## Output expectations

A good output from this skill should give the operator:

- a host-by-host or machine-by-machine map
- a bot-to-host map
- a user-by-user runtime inventory
- a runtime map showing how each bot is started
- an access map showing how each reachable target can be inspected safely
- the role of each bot
- restart/log commands
- current risks
- known unknowns that still need deeper access
- a clear statement when the work is being done in `partial map` mode

The result should be readable, operationally useful, and safe to share publicly.
