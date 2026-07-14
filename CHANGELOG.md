# Changelog

## 2.0.0 — Public portability and safety boundary

This release intentionally removes operator-specific defaults and private repository coupling.

### Migration

- Pass `--runtime-user <user>` to every `openclaw-single-gateway.sh` invocation, or set `OPENCLAW_RUNTIME_USER`.
- Pass `--runtime-home <absolute-path>` and `--openclaw-bin <absolute-path>` when the runtime does not use the documented defaults.
- Remote bootstrap-hygiene operations now require at least one explicit `--workspace-root <absolute-path>`.
- Replace references to removed private submodules and docs-sync commands with the vendored, provenance-labelled snapshot under `references/openclaw-docs/`.

### Security changes

- Remote gateway operations now preserve the first failing exit code and verify the live user service command.
- Runtime paths reject traversal, symlink escape, control characters, spaces, and unsafe systemd-unit values.
- Gateway ports must be within `1..65535`.
- Public-safety checks inspect compound private identities, tracked paths, every IPv4 occurrence, and unreadable/non-UTF-8 authored files.
- Repeated bootstrap roots are deduplicated before backup and rewrite.
