# Changelog

## 2.0.0 — Public portability and safety boundary

This release intentionally removes operator-specific defaults and private repository coupling.

### Migration

- Pass `--runtime-user <user>` to every `openclaw-single-gateway.sh` invocation, or set `OPENCLAW_RUNTIME_USER`.
- Pass `--runtime-home <absolute-path>` and `--openclaw-bin <absolute-path>` when the runtime does not use the documented defaults.
- The retired bootstrap-hygiene helper and its operator-coupled workspace assumptions were removed.
- Private submodules, docs-sync commands, and the vendored upstream documentation snapshot were removed; use maintained upstream documentation directly.

### Security changes

- Remote gateway operations now preserve the first failing exit code and verify the live user service command.
- Runtime paths reject traversal, symlink escape, control characters, spaces, and unsafe systemd-unit values.
- Gateway ports must be within `1..65535`.
- Generic public-safety checks inspect tracked paths, every IPv4 occurrence, and unreadable/non-UTF-8 authored files.
- Operator-specific deny-lists are accepted only through the untracked `--private-markers-file` privacy-gate overlay.
