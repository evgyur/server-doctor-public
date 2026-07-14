# Server Doctor Command Layer

This reference lists public-safe command entrypoints included with `server-doctor-public`.

Commands should stay generic: use host aliases, environment variables, or operator-provided paths. Do not hardcode private IPs, chat IDs, usernames, tokens, or local-only directories in public scripts.

## Vendored docs snapshot

Use `references/openclaw-docs/FILELIST.md` to discover pages in the bundled upstream snapshot. Check `references/openclaw-docs/state.json` before relying on version-sensitive details. If the snapshot is stale, use the live public documentation; this repository has no private refresh submodule.

## Server health / remediation MVP

```bash
./scripts/doctor-mvp.sh check <host-alias-or-user@host> [output_dir]
./scripts/doctor-mvp.sh fix <host-alias-or-user@host> [output_dir]
./scripts/doctor-mvp.sh preflight <host-alias-or-user@host> [output_dir]
```

Use `check` before `fix`. Keep output artifacts out of public commits unless they are sanitized examples.

## Telegram group agent binding check

```bash
python3 scripts/ensure-telegram-group-agent-binding.py --help
```

Use for validating public-safe Telegram group/agent binding config. Never print bot tokens or private chat IDs in public reports.

## OpenClaw post-update Telegram transport hotfix

```bash
./scripts/openclaw-post-update-transport-hotfix.sh --dry-run --host <host-alias>
./scripts/openclaw-post-update-transport-hotfix.sh --apply --host <host-alias>
./scripts/openclaw-post-update-transport-hotfix.sh --validate --host <host-alias>
```

Run dry-run first. Validate with visible delivery proof when possible.

## OpenClaw Telegram transport hotfix

```bash
./scripts/openclaw-telegram-transport-hotfix.sh --dry-run --host <host-alias>
./scripts/openclaw-telegram-transport-hotfix.sh --apply --host <host-alias>
./scripts/openclaw-telegram-transport-hotfix.sh --validate --host <host-alias>
```

Use for transport drift where the runtime is alive but Telegram delivery is broken.

## OpenClaw per-agent auth-profile sync

```bash
./scripts/openclaw-auth-profile-sync.sh --dry-run --host <host-alias>
./scripts/openclaw-auth-profile-sync.sh --apply --host <host-alias>
./scripts/openclaw-auth-profile-sync.sh --validate --host <host-alias>
```

Use when configured model/provider auth differs between runtime profile and per-agent profile.

## OpenClaw bootstrap hygiene

```bash
./scripts/openclaw-bootstrap-hygiene.sh --dry-run --host <host-alias> --workspace-root <path>
./scripts/openclaw-bootstrap-hygiene.sh --apply --host <host-alias> --workspace-root <path>
./scripts/openclaw-bootstrap-hygiene.sh --validate --host <host-alias> --workspace-root <path>
```

Use when bootstrapping files, hooks, or context loaders are causing latency or stale instructions.

## OpenClaw single-gateway canonicalization

```bash
./scripts/openclaw-single-gateway.sh --dry-run --host <host-alias> --runtime-user <user>
./scripts/openclaw-single-gateway.sh --apply --host <host-alias> --runtime-user <user>
./scripts/openclaw-single-gateway.sh --validate --host <host-alias> --runtime-user <user>
```

Use on hosts where two gateways compete for the same bot, port, or delivery lane. Confirm ownership before applying.

## macOS single OpenClaw runtime

```bash
./scripts/macos-single-openclaw-runtime.sh --dry-run
./scripts/macos-single-openclaw-runtime.sh --apply
```

Use for local macOS LaunchAgent/runtime duplication. Do not apply it to Linux hosts.

## Model normalization helper

```bash
python3 scripts/normalize-openclaw-models.py --help
```

Use for config-only normalization. Review the diff before applying any generated change.

## Native Codex stability audit

```bash
python3 scripts/openclaw-native-codex-stability-audit.py --help
```

Use for read-only stability checks around native Codex/OpenAI runtime behavior.
