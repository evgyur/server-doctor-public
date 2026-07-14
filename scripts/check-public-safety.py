#!/usr/bin/env python3
"""Scan public-skill additions without printing sensitive matched values."""

from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

PRIVATE_MARKERS = [
    "human" + "20",
    "ev" + "gyur",
    "chip" + "dev",
    "chip" + "dm",
    "intel" + "64",
    "ryzen" + "64",
    "pro" + "hoster",
    "hel" + "1",
]

RULES = [
    ("private-key", re.compile(r"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----")),
    ("telegram-chat-id", re.compile(r"(?<!\d)-100\d{7,}(?!\d)")),
    ("absolute-user-home", re.compile(r"/(?:home|Users)/(?!(?:<[^/]+>|\$\{?\w+\}?)(?:/|\b))[^/\s`'\"]+/")),
    ("specific-opt-or-srv-path", re.compile(r"/(?:opt|srv)/(?!\.\.\.|<[^/]+>|\$\{?\w+\}?)[A-Za-z0-9._-]{3,}/")),
    ("email-address", re.compile(r"\b[A-Z0-9._%+-]+@(?!example\.(?:com|org|net)\b)[A-Z0-9.-]+\.[A-Z]{2,}\b", re.I)),
    ("ipv4-address", re.compile(r"(?<![\d.])(?:\d{1,3}\.){3}\d{1,3}(?![\d.])")),
    ("secret-assignment", re.compile(r"\b(?:token|secret|password|api[_-]?key)\s*[:=]\s*(?!<|\$|\{\{|redacted\b|fake\b|test\b|example\b)[^\s#]+", re.I)),
    ("private-marker", re.compile("|".join(re.escape(x) for x in PRIVATE_MARKERS), re.I)),
]

ALLOWED_IPV4 = {"127.0.0.1", "0.0.0.0"}


def run_git(*args: str) -> str:
    proc = subprocess.run(
        ["git", *args], cwd=ROOT, text=True, capture_output=True, check=False
    )
    if proc.returncode != 0:
        raise SystemExit(f"git command failed: {' '.join(args)}")
    return proc.stdout


def staged_added_lines() -> list[tuple[str, int, str]]:
    diff = run_git("diff", "--cached", "--unified=0", "--no-color", "--", ".")
    rows: list[tuple[str, int, str]] = []
    current = ""
    new_line = 0
    for raw in diff.splitlines():
        if raw.startswith("+++ b/"):
            current = raw[6:]
            continue
        if raw.startswith("@@"):
            match = re.search(r"\+(\d+)(?:,(\d+))?", raw)
            new_line = int(match.group(1)) if match else 0
            continue
        if raw.startswith("+") and not raw.startswith("+++"):
            rows.append((current, new_line, raw[1:]))
            new_line += 1
        elif raw.startswith(" "):
            new_line += 1
    untracked = run_git("ls-files", "--others", "--exclude-standard", "-z")
    for item in filter(None, untracked.split("\0")):
        rows.extend(file_lines(ROOT / item))
    return rows


def range_added_lines(git_range: str) -> list[tuple[str, int, str]]:
    diff = run_git("diff", "--unified=0", "--no-color", git_range, "--", ".")
    rows: list[tuple[str, int, str]] = []
    current = ""
    new_line = 0
    for raw in diff.splitlines():
        if raw.startswith("+++ b/"):
            current = raw[6:]
        elif raw.startswith("@@"):
            match = re.search(r"\+(\d+)(?:,(\d+))?", raw)
            new_line = int(match.group(1)) if match else 0
        elif raw.startswith("+") and not raw.startswith("+++"):
            rows.append((current, new_line, raw[1:]))
            new_line += 1
        elif raw.startswith(" "):
            new_line += 1
    return rows


def file_lines(path: Path) -> list[tuple[str, int, str]]:
    try:
        text = path.read_text(encoding="utf-8")
    except (UnicodeDecodeError, OSError):
        return []
    try:
        label = str(path.relative_to(ROOT))
    except ValueError:
        label = str(path)
    return [(label, number, line) for number, line in enumerate(text.splitlines(), 1)]


def violations(rows: list[tuple[str, int, str]]) -> list[tuple[str, int, str]]:
    found: set[tuple[str, int, str]] = set()
    for path, line_no, text in rows:
        for name, pattern in RULES:
            match = pattern.search(text)
            if not match:
                continue
            if name == "ipv4-address" and match.group(0) in ALLOWED_IPV4:
                continue
            found.add((path, line_no, name))
    return sorted(found)


def main() -> int:
    parser = argparse.ArgumentParser()
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--staged", action="store_true")
    group.add_argument("--git-range")
    group.add_argument("--paths", nargs="+")
    args = parser.parse_args()

    if args.staged:
        rows = staged_added_lines()
    elif args.git_range:
        rows = range_added_lines(args.git_range)
    else:
        rows = []
        for value in args.paths:
            path = (ROOT / value).resolve() if not Path(value).is_absolute() else Path(value)
            rows.extend(file_lines(path))

    found = violations(rows)
    if found:
        for path, line_no, name in found:
            print(f"{path}:{line_no}: blocked by {name}")
        print(f"public-safety: FAIL ({len(found)} findings; values suppressed)")
        return 1

    print(f"public-safety: PASS ({len(rows)} lines checked)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
