# Incident Memory Index

Canonical incident-memory layer for `server-doctor-public`.

Use incident notes as evidence and precedent only after the current route is already chosen.

## Current sanitized incident notes
- `2026-03-28-runtime-bundle-corruption-and-wrong-root-hotfix.md`
- `2026-04-01-plugin-runtime-contract-drift.md`
- `2026-04-13-watchdog-stale-signal-restart-loop.md`
- `2026-04-17-post-update-dual-root-and-periodic-restart-loop.md`

## Rules
- incident notes are not the first router
- read doctrine first, then runbook, then overlays, then precedent
- if an incident lesson generalizes, promote it into doctrine or a runbook
- if a note is only historical narrative, keep it here and do not pollute the main router
