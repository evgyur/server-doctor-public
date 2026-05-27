# Agent Tasking for Server Ops

Use this reference when a `server-doctor` task is delegated to Claude Code, Codex, a subagent, or another coding/ops agent.

The goal is not to make the prompt longer. The goal is to prevent fake progress: vague “check/fix it” prompts produce plausible explanations when the agent does not know what proof of completion looks like.

## Core contract

Every delegated ops task should include:

```text
Goal:
Context / raw evidence:
Target host and access path:
Current behavior:
Expected behavior:
Hard constraints:
Process:
Done when:
```

Use placeholders for private details. Do not put tokens, cookies, private chat IDs, personal account names, or production secrets in prompts that may be shared outside the trusted environment.

## Investigation before mutation

For incidents, broken services, auth, routing, DNS, cron, gateways, payments, bot delivery, memory, or user-visible automation:

1. Reproduce or observe the failure directly.
2. Read the raw log/error/output, not a paraphrase.
3. Identify the earliest real failure, then separate cascading errors.
4. Trace the data/control path to the failing boundary.
5. Find a working nearby pattern before editing.
6. State root cause and minimal safe fix before mutation.
7. Make one small change, then verify with the same probe.

Hard bans unless explicitly justified:

- swallowing errors to make probes green;
- adding fallback values that hide a broken contract;
- loosening auth, validation, type checks, or access checks;
- broad refactors during incident recovery;
- claiming health from logs alone without an end-to-end probe.

## Prompt template: server incident debug

```text
Debug this server issue systematically.

Goal:
[what must work]

Target:
[host alias, user, service, path, port, bot/channel/topic if relevant]

Raw evidence:
[paste command output, logs, curl response, timestamps]

Constraints:
- First investigate, then propose the minimal fix.
- Do not edit files or restart services until root cause is stated.
- Do not suppress errors or weaken checks.
- Separate spec correctness from operational health.
- If production/user-visible, name the safe rollback.

Process:
1. Verify the target host/runtime/source of truth.
2. Reproduce or directly observe the failure.
3. Find the earliest real failure and cascades.
4. Trace the relevant path through files/services/config.
5. Find the closest working pattern.
6. Propose minimal fix and verification command.
7. Apply only after approval unless the change is explicitly pre-authorized.

Done when:
- same probe passes;
- related service health check passes;
- changed files/services are listed;
- remaining risks are named;
- rollback is known or explicitly not needed.
```

## Long-running / multi-agent ops

Use isolated worktrees, detached tasks, or subagents when tasks can conflict or exceed a short bounded check.

Rules:

- one agent = one scope;
- do not let two agents edit the same files;
- implementation starts after research summary, not in parallel with it;
- review checks the final diff/probe evidence independently;
- handoff includes only goal, facts, failed hypotheses, files, commands run, next diagnostic step, and constraints.

## Debug reset

After two failed fixes or a growing diff, stop implementation.

Require a reset note:

```text
Known facts:
Failed hypotheses:
Why they failed:
Missing evidence:
Next single diagnostic step:
Files/diff to revert or keep:
```

No third speculative fix before new evidence.

## Self-review before final

Before reporting “fixed” or “healthy”, check:

- target and source of truth were correct;
- no unrelated files changed;
- fix matches stated root cause;
- end-to-end probe ran after the change;
- health claim wording matches evidence;
- no secrets, private payloads, or raw tokens are in the report;
- docs were updated if the lesson is reusable.
