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

When one host carries a primary tenant and an isolated development tenant, keep tenant identity separate from agent identity.

Portable contract:

- each tenant has a distinct runtime owner, state directory, gateway, and transport identity;
- agent ids are unique inside a tenant and do not reuse another tenant's label;
- session keys in the primary state store must not reference the isolated tenant;
- validation commands receive tenant paths and expected agent ids as explicit inputs.

Validation pattern:

```bash
PRIMARY_STATE_DIR="${PRIMARY_STATE_DIR:?set primary state dir}"
ISOLATED_STATE_DIR="${ISOLATED_STATE_DIR:?set isolated state dir}"
ISOLATED_AGENT_ID="${ISOLATED_AGENT_ID:?set isolated agent id}"

rg -n --fixed-strings "$ISOLATED_AGENT_ID" \
  "$PRIMARY_STATE_DIR/openclaw.json" "$PRIMARY_STATE_DIR/agents" || true

test -f "$ISOLATED_STATE_DIR/openclaw.json"
```

If the first command finds active session keys from the isolated tenant under the primary tenant, back up the primary session index and archive only those stale entries. Do not delete the full state store.

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
