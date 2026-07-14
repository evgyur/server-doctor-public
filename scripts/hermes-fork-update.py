#!/usr/bin/env python3
"""Prepare a Hermes fork update candidate without moving the live checkout.

Modes:
- preflight: read-only repository and ancestry report.
- candidate: create a detached disposable worktree, merge upstream, and run merge-sanity checks.

The helper never executes merged code, pushes, resets the live checkout, restarts
services, or runs operator-supplied commands. Git hooks are disabled for worktree
creation and merge. Candidate mode requires separate operator validation.
"""
from __future__ import annotations

import argparse
import json
import subprocess
import tempfile
import time
from pathlib import Path
from typing import Any


class UpdateBlocked(RuntimeError):
    pass


def utc_stamp() -> str:
    return time.strftime("%Y%m%dT%H%M%SZ", time.gmtime())


def run(cmd: list[str], *, cwd: Path, timeout: int = 300) -> dict[str, Any]:
    started = time.time()
    try:
        proc = subprocess.run(
            cmd,
            cwd=cwd,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            timeout=timeout,
            check=False,
        )
        return {
            "cmd": cmd,
            "cwd": str(cwd),
            "exit_code": proc.returncode,
            "stdout": proc.stdout.strip(),
            "stderr": proc.stderr.strip(),
            "duration_s": round(time.time() - started, 3),
        }
    except subprocess.TimeoutExpired as exc:
        return {
            "cmd": cmd,
            "cwd": str(cwd),
            "exit_code": 124,
            "stdout": (exc.stdout or "").strip() if isinstance(exc.stdout, str) else "",
            "stderr": (exc.stderr or "").strip() if isinstance(exc.stderr, str) else f"timeout after {timeout}s",
            "duration_s": round(time.time() - started, 3),
        }


def require_ok(result: dict[str, Any], label: str) -> dict[str, Any]:
    if result["exit_code"] != 0:
        raise UpdateBlocked(f"{label} failed with exit {result['exit_code']}; inspect locally")
    return result


def git(root: Path, *args: str, timeout: int = 300) -> dict[str, Any]:
    return run(["git", *args], cwd=root, timeout=timeout)


def git_out(root: Path, *args: str) -> str:
    return str(require_ok(git(root, *args), f"git {' '.join(args)}")["stdout"]).strip()


def append_step(report: dict[str, Any], name: str, result: dict[str, Any]) -> dict[str, Any]:
    item = {
        "name": name,
        "exit_code": result["exit_code"],
        "duration_s": result["duration_s"],
        "stdout_present": bool(result["stdout"]),
        "stderr_present": bool(result["stderr"]),
    }
    report.setdefault("steps", []).append(item)
    return result


def ensure_repo(root: Path) -> None:
    if not root.is_dir():
        raise UpdateBlocked("live root is not a directory")
    if git(root, "rev-parse", "--is-inside-work-tree")["stdout"] != "true":
        raise UpdateBlocked("live root is not a Git worktree")


def resolve_ref(root: Path, ref: str) -> str:
    return git_out(root, "rev-parse", ref)


def divergence(root: Path, left: str, right: str) -> dict[str, int] | None:
    result = git(root, "rev-list", "--left-right", "--count", f"{left}...{right}")
    if result["exit_code"] != 0:
        return None
    parts = result["stdout"].split()
    if len(parts) != 2:
        return None
    return {"left_only": int(parts[0]), "right_only": int(parts[1])}


def ancestry(root: Path, ancestor: str, descendant: str) -> bool:
    return git(root, "merge-base", "--is-ancestor", ancestor, descendant)["exit_code"] == 0


def registered_worktrees(root: Path) -> tuple[Path, ...]:
    output = git_out(root, "worktree", "list", "--porcelain", "-z")
    paths: list[Path] = []
    for field in output.split("\0"):
        if field.startswith("worktree "):
            paths.append(Path(field.removeprefix("worktree ")).resolve())
    if not paths:
        raise UpdateBlocked("Git returned no registered worktrees")
    return tuple(paths)


def ensure_external_report_path(root: Path, report_path: Path) -> None:
    for registered in registered_worktrees(root):
        if report_path == registered or registered in report_path.parents:
            raise UpdateBlocked("report path must be outside every registered Git worktree")


def collect_preflight(report: dict[str, Any], root: Path, distribution_ref: str, upstream_ref: str) -> None:
    ensure_repo(root)
    status = git_out(root, "status", "--porcelain=v1")
    report["live"] = {
        "head": resolve_ref(root, "HEAD"),
        "distribution_ref": distribution_ref,
        "distribution_head": resolve_ref(root, distribution_ref),
        "upstream_ref": upstream_ref,
        "upstream_head": resolve_ref(root, upstream_ref),
        "dirty": bool(status),
        "dirty_path_count": len(status.splitlines()),
        "head_vs_distribution": divergence(root, "HEAD", distribution_ref),
        "distribution_vs_upstream": divergence(root, distribution_ref, upstream_ref),
        "upstream_in_distribution": ancestry(root, upstream_ref, distribution_ref),
    }
    append_step(report, "remote name inventory", require_ok(git(root, "remote"), "remote name inventory"))


def run_candidate_checks(
    report: dict[str, Any], root: Path, base_ref: str
) -> None:
    require_ok(
        append_step(report, "git diff --check", git(root, "diff", "--check", f"{base_ref}...HEAD")),
        "git diff --check",
    )
    unmerged = append_step(report, "unmerged index scan", git(root, "ls-files", "--unmerged"))
    require_ok(unmerged, "unmerged index scan")
    if unmerged["stdout"]:
        raise UpdateBlocked("unmerged index entries remain in candidate")
def prepare_candidate(
    report: dict[str, Any],
    root: Path,
    distribution_ref: str,
    upstream_ref: str,
    worktree_root: Path,
) -> None:
    if report["live"]["dirty"]:
        raise UpdateBlocked("live worktree is dirty; preserve and review drift before candidate preparation")
    for registered in registered_worktrees(root):
        if worktree_root == registered or registered in worktree_root.parents:
            raise UpdateBlocked("worktree root must be outside every registered Git worktree")
    candidate_name = f"hermes-fork-candidate-{report['started_at']}"
    candidate_path = worktree_root / candidate_name
    if candidate_path.exists():
        raise UpdateBlocked("candidate worktree already exists")
    candidate_path.parent.mkdir(parents=True, exist_ok=True)
    require_ok(
        append_step(
            report,
            "create detached candidate worktree",
            git(
                root,
                "-c",
                "core.hooksPath=/dev/null",
                "worktree",
                "add",
                "--detach",
                str(candidate_path),
                distribution_ref,
            ),
        ),
        "candidate worktree creation",
    )
    report["candidate"] = {
        "name": candidate_name,
        "base": resolve_ref(candidate_path, "HEAD"),
        "pushed": False,
        "live_checkout_moved": False,
        "service_restarted": False,
        "merge_sanity_checks_passed": False,
        "validated": False,
        "operator_validation_required": True,
    }
    merge = append_step(
        report,
        "merge upstream into candidate",
        git(
            candidate_path,
            "-c",
            "core.hooksPath=/dev/null",
            "merge",
            "--no-ff",
            "--no-edit",
            upstream_ref,
            timeout=900,
        ),
    )
    if merge["exit_code"] != 0:
        report["candidate"]["preserved_for_resolution"] = True
        raise UpdateBlocked("candidate merge failed; inspect the preserved worktree root")
    run_candidate_checks(report, candidate_path, report["candidate"]["base"])
    report["candidate"]["head"] = resolve_ref(candidate_path, "HEAD")
    report["candidate"]["upstream_is_ancestor"] = ancestry(candidate_path, upstream_ref, "HEAD")
    if not report["candidate"]["upstream_is_ancestor"]:
        raise UpdateBlocked("candidate validation lost upstream ancestry")
    report["candidate"]["merge_sanity_checks_passed"] = True


def write_report(path: Path, report: dict[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(report, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Prepare a safe Hermes maintained-fork update candidate")
    parser.add_argument("--mode", choices=("preflight", "candidate"), default="preflight")
    parser.add_argument("--live-root", type=Path, required=True)
    parser.add_argument("--distribution-ref", required=True)
    parser.add_argument("--upstream-ref", required=True)
    parser.add_argument("--worktree-root", type=Path, default=Path(tempfile.gettempdir()))

    parser.add_argument("--report", type=Path)
    parser.add_argument("--json", action="store_true")
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = parse_args(argv)
    stamp = utc_stamp()
    live_root = args.live_root.resolve()
    report_path = args.report.resolve() if args.report else None
    report: dict[str, Any] = {
        "started_at": stamp,
        "mode": args.mode,
        "ok": False,
        "report_written": False,
        "public_safety_boundary": {
            "push": False,
            "live_checkout_move": False,
            "service_restart": False,
            "operator_supplied_commands": False,
            "git_hooks_disabled": True,
            "command_output_in_report": False,
        },
    }
    code = 0
    report_write_allowed = False
    try:
        collect_preflight(report, live_root, args.distribution_ref, args.upstream_ref)
        if report_path is not None:
            ensure_external_report_path(live_root, report_path)
            report_write_allowed = True
        if args.mode == "candidate":
            prepare_candidate(
                report,
                live_root,
                args.distribution_ref,
                args.upstream_ref,
                args.worktree_root.resolve(),
            )
            report["status"] = "operator-validation-required"
            code = 3
        else:
            report["ok"] = True
            report["status"] = "preflight-complete"
    except (UpdateBlocked, json.JSONDecodeError, OSError) as exc:
        report["blocked"] = str(exc)
        code = 2
    finally:
        report["finished_at"] = utc_stamp()
        report["report_path"] = report_path.name if report_path is not None else None
        if report_write_allowed and report_path is not None:
            report["report_written"] = True
            try:
                write_report(report_path, report)
            except OSError as exc:
                report["ok"] = False
                report["report_written"] = False
                report["blocked"] = f"report write failed: {exc.__class__.__name__}"
                code = 2
    if args.json:
        print(json.dumps(report, ensure_ascii=False, indent=2))
    else:
        print(f"ok={report['ok']} mode={report['mode']} report={report['report_path'] or 'stdout-only'}")
        if report.get("blocked"):
            print(f"blocked: {report['blocked']}")
        if report.get("candidate"):
            print(f"candidate={report['candidate']['name']}")
    return code


if __name__ == "__main__":
    raise SystemExit(main())
