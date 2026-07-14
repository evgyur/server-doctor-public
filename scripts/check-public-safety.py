#!/usr/bin/env python3
"""Privacy gate for public authored surfaces and proposed additions.

Findings report only path, line, and rule name; matched values are never printed.
"""

from __future__ import annotations

import argparse
import ipaddress
import re
import subprocess
import sys
from pathlib import Path
from typing import TypeAlias

ROOT = Path(__file__).resolve().parents[1]
VENDORED_PREFIXES = ("references/openclaw-docs/",)
ScanRow: TypeAlias = tuple[str, int, str | None]

PRIVATE_PREFIX = "ch" + "ip"
PRIVATE_WORDS = [
    "human" + "20",
    "intel" + "64",
    "ryzen" + "64",
    "pro" + "hoster",
    "hel" + "1",
    "mac-mini-" + "claw",
    "clawd-" + "workspace",
    "scrum-" + "dashboard",
]
PRIVATE_MARKER_RE = re.compile(
    r"(?<![A-Za-z0-9])(?:"
    + re.escape(PRIVATE_PREFIX)
    + r"[A-Za-z0-9_-]*|"
    + "|".join(re.escape(value) for value in PRIVATE_WORDS)
    + r")(?![A-Za-z0-9])",
    re.I,
)

PUBLIC_OWNER = "ev" + "gyur"
PUBLIC_OWNER_RE = re.compile(
    r"(?<![A-Za-z0-9])" + re.escape(PUBLIC_OWNER) + r"(?![A-Za-z0-9])",
    re.I,
)
ALLOWED_OWNER_URL_RE = re.compile(
    r"https://github\.com/"
    + re.escape(PUBLIC_OWNER)
    + r"/server-doctor-public(?:\.git)?(?=$|[\s)`'\"])",
    re.I,
)

HOME_OR_ROOT_RE = re.compile(
    r"(?:"
    r"/(?:home|Users)/(?!<[^/]+>(?=/|$)|\$\{?\w+\}?(?=/|$|[\s`'\":),;}]))"
    r"[^/\s`'\"]+(?=/|$|[\s`'\":),;])"
    r"|/root(?=/|$|[\s`'\":),;])"
    r")"
)

RULES = [
    ("private-key", re.compile(r"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----")),
    ("telegram-chat-id", re.compile(r"(?<!\d)-100\d{7,}(?!\d)")),
    ("absolute-user-home", HOME_OR_ROOT_RE),
    (
        "specific-opt-or-srv-path",
        re.compile(
            r"/(?:opt|srv)/(?!homebrew(?:/|\b)|backups(?:/|\b)|\.\.\.|<[^/]+>|\$\{?\w+\}?)[A-Za-z0-9._-]{3,}/"
        ),
    ),
    (
        "email-address",
        re.compile(
            r"\b[A-Z0-9._%+-]+@(?!example\.(?:com|org|net)\b)[A-Z0-9.-]+\.[A-Z]{2,}\b",
            re.I,
        ),
    ),
    ("ipv4-address", re.compile(r"(?<![\d.])(?:\d{1,3}\.){3}\d{1,3}(?![\d.])")),
    (
        "secret-assignment",
        re.compile(
            r"\b(?:token|secret|password|api[_-]?key)\s*[:=]\s*(?!<|\$|\{\{|redacted\b|fake\b|test\b|example\b)[^\s#]+",
            re.I,
        ),
    ),
    ("private-marker", PRIVATE_MARKER_RE),
    ("public-owner-outside-repo-url", PUBLIC_OWNER_RE),
]

ALLOWED_IPV4_NETWORKS = tuple(
    ipaddress.ip_network(value)
    for value in (
        "0.0.0.0/32",
        "127.0.0.0/8",
        "192.0.2.0/24",
        "198.51.100.0/24",
        "203.0.113.0/24",
    )
)


def run_git(*args: str) -> str:
    proc = subprocess.run(
        ["git", *args], cwd=ROOT, text=True, capture_output=True, check=False
    )
    if proc.returncode != 0:
        raise SystemExit(f"git command failed: {' '.join(args)}")
    return proc.stdout


def run_git_bytes(*args: str) -> bytes | None:
    proc = subprocess.run(["git", *args], cwd=ROOT, capture_output=True, check=False)
    return proc.stdout if proc.returncode == 0 else None


def parse_added_lines(diff: str) -> list[ScanRow]:
    rows: list[ScanRow] = []
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


def staged_added_lines() -> list[ScanRow]:
    rows = parse_added_lines(
        run_git("diff", "--cached", "--unified=0", "--no-color", "--", ".")
    )
    paths = changed_paths("--cached")
    rows.extend(rows_from_git_source(paths, "index"))
    untracked = run_git("ls-files", "--others", "--exclude-standard", "-z")
    for item in filter(None, untracked.split("\0")):
        rows.extend(file_lines(ROOT / item))
    return rows


def range_added_lines(git_range: str) -> list[ScanRow]:
    rows = parse_added_lines(
        run_git("diff", "--unified=0", "--no-color", git_range, "--", ".")
    )
    paths = changed_paths(git_range)
    rows.extend(rows_from_git_source(paths, range_target(git_range)))
    return rows


def changed_paths(*diff_args: str) -> list[str]:
    names = run_git(
        "diff", *diff_args, "--name-only", "--diff-filter=ACMR", "-z", "--", "."
    )
    return list(filter(None, names.split("\0")))


def range_target(git_range: str) -> str:
    separator = "..." if "..." in git_range else ".."
    return git_range.rsplit(separator, 1)[-1] or "HEAD"


def rows_from_git_source(paths: list[str], source: str) -> list[ScanRow]:
    rows: list[ScanRow] = []
    for item in paths:
        rows.append((item, 0, ""))
        spec = f":{item}" if source == "index" else f"{source}:{item}"
        content = run_git_bytes("show", spec)
        if content is None:
            rows.append((item, 0, None))
            continue
        try:
            content.decode("utf-8")
        except UnicodeDecodeError:
            rows.append((item, 0, None))
    return rows


def path_label(path: Path) -> str:
    try:
        return str(path.relative_to(ROOT))
    except ValueError:
        return str(path)


def file_lines(path: Path) -> list[ScanRow]:
    label = path_label(path)
    try:
        text = path.read_text(encoding="utf-8")
    except (UnicodeDecodeError, OSError):
        return [(label, 0, None)]
    return [(label, number, line) for number, line in enumerate(text.splitlines(), 1)]


def authored_lines() -> list[ScanRow]:
    tracked = run_git("ls-files", "-z")
    rows: list[ScanRow] = []
    for item in filter(None, tracked.split("\0")):
        if item.startswith(VENDORED_PREFIXES):
            continue
        rows.extend(file_lines(ROOT / item))
    return rows


def ipv4_allowed(value: str) -> bool:
    try:
        address = ipaddress.ip_address(value)
    except ValueError:
        return False
    return any(address in network for network in ALLOWED_IPV4_NETWORKS)


def owner_scan_text(text: str) -> str:
    return ALLOWED_OWNER_URL_RE.sub("", text)


def path_is_sensitive(path: str) -> bool:
    return bool(PRIVATE_MARKER_RE.search(path) or PUBLIC_OWNER_RE.search(path))


def violations(rows: list[ScanRow]) -> list[tuple[str, int, str]]:
    found: set[tuple[str, int, str]] = set()
    checked_paths: set[str] = set()
    for path, line_no, text in rows:
        if path not in checked_paths:
            checked_paths.add(path)
            if path_is_sensitive(path):
                found.add((path, 0, "tracked-path-private-marker"))
        if text is None:
            found.add((path, line_no, "unreadable-or-non-utf8-file"))
            continue
        for name, pattern in RULES:
            candidate = owner_scan_text(text) if name == "public-owner-outside-repo-url" else text
            matches = list(pattern.finditer(candidate))
            if not matches:
                continue
            if name == "ipv4-address":
                if all(ipv4_allowed(match.group(0)) for match in matches):
                    continue
            found.add((path, line_no, name))
    return sorted(found)


def main() -> int:
    parser = argparse.ArgumentParser()
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument("--staged", action="store_true")
    group.add_argument("--git-range")
    group.add_argument("--paths", nargs="+")
    group.add_argument("--authored", action="store_true")
    args = parser.parse_args()

    if args.staged:
        rows = staged_added_lines()
    elif args.git_range:
        rows = range_added_lines(args.git_range)
    elif args.authored:
        rows = authored_lines()
    else:
        rows = []
        for value in args.paths:
            path = (ROOT / value).resolve() if not Path(value).is_absolute() else Path(value)
            rows.extend(file_lines(path))

    found = violations(rows)
    if found:
        sensitive_paths = {path for path, _, _ in found if path_is_sensitive(path)}
        for path, line_no, name in found:
            display_path = "<suppressed-path>" if path in sensitive_paths else path
            print(f"{display_path}:{line_no}: blocked by {name}")
        print(f"public-safety: FAIL ({len(found)} findings; values suppressed)")
        return 1

    surface = "authored tree" if args.authored else "selected surface"
    print(f"public-safety: PASS ({surface}; {len(rows)} lines checked)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
