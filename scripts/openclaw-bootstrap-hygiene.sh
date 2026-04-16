#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage:
  openclaw-bootstrap-hygiene.sh --dry-run --host <ssh-host> [--workspace-root <path>]
  openclaw-bootstrap-hygiene.sh --apply --host <ssh-host> [--workspace-root <path>]
  openclaw-bootstrap-hygiene.sh --validate --host <ssh-host> [--workspace-root <path>]
  openclaw-bootstrap-hygiene.sh --dry-run-local --root <workspace-root>
  openclaw-bootstrap-hygiene.sh --apply-local --root <workspace-root>
  openclaw-bootstrap-hygiene.sh --validate-local --root <workspace-root>

Public modes:
  --dry-run   Inspect a remote workspace and report bootstrap drift.
  --apply     Back up and normalize AGENTS.md and TOOLS.md on a remote host.
  --validate  Fail unless AGENTS.md and TOOLS.md are already normalized.

Test/helper modes:
  --dry-run-local --root <workspace-root>
  --apply-local --root <workspace-root>
  --validate-local --root <workspace-root>
              Run against a local workspace root without SSH.
EOF
}

die() {
  echo "error: $*" >&2
  exit 1
}

emit_python_program() {
  cat <<'PY'
from __future__ import annotations

import json
import shutil
import sys
from datetime import datetime, timezone
from pathlib import Path
from tempfile import NamedTemporaryFile


MODE = sys.argv[1]
ROOTS = [Path(arg).expanduser() for arg in sys.argv[2:]]

OPERATOR_AGENTS_CANONICAL = """# AGENTS.md - Workspace Bootstrap

## Skills First

- If a request starts with `/`, check the matching skill first.
- Read the skill's `SKILL.md` before acting.
- Do not invent alternate implementations when a skill already owns the workflow.

## Session Start

1. Read `SOUL.md`.
2. Read `USER.md`.
3. Read `memory/YYYY-MM-DD.md` for today and yesterday when available.
4. Read pending learnings from `.learnings/LEARNINGS.md` when the file exists.
5. Read `MEMORY.md` only in main/direct sessions.

## Group Chats

- Speak when asked, mentioned, or when you can add clear value.
- Prefer one complete reply for one user request.
- Do not leak private direct-chat context into shared chats.

## Privacy and Safety

- Do not exfiltrate private data.
- Ask before destructive changes or external sends.
- When a user requests a file, send the file instead of only reporting a path.
- For chat delivery from a normal assistant reply, do not use `MEDIA:/absolute/path/...`.
- Use a safe relative workspace path like `MEDIA:./out/file.pdf` for supported media/safe document types, or use the message tool/filePath path when available.
- Do not claim that chat attachment delivery is impossible when a local file already exists.
- For Telegram media tied to an attachment or reply, use `scripts/telegram_media_recover.py` before claiming the media is missing.

## Runtime and Ops

- Use server-doctor owned runbooks for gateway, transport, config, and restart procedures.
- Keep skill-specific workflow rules inside their owning skills.
- Keep heartbeat instructions in `HEARTBEAT.md` only if they are actually needed.
"""

OPERATOR_TOOLS_CANONICAL = """# TOOLS.md - Workspace Tool Index

- Use /opt/clawd-workspace/SKILLS.md for the skill command index.
- Skills own their tools; read the matching `SKILL.md` before using a skill-managed tool.
- `telegram-chip` API base: `http://127.0.0.1:8080` (`/health` before Telegram operations).
- Browser relay status: `http://127.0.0.1:18800/json/version`
- Browser relay tabs: `http://127.0.0.1:18800/json/list`
- Google Workspace quick check: `/opt/clawd-workspace/scripts/gog-check.sh`
- Telegram media recovery helper: `/opt/clawd-workspace/scripts/telegram_media_recover.py`
- Chat attachments from OpenClaw final replies: prefer `MEDIA:./relative/path/to/file.pdf` or another safe relative workspace path for supported media/safe document types; avoid `MEDIA:/absolute/path/...` in normal replies.
- Keep secrets, SSH fallbacks, incident runbooks, and workflow doctrine out of this file.
"""

AGENT_WORKSPACE_AGENTS_CANONICAL = """# AGENTS.md - Your Workspace

This folder is home. Treat it that way.

## First Run

If `BOOTSTRAP.md` exists, that's your birth certificate. Follow it, figure out who you are, then delete it. You won't need it again.

## Every Session

Before doing anything else:

1. Read `SOUL.md` - this is who you are
2. Read `USER.md` - this is who you're helping
3. Read `memory/YYYY-MM-DD.md` (today + yesterday) for recent context
4. **If in MAIN SESSION** (direct chat with your human): Also read `MEMORY.md`

Don't ask permission. Just do it.

## Memory

You wake up fresh each session. These files are your continuity:

- **Daily notes:** `memory/YYYY-MM-DD.md` (create `memory/` if needed) - raw logs of what happened
- **Long-term:** `MEMORY.md` - your curated memories, like a human's long-term memory

Capture what matters. Decisions, context, things to remember. Skip the secrets unless asked to keep them.

### MEMORY.md - Your Long-Term Memory

- **ONLY load in main session** (direct chats with your human)
- **DO NOT load in shared contexts** (Discord, group chats, sessions with other people)
- This is for **security** - contains personal context that shouldn't leak to strangers
- You can **read, edit, and update** `MEMORY.md` freely in main sessions
- Write significant events, thoughts, decisions, opinions, and lessons learned
- This is your curated memory - the distilled essence, not raw logs

### Write It Down - No "Mental Notes"!

- **Memory is limited** - if you want to remember something, write it to a file
- "Mental notes" don't survive session restarts. Files do.
- When someone says "remember this", update `memory/YYYY-MM-DD.md` or the relevant file
- When you learn a lesson, update `AGENTS.md`, `TOOLS.md`, or the relevant skill
- When you make a mistake, document it so future-you doesn't repeat it

## Safety

- Don't exfiltrate private data. Ever.
- Don't run destructive commands without asking.
- `trash` > `rm` (recoverable beats gone forever)
- When the human asks for a file in chat, create it and attach it in the same final reply with a safe relative `MEDIA:` path for supported media/safe document types, or use the message tool/filePath route when available.
- Do not claim that chat attachment delivery is impossible when the file already exists locally.
- When in doubt, ask.

## Runtime Guardrails

- Do not edit `~/.openclaw/openclaw.json`, auth profiles, provider settings, model defaults, launchd plists, or gateway env unless the human explicitly asks for that exact change.
- Do not switch models or providers as "self-healing". Show the evidence first, explain the proposed change, and wait for approval.
- Do not claim an API key, billing state, or membership is invalid from one provider error, one failed command, or one Python exception. Verify with fresh runtime evidence first.
- Treat provider messages like `LLM request rejected`, `membership benefits`, `request timed out`, and similar errors as unverified until a fresh diagnostic command narrows the cause.

## External vs Internal

**Safe to do freely:**

- Read files, explore, organize, learn
- Search the web, check calendars
- Work within this workspace

**Ask first:**

- Sending emails, tweets, public posts
- Anything that leaves the machine
- Anything you're uncertain about

## Group Chats

You have access to your human's stuff. That doesn't mean you share their stuff. In groups, you're a participant - not their voice, not their proxy. Think before you speak.
"""

AGENT_WORKSPACE_TOOLS_CANONICAL = """# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics - the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room -> Main area, 180 deg wide angle
- front-door -> Entrance, motion-triggered

### SSH

- home-server -> 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

Add whatever helps you do your job. This is your cheat sheet.

## OpenClaw Chat Attachments

- After creating a file for chat delivery, attach it from the final reply with `MEDIA:./relative/path/to/file.pdf` or another safe relative workspace path.
- Do not use absolute `MEDIA:/...` paths in normal replies.
- One file = one `MEDIA:` line.
"""

COMMON_AGENTS_FORBIDDEN = [
    "Heartbeats - Be Proactive!",
    "/shaw Workflow Enforcement",
    "UI/Frontend Prod Fix Checklist",
    "Правила генерации контента",
    "Recurring Tasks",
    "Slash-команды для workflow",
    "Gateway Restart Pre-flight Check",
    "EVGYUR.PRO Scope Guard",
    "workflow-circuit-breakers.md",
    "TELEGRAM-CHIP POLICY (LOCAL ONLY)",
    "BROWSER POLICY (MANDATORY)",
    "Goal-Driven Autonomous Tasks",
    "SKILLS Yellow Pages",
]

COMMON_TOOLS_FORBIDDEN = [
    "Mac mini (chip) — SSH / Runtime",
    "Пароль fallback",
    "SKILLS Yellow Pages",
    "Telegram Attachment SOP",
    "Telethon Policy",
    "Workflow Enforcement Tools",
    "workflow-circuit-breakers.md",
    "Human20 Video Pipeline",
    "Promise Tracker",
    "BRAIN.md State Manager",
    "TELEGRAM-CHIP POLICY (LOCAL ONLY)",
    "Workflow Enforcement Tools",
]


def fail(message: str, code: int = 1) -> None:
    print(json.dumps({"status": "error", "error": message}, indent=2))
    raise SystemExit(code)


def write_text_atomic(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with NamedTemporaryFile(
        "w",
        encoding="utf-8",
        dir=path.parent,
        delete=False,
    ) as tmp_file:
        tmp_file.write(content)
        if not content.endswith("\n"):
            tmp_file.write("\n")
        tmp_path = Path(tmp_file.name)
    tmp_path.replace(path)


def read_text(path: Path) -> str:
    if not path.exists():
        return ""
    return path.read_text(encoding="utf-8")


def forbidden_hits(content: str, patterns: list[str]) -> list[str]:
    return [pattern for pattern in patterns if pattern in content]


def normalize_text(content: str) -> str:
    return content.strip() + "\n" if content.strip() else ""


def profile_for_root(root: Path) -> str:
    root_posix = root.as_posix()
    if root_posix.endswith("/.openclaw/workspace"):
        return "agent-workspace"
    return "operator"


def profile_content(profile: str) -> tuple[str, str]:
    if profile == "agent-workspace":
        return AGENT_WORKSPACE_AGENTS_CANONICAL, AGENT_WORKSPACE_TOOLS_CANONICAL
    return OPERATOR_AGENTS_CANONICAL, OPERATOR_TOOLS_CANONICAL


def looks_like_local_notes_template(content: str) -> bool:
    required = (
        "# TOOLS.md - Local Notes",
        "Skills define _how_ tools work.",
        "## What Goes Here",
        "## Why Separate?",
        "## OpenClaw Chat Attachments",
        "MEDIA:./relative/path/to/file.pdf",
    )
    return all(part in content for part in required)


def build_root_report(root: Path) -> dict:
    if not root.is_dir():
        fail(f"missing workspace root: {root}")

    profile = profile_for_root(root)
    canonical_agents, canonical_tools = profile_content(profile)
    agents_path = root / "AGENTS.md"
    tools_path = root / "TOOLS.md"
    agents_content = read_text(agents_path)
    tools_content = read_text(tools_path)
    agents_hits = forbidden_hits(agents_content, COMMON_AGENTS_FORBIDDEN)
    tools_hits = forbidden_hits(tools_content, COMMON_TOOLS_FORBIDDEN)
    agents_needs_rewrite = normalize_text(agents_content) != canonical_agents or bool(agents_hits)
    if profile == "agent-workspace":
        tools_needs_rewrite = bool(tools_hits) or not looks_like_local_notes_template(tools_content)
    else:
        tools_needs_rewrite = normalize_text(tools_content) != canonical_tools or bool(tools_hits)

    return {
        "root": str(root),
        "profile": profile,
        "status": "drift" if agents_needs_rewrite or tools_needs_rewrite else "ok",
        "agentsNeedsRewrite": agents_needs_rewrite,
        "toolsNeedsRewrite": tools_needs_rewrite,
        "agentsForbiddenHits": agents_hits,
        "toolsForbiddenHits": tools_hits,
        "agentsBytes": len(agents_content.encode("utf-8")),
        "toolsBytes": len(tools_content.encode("utf-8")),
        "canonicalAgentsBytes": len(canonical_agents.encode("utf-8")),
        "canonicalToolsBytes": len(canonical_tools.encode("utf-8")),
    }


def summarize_reports(root_reports: list[dict]) -> dict:
    status = "drift" if any(
        report["agentsNeedsRewrite"] or report["toolsNeedsRewrite"] for report in root_reports
    ) else "ok"
    summary = {
        "status": status,
        "roots": root_reports,
    }
    if len(root_reports) == 1:
        summary.update(root_reports[0])
    return summary


def build_report() -> dict:
    if not ROOTS:
        fail("missing workspace root")
    return summarize_reports([build_root_report(root) for root in ROOTS])


def apply_root_rewrite(report: dict) -> dict:
    root = Path(report["root"])
    profile = report["profile"]
    canonical_agents, canonical_tools = profile_content(profile)

    if not report["agentsNeedsRewrite"] and not report["toolsNeedsRewrite"]:
        report["status"] = "unchanged"
        report["updatedFiles"] = []
        return report

    timestamp = datetime.now(timezone.utc).strftime("%Y%m%d-%H%M%S")
    backup_dir = root / "backups" / f"openclaw-bootstrap-hygiene-{timestamp}"
    backup_dir.mkdir(parents=True, exist_ok=True)

    updated_files: list[str] = []
    for name, content, needs_rewrite in (
        ("AGENTS.md", canonical_agents, report["agentsNeedsRewrite"]),
        ("TOOLS.md", canonical_tools, report["toolsNeedsRewrite"]),
    ):
        if not needs_rewrite:
            continue
        path = root / name
        if path.exists():
            shutil.copy2(path, backup_dir / f"{name}.bak")
        write_text_atomic(path, content)
        updated_files.append(name)

    updated_report = build_root_report(root)
    updated_report["status"] = "updated"
    updated_report["backupDir"] = str(backup_dir)
    updated_report["updatedFiles"] = updated_files
    return updated_report


def apply_rewrite(report: dict) -> dict:
    updated_reports = [apply_root_rewrite(root_report) for root_report in report["roots"]]
    status = "updated" if any(item["status"] == "updated" for item in updated_reports) else "unchanged"
    summary = {
        "status": status,
        "roots": updated_reports,
    }
    if len(updated_reports) == 1:
        summary.update(updated_reports[0])
    return summary


report = build_report()

if MODE == "dry-run":
    print(json.dumps(report, indent=2))
    raise SystemExit(0)

if MODE == "apply":
    print(json.dumps(apply_rewrite(report), indent=2))
    raise SystemExit(0)

if MODE == "validate":
    print(json.dumps(report, indent=2))
    raise SystemExit(0 if report["status"] == "ok" else 1)

fail(f"unsupported mode: {MODE}")
PY
}

run_local_mode() {
  local mode="$1"
  shift
  emit_python_program | python3 - "$mode" "$@"
}

run_remote_mode() {
  local mode="$1"
  local host="$2"
  shift 2

  local remote_cmd="python3 -"
  local arg
  for arg in "$mode" "$@"; do
    printf -v remote_cmd '%s %q' "$remote_cmd" "$arg"
  done

  emit_python_program | ssh "$host" "$remote_cmd"
}

default_workspace_roots_for_host() {
  local host="$1"
  case "$host" in
    mac-mini-claw|mac-mini-claw.tail2b1f86.ts.net|claw@100.119.134.8|claw@mac-mini-claw|claw@mac-mini-claw.tail2b1f86.ts.net)
      printf '%s\n' "/opt/clawd-workspace" "/Users/claw/.openclaw/workspace"
      ;;
    *)
      printf '%s\n' "/opt/clawd-workspace"
      ;;
  esac
}

main() {
  local mode=""
  local host=""
  local -a roots=()
  local -a workspace_roots=()

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --dry-run)
        mode="dry-run"
        shift
        ;;
      --apply)
        mode="apply"
        shift
        ;;
      --validate)
        mode="validate"
        shift
        ;;
      --dry-run-local)
        mode="dry-run"
        shift
        ;;
      --apply-local)
        mode="apply"
        shift
        ;;
      --validate-local)
        mode="validate"
        shift
        ;;
      --host)
        host="${2:-}"
        shift 2
        ;;
      --root)
        roots+=("${2:-}")
        shift 2
        ;;
      --workspace-root)
        workspace_roots+=("${2:-}")
        shift 2
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        die "unknown argument: $1"
        ;;
    esac
  done

  [[ -n "$mode" ]] || die "missing mode"

  if [[ -n "$host" ]]; then
    [[ ${#roots[@]} -eq 0 ]] || die "--root is only valid with local modes"
    if [[ ${#workspace_roots[@]} -eq 0 ]]; then
      mapfile -t workspace_roots < <(default_workspace_roots_for_host "$host")
    fi
    run_remote_mode "$mode" "$host" "${workspace_roots[@]}"
    exit 0
  fi

  [[ ${#workspace_roots[@]} -eq 0 ]] || die "--workspace-root is only valid with remote modes"
  [[ ${#roots[@]} -gt 0 ]] || die "missing --root for local mode"
  run_local_mode "$mode" "${roots[@]}"
}

main "$@"
