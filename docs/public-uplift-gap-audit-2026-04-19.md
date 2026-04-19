# server-doctor-public uplift gap audit (2026-04-19)

Goal: bring `server-doctor-public` closer to the operational maturity of the private `server-doctor` skill without copying secrets, host-specific overlays, or private topology.

## What is missing vs private

### 1. Architecture and routing layer
Missing public-safe doctrine files:
- `references/routing-stack.md`
- `references/principal-architecture.md`
- `references/principal-rubric.md`
- `references/review-gate.md`
- `references/core/INDEX.md`
- `references/overlays/INDEX.md`

Impact:
- the public repo has useful runbooks, but weaker routing and placement discipline
- reusable knowledge is not clearly separated into doctrine, runbook, overlay, and incident layers

### 2. Inventory / topology / host mapping layer
Missing public-safe references:
- `references/hosts-inventory.md`
- `references/bot-service-map.md`
- `references/openclaw-taskflow-ops.md`

Impact:
- weaker intake and access-map workflow
- less structure for host-to-service mapping and multi-step recovery orchestration

### 3. Update / incident maturity
Missing public-safe references:
- `references/openclaw-update-workflow.md`
- `incidents/INDEX.md`
- a public-safe incident catalog derived from private learnings

Impact:
- update handling is less canonical
- reusable incident memory is not packaged as a searchable public runbook set

### 4. Platform overlays that need generic public variants
Private has additional references that should be re-authored publicly, not copied literally:
- `references/mac-mini-ops.md`
- `references/scrum-dashboard-ops.md`
- `references/tailscale-exit-node.md`
- `references/claude-tailscale-proxy.md`
- `references/openclaw-ryzen64-agent-topology.md`

Impact:
- public repo lacks some higher-level operational patterns
- these need generalized versions with placeholders and redactions

### 5. Script and test parity
Private includes additional utilities or renamed variants:
- `scripts/openclaw-post-update-transport-hotfix.sh`
- `scripts/openclaw-single-gateway.sh`
- `scripts/openclaw-intel64-chip-preflight.sh` (private-specific, should not be copied directly)
- `scripts/review_placement.py`
- related tests

Impact:
- public repo lacks some remediation paths and doc quality checks
- host-specific preflight should become a generic public equivalent, not a direct port

## What should NOT be copied directly

Do not directly port:
- hostnames
- user names
- internal bot names
- Telegram usernames
- chat ids
- IPs, domains, emails
- private incident narratives with identifying details
- host-specific preflight scripts tied to named environments
- overlays whose value depends on private topology

## Safe uplift strategy

### Track A. Public doctrine parity
Recreate architecture/routing docs in public-safe form:
1. `routing-stack.md`
2. `principal-architecture.md`
3. `principal-rubric.md`
4. `review-gate.md`
5. `core/INDEX.md`
6. `overlays/INDEX.md`

### Track B. Public operational parity
Add generic runbooks:
1. `hosts-inventory.md`
2. `bot-service-map.md`
3. `openclaw-update-workflow.md`
4. `openclaw-taskflow-ops.md`
5. public-safe `tailscale-exit-node.md`

### Track C. Incident packaging
Create:
1. `incidents/INDEX.md`
2. 3 to 5 sanitized incident exemplars rewritten as generic patterns
3. links from `openclaw-incident-response.md` into those exemplars

### Track D. Script/test parity
Add public-safe versions of:
1. `openclaw-post-update-transport-hotfix.sh` naming alignment or compatibility wrapper
2. `openclaw-single-gateway.sh`
3. `review_placement.py`
4. tests for the above

### Track E. Secret-safety pass
Before publishing or merging:
1. grep for identifying strings and private topology residue
2. review docs for accidental host fingerprints
3. ensure examples use placeholders and role labels
4. verify no verbatim private incident exports remain

## Recommendation

Best path is not "copy private into public and redact later".

Best path is:
- use private as source material
- rewrite into public doctrine and generic runbooks
- only port scripts when they are topology-agnostic or can be parameterized cleanly
- add a final secret-safety review before merge
