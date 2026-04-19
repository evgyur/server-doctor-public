# Hosts Inventory

Use this reference for host selection, login path, privilege boundaries, and canonical runtime targeting.

This public version is a template plus policy, not a private inventory dump.

## What belongs here
- host role labels
- access method categories
- canonical runtime style
- canonical health-check path
- privilege boundary notes
- operator-owned placeholders for safe local customization

## What does not belong here
- passwords
- API keys
- session strings
- chat ids
- private domains
- private IP addresses
- personally identifying hostnames or usernames unless intentionally public

## Public-safe host card template

```markdown
### <host-label>
- role: <gateway | bot host | workstation | VPS | jump host>
- environment: <prod | staging | personal lab>
- OS: <Ubuntu 24.04 | macOS 15 | ...>
- runtime styles present: <systemd --user | launchd | docker compose | direct process>
- canonical target for this environment: <main OpenClaw gateway | telegram worker | browser sidecar>
- preferred access path: <ssh alias | tailscale | local shell | docker exec>
- privilege boundary: <unprivileged user first, escalate only if needed>
- canonical status commands:
  - `<status command 1>`
  - `<status command 2>`
- canonical logs:
  - `<log command or path>`
- restart path:
  - `<restart command>`
- notes:
  - `<important split-brain or duplicate-runtime guardrail>`
```

## Access-map policy

For each real environment, capture:
- whether the host is reachable
- who owns the runtime
- what service manager starts it
- what path is canonical for status, logs, and restart
- which access path is safe and verified

Track map status explicitly:
- `mapped`
- `partial map`
- `unreachable`

## Split-brain guardrail

If a machine can host multiple OpenClaw runtimes, document:
- which one is canonical
- how to force tooling toward the correct port or state directory
- how to recognize a misleading green check from the wrong runtime

## Example, sanitized

```markdown
### main-gateway-host
- role: main OpenClaw host
- environment: prod
- OS: Ubuntu 24.04
- runtime styles present: systemd --user, docker
- canonical target for this environment: main OpenClaw gateway
- preferred access path: ssh alias
- privilege boundary: inspect as service owner first
- canonical status commands:
  - `systemctl --user status openclaw-gateway --no-pager -l`
  - `ss -tulpn | grep -E '127.0.0.1:(8090|8092)'`
- canonical logs:
  - `journalctl --user -u openclaw-gateway -n 200 --no-pager`
- restart path:
  - `systemctl --user restart openclaw-gateway`
- notes:
  - another lightweight gateway may exist on a different port for local experiments
```
