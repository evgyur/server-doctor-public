# Security policy

`server-doctor-public` is an operational skill. Some references and helpers intentionally inspect services, SSH configuration, auth-file permissions, gateways, and service managers. Treat it as high-privilege code, not as a passive prompt pack.

## Before use

- Review `SKILL.md`, the selected runbook, and the exact helper source.
- Start with read-only or `--dry-run` modes.
- Supply targets, users, paths, ports, and remotes explicitly.
- Keep production credentials and private topology outside this repository.
- Record rollback before any `apply`, restart, ownership, firewall, SSH, or checkout mutation.
- Run helpers from a clean checkout at a reviewed commit.

A generic community-skill scanner may block this repository because server operations legitimately include `sudo`, SSH, service-manager changes, and bounded repair commands. Do not use a force-install flag to bypass that verdict. Clone the repository for manual, commit-pinned review and run only the approved helper or diagnostic path.

## Publication checks

```bash
npm test
python3 scripts/privacy_gate.py --root .
gitleaks detect --source . --no-git --redact --exit-code 1
git diff --check
```

The repository-wide privacy gate rejects Telegram chat-id shapes, hard-coded operator home paths, non-example email addresses, non-documentation IPv4 addresses, private-key headers, token shapes, and non-placeholder secret assignments. Supply an untracked `--private-markers-file` to add operator-specific aliases without embedding them in public source.

## Reporting a vulnerability

Use GitHub's private vulnerability reporting or a private security advisory for this repository. Do not open a public issue containing credentials, private host details, raw logs, or message/session content.
