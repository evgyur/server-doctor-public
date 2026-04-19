# Server Doctor Principal Architecture

Use this reference to keep `server-doctor-public` operating like a principled system instead of a growing pile of ad hoc notes.

## Core design law

`server-doctor` has four layers. Do not mix them casually.

### 1. Core operational doctrine
Portable rules that should survive host changes:
- access-map first
- spec correctness before ops-quality labels
- evidence hierarchy
- recovery requires post-action proof
- smallest-safe-change first

Canonical references:
- `references/health-claims-and-evidence.md`
- `references/outage-classification.md`
- `references/openclaw-host-audit.md`
- `references/routine-admin.md`

### 2. Platform runbooks
Reusable operating paths:
- OpenClaw incidents
- OpenClaw updates
- onboarding
- security / forensics
- taskflow-oriented live recovery

These should stay reusable across multiple environments.

### 3. Environment overlays
Environment-specific facts maintained in a public-safe shape:
- host inventory templates
- bot / service ownership maps
- runtime topology summaries
- host-specific operating notes if they are sanitized enough to share

Canonical references:
- `references/hosts-inventory.md`
- `references/bot-service-map.md`

### 4. Incident memory
Concrete dated incidents and postmortem-derived lessons.

These are evidence and pattern sources, not the first routing layer.
They should sharpen diagnosis after the core route is chosen.

## Routing contract

When a new task arrives, route in this order:
1. classify the request type
2. read the matching core doctrine first
3. read the relevant platform runbook
4. only then read overlays or incident notes as needed

## Documentation placement rules

Put new information in the highest reusable layer that fits:
- doctrine lesson -> core doctrine refs
- platform workflow improvement -> platform runbook
- environment-specific fact -> overlay
- one-off historical example -> dated incident note

If a lesson generalizes across environments, do not bury it only in an incident note.

## Done criteria for principal-grade changes
- routing got clearer, not just longer
- reusable doctrine moved upward
- environment-specific details stayed isolated
- incident notes remain examples, not the main router
- a future operator can answer `where should this lesson live?` quickly
