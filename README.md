# server-doctor-public

Public-safe operational runbooks, tests, and agent instructions for keeping OpenClaw/Hermes-style agent deployments alive.

This repository packages reusable server-operations knowledge from real agent infrastructure work: Telegram bots, OpenClaw/Hermes gateways, user-space services, Dockerized runtimes, `systemd`/`launchd` units, update workflows, incident triage, and post-fix verification.

The goal is not to expose private infrastructure. The goal is to preserve the useful operational patterns while stripping hostnames, IPs, chat IDs, credentials, local paths, and customer-specific state.

## Who it is for

Use this repo if you maintain or operate:

- OpenClaw or Hermes agent deployments
- Telegram/Discord bot gateways
- Codex/OpenAI-backed agent workflows
- VPS-hosted automation stacks
- long-running background workers
- small agent infrastructure where logs, restarts, updates, and runtime ownership matter

## What is inside

- `SKILL.md` — the top-level agent skill for server diagnosis and repair
- `references/` — reusable doctrine, runbooks, routing rules, evidence standards, update workflows, and review gates
- `incidents/` — sanitized incident lessons and failure patterns
- `scripts/` — public-safe helper scripts for audits, hygiene checks, transport hotfixes, and command-layer operations
- `tests/` — regression tests for scripts and operational guardrails
- `tools/chip-docs-local/` — local documentation tooling used by the public docs workflow

## Core operating model

Server Doctor follows a root-cause-first workflow:

1. Map the target: host, runtime owner, service manager, source of truth, and safe access method.
2. Collect low-risk evidence before mutating anything.
3. Separate confirmed facts from assumptions.
4. Diagnose the actual failing layer: host, service, process, config, network, credentials, webhook/transport, or source checkout.
5. Apply the smallest safe fix.
6. Verify with command output, logs, health checks, and a rollback path.
7. Convert reusable lessons back into public-safe runbooks or tests.

## Quick start

Clone the repo:

```bash
git clone https://github.com/evgyur/server-doctor-public.git
cd server-doctor-public
```

Read the skill:

```bash
sed -n '1,220p' SKILL.md
```

Run the test suite:

```bash
npm test
```

Run a placement/review check when editing docs:

```bash
python3 scripts/review_placement.py
```

## Example agent prompt

Use this when handing an incident to a coding/ops agent:

```text
Use the server-doctor-public workflow.

Target:
- host / machine:
- service / bot:
- runtime owner:
- suspected failure:
- safe access method:

Rules:
- collect evidence first
- do not print secrets
- do not restart or mutate until the failing layer is identified
- preserve rollback path
- verify before claiming fixed
- if the finding is reusable, update the matching public-safe runbook or test
```

## Safety and privacy

This repo deliberately avoids private operational data. Do not commit:

- API keys, bot tokens, OAuth secrets, SSH keys, cookies, or `.env` values
- private hostnames, IP addresses, chat IDs, user IDs, or customer names
- raw logs that contain credentials or personal data
- machine-specific runtime paths unless converted to placeholders

Use placeholders such as:

```text
<host>
<runtime-user>
<service-name>
<repo-path>
<bot-token>
<chat-id>
```

## OpenClaw / Hermes ecosystem work

This repository is maintained alongside real OpenClaw/Hermes operational work. The public runbooks are informed by upstream and fork-based maintenance tasks such as Telegram/media handling, TaskFlow routing, plugin discovery, gateway stability, post-update hotfixes, and runtime safety checks.

Related public contribution examples include upstream OpenClaw pull requests for:

- multiline media directive parsing
- durable work routing through TaskFlow
- native hook relay stability
- Telegram formatting preservation
- plugin discovery hardening
- unsent media payload preservation

## How Codex helps this project

Codex/API credits are useful for maintainer workflows that are expensive to do manually:

- reviewing runbook changes for safety regressions
- generating regression tests from incident lessons
- triaging reports from users operating agent deployments
- keeping docs aligned with scripts and command behavior
- checking release/update workflows before public guidance is published
- turning one-off fixes into reusable public-safe operational patterns

## Contributing

Small, focused changes are preferred.

Good contributions:

- add a regression test for a real operational failure
- improve a runbook with clearer evidence and rollback steps
- sanitize and generalize an incident lesson
- fix a command-layer script without weakening safety gates
- improve documentation placement using the principal architecture rules

Before opening a PR:

```bash
npm test
python3 scripts/review_placement.py
```

Also scan your diff for private data before pushing.

## License

MIT, unless a subdirectory states otherwise.
