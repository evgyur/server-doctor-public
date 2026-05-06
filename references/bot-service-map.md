# Bot and Service Map

Use this reference to map bot functions to hosts, runtime owners, startup mechanisms, and operator actions.

This public version is intentionally generic.

## Purpose
A good service map should answer:
- what this bot or service does
- where it runs
- who owns it
- how it starts
- where logs live
- how to restart it safely
- what dependencies it needs

## Public-safe service card template

```markdown
### <service-label>
- function: <main assistant | publishing bot | maintenance bot | webhook worker>
- host label: <host-label>
- runtime owner: <service user | launchd user | container owner>
- startup mechanism: <systemd --user | launchd | docker compose | direct process>
- working directory: <sanitized path or role label>
- status command:
  - `<status command>`
- log command or path:
  - `<log command or path>`
- restart command:
  - `<restart command>`
- dependencies:
  - `<telegram>`
  - `<provider API>`
  - `<database>`
  - `<browser sidecar>`
- failure modes:
  - `<transport stall>`
  - `<auth drift>`
  - `<duplicate runtime>`
- unknowns:
  - `<anything still not proven>`
```

## Mapping rules
- prefer role labels over private bot usernames
- prefer dependency classes over secret-bearing config detail
- keep status, logs, and restart commands concrete
- separate confirmed facts from assumptions

## Runtime taxonomy
Use one of these labels when possible:
- `systemd`
- `launchd`
- `docker / compose`
- `direct process`
- `tmux / screen managed`

## OpenClaw tenant and agent identity guard

When a host has both a main bot tenant and a separate development bot tenant, do not reuse the development tenant name as an agent id inside the main tenant.

Confirmed public-safe pattern:

- main tenant on the shared host:
  - runtime owner: `chip`
  - main coding agent id: `chipcoder`
  - `chipdev` should not appear as an active agent id or Telegram session key in this tenant
- development tenant on the same host:
  - runtime owner: `chipdev`
  - separate OpenClaw state directory and gateway
  - this is the `chipdev` bot/tenant, not the `chipcoder` agent inside the main tenant

Validation pattern:

```bash
rg -n 'agent:chipdev|"id": "chipdev"|chipdev' \
  /home/chip/.openclaw/openclaw.json /home/chip/.openclaw/agents

sudo -n -u chipdev python3 - <<'PY'
import json, pathlib
cfg = json.loads(pathlib.Path('/home/chipdev/.openclaw/openclaw.json').read_text())
print(cfg.get('agents', {}).get('defaults', {}).get('model'))
print(cfg.get('agents', {}).get('defaults', {}).get('agentRuntime'))
PY
```

If the first command finds active `agent:chipdev` session keys under the main tenant, archive those stale entries before testing the `chipcoder` route.

## Example, sanitized

```markdown
### main-assistant-gateway
- function: main assistant
- host label: main-gateway-host
- runtime owner: service account
- startup mechanism: systemd --user
- working directory: `~/.openclaw`
- status command:
  - `systemctl --user status openclaw-gateway --no-pager -l`
- log command or path:
  - `journalctl --user -u openclaw-gateway -n 200 --no-pager`
- restart command:
  - `systemctl --user restart openclaw-gateway`
- dependencies:
  - Telegram Bot API
  - model provider
  - local browser control
- failure modes:
  - Telegram transport regression after update
  - stale session override
  - per-agent auth drift
- unknowns:
  - whether a second experimental gateway is also polling the same bot token
```
