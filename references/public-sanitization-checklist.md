# Public sanitization checklist

Use this before converting a private operational finding into a public runbook, test, script, issue, or incident note.

## Clean-room rule

Do not copy a private incident or runbook and then try to redact it line by line. Extract the reusable contract, write a new public version from scratch, and verify that the new text stands alone.

## Never publish

- credentials, tokens, cookies, private keys, session strings, or `.env` values;
- private hostnames, addresses, domains, email addresses, account names, or repository remotes;
- chat, user, message, tenant, customer, booking, or internal incident identifiers;
- raw logs, database rows, transcripts, screenshots, or message bodies;
- private absolute paths, home-directory usernames, SSH aliases, service-account names, or inventory maps;
- exact firewall allowlists, tunnel endpoints, or hidden network topology;
- backup contents, untracked-file names, or diffs that may expose any of the above.

## Convert private evidence into public structure

Use this shape:

```text
Symptom:
Evidence/probes:
Root cause:
Minimal fix / code contract:
Verification:
Rollback:
Future guardrail:
```

Replace local details with neutral roles and variables:

```text
<host>
<runtime-user>
<service>
<repo-path>
<state-directory>
<endpoint>
<chat-id>
<agent-id>
```

Prefer shell variables such as `$LIVE_REPO`, `$SERVICE`, and `$BACKUP_ROOT` when the value must be reused.

## Generalization tests

Before publishing, ask:

- Would this still help an operator with different hosts, users, services, and chat platforms?
- Is the lesson a reusable contract, or merely a diary of one environment?
- Does the example reveal which private systems exist or how they connect?
- Could a reader reconstruct an address, identity, credential, or private route from several harmless-looking fragments?
- Are exact timestamps and commit IDs necessary, or can the public note describe ordering and evidence instead?

If the answer exposes private topology without improving the reusable procedure, remove it.

## Scripts and tests

- Parameterize target paths, users, IDs, ports, and service names.
- Default network listeners to loopback.
- Use fake/test credentials only; label them clearly.
- Write evidence to a relative operator-selected directory.
- Never print secret values on failure; print the rule and file/line only.
- Keep generated runtime state, caches, reports, and local config out of Git.
- Test both a clean fixture and representative leak-shaped fixtures.

## Two-layer scan

Before commit, run the strict authored-tree gate, then stage the intended files and scan additions:

```bash
python3 scripts/check-public-safety.py --authored
python3 scripts/check-public-safety.py --staged
```

The authored gate scans every tracked project-authored file and excludes only the provenance-labelled upstream docs snapshot. The staged gate checks newly added lines plus whole untracked files. Both report rule names without echoing matched values.

For a clean-room file before staging:

```bash
python3 scripts/check-public-safety.py --paths \
  references/repo-backed-runtime-update-workflow.md \
  references/public-sanitization-checklist.md
```

This deterministic check complements manual review; it does not prove that prose is safe or non-identifying.

## Final gate

- [ ] New text was written clean-room from reusable contracts.
- [ ] No private identifiers, values, logs, paths, or topology were copied.
- [ ] Examples use placeholders or variables.
- [ ] Added-line privacy scan passes.
- [ ] `git diff --check` passes.
- [ ] Tests and skill validation pass.
- [ ] Final diff was reviewed manually before public push.
