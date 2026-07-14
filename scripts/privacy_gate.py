#!/usr/bin/env python3
"""Repository-wide privacy gate for server-doctor-public."""
from __future__ import annotations

import argparse
import ipaddress
import json
import os
import re
import subprocess
from dataclasses import asdict, dataclass
from pathlib import Path

CHAT_ID_RE = re.compile(r"(?<!\d)-100\d{7,}(?!\d)")
EMAIL_RE = re.compile(r"\b[A-Z0-9._%+-]+@([A-Z0-9.-]+\.[A-Z]{2,})\b", re.IGNORECASE)
IPV4_RE = re.compile(r"(?<![\d.])(?:\d{1,3}\.){3}\d{1,3}(?![\d.])")
OPERATOR_PATH_RE = re.compile(
    r"/(?:home|Users)/(?!\$|\{|<)([A-Za-z0-9_.-]+)(?:/|(?=$|[\s`'\":),;}]))"
)
PRIVATE_KEY_RE = re.compile(r"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----")
TOKEN_SHAPE_RE = re.compile(
    r"(?<![A-Za-z0-9])(?:ghp_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}|sk-[A-Za-z0-9_-]{20,})"
)
SECRET_ASSIGNMENT_RE = re.compile(
    r"(?i)(?<![A-Za-z0-9])(?:[A-Z0-9]+[_-])*"
    r"(?:api[_-]?key|access[_-]?token|bot[_-]?token|client[_-]?secret|password)"
    r"\s*[:=]\s*[\"']?([^\s\"']{8,})"
)
SAFE_SECRET_PREFIXES = ("${", "$", "<", "example", "fake", "fixture", "redacted", "replace")
SAFE_EMAIL_DOMAINS = {"example.com", "example.org", "example.net", "example.invalid"}
SAFE_IPV4_NETWORKS = tuple(
    ipaddress.ip_network(value)
    for value in ("0.0.0.0/32", "127.0.0.0/8", "192.0.2.0/24", "198.51.100.0/24", "203.0.113.0/24")
)
REDACTED_PATH = "<redacted-sensitive-path>"


@dataclass(frozen=True)
class Finding:
    rule: str
    path: str
    line: int
    message: str


def git_files(root: Path) -> list[Path] | None:
    proc = subprocess.run(
        ["git", "ls-files", "--cached", "--others", "--exclude-standard", "-z"],
        cwd=root,
        stdout=subprocess.PIPE,
        stderr=subprocess.DEVNULL,
        check=False,
    )
    if proc.returncode != 0:
        return None
    return [root / os.fsdecode(item) for item in proc.stdout.split(b"\0") if item]


def candidate_files(root: Path) -> list[Path]:
    files = git_files(root)
    if files is None:
        files = [
            path
            for path in root.rglob("*")
            if (path.is_file() or path.is_symlink()) and ".git" not in path.parts
        ]
    result: list[Path] = []
    for path in files:
        if not path.is_file() and not path.is_symlink():
            continue
        result.append(path)
    return sorted(set(result))


def scan_text(relative: str, text: str, private_markers: tuple[str, ...]) -> list[Finding]:
    findings: list[Finding] = []
    for line_no, line in enumerate(text.splitlines(), 1):
        lowered = line.lower()
        if any(marker in lowered for marker in private_markers):
            findings.append(
                Finding("private-overlay-marker", relative, line_no, "private overlay marker")
            )
        if CHAT_ID_RE.search(line):
            findings.append(Finding("telegram-chat-id", relative, line_no, "Telegram chat-id shaped value"))
        for match in EMAIL_RE.finditer(line):
            if match.group(1).lower() not in SAFE_EMAIL_DOMAINS:
                findings.append(Finding("email", relative, line_no, "non-example email address"))
        for match in IPV4_RE.finditer(line):
            try:
                address = ipaddress.ip_address(match.group(0))
            except ValueError:
                continue
            if not any(address in network for network in SAFE_IPV4_NETWORKS):
                findings.append(Finding("ipv4-address", relative, line_no, "non-documentation IPv4 address"))
        if OPERATOR_PATH_RE.search(line):
            findings.append(Finding("operator-path", relative, line_no, "hard-coded operator home path"))
        if PRIVATE_KEY_RE.search(line):
            findings.append(Finding("private-key", relative, line_no, "private key material"))
        if TOKEN_SHAPE_RE.search(line):
            findings.append(Finding("token-shape", relative, line_no, "token-shaped value"))
        for match in SECRET_ASSIGNMENT_RE.finditer(line):
            value = match.group(1).lower()
            if not value.startswith(SAFE_SECRET_PREFIXES):
                findings.append(Finding("secret-assignment", relative, line_no, "non-placeholder secret assignment"))
    return findings


def scan_path(relative: str, private_markers: tuple[str, ...]) -> list[Finding]:
    try:
        relative.encode("utf-8", errors="strict")
    except UnicodeEncodeError:
        return [
            Finding(
                "unreadable-publishable-path",
                REDACTED_PATH,
                0,
                "publishable path is not valid UTF-8",
            )
        ]
    path_matches = scan_text(relative, relative, private_markers)
    return [
        Finding(
            f"path-{item.rule}",
            REDACTED_PATH,
            0,
            "sensitive value in publishable path",
        )
        for item in path_matches
    ]


def load_private_markers(path: Path | None) -> tuple[str, ...]:
    if path is None:
        return ()
    markers = []
    for raw in path.read_text(encoding="utf-8").splitlines():
        marker = raw.strip().lower()
        if not marker or marker.startswith("#"):
            continue
        if len(marker) < 3:
            raise ValueError("private markers must contain at least three characters")
        markers.append(marker)
    return tuple(sorted(set(markers)))


def scan(root: Path, private_markers: tuple[str, ...]) -> tuple[list[Finding], int]:
    findings: list[Finding] = []
    files = candidate_files(root)
    for path in files:
        relative = path.relative_to(root).as_posix()
        path_findings = scan_path(relative, private_markers)
        findings.extend(path_findings)
        display_path = REDACTED_PATH if path_findings else relative
        try:
            text = os.readlink(path) if path.is_symlink() else path.read_text(encoding="utf-8")
        except (UnicodeDecodeError, OSError):
            findings.append(
                Finding(
                    "unreadable-publishable-file",
                    display_path,
                    0,
                    "publishable file could not be read as UTF-8",
                )
            )
            continue
        findings.extend(scan_text(display_path, text, private_markers))
    return findings, len(files)


def parse_args(argv: list[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Scan the public repository for private residue")
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument(
        "--private-markers-file",
        type=Path,
        help="untracked newline-delimited private marker overlay",
    )
    parser.add_argument("--json", action="store_true")
    return parser.parse_args(argv)


def main(argv: list[str] | None = None) -> int:
    args = parse_args(argv)
    root = args.root.resolve()
    try:
        private_markers = load_private_markers(args.private_markers_file)
    except (OSError, UnicodeError, ValueError) as exc:
        raise SystemExit(f"privacy gate configuration error: {exc}") from exc
    findings, file_count = scan(root, private_markers)
    payload = {
        "ok": not findings,
        "root": ".",
        "scope": "tracked and non-ignored publishable files",
        "private_overlay_marker_count": len(private_markers),
        "files_scanned": file_count,
        "findings": [asdict(item) for item in findings],
    }
    if args.json:
        print(json.dumps(payload, ensure_ascii=False, indent=2))
    else:
        print(f"privacy gate: {'PASS' if payload['ok'] else 'FAIL'}")
        print(f"scope: {payload['scope']} · files: {file_count} · findings: {len(findings)}")
        for item in findings:
            print(f"- {item.rule} · {item.path}:{item.line} · {item.message}")
    return 0 if payload["ok"] else 1


if __name__ == "__main__":
    raise SystemExit(main())
