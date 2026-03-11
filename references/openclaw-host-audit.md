# OpenClaw Host Audit

Use this reference when you need a repeatable inspection flow for a host that may run OpenClaw or other Telegram automation.

## Audit order

1. Identify the OS and operator account.
2. Discover service managers and direct processes.
3. Find OpenClaw directories, configs, and logs.
4. Map Telegram-facing services and supporting dependencies.
5. Build a minimal operator inventory.

## Linux audit checklist

### System layer

```bash
hostname
whoami
uname -a
uptime
df -h
free -h
systemctl --failed
```

### Service layer

```bash
systemctl list-units --type=service --all
journalctl -n 200 --no-pager
```

### Process layer

```bash
ps -eo user,pid,ppid,lstart,cmd --sort=user
ss -tulpn
```

### Container layer

```bash
docker ps -a
docker compose ls
docker compose ps
```

### Filesystem layer

```bash
find ~ -maxdepth 3 -type d | grep -Ei 'openclaw|telegram|bot'
find /opt -maxdepth 4 -type f 2>/dev/null | grep -Ei 'openclaw|compose|telegram|docker'
```

## macOS audit checklist

### System layer

```bash
hostname
whoami
sw_vers
df -h
```

### Service layer

```bash
launchctl list
ls -la ~/Library/LaunchAgents
```

### Process layer

```bash
ps aux
```

### Optional local runtimes

```bash
docker ps -a
colima list
tmux ls
screen -ls
```

## What to record

For each service:

- user
- name
- runtime
- startup mechanism
- config path
- log path
- restart path
- purpose
- dependencies

## Safe phrasing for public outputs

Instead of:

- real hostnames
- real usernames
- real Telegram usernames
- direct config excerpts

Use:

- `primary Linux host`
- `secondary analysis host`
- `macOS automation node`
- `main gateway bot`
- `repair bot`
- `content publishing pipeline`

## Public-safe redaction checklist

Before publishing:

- remove passwords
- remove bot tokens
- remove API keys
- remove session strings
- remove IPs and domains
- remove emails
- remove private chat IDs
- remove exact internal file paths if they disclose user identity
