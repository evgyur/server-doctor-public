# OpenClaw TaskFlow Ops

Use this reference when an OpenClaw repair or migration is multi-step, interruption-prone, or should survive restart and handoff.

## When to use TaskFlow-style handling
Use a durable execution path when the work involves:
- restart plus soak verification
- multi-step live recovery
- approvals or maintenance windows
- cross-host cutover or rollback
- a fix that needs re-checks over time
- operator handoff between diagnosis and implementation

## Working rule
Do not treat a multi-step live recovery as a single chat reply.
Break it into:
1. target confirmation
2. evidence capture
3. smallest corrective action
4. post-action verification
5. checkpoint / handoff note

## Minimal recovery ledger
Track these explicitly:
- target runtime
- current symptom
- current hypothesis
- action just taken
- evidence captured
- next verification target
- rollback or safe-stop path
- remaining unknowns

## Good chunk shape
One chunk should have:
- one objective
- one smallest viable action
- one validation target
- one checkpoint note

## Example chunk sequence
1. confirm canonical runtime and logs
2. clear one narrow source of drift
3. restart only the affected component
4. verify with a real probe
5. soak briefly if the failure was intermittent
6. checkpoint the result before the next chunk

## Completion rule
Do not say the incident is resolved until the latest chunk has fresh verification evidence.

## Handoff rule
If another operator may resume the work, leave a short ledger note that answers:
- what is proven
- what was changed
- what still needs verification
- how to resume safely
