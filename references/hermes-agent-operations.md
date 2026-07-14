# Hermes Agent operations

Use this reference for Hermes Agent gateway incidents, runtime health checks, messaging failures, and post-update verification.

## Source of truth

Consult the current official documentation before relying on local notes:

- `https://hermes-agent.nousresearch.com/docs/llms-full.txt` — full machine-readable documentation
- `https://hermes-agent.nousresearch.com/docs/llms.txt` — compact index
- `https://hermes-agent.nousresearch.com/docs/` — public documentation
- `https://github.com/NousResearch/hermes-agent` — upstream source

If the full documentation is unavailable, say so and label conclusions as local-repository or live-runtime evidence.

## Evidence ladder

A running process is not enough to claim recovery. Check in this order:

1. **Target** — identify the checkout, runtime user, service unit, Hermes home, and active profile.
2. **Process** — inspect the service manager and recent restart count.
3. **API** — probe the configured local health endpoint.
4. **Gateway state** — inspect `$HERMES_HOME/gateway_state.json` for gateway and platform state.
5. **Logs** — correlate gateway and agent logs for the affected session or channel.
6. **Transport** — run a bounded user-facing round trip when policy allows it.

Example skeleton:

```bash
systemctl status <service-unit> --no-pager -l
journalctl -u <service-unit> -n 200 --no-pager
curl -fsS http://127.0.0.1:<api-port>/health
python3 -m json.tool "$HERMES_HOME/gateway_state.json"
```

Report a blocked transport probe as `blocked by policy`, not as a gateway failure. Do not silently broaden an allowlist just to obtain a green check.

## Perceived silence without an outage

When a user says Hermes stopped answering, separate these states before restarting:

- gateway process is down;
- platform adapter is disconnected;
- the exact chat is not reachable by the configured bot identity;
- a turn is still running or waiting on a long tool call;
- a turn ended as interrupted with no final response;
- delivery failed after the model completed;
- a stale session mapping points at an ended session while later turns still work.

Correlate:

- inbound timestamp and channel/session identifier in gateway logs;
- matching agent turn start/end and termination reason;
- `response ready` and outbound send records;
- long tool durations or context-compression activity;
- fresh platform connection state.

Do not restart solely because a chat is waiting while logs show an active model or tool call. A restart can destroy the original evidence and interrupt the turn.

## Chat-specific silence

When only one private group or channel is silent:

1. confirm the running bot identity using the platform API;
2. resolve and test the exact target chat identifier;
3. check bot membership and platform privacy mode;
4. inspect private/public chat policy and mention/reply requirements;
5. search logs and session state for that exact target;
6. only then investigate model or conversation-loop failure.

A platform response equivalent to `chat not found` while owner/direct-message access works usually means the bot was never added, was removed, or the link belongs to another bot/runtime. Classify this as targeting or membership failure, not an LLM outage.

## Post-update verification

After an update that touches gateway, session, platform, or conversation-loop code:

```bash
python -m py_compile <changed-python-files>
python -m pytest <focused-tests> -q -o 'addopts='
git diff --check
```

Then verify:

- the intended branch and commit are live;
- the service remains stable beyond the first active snapshot;
- the API health endpoint is green;
- required platforms are connected;
- a bounded end-to-end message works when allowed;
- no fresh traceback appears after the probe.

## Output contract

Report:

- target checkout, runtime user, service unit, and access path;
- process, API, gateway-state, log, and transport evidence separately;
- whether the issue is outage, degradation, targeting, long-running work, interruption, or delivery failure;
- changes made and rollback path;
- remaining unverified layer, if any.
