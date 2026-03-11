---
name: server-doctor
description: Use when auditing or repairing Linux or macOS hosts that run OpenClaw, Telegram bots, or related automation. Focus on safe inventory, runtime discovery, incident response, log inspection, service recovery, and documentation without exposing secrets.
---

# Server Doctor

Use this skill to inspect and stabilize hosts that run:

- OpenClaw gateways
- Telegram bots
- background automation
- Dockerized bot services
- user-space processes
- `systemd` or `launchd` services

This public version is intentionally generic. It does not assume any specific hostnames, users, IPs, bot usernames, chat IDs, or credentials.

## Primary goals

1. Identify what is actually running on a host.
2. Determine which Unix user owns each bot or service.
3. Classify runtime style:
   - `systemd`
   - `launchd`
   - Docker / Compose
   - direct user-space process
   - terminal multiplexer session
4. Locate logs, configs, restart paths, and dependencies.
5. Capture operational risks without leaking secrets.

## Workflow

### 1. Establish host context

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

### 2. Discover runtimes

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

### 3. Locate OpenClaw state

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

### 4. Confirm Telegram-facing services

When a service interacts with Telegram, document:

- owning Unix user
- runtime style
- process or service name
- working directory
- log path
- restart command
- whether a Telegram bot username is confirmed

If a Telegram username is confirmed, record it only in the operator's private inventory unless the user explicitly wants a public-safe example.

### 5. Build the inventory

For each discovered service, capture:

- host role
- user
- service name
- runtime
- startup mechanism
- function
- dependencies
- known failure modes
- safe operator commands for status/logs/restart

## Documentation rules

- Never publish passwords, tokens, chat IDs, session strings, private SSH config, or provider API keys.
- Do not copy `.env`, `openclaw.json`, service unit files, or bot configs verbatim into public docs.
- Redact:
  - IP addresses
  - domains
  - email addresses
  - Telegram usernames
  - internal bot names
  - hostnames
  - user names if they identify private environments
- Prefer phrases like:
  - `main OpenClaw gateway`
  - `content publishing bot`
  - `maintenance bot`
  - `private Telegram channel`

## Incident handling

For OpenClaw or Telegram incidents:

1. confirm whether the main process is running
2. inspect recent logs
3. identify whether failure is transport, auth, upstream model, Telegram delivery, or dependency related
4. verify restart path
5. document impact and recovery

Load these references when needed:

- `references/openclaw-host-audit.md`
- `references/openclaw-incident-response.md`

## Output expectations

A good output from this skill should give the operator:

- a host-by-host map
- a user-by-user runtime inventory
- the role of each bot
- restart/log commands
- current risks
- unknowns that still need deeper access

The result should be readable and operationally useful, but safe to share publicly.
