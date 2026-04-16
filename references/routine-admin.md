# Routine admin

Use this reference for baseline host checks, common diagnostics, and safe working rules.

## First checks after connect

Run these first when the operator asks to inspect server health or debug a generic issue:

```bash
hostname
whoami
uname -a
uptime
df -h
free -h
systemctl --failed
```

## Common diagnostics

### Disk pressure triage

```bash
df -h /
sudo du -xhd1 / 2>/dev/null | sort -hr | head -n 30
sudo find / -xdev -type f -size +1G -printf '%s %p\n' 2>/dev/null | sort -nr | head -n 60
```

Practical check: if `/usr/local/lib/node-v*` is unexpectedly huge, inspect it before assuming it is a normal Node install. In some environments it turns out to be an accidental filesystem snapshot unpacked under a Node-looking path, not a live runtime. Before deleting, verify there are no mounts, no open files, and no symlinks pointing into it.

### Service issues

```bash
systemctl status <service> --no-pager
journalctl -u <service> -n 200 --no-pager
```

### Docker

```bash
docker ps
docker logs --tail 200 <container>
docker compose ps
```

### nginx

```bash
nginx -t
systemctl status nginx --no-pager
journalctl -u nginx -n 200 --no-pager
```

### Networking

```bash
ss -tulpn
curl -I http://127.0.0.1
```

## Working rules

- prefer non-destructive inspection first
- explain what is being checked before making changes
- if a change is needed, capture current state first
- when editing remote config, keep changes minimal and verify immediately
- after any service change, run a focused health check

## Server health / remediation MVP

From the repo root:

```bash
./scripts/doctor-mvp.sh check <host-alias-or-user@ip> [output_dir]
./scripts/doctor-mvp.sh fix <host-alias-or-user@ip> [output_dir]
./scripts/doctor-mvp.sh preflight <host-alias-or-user@ip> [output_dir]
```

## Output artifacts

- `server-doctor-*.md`
- `server-doctor-*.json`
- for `fix`: before/after plus consolidated `*.fix.md` and `*.fix.json`
