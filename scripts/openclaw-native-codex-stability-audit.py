#!/usr/bin/env python3
"""Audit an OpenClaw native Codex tenant for common hang risks.

This script is intentionally read-only. It is meant to run on the host that owns
the OpenClaw state directory, usually as the same Unix user that runs the
gateway.
"""

from __future__ import annotations

import argparse
import json
import subprocess
import time
from pathlib import Path
from typing import Any


def load_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def contains_text(value: Any, needle: str) -> bool:
    try:
        return needle in json.dumps(value, ensure_ascii=False)
    except TypeError:
        return needle in str(value)


def iter_cron_jobs(cron_path: Path) -> list[dict[str, Any]]:
    if not cron_path.exists():
        return []
    data = load_json(cron_path)
    if isinstance(data, dict):
        jobs = data.get("jobs", [])
    else:
        jobs = data
    return [job for job in jobs if isinstance(job, dict)]


def iter_sessions(state_dir: Path) -> list[tuple[str, str, dict[str, Any]]]:
    rows: list[tuple[str, str, dict[str, Any]]] = []
    for store in (state_dir / "agents").glob("*/sessions/sessions.json"):
        agent_id = store.parts[-3]
        try:
            data = load_json(store)
        except Exception:
            continue
        if not isinstance(data, dict):
            continue
        for key, session in data.items():
            if isinstance(session, dict):
                rows.append((agent_id, key, session))
    return rows


def read_processes() -> list[dict[str, Any]]:
    cmd = ["ps", "-eo", "pid,ppid,user,stat,pcpu,pmem,rss,etime,args"]
    try:
        out = subprocess.check_output(cmd, text=True, stderr=subprocess.DEVNULL)
    except Exception:
        return []
    rows = []
    for line in out.splitlines()[1:]:
        parts = line.split(None, 8)
        if len(parts) < 9:
            continue
        pid, ppid, user, stat, pcpu, pmem, rss, etime, args = parts
        rows.append(
            {
                "pid": int(pid),
                "ppid": int(ppid),
                "user": user,
                "stat": stat,
                "pcpu": float(pcpu),
                "pmem": float(pmem),
                "rss_kb": int(rss),
                "etime": etime,
                "args": args,
            }
        )
    return rows


def audit(args: argparse.Namespace) -> dict[str, Any]:
    state_dir = args.state_dir.expanduser()
    config_path = args.config or (state_dir / "openclaw.json")
    now_ms = time.time() * 1000
    findings: list[dict[str, Any]] = []

    config: dict[str, Any] = {}
    if config_path.exists():
        config = load_json(config_path)
    else:
        findings.append(
            {
                "severity": "critical",
                "code": "missing-config",
                "message": f"Config path does not exist: {config_path}",
            }
        )

    defaults = config.get("agents", {}).get("defaults", {}) if config else {}
    model = defaults.get("model", {})
    runtime = defaults.get("agentRuntime", {})
    subagents = defaults.get("subagents", {})
    if model.get("primary") != args.expected_model:
        findings.append(
            {
                "severity": "critical",
                "code": "default-model-drift",
                "message": "Default model is not the expected native OpenAI model.",
                "actual": model.get("primary"),
                "expected": args.expected_model,
            }
        )
    if runtime.get("id") != "codex":
        findings.append(
            {
                "severity": "critical",
                "code": "default-runtime-drift",
                "message": "Default agent runtime is not Codex.",
                "actual": runtime,
            }
        )
    if defaults.get("maxConcurrent") != args.expected_concurrency:
        findings.append(
            {
                "severity": "warning",
                "code": "gateway-concurrency-drift",
                "message": "Native Codex tenants should keep gateway admission bounded.",
                "actual": defaults.get("maxConcurrent"),
                "expected": args.expected_concurrency,
            }
        )
    if subagents.get("maxConcurrent") != args.expected_concurrency:
        findings.append(
            {
                "severity": "warning",
                "code": "subagent-concurrency-drift",
                "message": "Native Codex subagent concurrency is not bounded.",
                "actual": subagents.get("maxConcurrent"),
                "expected": args.expected_concurrency,
            }
        )

    cron_jobs = iter_cron_jobs(state_dir / "cron" / "jobs.json")
    stale_cron_jobs = [
        {
            "id": job.get("id"),
            "name": job.get("name"),
            "agentId": job.get("agentId"),
            "enabled": job.get("enabled"),
        }
        for job in cron_jobs
        if job.get("enabled") is not False and contains_text(job, "openai-codex")
    ]
    if stale_cron_jobs:
        findings.append(
            {
                "severity": "critical",
                "code": "cron-openai-codex-drift",
                "message": "Enabled cron jobs still contain openai-codex route state.",
                "count": len(stale_cron_jobs),
                "examples": stale_cron_jobs[: args.example_limit],
            }
        )

    cron_model_drift = []
    if args.expected_cron_model or args.expected_cron_thinking:
        for job in cron_jobs:
            payload = job.get("payload") if isinstance(job.get("payload"), dict) else {}
            actual_model = payload.get("model")
            actual_thinking = payload.get("thinking")
            model_bad = args.expected_cron_model and actual_model != args.expected_cron_model
            thinking_bad = (
                args.expected_cron_thinking
                and actual_thinking != args.expected_cron_thinking
            )
            if model_bad or thinking_bad:
                cron_model_drift.append(
                    {
                        "id": job.get("id"),
                        "name": job.get("name"),
                        "agentId": job.get("agentId"),
                        "enabled": job.get("enabled"),
                        "model": actual_model,
                        "thinking": actual_thinking,
                    }
                )
    if cron_model_drift:
        findings.append(
            {
                "severity": "critical",
                "code": "cron-model-thinking-drift",
                "message": "Cron payload model or thinking level does not match the expected policy.",
                "count": len(cron_model_drift),
                "expectedModel": args.expected_cron_model,
                "expectedThinking": args.expected_cron_thinking,
                "examples": cron_model_drift[: args.example_limit],
            }
        )

    recent_sessions = []
    stale_route_sessions = []
    large_sessions = []
    active_cutoff_ms = args.active_hours * 3600 * 1000
    for agent_id, key, session in iter_sessions(state_dir):
        updated_at = session.get("updatedAt")
        age_ms = now_ms - updated_at if isinstance(updated_at, (int, float)) else None
        if age_ms is not None and age_ms <= active_cutoff_ms:
            recent_sessions.append((agent_id, key, session, age_ms))
            provider = session.get("modelProvider") or session.get("providerOverride")
            if provider == "openai-codex":
                stale_route_sessions.append(
                    {
                        "agentId": agent_id,
                        "key": key,
                        "sessionId": session.get("sessionId"),
                        "ageSeconds": int(age_ms / 1000),
                    }
                )
        total_tokens = session.get("totalTokens")
        if isinstance(total_tokens, int) and total_tokens >= args.large_session_tokens:
            large_sessions.append(
                {
                    "agentId": agent_id,
                    "key": key,
                    "sessionId": session.get("sessionId"),
                    "totalTokens": total_tokens,
                }
            )
    if stale_route_sessions:
        findings.append(
            {
                "severity": "critical",
                "code": "active-session-openai-codex-drift",
                "message": "Recent sessions still report openai-codex provider state.",
                "count": len(stale_route_sessions),
                "examples": stale_route_sessions[: args.example_limit],
            }
        )
    if large_sessions:
        findings.append(
            {
                "severity": "warning",
                "code": "large-session-state",
                "message": "Large sessions increase compaction/recovery cost and stall blast radius.",
                "count": len(large_sessions),
                "examples": large_sessions[: args.example_limit],
            }
        )

    processes = read_processes()
    owner_processes = [p for p in processes if p["user"] == args.owner]
    app_servers = [
        p
        for p in owner_processes
        if "codex app-server" in p["args"] and args.codex_port in p["args"]
    ]
    app_rss_kb = sum(p["rss_kb"] for p in app_servers)
    if app_rss_kb >= args.max_appserver_rss_gb * 1024 * 1024:
        findings.append(
            {
                "severity": "critical",
                "code": "codex-appserver-rss-high",
                "message": "Codex app-server RSS is above threshold.",
                "rssGb": round(app_rss_kb / 1024 / 1024, 2),
                "thresholdGb": args.max_appserver_rss_gb,
                "pids": [p["pid"] for p in app_servers],
            }
        )
    openclaw_agents = [
        p for p in owner_processes if p["args"].strip().startswith("openclaw-agent")
    ]
    if len(openclaw_agents) > args.max_openclaw_agents:
        findings.append(
            {
                "severity": "warning",
                "code": "openclaw-agent-count-high",
                "message": "Many openclaw-agent workers are attached to the tenant.",
                "count": len(openclaw_agents),
                "threshold": args.max_openclaw_agents,
                "examples": [
                    {"pid": p["pid"], "rssMb": round(p["rss_kb"] / 1024, 1), "etime": p["etime"]}
                    for p in openclaw_agents[: args.example_limit]
                ],
            }
        )

    return {
        "stateDir": str(state_dir),
        "owner": args.owner,
        "expectedModel": args.expected_model,
        "expectedConcurrency": args.expected_concurrency,
        "recentSessionCount": len(recent_sessions),
        "cronJobCount": len(cron_jobs),
        "codexAppServerRssGb": round(app_rss_kb / 1024 / 1024, 2),
        "codexAppServerPids": [p["pid"] for p in app_servers],
        "openclawAgentCount": len(openclaw_agents),
        "findings": findings,
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--state-dir", type=Path, default=Path.home() / ".openclaw")
    parser.add_argument("--config", type=Path)
    parser.add_argument("--owner", default="chip")
    parser.add_argument("--expected-model", default="openai/gpt-5.5")
    parser.add_argument("--expected-concurrency", type=int, default=1)
    parser.add_argument("--codex-port", default="39175")
    parser.add_argument("--expected-cron-model")
    parser.add_argument("--expected-cron-thinking")
    parser.add_argument("--active-hours", type=float, default=4)
    parser.add_argument("--large-session-tokens", type=int, default=120_000)
    parser.add_argument("--max-appserver-rss-gb", type=float, default=8.0)
    parser.add_argument("--max-openclaw-agents", type=int, default=4)
    parser.add_argument("--example-limit", type=int, default=8)
    parser.add_argument("--json", action="store_true")
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    result = audit(args)
    if args.json:
        print(json.dumps(result, ensure_ascii=False, indent=2))
    else:
        print(f"state: {result['stateDir']}")
        print(f"codex app-server RSS: {result['codexAppServerRssGb']} GiB")
        print(f"openclaw-agent workers: {result['openclawAgentCount']}")
        if not result["findings"]:
            print("findings: none")
        else:
            print("findings:")
            for finding in result["findings"]:
                print(f"- [{finding['severity']}] {finding['code']}: {finding['message']}")
                for key in ("actual", "expected", "count", "rssGb", "thresholdGb"):
                    if key in finding:
                        print(f"  {key}: {finding[key]}")
                if finding.get("examples"):
                    print(f"  examples: {json.dumps(finding['examples'], ensure_ascii=False)}")
    return 2 if result["findings"] else 0


if __name__ == "__main__":
    raise SystemExit(main())
