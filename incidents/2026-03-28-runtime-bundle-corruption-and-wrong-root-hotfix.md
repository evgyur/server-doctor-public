# 2026-03-28 — Runtime bundle corruption and wrong-root hotfix

## Summary

A Linux OpenClaw runtime was found broken because the intended installed package tree was incomplete.
An emergency hotfix briefly pointed the service at a different local install root, which brought replies back but violated the intended runtime invariant.

The correct recovery was not a single-file repair.
It was full-package restoration to the canonical runtime root.

## User-visible symptom

- gateway failed to start cleanly or crashed with missing-module style errors
- emergency repoint to a different local install root appeared to help temporarily
- version drift risk increased once the runtime started from the wrong tree

## What was proved

### 1. The canonical runtime tree was incomplete

The intended package root contained only part of the runtime bundle.
That made single-entrypoint repair misleading, because the next missing file appeared immediately after the first repair.

### 2. The emergency root was a workaround, not the architecture

A second local OpenClaw install root was healthy enough to bootstrap the service.
That restored responsiveness, but it did not preserve the intended deployment invariant.

### 3. The real failure class was bundle corruption, not one missing file

Once the first missing file was restored, more missing runtime pieces appeared.
That proved the damage was systemic across the installed package tree.

## Correct recovery

1. confirm the intended canonical runtime root
2. avoid normalizing the emergency alternate root as the final fix
3. restore the entire OpenClaw package from the nearest valid package backup or reinstall source
4. repoint the service back to the intended root
5. restart the canonical service only after the package tree is whole again

## Validation

Require all of these:
- service manager points to the canonical root again
- live process path matches the canonical root
- `openclaw --version` aligns with the intended install
- provider startup succeeds
- a real end-to-end probe works

## Operational lesson

For runtime-tree corruption:
- do not start with single-file restore
- do not mistake a wrong-root hotfix for recovery
- whole-package restore is safer than piecemeal repair
