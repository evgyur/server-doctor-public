# 2026-04-01 — Plugin runtime contract drift

## Summary

After a restart or update window, the gateway stayed mostly alive, but one plugin-backed workflow silently failed.
The real problem was not global Telegram transport or a full gateway outage.
The plugin depended on runtime helper methods that were absent or had changed shape on the live host.

## User-visible symptom

- gateway looked healthy enough in shallow checks
- one bound workflow or plugin lane stopped replying
- logs showed plugin exceptions like `Cannot read properties of undefined (...)`

## What was proved

### 1. Gateway health and plugin health were not the same thing

The provider and main process could still be up while one plugin execution path crashed.
This made the incident easy to misclassify as transport failure.

### 2. The plugin depended on an optional runtime surface

The failing code assumed channel-specific helpers existed under the runtime API.
That assumption was no longer safe on the live contour.

### 3. Guarding only the first failing call was not enough

After one helper was wrapped or guarded, the next missing helper surfaced.
That proved the issue was contract drift across a wider helper surface, not one isolated method.

## Correct recovery

1. separate gateway health from plugin health
2. identify channel-specific runtime calls inside the plugin
3. preserve legacy helpers when present
4. add compatibility fallbacks for the missing helper paths
5. contain hook failures so one bad event does not crash the whole plugin lane
6. patch both the live runtime copy and the canonical source repo if both exist

## Validation

Require all of these:
- no immediate plugin import or handler crash after restart
- no fresh `undefined` runtime-helper errors on the affected path
- the bound workflow replies again
- canonical tests pass in the plugin source repo

## Operational lesson

When the gateway is green but one plugin-backed workflow goes silent right after update or restart, suspect runtime contract drift before declaring transport outage.
