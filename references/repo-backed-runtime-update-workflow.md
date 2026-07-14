# Repository-backed runtime update workflow

Use this for a live service whose runtime is deployed from a Git repository, especially when the live checkout carries operator-owned patches or tracks a maintained fork.

This is a clean-room public contract. Replace variables with local values; do not copy private remotes, hostnames, credentials, or absolute paths into public evidence.

## Safety contract

- Never run a blind `git pull`, `git reset --hard`, rebase, or service restart against an unidentified live checkout.
- Treat a dirty live tree as operator-owned state until it is backed up and attributed.
- Merge and validate away from the live checkout.
- Prefer the smallest reversible switch.
- Do not call an update healthy from Git state or `service active` alone; require a live end-to-end probe.

## Inputs

```text
LIVE_REPO=<path to the checkout used by the live process>
SERVICE=<service manager unit or launch label>
FORK_REMOTE=<maintained fork remote>
UPSTREAM_REMOTE=<upstream remote>
BRANCH=<deployed branch>
BACKUP_ROOT=<private operator backup directory>
```

Keep these values in the private operator overlay or shell environment, not in public incident notes.

## 1. Prove the live target

Before changing Git state, correlate all of these:

- service definition and runtime owner;
- live PID command line and working directory;
- executable/import path;
- checkout remotes, branch, and current commit;
- port, socket, or endpoint owned by that PID.

Example probes:

```bash
systemctl cat "$SERVICE" || systemctl --user cat "$SERVICE"
ps -eo user,pid,ppid,lstart,cmd
readlink -f "/proc/<pid>/cwd"
git -C "$LIVE_REPO" remote -v
git -C "$LIVE_REPO" status --short --branch
git -C "$LIVE_REPO" rev-parse HEAD
```

If the process does not load from `LIVE_REPO`, stop. Updating the wrong checkout is fake progress.

## 2. Fetch and measure divergence

```bash
git -C "$LIVE_REPO" fetch --all --prune
git -C "$LIVE_REPO" rev-parse HEAD "$FORK_REMOTE/$BRANCH" "$UPSTREAM_REMOTE/$BRANCH"
git -C "$LIVE_REPO" rev-list --left-right --count \
  "HEAD...$FORK_REMOTE/$BRANCH"
git -C "$LIVE_REPO" rev-list --left-right --count \
  "$FORK_REMOTE/$BRANCH...$UPSTREAM_REMOTE/$BRANCH"
```

Report fetched ancestry, not assumptions based on a stale local remote-tracking branch.

## 3. Back up dirty and untracked state

Create a timestamped private backup outside the repository. Record:

- pre-update commit;
- branch/status;
- unstaged and staged diffs;
- untracked file list;
- a backup branch or bundle when appropriate.

Do not publish the backup: diffs and untracked-file names may contain secrets or private topology.

```bash
ts=$(date -u +%Y%m%dT%H%M%SZ)
backup="$BACKUP_ROOT/runtime-update-$ts"
mkdir -p "$backup"
git -C "$LIVE_REPO" rev-parse HEAD >"$backup/pre-head.txt"
git -C "$LIVE_REPO" status --porcelain=v1 --branch >"$backup/pre-status.txt"
git -C "$LIVE_REPO" diff >"$backup/unstaged.diff"
git -C "$LIVE_REPO" diff --cached >"$backup/staged.diff"
git -C "$LIVE_REPO" ls-files --others --exclude-standard >"$backup/untracked.txt"
git -C "$LIVE_REPO" branch "backup/live-before-update-$ts" HEAD
```

If the tree must be cleaned for validation, stash only after the backup exists and record the stash name.

## 4. Integrate upstream in a disposable worktree

Use a separate worktree based on the maintained fork branch. When the fork contains a meaningful patch stack, prefer one merge over rebasing every private commit.

```bash
worktree=$(mktemp -d)
git -C "$LIVE_REPO" worktree add "$worktree" "$FORK_REMOTE/$BRANCH"
git -C "$worktree" merge --no-ff "$UPSTREAM_REMOTE/$BRANCH"
```

Conflict policy:

- upstream usually wins for generic framework and test-infrastructure changes;
- operator-owned extensions win only where their contract is explicit and tested;
- resolve each conflict by behavior, not by choosing one side wholesale;
- reject conflict markers and missing-helper partial merges.

Minimum checks:

```bash
git -C "$worktree" diff --check
git -C "$worktree" grep -n -E '^(<<<<<<<|=======|>>>>>>>|\|\|\|\|\|\|\|)' -- .
```

The marker search should return no matches.

## 5. Validate before switching live

Run the repository's real gates in the worktree:

- syntax/compile checks for changed code;
- focused regression tests for every operator-owned extension touched by the merge;
- configuration parsing with fake or isolated test values;
- aggregate test/lint/build checks where practical;
- a secret scan over added lines and generated artifacts.

Do not let live environment variables leak into unit tests. Use an isolated temporary home/config and explicit fake credentials.

If a focused contract test is missing, add it before updating live. A remembered patch without a regression test is not an update invariant.

## 6. Publish the maintained branch, then switch live

Only after validation:

1. commit the merge in the worktree;
2. push the maintained fork branch;
3. verify the remote commit;
4. fetch the live checkout;
5. switch the live checkout to the verified fork commit using the documented deployment method.

Do not push secrets, backup artifacts, runtime state, or generated operator evidence.

## 7. Restart outside the active request lane

Do not synchronously restart the gateway/service from the same live chat or request that is delivering the result. Use a detached operator shell, service manager, durable task, or post-delivery action.

Restart the minimum component. If dependencies must restart, order them explicitly and wait for readiness instead of embedding recursive restarts inside another unit's `ExecStartPre`.

## 8. Verify the running result

Require all of these:

- live checkout commit equals the verified deployed commit;
- expected upstream commit is an ancestor where applicable;
- service has a fresh stable PID and no restart churn;
- live PID still points to the intended checkout/install root;
- local health endpoint or socket passes;
- platform/transport state is connected;
- a real user-facing or equivalent end-to-end probe succeeds;
- recent logs contain no new import, auth, routing, or delivery errors.

A delayed request caused by a long-running tool call is not automatically a gateway outage. Correlate the affected session and in-flight work before restarting.

## Rollback

Rollback should be known before the live switch:

- previous commit or tag;
- backup branch/bundle;
- saved dirty-state artifacts;
- previous service definition/config snapshot;
- exact service restart and health probes.

Rollback the smallest changed layer, then rerun the same end-to-end probe.

## Report contract

Report without secret values:

- live target and access path;
- pre-update and deployed short commit IDs;
- fork/upstream ancestry result;
- dirty-state backup location in private operator storage;
- validation commands and pass/fail state;
- live PID/health/end-to-end result;
- restart performed or intentionally deferred;
- rollback pointer and residual risk.
