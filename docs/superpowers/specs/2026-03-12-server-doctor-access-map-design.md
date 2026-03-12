# Server Doctor Access Map Design

## Goal

Update the public `server-doctor` skill so it starts by collecting a usable environment map before diagnosis. The skill should warn that it is severely limited without access to the relevant hosts, bots, and local directories, but it must still work in a `partial map` mode when the operator only knows part of the estate.

## Scope

This change is limited to the public skill document in `server-doctor-public/SKILL.md`.

It should:

- add an upfront warning about limited usefulness without access
- require an `Access & Inventory Preflight` before deeper troubleshooting
- require a minimal map of hosts, bots, runtimes, users, directories, and safe connection paths
- allow `partial map` operation when the operator lacks complete information
- reframe the skill around building an operational map first, then performing diagnosis and repair

It should not:

- require secrets to be pasted into public docs or chat by default
- assume only remote SSH workflows; local execution and container access must remain valid
- bake in any private hostnames, users, bot names, tokens, or credentials

## Design

The skill will open with a clear warning: if the agent cannot reach the relevant bots, servers, containers, or local worktrees, it may help with reasoning but cannot reliably diagnose or repair the system.

The first workflow step becomes `Access & Inventory Preflight`. Before normal diagnostics, the agent must ask the operator for a minimal environment map:

- known hosts or local machines
- which bots/services run on each machine
- Unix user or runtime owner
- known directories, service names, Compose projects, or launch agents
- safe access method such as `ssh`, `tailscale`, local shell, `docker exec`, `systemctl --user`, or a jump host

When the operator lacks complete information, the skill enters `partial map` mode. In this mode, it should:

- record confirmed facts
- list unknowns explicitly
- keep asking for the next highest-value access detail
- continue with low-risk discovery where access exists

The rest of the document should reflect the new priority order:

1. warn about access limits
2. collect the map
3. discover runtimes and service topology
4. document restart/log/status paths
5. investigate incidents using the growing map

## Success Criteria

- The skill no longer implies that generic host inspection is the correct first step.
- A future agent reading the skill will first request an access map from the user.
- The skill remains public-safe and does not require private credentials to be stored in the skill itself.
- The output explicitly includes a host map, bot map, access map, runtime map, and known unknowns.
