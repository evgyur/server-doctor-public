# Server Doctor Routing Stack

Use this stack before diving into any detailed reference.

## Step 1. Classify the task
Choose one primary class:
- access / host targeting
- generic host audit
- OpenClaw update
- OpenClaw incident
- topology / ownership
- host-specific ops
- security / forensics
- backup / restore

## Step 2. Read one doctrine anchor
Pick the minimal doctrine anchor that governs the task:
- health / evidence -> `references/health-claims-and-evidence.md`
- generic audit -> `references/openclaw-host-audit.md`
- generic baseline checks -> `references/routine-admin.md`
- outage wording -> `references/outage-classification.md`

## Step 3. Read one runbook
Pick the smallest platform runbook that matches the class.

Typical runbooks:
- `references/openclaw-incident-response.md`
- `references/openclaw-update-workflow.md`
- `references/security-forensics.md`
- `references/onboarding.md`
- `references/openclaw-taskflow-ops.md`

## Step 4. Add overlays only as needed
Use overlays for environment-specific facts and operator-local mapping:
- `references/hosts-inventory.md`
- `references/bot-service-map.md`
- any operator-maintained private inventory outside this public repo

## Step 5. Use incident notes last
Use dated incident files only when:
- current symptoms materially resemble that incident
- or you need a proven precedent after the current route is already chosen

## Anti-slop rule
- do not read multiple environment-specific references before the doctrine anchor is clear
- do not let a dated incident note become the primary router
- do not start with topology lore when the operator only asked for a generic health check
