# server-doctor-public

Public-safe operational runbooks, tests, and agent instructions for keeping Hermes Agent, OpenClaw, Telegram gateways, and small automation deployments healthy.

The repository preserves reusable operational patterns while excluding real hostnames, IPs, chat identifiers, credentials, private repositories, operator paths, and customer-specific topology.

## What is included

- `SKILL.md` — concise routing and execution contract
- `references/` — evidence standards, incident/update runbooks, command routing, and review gates
- `incidents/` — sanitized incident patterns rather than private timelines
- `scripts/` — parameterized diagnostics, bounded repair helpers, and public-safety gates
- `tests/` — regression tests and repository hygiene checks
- links to current official Hermes Agent and OpenClaw documentation instead of bundled mirrors

## Hermes operations layer

- `references/hermes-agent-operations.md` — official-docs-first diagnosis, gateway evidence ladder, perceived silence, and chat-specific access failures
- `references/hermes-fork-update-workflow.md` — safe maintained-fork updates through backups, disposable worktrees, validation, and detached restart boundaries
- `references/hermes-telegram-delivery-regressions.md` — clipped finals, stale previews, duplicate sends, progress cleanup, and reply-context ordering
- `incidents/patterns/auth-store-permission-mismatch.md` — credentials exist but the runtime user cannot read them
- `incidents/patterns/partial-module-extraction-after-merge.md` — caller/callee contract drift that syntax checks miss
- `scripts/hermes-fork-update.py` — non-pushing preflight and merge-candidate helper

## Core operating model

1. Map the target: host, runtime owner, service manager, checkout/state directory, and safe access method.
2. Collect low-risk evidence before mutation.
3. Separate confirmed facts from assumptions.
4. Diagnose the actual layer: host, service, process, config, network, auth, provider, platform transport, session, or source checkout.
5. Apply the smallest reversible fix.
6. Verify with the same failing probe plus an end-to-end user path when policy allows it.
7. Convert reusable lessons into public-safe runbooks, tests, or incident patterns.

For Git-backed live runtimes, use `references/repo-backed-runtime-update-workflow.md`. Before publishing a lesson derived from private operations, use `references/public-sanitization-checklist.md` and scan added lines without printing matched values.

## Clone for manual use

Clone the full repository. A raw `SKILL.md` download is not sufficient because the operational package depends on references, scripts, and tests.

This repository contains privileged operator tooling and is **not advertised as a one-click Hermes community-skill install**. Review `SECURITY.md`, load it as project context, and approve mutating helpers case by case.

```bash
git clone https://github.com/<owner>/server-doctor-public.git
cd server-doctor-public
```

## Verification

```bash
npm test
python3 scripts/privacy_gate.py --root .
python3 scripts/review_placement.py
python3 scripts/check-public-safety.py --staged
git diff --check
```

`privacy_gate.py` scans tracked files plus non-ignored untracked files; in an exported package it scans the filesystem tree. Ignored local state is outside its publication boundary. `check-public-safety.py` scans only added lines and suppresses matched values. Full third-party documentation mirrors are intentionally not bundled because they become stale and drown repository scans in unrelated examples.

For operator-specific aliases that do not have a generic shape, keep a newline-delimited marker list outside the repository and add `--private-markers-file <untracked-path>`. Never encode the real marker corpus in public scanner source or tests.

## Hermes fork update preflight

The helper defaults to read-only preflight:

```bash
python3 scripts/hermes-fork-update.py \
  --mode preflight \
  --live-root <live-checkout> \
  --distribution-ref <remote/main> \
  --upstream-ref <upstream/main> \
  --report <external-report-root>/hermes-update-preflight.json
```

Omit `--report` for stdout-only preflight with no report file. Report paths inside any registered Git worktree are rejected.

Candidate mode creates a disposable merge worktree and runs merge-sanity checks only. It exits `3` with `status=operator-validation-required`, `ok=false`, and `candidate.validated=false` until an operator runs the focused compile/test gate. It deliberately does not execute merged code, push, move the live checkout, restart services, accept operator-supplied commands, or include command output and absolute checkout paths in its JSON report. Git hooks are disabled for candidate creation and merge.

Remote gateway repair currently supports regular accounts whose home is `/home/<runtime-user>` and whose primary group equals the runtime username. It fails closed for other account layouts instead of guessing ownership.

## Safety and privacy

This is a high-privilege operational skill. Read [`SECURITY.md`](SECURITY.md) before running mutating helpers.

Do not commit:

- API keys, bot tokens, OAuth secrets, SSH keys, cookies, or `.env` values;
- private hostnames, IP addresses, chat/user identifiers, emails, or customer names;
- raw logs, session dumps, auth stores, or message bodies;
- operator-specific home paths, service maps, allowlists, or private fork names;
- literal private incident exports.

Use placeholders:

```text
<host>
<runtime-user>
<service-unit>
<repo-path>
<state-directory>
<chat-id>
```

## Contributing

Good contributions are small and evidence-backed:

- a focused regression test for a real failure class;
- a clearer runbook with rollback and verification;
- a sanitized incident pattern;
- a parameterized helper with safe defaults;
- a stronger privacy or placement gate.

Before opening a PR:

```bash
npm test
python3 scripts/privacy_gate.py --root .
python3 scripts/review_placement.py
python3 scripts/check-public-safety.py --staged
git diff --check
```

## License

MIT. See [`LICENSE`](LICENSE).
