# Server Doctor Review Checklists

Use these checklists after structural changes to the `server-doctor` skill or its runbook layer.

## Quick test checklist

- [ ] `SKILL.md` stays router-first and points to focused references.
- [ ] `references/health-claims-and-evidence.md` remains valid.
- [ ] `references/outage-classification.md` remains valid.
- [ ] `references/openclaw-incident-response.md` remains valid.
- [ ] `references/openclaw-update-workflow.md` remains the canonical update workflow.
- [ ] `references/routine-admin.md` remains valid.
- [ ] `references/security-forensics.md` remains valid.
- [ ] `references/agent-tasking-for-server-ops.md` remains valid.
- [ ] `references/server-doctor-fast-paths.md` remains valid.
- [ ] `references/server-doctor-command-layer.md` remains valid.
- [ ] Current official OpenClaw and Hermes documentation sources remain documented.
- [ ] `scripts/doctor-mvp.sh` remains documented and callable.
- [ ] Public scripts do not hardcode private hosts, chat IDs, account names, or tokens.
- [ ] Public examples use placeholders such as `<host-alias>` and `<service>`.

## Manual review checklist

- [ ] One file = one purpose.
- [ ] No public-safe upstream files were accidentally removed.
- [ ] Secret inventory stays out of the public repo.
- [ ] Root `SKILL.md` is readable in under 1 minute.
- [ ] Existing operator workflow is backward-compatible.
- [ ] OpenClaw updates still route through one mandatory canonical workflow.
- [ ] Spec correctness is visibly separated from ops quality.
- [ ] Incomplete visibility cannot be mistaken for outage proof.
- [ ] Recovery claims still require post-fix proof.
- [ ] New reusable findings are written into the matching public-safe reference before completion.

## Privacy review checklist

Block public publication if a changed file contains:

- real tokens, cookies, private keys, or credential file contents;
- real private IPs, private hostnames, or personal machine aliases;
- Telegram chat IDs, phone numbers, account IDs, or bot tokens;
- local absolute paths from a private operator machine;
- raw private chat logs, incident dumps, or customer/user payloads;
- product-specific infrastructure overlays that are not meant as public examples.

When a private incident produced a useful lesson, publish the pattern, not the raw incident: replace identities with roles, replace exact paths with placeholders, and remove timestamps unless they are essential to the reusable lesson.

## Backward compatibility notes

- Skill name remains `server-doctor`.
- `references/openclaw-incident-response.md` path stays valid.
- `references/openclaw-update-workflow.md` path stays valid.
- Command entrypoints under `scripts/` keep their public CLI shape.
- New references are additive packaging improvements.
