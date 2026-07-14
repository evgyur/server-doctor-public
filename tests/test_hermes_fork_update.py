from __future__ import annotations

import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
HELPER = ROOT / "scripts" / "hermes-fork-update.py"


def run(command: list[str], cwd: Path) -> subprocess.CompletedProcess[str]:
    return subprocess.run(command, cwd=cwd, text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, check=False)


class HermesForkUpdateTests(unittest.TestCase):
    def make_repo(self, root: Path) -> Path:
        repo = root / "repo"
        repo.mkdir()
        self.assertEqual(run(["git", "init", "-b", "main"], repo).returncode, 0)
        self.assertEqual(run(["git", "config", "user.email", "test@example.com"], repo).returncode, 0)
        self.assertEqual(run(["git", "config", "user.name", "Test Operator"], repo).returncode, 0)
        (repo / "base.txt").write_text("base\n", encoding="utf-8")
        (repo / "docs-example.md").write_text(
            "<<<<<<< example shown in documentation\n",
            encoding="utf-8",
        )
        self.assertEqual(run(["git", "add", "base.txt", "docs-example.md"], repo).returncode, 0)
        self.assertEqual(run(["git", "commit", "-m", "base"], repo).returncode, 0)
        self.assertEqual(run(["git", "branch", "distribution"], repo).returncode, 0)
        self.assertEqual(run(["git", "switch", "-c", "upstream"], repo).returncode, 0)
        (repo / "upstream.txt").write_text("upstream\n", encoding="utf-8")
        self.assertEqual(run(["git", "add", "upstream.txt"], repo).returncode, 0)
        self.assertEqual(run(["git", "commit", "-m", "upstream change"], repo).returncode, 0)
        self.assertEqual(run(["git", "switch", "distribution"], repo).returncode, 0)
        (repo / "distribution.txt").write_text("distribution\n", encoding="utf-8")
        self.assertEqual(run(["git", "add", "distribution.txt"], repo).returncode, 0)
        self.assertEqual(run(["git", "commit", "-m", "distribution change"], repo).returncode, 0)
        return repo

    def run_helper(self, repo: Path, report: Path, *extra: str) -> subprocess.CompletedProcess[str]:
        return run(
            [
                sys.executable,
                str(HELPER),
                "--live-root",
                str(repo),
                "--distribution-ref",
                "distribution",
                "--upstream-ref",
                "upstream",
                "--report",
                str(report),
                "--json",
                *extra,
            ],
            ROOT,
        )

    def test_preflight_reports_divergence_without_mutation(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            repo = self.make_repo(root)
            remote_url = "https://" + "operator:" + "private-value" + "@example.com/repo.git"
            self.assertEqual(run(["git", "remote", "add", "audit", remote_url], repo).returncode, 0)
            before = run(["git", "rev-parse", "HEAD"], repo).stdout.strip()
            report_path = root / "preflight.json"
            result = self.run_helper(repo, report_path)
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            payload = json.loads(result.stdout)
            self.assertTrue(payload["ok"])
            self.assertFalse(payload["live"]["dirty"])
            self.assertEqual(payload["live"]["distribution_vs_upstream"], {"left_only": 1, "right_only": 1})
            self.assertEqual(run(["git", "rev-parse", "HEAD"], repo).stdout.strip(), before)
            self.assertEqual(payload["public_safety_boundary"]["push"], False)
            self.assertNotIn(remote_url, json.dumps(payload))
            self.assertNotIn(str(repo), json.dumps(payload))

    def test_candidate_merges_in_detached_worktree_only(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            repo = self.make_repo(root)
            hook_marker = root / "hook-ran"
            for hook_name in ("post-checkout", "post-merge"):
                hook = repo / ".git" / "hooks" / hook_name
                hook.write_text(
                    f"#!/bin/sh\nprintf ran > {hook_marker}\n",
                    encoding="utf-8",
                )
                hook.chmod(0o755)
            before = run(["git", "rev-parse", "HEAD"], repo).stdout.strip()
            report_path = root / "candidate.json"
            result = self.run_helper(repo, report_path, "--mode", "candidate", "--worktree-root", str(root / "worktrees"))
            self.assertEqual(result.returncode, 3, result.stdout + result.stderr)
            payload = json.loads(result.stdout)
            self.assertFalse(payload["ok"])
            self.assertEqual(payload["status"], "operator-validation-required")
            candidate = root / "worktrees" / payload["candidate"]["name"]
            self.assertTrue((candidate / "distribution.txt").is_file())
            self.assertTrue((candidate / "upstream.txt").is_file())
            self.assertTrue(payload["candidate"]["upstream_is_ancestor"])
            self.assertFalse(payload["candidate"]["pushed"])
            self.assertFalse(payload["candidate"]["live_checkout_moved"])
            self.assertFalse(payload["candidate"]["service_restarted"])
            self.assertTrue(payload["candidate"]["merge_sanity_checks_passed"])
            self.assertFalse(payload["candidate"]["validated"])
            self.assertTrue(payload["candidate"]["operator_validation_required"])
            self.assertEqual(run(["git", "rev-parse", "HEAD"], repo).stdout.strip(), before)
            self.assertFalse(hook_marker.exists())

    def test_candidate_never_validates_broken_merged_python(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            repo = self.make_repo(root)
            self.assertEqual(run(["git", "switch", "upstream"], repo).returncode, 0)
            (repo / "broken.py").write_text("def broken(:\n", encoding="utf-8")
            self.assertEqual(run(["git", "add", "broken.py"], repo).returncode, 0)
            self.assertEqual(run(["git", "commit", "-m", "broken Python fixture"], repo).returncode, 0)
            self.assertEqual(run(["git", "switch", "distribution"], repo).returncode, 0)
            result = self.run_helper(
                repo,
                root / "broken-candidate.json",
                "--mode",
                "candidate",
                "--worktree-root",
                str(root / "worktrees"),
            )
            self.assertEqual(result.returncode, 3, result.stdout + result.stderr)
            payload = json.loads(result.stdout)
            self.assertFalse(payload["ok"])
            self.assertFalse(payload["candidate"]["validated"])
            self.assertTrue(payload["candidate"]["operator_validation_required"])

    def test_candidate_rejects_worktree_root_inside_live_checkout(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            repo = self.make_repo(root)
            result = self.run_helper(
                repo,
                root / "blocked.json",
                "--mode",
                "candidate",
                "--worktree-root",
                str(repo / "nested-worktrees"),
            )
            self.assertEqual(result.returncode, 2)
            payload = json.loads(result.stdout)
            self.assertIn("outside every registered Git worktree", payload["blocked"])
            self.assertFalse((repo / "nested-worktrees").exists())

    def test_candidate_rejects_worktree_root_inside_second_linked_worktree(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            repo = self.make_repo(root)
            linked = root / "linked"
            self.assertEqual(
                run(
                    [
                        "git",
                        "-c",
                        "core.hooksPath=/dev/null",
                        "worktree",
                        "add",
                        "--detach",
                        str(linked),
                        "distribution",
                    ],
                    repo,
                ).returncode,
                0,
            )
            nested = linked / "nested-worktrees"
            result = self.run_helper(
                repo,
                root / "blocked-linked.json",
                "--mode",
                "candidate",
                "--worktree-root",
                str(nested),
            )
            self.assertEqual(result.returncode, 2)
            payload = json.loads(result.stdout)
            self.assertIn("outside every registered Git worktree", payload["blocked"])
            self.assertFalse(nested.exists())

    def test_dirty_live_tree_blocks_candidate(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            repo = self.make_repo(root)
            (repo / "dirty.txt").write_text("dirty\n", encoding="utf-8")
            result = self.run_helper(
                repo,
                root / "blocked.json",
                "--mode",
                "candidate",
                "--worktree-root",
                str(root / "worktrees"),
            )
            self.assertEqual(result.returncode, 2)
            payload = json.loads(result.stdout)
            self.assertIn("dirty", payload["blocked"])
            self.assertNotIn("candidate", payload)

    def test_report_path_inside_live_worktree_is_rejected_without_dirtying_it(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            repo = self.make_repo(root)
            report_path = repo / "reports" / "preflight.json"
            result = self.run_helper(repo, report_path)
            self.assertEqual(result.returncode, 2, result.stdout + result.stderr)
            payload = json.loads(result.stdout)
            self.assertFalse(payload["ok"])
            self.assertFalse(payload["report_written"])
            self.assertFalse(report_path.exists())
            self.assertEqual(run(["git", "status", "--porcelain=v1"], repo).stdout, "")

    def test_report_path_inside_second_linked_worktree_is_rejected(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            repo = self.make_repo(root)
            linked = root / "linked"
            self.assertEqual(
                run(
                    [
                        "git",
                        "-c",
                        "core.hooksPath=/dev/null",
                        "worktree",
                        "add",
                        "--detach",
                        str(linked),
                        "distribution",
                    ],
                    repo,
                ).returncode,
                0,
            )
            report_path = linked / "reports" / "preflight.json"
            result = self.run_helper(repo, report_path)
            self.assertEqual(result.returncode, 2, result.stdout + result.stderr)
            payload = json.loads(result.stdout)
            self.assertFalse(payload["report_written"])
            self.assertIn("outside every registered Git worktree", payload["blocked"])
            self.assertFalse(report_path.exists())

    def test_default_report_stays_outside_callers_live_worktree(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            repo = self.make_repo(root)
            result = run(
                [
                    sys.executable,
                    str(HELPER),
                    "--live-root",
                    str(repo),
                    "--distribution-ref",
                    "distribution",
                    "--upstream-ref",
                    "upstream",
                    "--json",
                ],
                repo,
            )
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)
            payload = json.loads(result.stdout)
            self.assertFalse(payload["report_written"])
            self.assertIsNone(payload["report_path"])
            self.assertEqual(run(["git", "status", "--porcelain=v1"], repo).stdout, "")

    def test_candidate_checks_the_merge_diff_not_only_worktree_dirt(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            repo = self.make_repo(root)
            self.assertEqual(run(["git", "switch", "upstream"], repo).returncode, 0)
            (repo / "bad.txt").write_text("trailing whitespace \n", encoding="utf-8")
            self.assertEqual(run(["git", "add", "bad.txt"], repo).returncode, 0)
            self.assertEqual(run(["git", "commit", "-m", "bad whitespace"], repo).returncode, 0)
            self.assertEqual(run(["git", "switch", "distribution"], repo).returncode, 0)
            result = self.run_helper(
                repo,
                root / "blocked.json",
                "--mode",
                "candidate",
                "--worktree-root",
                str(root / "worktrees"),
            )
            self.assertEqual(result.returncode, 2)
            payload = json.loads(result.stdout)
            self.assertIn("git diff --check", payload["blocked"])


if __name__ == "__main__":
    unittest.main()
