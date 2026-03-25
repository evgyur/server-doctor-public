# OpenClaw Telegram Access Parity

Use this reference when one more Telegram user should be able to use an already working OpenClaw bot the same way as an existing allowed user, but with separate DM sessions.

## Goal

- keep the same bot and the same OpenClaw deployment
- give the new Telegram user the same access path as the existing allowed user
- keep direct-message memory separate per user
- avoid broadening access with wildcards

## Do Not Use This For

- creating a second Telegram bot token
- adding a second Telegram account instance under `channels.telegram.accounts`
- copying memory or session history from one user to another
- opening the bot globally with `allowFrom: ["*"]`

## Default Workflow

### 1. Freeze the current state

Capture:

```bash
hostname
whoami
systemctl --user status openclaw-gateway.service --no-pager
sed -n '1,220p' ~/.openclaw/openclaw.json
```

Before editing:

```bash
cp ~/.openclaw/openclaw.json ~/.openclaw/openclaw.json.bak.$(date +%Y%m%d-%H%M%S)
```

### 2. Locate the active OpenClaw runtime

On the common user-scoped layout:

```bash
systemctl --user --no-pager --type=service | grep -i openclaw
find ~/.openclaw ~/.config/systemd/user -maxdepth 3 \( -name 'openclaw.json' -o -name '*.service' \) 2>/dev/null | sort
```

Expect:

- an active unit such as `openclaw-gateway.service`
- an active config such as `~/.openclaw/openclaw.json`

### 3. Identify the existing allowed Telegram user

Inspect the current Telegram access block:

```bash
sed -n '1,220p' ~/.openclaw/openclaw.json
```

Look for:

- `channels.telegram.allowFrom`
- `channels.telegram.groupAllowFrom`
- current numeric sender IDs already allowed

Treat the already working user's numeric Telegram ID as the source of truth for the permission shape.

### 4. Resolve the new Telegram user's numeric ID

Preferred path when a trusted local Telegram helper exists:

```bash
curl -s http://127.0.0.1:8080/resolve/<username>
curl -s 'http://127.0.0.1:8080/chats/list?limit=200'
curl -s http://127.0.0.1:8080/health
```

Fallback paths:

- inspect recent local logs for the username or sender ID
- inspect local Telegram integration tooling on the host
- use an existing Telegram API helper already trusted on that machine

Do not continue until the new user's numeric Telegram ID is known exactly.

### 5. Enforce separate DM sessions

Set:

```json
{
  "session": {
    "dmScope": "per-channel-peer"
  }
}
```

Reason:

- each Telegram DM sender gets a separate session key
- the new user does not inherit the existing user's DM memory
- group chat sessions remain keyed by chat as normal

### 6. Add the new user to the same allowlists

Update the active config so the new numeric ID is added alongside the existing allowed user in both:

- `channels.telegram.allowFrom`
- `channels.telegram.groupAllowFrom`

Safe patch pattern:

```bash
python3 - <<'PY'
import json
from pathlib import Path

path = Path.home() / ".openclaw" / "openclaw.json"
data = json.loads(path.read_text())
telegram = data.setdefault("channels", {}).setdefault("telegram", {})

existing_user_id = "EXISTING_NUMERIC_ID"
new_user_id = "NEW_NUMERIC_ID"

for key in ("allowFrom", "groupAllowFrom"):
    values = [str(value) for value in telegram.get(key, [])]
    for wanted in (existing_user_id, new_user_id):
        if wanted not in values:
            values.append(wanted)
    telegram[key] = values

session = data.setdefault("session", {})
session["dmScope"] = "per-channel-peer"

path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n")
PY
```

Validate immediately:

```bash
python3 -m json.tool ~/.openclaw/openclaw.json >/dev/null
grep -n 'allowFrom\|groupAllowFrom\|dmScope' ~/.openclaw/openclaw.json
```

### 7. Reload the gateway

Preferred:

```bash
systemctl --user restart openclaw-gateway.service
```

Then verify:

```bash
systemctl --user status openclaw-gateway.service --no-pager
journalctl --user -u openclaw-gateway.service -n 120 --no-pager
```

Good signs:

- service is `active (running)`
- no config parse errors
- no fresh `allowlist`, `blocked`, or `pairing` failures caused by the edit

### 8. Require a real Telegram probe

Do not claim success without a live check.

Verify:

1. the new user can DM the bot and receive a reply
2. the old user still works
3. both users can use commands in the same already-allowed group chats
4. DM memory stays separate between the two users

If logs still show access denials for the new user, the rollout is incomplete.

## Fast Checklist

- [ ] backup of `~/.openclaw/openclaw.json` created
- [ ] active service and config path confirmed
- [ ] existing allowed Telegram numeric ID identified
- [ ] new Telegram numeric ID resolved exactly
- [ ] new ID added to both `allowFrom` and `groupAllowFrom`
- [ ] `session.dmScope` set to `per-channel-peer`
- [ ] gateway restarted and healthy
- [ ] real Telegram probe completed

## Anti-Patterns

- do not use `allowFrom: ["*"]` for this task
- do not create a second bot when access parity is enough
- do not copy or merge DM session files
- do not assume usernames are the runtime allowlist key; use numeric Telegram IDs
