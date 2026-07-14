# Pattern: auth store permission mismatch

## Symptom

A provider reports missing or invalid credentials even though the expected auth store exists and contains valid data.

## Evidence

The decisive log line is a filesystem error such as `Permission denied`, followed by a higher-level message such as `No credentials stored`.

Check from the runtime user's perspective:

```bash
stat -c '%U:%G %a %n' "$HERMES_HOME/auth.json"
sudo -u <runtime-user> test -r "$HERMES_HOME/auth.json"
sudo -u <runtime-user> hermes doctor
```

Do not inspect or print the auth contents in an incident report.

## Root cause

An operator or root-owned setup command rewrote the auth store with restrictive mode but the wrong owner. The service account therefore sees the file as absent or unparsable even though the credentials are present.

## Repair

Restore ownership to the service account while keeping the file private:

```bash
chown <runtime-user>:<runtime-group> "$HERMES_HOME/auth.json"
chmod 600 "$HERMES_HOME/auth.json"
```

Restart only the affected service after recording its current state and rollback path.

## Verification

- file owner/group match the service identity;
- mode remains `600`;
- `hermes doctor` succeeds as the runtime user;
- a bounded provider smoke succeeds as the runtime user;
- fresh logs contain no new permission or credential-missing error.

## Guardrail

Any privileged process that writes the auth store must finish by restoring the declared owner/group and mode. Add a post-write ownership assertion to setup or synchronization tooling.
