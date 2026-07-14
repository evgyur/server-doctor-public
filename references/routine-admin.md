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

### Post-upgrade completion gate

Use this after OS package, kernel, Docker Engine, or container-runtime upgrades. A completed package-manager command is not proof that the host returned to a durable healthy state.

```bash
uname -r
test -f /var/run/reboot-required && cat /var/run/reboot-required
test -f /var/run/reboot-required.pkgs && cat /var/run/reboot-required.pkgs
sudo needrestart -b -r l 2>/dev/null || true
sudo apt-get -s upgrade
systemctl --failed --no-pager
sudo docker ps -a
sudo docker inspect --format '{{.Name}} restart={{.HostConfig.RestartPolicy.Name}} status={{.State.Status}}' $(sudo docker ps -aq)
sudo docker compose ls
```

Interpretation:

- a running old kernel plus `reboot-required` needs a scheduled reboot, not repeated service restarts;
- phased or held packages must be reported as deferred, not silently counted as upgraded;
- a Docker daemon restart may leave required containers stopped when their restart policy is empty or `no`;
- inspect failed units and stopped workload containers before declaring maintenance complete;
- after reboot, repeat the service, listener, and end-to-end probes that mattered before the upgrade.

### Prevent suspend on unattended server hosts

On dedicated hosts that must remain reachable, inspect sleep policy before assuming an unexplained disappearance is a crash:

```bash
systemctl status sleep.target suspend.target hibernate.target hybrid-sleep.target --no-pager
loginctl show-logind 2>/dev/null || true
journalctl -b | grep -E 'suspend|hibernate|sleep' | tail -n 100
```

If the workload contract forbids sleep, use a small `logind` drop-in and mask the sleep targets through the host's normal configuration-management path. Preserve the previous config first.

Verification must include:

- sleep targets show `masked` when masking is the selected policy;
- `systemctl --failed` remains clean;
- the host stays reachable past the previous idle/suspend interval;
- application and operator-facing probes still pass after that interval.

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
