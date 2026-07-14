---
name: server-doctor
description: Public-safe diagnosis and repair patterns for Hermes Agent, OpenClaw, Telegram gateways, services, providers, sessions, and small server fleets. Use for incidents, health checks, maintained-fork updates, deployment verification, and postmortems without exposing private infrastructure.
version: 1.1.0
license: MIT
---

# Server Doctor

Public-safe router for agent infrastructure operations. It intentionally contains no real host inventory, chat identifiers, credentials, private repositories, or operator-specific paths.

## Core rule

Map the target before acting, collect low-risk evidence, apply the smallest safe change, and verify the user path before claiming recovery.

Keep environment facts in private overlays outside this repository. Keep reusable doctrine and generic runbooks here.

## Safety boundary

- Do not request or print credentials, tokens, cookies, private keys, raw auth stores, or private message bodies.
- Do not copy `.env`, runtime config, service units, or logs verbatim into public docs.
- Do not restart, update, reset, or overwrite a live checkout until the target, owner, rollback, and verification path are known.
- A running process is not proof that an API, platform adapter, or end-to-end message path works.
- When access is incomplete, continue only with reachable evidence and label the result `partial map`.

## Start here

Before deep diagnosis, read:

- `references/routing-stack.md`
- `references/principal-architecture.md`
- `references/server-doctor-fast-paths.md`
- `references/server-doctor-command-layer.md`
- `references/health-claims-and-evidence.md`
- `references/outage-classification.md`
- `incidents/INDEX.md`

Use this placement order:

1. doctrine anchor;
2. platform runbook;
3. private environment overlay maintained outside this repository;
4. sanitized incident pattern.

For a live service deployed from Git, read `references/repo-backed-runtime-update-workflow.md` before updating. It covers live-checkout proof, dirty-state backup, disposable-worktree integration, ancestry checks, detached restart, and end-to-end verification without exposing private fork details.

Before moving any lesson from a private runbook or incident into this repository, read `references/public-sanitization-checklist.md` and run `scripts/check-public-safety.py` against the added lines.

## Non-negotiable warning

Do not restart, update, reset, or overwrite a live checkout until the target, owner, rollback, and verification path are known. Never publish raw evidence from a private environment.

## Access map

Build the minimum usable map:

```text
Host or machine:
Role:
Known services:
Runtime owner:
Service manager or container runtime:
Canonical checkout/state directory:
Status/log/restart paths:
Safe access method:
Missing information:
```

Declare one state:

- `mapped` — target, runtime owner, and access path are known;
- `partial map` — useful evidence exists, but some ownership, location, or access facts are missing;
- `unreachable` — the target exists, but no current safe inspection path is available.

Separate confirmed facts, assumptions, and blockers.

## Reference routing

### Routine host and service checks

Read:

- `references/routine-admin.md`
- `references/openclaw-host-audit.md`
- `references/hosts-inventory.md` — public template, never a real inventory dump
- `references/bot-service-map.md` — public template for service ownership

### OpenClaw incidents and updates

Read:

- `references/openclaw-incident-response.md`
- `references/openclaw-update-workflow.md`
- `references/repo-backed-runtime-update-workflow.md`
- `references/openclaw-taskflow-ops.md`
- `references/openclaw-telegram-access-parity.md`
- `references/server-doctor-fast-paths.md`
- `references/server-doctor-command-layer.md`

For update work, read `references/openclaw-update-workflow.md` before mutation and require post-update health plus an end-to-end probe.

### Hermes Agent operations

Read:

- `references/hermes-agent-operations.md` — official docs, evidence ladder, health and chat-specific silence
- `references/hermes-fork-update-workflow.md` — maintained-fork update and disposable-worktree workflow
- `references/hermes-telegram-delivery-regressions.md` — clipping, stale previews, duplicates, and reply-context loss

For Hermes tasks, consult `https://hermes-agent.nousresearch.com/docs/llms-full.txt` as the current upstream documentation source, then verify the live runtime.

### Delegating server work

Read `references/agent-tasking-for-server-ops.md` before handing an operation to a coding agent or subagent. Require exact target/access path, raw evidence, minimal mutation, rollback, focused tests, and proof before `fixed`.

### Security, access, and onboarding

Read:

- `references/security-forensics.md`
- `references/onboarding.md`

Use these references for attribution, audit logging, SSH hardening, least privilege, firewall posture, and new-host handoff.

Public boundary:

- `references/public-sanitization-checklist.md`

Environment overlays:

- `references/hosts-inventory.md`
- `references/bot-service-map.md`

### Incident patterns

Start with `incidents/INDEX.md`. Reusable public examples include:

- `incidents/patterns/auth-store-permission-mismatch.md`
- `incidents/patterns/partial-module-extraction-after-merge.md`

Publish the reusable failure class, not the real host, account, timeline, message body, or repository history.

## Workflow

1. Identify canonical host, owner, service, checkout/state directory, and source of truth.
2. Gather process, logs, disk/memory, ports, config shape, and repository evidence without exposing secrets.
3. Classify the failing layer: host, service manager, process, container, network, auth, provider, platform transport, session, or source checkout.
4. Choose the narrowest reversible repair.
5. Record rollback before mutation.
6. Re-run the same probe that demonstrated failure.
7. Add a user-facing or end-to-end probe when policy permits.
8. Convert reusable findings into a generic reference, test, or sanitized incident pattern.
9. Run the public privacy gate before publication.

## Public helper scripts

- `scripts/doctor-mvp.sh` — bounded host diagnostic snapshot
- `scripts/openclaw-auth-profile-sync.sh` — parameterized auth-profile drift inspection and repair
- `scripts/openclaw-telegram-transport-hotfix.sh` — bounded transport compatibility workflow
- `scripts/openclaw-post-update-transport-hotfix.sh` — post-update compatibility recheck
- `scripts/openclaw-single-gateway.sh` — parameterized single-gateway canonicalization
- `scripts/macos-single-openclaw-runtime.sh` — macOS runtime duplication checks
- `scripts/normalize-openclaw-models.py` — model normalization helper
- `scripts/openclaw-native-codex-stability-audit.py` — read-only stability audit
- `scripts/hermes-fork-update.py` — preflight and disposable merge-candidate preparation; never pushes or restarts
- `scripts/privacy_gate.py` — repository-wide privacy and secret-residue gate
- `scripts/review_placement.py` — doctrine/runbook/overlay/incident placement check

Read `references/server-doctor-command-layer.md` before applying any mutating helper.

## OpenClaw documentation

Use the current official documentation at `https://docs.openclaw.ai`. Do not bundle a full documentation mirror into this skill: it becomes stale, inflates safety scans, and can hide real repository findings in upstream examples.

## Public privacy gate

Before commit or publication:

```bash
python3 scripts/privacy_gate.py --root .
python3 tests/test_public_hygiene.py
npm test
git diff --check
```

The privacy scan includes tracked and untracked repository content and path names. It fails closed on non-UTF-8/unreadable publishable files and redacts sensitive path names in findings. Do not add excluded content roots that could hide private residue.

## After-action rule

Capture reusable findings in this shape:

```text
Symptom:
Evidence/probes:
Root cause:
Fix or code contract:
Verification:
Rollback/deployment notes:
Future guardrail:
```

Placement:

- reusable operational law → core doctrine;
- reusable platform workflow → platform runbook;
- environment fact → private overlay outside this repo;
- reusable historical failure → sanitized incident pattern.

## Output Contract

Return a compact operational report containing:

- target and access path;
- map state;
- confirmed facts, assumptions, and missing evidence;
- spec correctness separated from operational health;
- commands/probes and result state;
- changes, rollback, and verification;
- remaining blocker or next action.

Never include secrets, raw tokens, private chat content, real host inventory, or credentials.

## Quick Test Checklist

- [ ] Matching reference was selected before deep action.
- [ ] Canonical target/runtime/source of truth was verified directly.
- [ ] Dirty repository or runtime drift was attributed before mutation.
- [ ] Raw errors were inspected without publishing secret-bearing payloads.
- [ ] Mutation was followed by focused and end-to-end verification.
- [ ] Reusable findings were written as generic doctrine/runbook/test/pattern.
- [ ] `python3 scripts/privacy_gate.py --root .` passed for the full repository.
- [ ] Focused tests and `git diff --check` passed.

## Done Criteria

A task is complete when:

- [ ] the target and source of truth are identified, or missing access is named;
- [ ] claims match current evidence strength;
- [ ] the smallest safe repair was applied or a real blocker was isolated;
- [ ] rollback and verification are recorded;
- [ ] public documentation contains reusable patterns only;
- [ ] validation passes, or every remaining failure is reported honestly.
