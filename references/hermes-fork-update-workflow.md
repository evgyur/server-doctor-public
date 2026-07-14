# Hermes fork update workflow

Use this when a live Hermes Agent checkout carries a maintained distribution/private fork that must stay current with upstream without losing local patches.

## Hard rules

- Never update a dirty production checkout blindly.
- Never merge upstream directly in the live checkout.
- Never call an update successful from `git pull` or `systemctl active` alone.
- Never restart a gateway synchronously from the messaging turn it is serving.
- Preserve a rollback branch and evidence before moving the live checkout.

## Required inputs

```text
live checkout:
distribution remote/ref:
upstream remote/ref:
runtime user:
service unit or restart command:
health command:
focused validation commands:
backup root:
```

Do not infer remote names. Read `git remote`, inspect URLs locally without copying them into reports, and verify the live service command first.

## Sequence

### 1. Establish the live target

```bash
cd <live-checkout>
git status --short --branch
git remote
git rev-parse HEAD <distribution-ref> <upstream-ref>
git rev-list --left-right --count HEAD...<distribution-ref>
git rev-list --left-right --count <distribution-ref>...<upstream-ref>
```

Attribute dirty files before continuing. Operator-owned drift is evidence, not disposable update noise.

### 2. Back up current state

```bash
ts=$(date -u +%Y%m%dT%H%M%SZ)
backup=<backup-root>/hermes-update-$ts
mkdir -p "$backup"
git rev-parse HEAD > "$backup/pre_HEAD.txt"
git status --porcelain=v1 --branch > "$backup/pre_status.txt"
git diff > "$backup/unstaged.diff"
git diff --cached > "$backup/staged.diff"
git ls-files --others --exclude-standard > "$backup/untracked_files.txt"
git branch "backup/live-before-update-$ts" HEAD
```

Do not continue automatically when the live tree is dirty. Preserve and review the drift first.

### 3. Merge upstream in a disposable worktree

```bash
git fetch --all --prune
wt=$(mktemp -d)/hermes-upstream-merge
git -c core.hooksPath=/dev/null worktree add "$wt" <distribution-ref>
cd "$wt"
git -c core.hooksPath=/dev/null merge --no-ff <upstream-ref> -m "merge upstream into maintained distribution"
```

Prefer a merge over rebasing a long-lived distribution branch with many patches: one merge resolves each conflict once and keeps the upstream relationship visible.

### 4. Validate the candidate

Minimum candidate gate:

```bash
git diff --check
git grep -n '^<<<<<<<\|^>>>>>>>\|^||||||| ' -- . && exit 1 || true
python -m py_compile <changed-python-files>
python -m pytest <focused-tests> -q -o 'addopts='
```

Run distribution-specific checks as a separate, operator-reviewed step. The generic helper intentionally does not accept arbitrary commands or inherit a check manifest.

The helper itself runs only merge-sanity checks (`git diff --check`, unmerged-index scan, and upstream ancestry). It does **not** execute code from the merged candidate. Candidate mode therefore exits `3` with `status=operator-validation-required`, `ok=false`, and `candidate.validated=false`; run the minimum compile/focused-test gate above before publication.

The JSON report records built-in check outcomes but suppresses command output, absolute checkout paths, dirty filenames, and remote URLs. It is safer to share than raw logs, but it still requires review before publication.

### 5. Publish distribution, then move live

Push the validated candidate to the maintained distribution branch. Only then fetch from the live checkout and fast-forward or reset to that exact published ref according to the operator's declared policy.

A forced live reset is acceptable only after the clean-tree gate, backup branch, candidate validation, and remote publication all pass.

### 6. Restart out of band

Use a detached service-manager job or a separate operator shell. The active gateway turn must be allowed to deliver its final response before the process is replaced.

### 7. Verify after restart

Require all applicable evidence:

- live `HEAD` equals the published distribution ref;
- upstream is an ancestor of the live commit;
- service is stable with no fresh restart loop;
- local API health passes;
- gateway/platform state is connected;
- focused regression tests still pass in the live environment;
- bounded end-to-end transport probe passes or is explicitly blocked by policy.

## Public helper

`scripts/hermes-fork-update.py` implements conservative preflight and candidate preparation. It is parameterized and defaults to non-mutating `preflight` mode.

Example:

```bash
python3 scripts/hermes-fork-update.py \
  --mode preflight \
  --live-root <live-checkout> \
  --distribution-ref <remote/main> \
  --upstream-ref <upstream/main> \
  --report <external-report-root>/hermes-update-preflight.json
```

Omit `--report` for stdout-only operation. Report paths inside any registered Git worktree are rejected so preflight cannot dirty the checkout it just inspected.

Candidate mode creates a disposable worktree and merge candidate but does not mark it validated, push, move the live checkout, or restart services. Exit `3` means preparation succeeded and operator validation is still required.

## Report contract

Always report:

- live and candidate commit IDs;
- divergence and ancestry results;
- dirty-tree decision;
- backup branch/path when mutation occurred;
- worktree name and operator-selected root when a conflict needs manual resolution;
- built-in merge-sanity outcomes plus separately recorded operator validation evidence;
- whether push, live checkout movement, and restart were intentionally not performed;
- rollback branch and residual risk.
