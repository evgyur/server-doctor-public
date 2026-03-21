# Health Claims And Evidence

Use this reference to keep `server-doctor-public` incident claims evidence-bound and safe.

## Two-layer diagnosis

Always separate these two questions:

### 1. Spec correctness

Check whether the claim is aimed at the right thing and supported by the right evidence.

- did we inspect the canonical host, owner, runtime, and service target
- did we use the right source of truth for the current runtime generation
- is the evidence direct and recent
- does the wording match only what the evidence proves
- did we use the local docs mirror or live public docs when topology or runtime path was unclear

If spec correctness is unresolved, do not make a strong health claim. Use `unknown`, `visibility-limited`, or `misconfigured check / wrong target`.

### 2. Ops quality

Only after the target is confirmed should you judge health.

- healthy
- degraded
- partial failure
- unstable
- down / outage

Spec uncertainty is not the same thing as operational failure.

## Evidence hierarchy

Use the strongest direct evidence available. A weaker signal should not override a stronger one without a direct contradiction.

1. Direct user-facing probe or real endpoint result
2. Canonical runtime health endpoint or service response
3. Process or service-manager state with matching runtime path, owner, and port
4. Recent logs that directly explain current behavior
5. Current docs or topology evidence used to verify the canonical target
6. Legacy health scripts, stale dashboards, old assumptions, and remembered topology

Operational rule:

- direct live endpoint beats stale legacy status
- canonical runtime response beats indirect status commands
- logs can explain a failure plane but do not replace a live probe when one is available
- docs establish what should be checked; they do not by themselves prove current health

## Canonical runtime identity check

Before using strong outage or recovery wording, confirm the canonical runtime identity:

- exact host or local machine
- service owner or launch domain
- exact systemd unit, launchd label, container, or process tree
- runtime directory or state directory
- live port, socket, or health endpoint
- whether the local docs mirror under `references/openclaw-docs/current/` was used, stale, or unavailable

If any of these are uncertain, downgrade the claim language.

## Anti-false-outage contract

### Permission-limited visibility

- missing role, scope, or command access is not outage proof
- if one status command is permission-limited, use live process, port, and user-facing probes before judging health
- allowed language:
  - `Status visibility is limited by permissions; current live probes suggest the service is up.`
- forbidden language:
  - `The service is down.` based only on denied or incomplete visibility

### Legacy vs live health mismatch

- direct live health beats stale legacy checks unless stronger current evidence disproves it
- if an older checker disagrees with the live endpoint, treat the legacy signal as suspect until the canonical runtime confirms it
- allowed language:
  - `Legacy health output disagrees with the live endpoint, so the alert is being treated as stale until direct evidence says otherwise.`
- forbidden language:
  - `The outage is confirmed.` based only on stale or indirect checks

### Wrong runtime, wrong path, wrong service generation

- verify the canonical unit, runtime directory, host, and port before using outage phrasing
- mirror copies, backup services, old ports, duplicate runtimes, and local workspace paths are common false targets
- allowed language:
  - `The failing probe targeted a non-canonical runtime path, so the outage claim is not proven yet.`
- forbidden language:
  - `Production is down.` when only a mirror copy, old port, or duplicate runtime failed

### Partial function vs full outage

- alive but slow, delayed, jammed, or partially broken is not the same as down
- use `degraded`, `partial failure`, `unstable`, `delayed`, or `unhealthy` when direct evidence shows reduced function without total loss
- allowed language:
  - `Service is degraded, not fully down; the endpoint responds but latency remains high.`
- forbidden language:
  - `Everything is fine.` when only a shallow health endpoint is green
  - `Bot is dead.` when replies are delayed or only one path is failing

### Probe quality hierarchy

- prefer direct user-facing probe or real endpoint
- then canonical runtime health endpoint
- then service-manager state tied to the same target
- then logs
- then legacy dashboards and remembered topology

Never let a weaker probe casually outrank a stronger one.

### Recovery confirmation

Do not claim recovery on restart alone.

Recovery wording requires:

1. action taken
2. direct post-action proof
3. relevant user-facing or canonical health confirmation
4. contradiction cleared when a stale alert or wrong target caused the confusion

## Evidence matrix

| Claim | Minimum evidence required | Nice-to-have supporting evidence | Not sufficient evidence | Allowed wording | Forbidden or too-strong wording |
| --- | --- | --- | --- | --- | --- |
| `service is down` | canonical target confirmed; direct user-facing probe fails or canonical health endpoint is unavailable or failing; service-manager or process evidence agrees | recent logs showing crash, bind failure, or repeated restart loop | one failed scoped command; stale dashboard; old incident memory; wrong host or port | `The canonical service appears down: the live probe failed and the target runtime is not serving.` | `Service is dead.` when target identity or live probe is missing |
| `service is healthy` | canonical target confirmed; direct probe or canonical health endpoint succeeds on the live runtime | matching process state; recent logs show stable operation | only `systemctl active`; only a successful restart; only absence of recent errors | `The canonical health endpoint responds and the service currently looks healthy.` | `Everything is fine.` when queueing, delivery, or user-facing probes remain degraded |
| `gateway is inactive` | canonical gateway unit, launch target, container, or process target confirmed; service manager shows inactive or failed; matching process or listener is absent | recent logs showing clean exit or crash reason | looking at the wrong target; stale `status` output; missing permissions | `The canonical gateway target is inactive and no matching listener is present.` | `Gateway is gone.` without confirming the canonical target and listener |
| `gateway is alive but status visibility is limited` | permission or scope blocked one status path; live process, listener, or user-facing probe still shows activity on the canonical target | a second direct probe; logs from the owning runtime | only permission failure; only assumption that permissions are missing | `Gateway status visibility is limited, but the canonical process and port still look alive.` | `Gateway is down.` because one command was permission-limited |
| `telegram transport is unhealthy` | canonical transport target confirmed; real send or read path fails, stalls, or returns errors on the live API | matching logs from the transport runtime; process state; reachable port with bad behavior | only upstream model symptoms; wrong Telegram peer or payload shape; wrong runtime path | `The canonical Telegram transport path is unhealthy: the live message flow is failing.` | `Telegram is down.` when the issue may be a bad probe or wrong runtime target |
| `incident likely caused by legacy or stale health pipeline` | live runtime or state inspection contradicts the old check; legacy checker or doctor warning is known stale or mismatched to current runtime | matching docs or release notes; repeated false-positive pattern | only suspicion; no direct contradiction from the live runtime | `Current evidence points to a stale health pipeline rather than a live outage.` | `The monitor is broken.` without showing the live contradiction |
| `wrong runtime path or service target was being checked` | canonical runtime identity confirmed; failed probe shown to hit a mirror path, backup service, old port, old unit, duplicate runtime, or wrong host | docs or runtime map confirm topology; matching process or port map | only a hunch that the target looks wrong | `The failing check targeted a non-canonical runtime path, so the outage claim does not hold yet.` | `The service recovered.` when the real issue was only a bad target |
| `docs mirror was used` | investigation explicitly used `references/openclaw-docs/FILELIST.md`, `references/openclaw-docs/current/`, or live public docs fallback was stated | mirror snapshot or lookup path noted | assuming docs were consulted | `Diagnosis used the local docs mirror for topology guidance.` | `Docs confirm the outage.` because docs do not prove runtime state |
| `docs mirror was stale` | mirror snapshot is older than the needed runtime or contradicts newer direct evidence; this limitation is stated | refresh attempt documented | mirror age guessed but not checked | `The local docs mirror appears stale for this runtime version, so topology guidance may lag.` | `The docs are wrong.` without establishing recency limits |
| `local docs unavailable` | `references/openclaw-docs/current/` is missing or unusable and the fallback to live public docs is stated | refresh attempt documented | not checking the mirror at all | `Local docs mirror was unavailable, so topology confidence is reduced.` | `No docs exist.` when only the local mirror was unavailable |
| `recovery is confirmed` | action taken; direct post-fix proof passed; relevant user-facing probe or canonical health endpoint now succeeds; stale contradiction cleared if relevant | second confirmation after a short wait; latency measurement noted | restart only; service manager says active; operator expectation | `Recovery is confirmed by a post-fix live probe on the canonical path.` | `Recovered.` immediately after restart with no live proof |
| `degraded but not outage` | canonical target confirmed; direct probe still works but latency, errors, backlog, or one function path is impaired | logs or metrics show queueing, retries, or partial delivery failures | green shallow health endpoint alone; anecdotal slowness with no direct probe | `Service is degraded but not fully down; the endpoint responds, but latency remains elevated.` | `Service is healthy.` when user-facing behavior is still materially impaired |

## Wording contract

Prefer the weakest wording that is fully supported.

### Good

- `Status visibility is limited, but the live process and port suggest the service is up.`
- `Service responds on the canonical health endpoint; the issue looks degraded, not fully down.`
- `Legacy health output disagrees with the live endpoint, so the alert is being treated as stale until direct evidence says otherwise.`
- `Current evidence is insufficient to call this an outage.`
- `Recovery is not confirmed yet; restart succeeded, but the post-fix live probe is still pending.`

### Bad

- `Gateway is down.` when only one scoped command failed
- `Bot is dead.` without a live probe
- `Recovered.` right after restart without post-fix verification
- `Everything is fine.` when the endpoint is alive but queueing or delivery is jammed
- `Telegram is down.` when the failing check used the wrong runtime path or bad payload shape

## Quick test checklist

- [ ] Permission-limited status output plus a live port or DM probe produces `visibility-limited` or `alive but visibility is limited`, not `down`
- [ ] Legacy checker failure plus live healthy endpoint produces a stale or legacy mismatch diagnosis, not outage
- [ ] Wrong unit, mirror path, old port, duplicate runtime, or backup service probe produces `wrong target` or `misconfigured check`, not outage
- [ ] Restart without a post-fix probe does not produce `recovered`
- [ ] Live endpoint with high latency or jammed queue produces `degraded` or `partial failure`, not `healthy`
- [ ] Docs mirror use, staleness, or unavailability is stated separately from runtime health

## Public-safe review checklist

- [ ] No hostnames, usernames, IPs, tokens, private paths, or private bot identifiers were added
- [ ] Every strong claim names the canonical target in generic terms
- [ ] Evidence strength is explicit and recent
- [ ] Spec correctness is resolved before ops quality is labeled
- [ ] Weaker legacy checks do not override stronger live probes
- [ ] Recovery claims include post-action proof
