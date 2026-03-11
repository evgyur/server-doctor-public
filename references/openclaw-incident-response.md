# OpenClaw Incident Response

Use this reference when a Telegram bot is slow, unresponsive, partially working, or failing after startup.

## Symptom buckets

### 1. Process is down

Checks:

```bash
ps aux | grep -Ei 'openclaw|gateway' | grep -v grep
systemctl status <service> --no-pager
launchctl list | grep -Ei 'openclaw|gateway'
```

Likely causes:

- crashed process
- failed boot dependency
- broken service definition
- missing environment after reboot

### 2. Process is up, but Telegram does not respond

Checks:

```bash
journalctl -u <service> -n 200 --no-pager
tail -n 200 <logfile>
```

Look for:

- authentication failures
- Telegram delivery errors
- network timeouts
- upstream model failures
- stale sockets
- queue backlog

### 3. Bot replies slowly

Look for:

- provider latency
- repeated retries
- model failover loops
- blocked dependencies
- CPU or memory pressure
- container restarts

### 4. Some features work, others fail

This often indicates a dependency problem rather than a gateway problem.

Check:

- local HTTP dependencies
- helper bots
- sidecar APIs
- databases
- browser-control endpoints
- cron or scheduler jobs

## Recovery order

1. Capture recent logs.
2. Confirm the dependency graph.
3. Restart the smallest failing component first.
4. Verify the gateway only after dependencies are healthy.
5. Re-test with a known-safe command.

## What to avoid

- do not rotate secrets during first response unless compromise is suspected
- do not wipe state directories to “start fresh”
- do not delete sessions, volumes, or compose stacks without evidence
- do not publish raw logs if they may contain tokens or private routing data

## Public-safe incident summary format

- symptom
- scope
- confirmed healthy components
- confirmed failing components
- probable root cause
- recovery action taken
- residual risk
