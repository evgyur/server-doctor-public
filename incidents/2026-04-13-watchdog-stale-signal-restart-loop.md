# 2026-04-13 — Watchdog stale-signal restart loop

## Summary

A custom watchdog repeatedly restarted an OpenClaw gateway even after the gateway itself had recovered.
The watchdog re-read old severe log signals from a sliding journal window and treated them as if they came from the current process epoch.

## User-visible symptom

- gateway looked briefly healthy after restart
- watchdog logs kept showing restart decisions
- service entered a flapping or unstable state

## What was proved

### 1. The watchdog, not the gateway, was the restart source

The watchdog explicitly inspected logs, decided on a severe condition, killed the process, and restarted it.

### 2. Sliding log windows were replaying old evidence

The watchdog read a recent time window from the journal, but that window still contained severe events emitted by an older process instance.
A fresh process was therefore punished for historical evidence.

### 3. This was an epoch-isolation defect

The core bug was not only aggressive restart policy.
It was the lack of binding between severe-event evaluation and the current runtime epoch.

## Correct recovery

1. identify the current main PID and start time
2. evaluate severe signals only if they are newer than the current runtime epoch, or use a durable cursor / watermark
3. suppress duplicate handling of the same severe signal
4. add cooldown for severe-signal restarts
5. keep fast restart behavior only for genuinely inactive service conditions

## Validation

Require all of these:
- watchdog syntax and smoke checks pass
- historical severe signals no longer trigger restarts for a fresh healthy process
- watchdog logs show healthy `ok` cycles instead of repeated restart actions
- the gateway remains stable across multiple timer cycles

## Operational lesson

For log-driven watchdogs:
- `journalctl --since` is not enough on its own
- restart decisions must be tied to the current process epoch or a durable journal cursor
- otherwise the watchdog becomes the flapping source
