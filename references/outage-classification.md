# Outage Classification

Use this reference to label runtime state after the canonical target is confirmed.

## Classification rule

1. Confirm the canonical target first:
   - host or local machine
   - owner
   - unit, launch agent, container, or process tree
   - runtime directory or state directory
   - live port, socket, or endpoint
2. Record any visibility gaps before judging health.
3. Choose the weakest status label that the evidence fully supports.
4. Escalate to `down / outage` only when direct live evidence supports total loss on the canonical target.

## Status taxonomy

| Status label | Meaning | Minimum evidence | Escalation level | Example phrasing |
| --- | --- | --- | --- | --- |
| `healthy` | canonical target is responding normally on the checked path | direct user-facing probe or canonical health endpoint succeeds with no current contradictory signal | note only if incident is resolved or routine check requested | `Service is currently healthy on the canonical endpoint.` |
| `degraded` | service still works but latency, retries, or reduced quality are materially affecting users | direct probe succeeds but is slow, error-prone, or backlog is growing | monitor closely; escalate if sustained or user-facing impact is rising | `Service is degraded: requests still complete, but latency remains high.` |
| `partial failure` | one important function path is broken while another still works | direct evidence shows some probes pass and others fail on the same canonical runtime | investigate the failed plane; do not phrase as full outage | `Service has a partial failure: health is green, but one delivery path is failing.` |
| `unstable` | service alternates between working and failing or restarts repeatedly | repeated recent transitions in probes, process state, or logs | high priority because user impact can widen quickly | `Service is unstable: it recovers briefly, then fails again.` |
| `down / outage` | canonical service is unavailable on the checked user-facing or runtime path | direct probe fails and canonical runtime evidence agrees that the service is not serving | immediate escalation | `The canonical service appears down; the live probe failed and the runtime is not serving.` |
| `unknown / insufficient evidence` | current evidence cannot justify a health label yet | target unclear, probes missing, or evidence is stale or indirect | gather better evidence before escalation | `Current evidence is insufficient to classify service health.` |
| `visibility-limited` | health cannot be fully judged because scope, role, or access is incomplete | one or more status paths are blocked by permissions, but outage is not proven | improve visibility or use alternate direct probes | `Visibility is limited by permissions; current evidence does not prove an outage.` |
| `misconfigured check / wrong target` | the failing probe aimed at a non-canonical runtime path or obsolete check | canonical target confirmed and the failing check shown to hit the wrong thing | fix the probe or target mapping before any incident escalation | `The failing check hit a non-canonical target, so this is a probe issue, not outage proof.` |

## Escalation notes

- `healthy` does not mean nothing else is wrong; confirm the user-facing contradiction is cleared.
- `degraded` and `partial failure` are operational incidents even when the main process is alive.
- `visibility-limited` is a diagnosis about evidence quality, not service quality.
- `misconfigured check / wrong target` should trigger topology and probe cleanup, not outage messaging.
- `unknown / insufficient evidence` is the correct outcome when the proof is not there yet.

## Recovery classification

Use `recovered` only after the service moves from a non-healthy label to `healthy` or an accepted lower-risk state with direct post-fix proof.

Minimum bar:

1. action taken
2. post-action live probe passed on the canonical path
3. relevant contradiction cleared
4. residual degradation called out if it still exists

Example:

- `Gateway recovered from outage: restart plus a live probe succeeded on the canonical path.`
- `Availability recovered, but service remains degraded due to queue latency.`
