<!-- Source: https://docs.openclaw.ai/install/updating -->
<!-- Title: Updating - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/updating)

[OpenClaw home page![light logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)![dark logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)](https://docs.openclaw.ai/)

[Get started

](https://docs.openclaw.ai/)[Install

](https://docs.openclaw.ai/install)[Channels

](https://docs.openclaw.ai/channels)[Agents

](https://docs.openclaw.ai/pi)[Tools

](https://docs.openclaw.ai/tools)[Models

](https://docs.openclaw.ai/providers)[Platforms

](https://docs.openclaw.ai/platforms)[Gateway & Ops

](https://docs.openclaw.ai/gateway)[Reference

](https://docs.openclaw.ai/cli)[Help

](https://docs.openclaw.ai/help)

##### Install overview

-   [
    
    Install
    
    
    
    ](https://docs.openclaw.ai/install)
-   [
    
    Installer Internals
    
    
    
    ](https://docs.openclaw.ai/install/installer)

##### Other install methods

-   [
    
    Docker
    
    
    
    ](https://docs.openclaw.ai/install/docker)
-   [
    
    Podman
    
    
    
    ](https://docs.openclaw.ai/install/podman)
-   [
    
    Nix
    
    
    
    ](https://docs.openclaw.ai/install/nix)
-   [
    
    Ansible
    
    
    
    ](https://docs.openclaw.ai/install/ansible)
-   [
    
    Bun (Experimental)
    
    
    
    ](https://docs.openclaw.ai/install/bun)

##### Maintenance

-   [
    
    Updating
    
    
    
    ](https://docs.openclaw.ai/install/updating)
-   [
    
    Migration Guide
    
    
    
    ](https://docs.openclaw.ai/install/migrating)
-   [
    
    Uninstall
    
    
    
    ](https://docs.openclaw.ai/install/uninstall)

##### Hosting and deployment

-   [
    
    VPS Hosting
    
    
    
    ](https://docs.openclaw.ai/vps)
-   [
    
    Kubernetes
    
    
    
    ](https://docs.openclaw.ai/install/kubernetes)
-   [
    
    Fly.io
    
    
    
    ](https://docs.openclaw.ai/install/fly)
-   [
    
    Hetzner
    
    
    
    ](https://docs.openclaw.ai/install/hetzner)
-   [
    
    GCP
    
    
    
    ](https://docs.openclaw.ai/install/gcp)
-   [
    
    macOS VMs
    
    
    
    ](https://docs.openclaw.ai/install/macos-vm)
-   [
    
    exe.dev
    
    
    
    ](https://docs.openclaw.ai/install/exe-dev)
-   [
    
    Deploy on Railway
    
    
    
    ](https://docs.openclaw.ai/install/railway)
-   [
    
    Deploy on Render
    
    
    
    ](https://docs.openclaw.ai/install/render)
-   [
    
    Deploy on Northflank
    
    
    
    ](https://docs.openclaw.ai/install/northflank)

##### Advanced

-   [
    
    Development Channels
    
    
    
    ](https://docs.openclaw.ai/install/development-channels)

-   [Updating](https://docs.openclaw.ai/install/updating)
-   [Recommended: re-run the website installer (upgrade in place)](https://docs.openclaw.ai/install/updating)
-   [Before you update](https://docs.openclaw.ai/install/updating)
-   [Update (global install)](https://docs.openclaw.ai/install/updating)
-   [Core auto-updater (optional)](https://docs.openclaw.ai/install/updating)
-   [Update (openclaw update)](https://docs.openclaw.ai/install/updating)
-   [Update (Control UI / RPC)](https://docs.openclaw.ai/install/updating)
-   [Update (from source)](https://docs.openclaw.ai/install/updating)
-   [Always Run: openclaw doctor](https://docs.openclaw.ai/install/updating)
-   [Start / stop / restart the Gateway](https://docs.openclaw.ai/install/updating)
-   [Rollback / pinning (when something breaks)](https://docs.openclaw.ai/install/updating)
-   [Pin (global install)](https://docs.openclaw.ai/install/updating)
-   [Pin (source) by date](https://docs.openclaw.ai/install/updating)
-   [If you’re stuck](https://docs.openclaw.ai/install/updating)

Maintenance

# Updating

# 

[​

](https://docs.openclaw.ai/install/updating)

Updating

OpenClaw is moving fast (pre “1.0”). Treat updates like shipping infra: update → run checks → restart (or use `openclaw update`, which restarts) → verify.

## 

[​

](https://docs.openclaw.ai/install/updating)

Recommended: re-run the website installer (upgrade in place)

The **preferred** update path is to re-run the installer from the website. It detects existing installs, upgrades in place, and runs `openclaw doctor` when needed.

Copy

```
curl -fsSL https://openclaw.ai/install.sh | bash
```

Notes:

-   Add `--no-onboard` if you don’t want the setup wizard to run again.
-   For **source installs**, use:
    
    Copy
    
    ```
    curl -fsSL https://openclaw.ai/install.sh | bash -s -- --install-method git --no-onboard
    ```
    
    The installer will `git pull --rebase` **only** if the repo is clean.
-   For **global installs**, the script uses `npm install -g openclaw@latest` under the hood.
-   Legacy note: `clawdbot` remains available as a compatibility shim.

## 

[​

](https://docs.openclaw.ai/install/updating)

Before you update

-   Know how you installed: **global** (npm/pnpm) vs **from source** (git clone).
-   Know how your Gateway is running: **foreground terminal** vs **supervised service** (launchd/systemd).
-   Snapshot your tailoring:
    -   Config: `~/.openclaw/openclaw.json`
    -   Credentials: `~/.openclaw/credentials/`
    -   Workspace: `~/.openclaw/workspace`

## 

[​

](https://docs.openclaw.ai/install/updating)

Update (global install)

Global install (pick one):

Copy

```
npm i -g openclaw@latest
```

Copy

```
pnpm add -g openclaw@latest
```

We do **not** recommend Bun for the Gateway runtime (WhatsApp/Telegram bugs). To switch update channels (git + npm installs):

Copy

```
openclaw update --channel beta
openclaw update --channel dev
openclaw update --channel stable
```

Use `--tag <dist-tag|version|spec>` for a one-off package target override. For the current GitHub `main` head via a package-manager install:

Copy

```
openclaw update --tag main
```

Manual equivalents:

Copy

```
npm i -g github:openclaw/openclaw#main
```

Copy

```
pnpm add -g github:openclaw/openclaw#main
```

You can also pass an explicit package spec to `--tag` for one-off updates (for example a GitHub ref or tarball URL). See [Development channels](https://docs.openclaw.ai/install/development-channels) for channel semantics and release notes. Note: on npm installs, the gateway logs an update hint on startup (checks the current channel tag). Disable via `update.checkOnStart: false`.

### 

[​

](https://docs.openclaw.ai/install/updating)

Core auto-updater (optional)

Auto-updater is **off by default** and is a core Gateway feature (not a plugin).

Copy

```
{
  "update": {
    "channel": "stable",
    "auto": {
      "enabled": true,
      "stableDelayHours": 6,
      "stableJitterHours": 12,
      "betaCheckIntervalHours": 1
    }
  }
}
```

Behavior:

-   `stable`: when a new version is seen, OpenClaw waits `stableDelayHours` and then applies a deterministic per-install jitter in `stableJitterHours` (spread rollout).
-   `beta`: checks on `betaCheckIntervalHours` cadence (default: hourly) and applies when an update is available.
-   `dev`: no automatic apply; use manual `openclaw update`.

Use `openclaw update --dry-run` to preview update actions before enabling automation. Then:

Copy

```
openclaw doctor
openclaw gateway restart
openclaw health
```

Notes:

-   If your Gateway runs as a service, `openclaw gateway restart` is preferred over killing PIDs.
-   If you’re pinned to a specific version, see “Rollback / pinning” below.

## 

[​

](https://docs.openclaw.ai/install/updating)

Update (`openclaw update`)

For **source installs** (git checkout), prefer:

Copy

```
openclaw update
```

It runs a safe-ish update flow:

-   Requires a clean worktree.
-   Switches to the selected channel (tag or branch).
-   Fetches + rebases against the configured upstream (dev channel).
-   Installs deps, builds, builds the Control UI, and runs `openclaw doctor`.
-   Restarts the gateway by default (use `--no-restart` to skip).

If you installed via **npm/pnpm** (no git metadata), `openclaw update` will try to update via your package manager. If it can’t detect the install, use “Update (global install)” instead.

## 

[​

](https://docs.openclaw.ai/install/updating)

Update (Control UI / RPC)

The Control UI has **Update & Restart** (RPC: `update.run`). It:

1.  Runs the same source-update flow as `openclaw update` (git checkout only).
2.  Writes a restart sentinel with a structured report (stdout/stderr tail).
3.  Restarts the gateway and pings the last active session with the report.

If the rebase fails, the gateway aborts and restarts without applying the update.

## 

[​

](https://docs.openclaw.ai/install/updating)

Update (from source)

From the repo checkout: Preferred:

Copy

```
openclaw update
```

Manual (equivalent-ish):

Copy

```
git pull
pnpm install
pnpm build
pnpm ui:build # auto-installs UI deps on first run
openclaw doctor
openclaw health
```

Notes:

-   `pnpm build` matters when you run the packaged `openclaw` binary ([`openclaw.mjs`](https://github.com/openclaw/openclaw/blob/main/openclaw.mjs)) or use Node to run `dist/`.
-   If you run from a repo checkout without a global install, use `pnpm openclaw ...` for CLI commands.
-   If you run directly from TypeScript (`pnpm openclaw ...`), a rebuild is usually unnecessary, but **config migrations still apply** → run doctor.
-   Switching between global and git installs is easy: install the other flavor, then run `openclaw doctor` so the gateway service entrypoint is rewritten to the current install.

## 

[​

](https://docs.openclaw.ai/install/updating)

Always Run: `openclaw doctor`

Doctor is the “safe update” command. It’s intentionally boring: repair + migrate + warn. Note: if you’re on a **source install** (git checkout), `openclaw doctor` will offer to run `openclaw update` first. Typical things it does:

-   Migrate deprecated config keys / legacy config file locations.
-   Audit DM policies and warn on risky “open” settings.
-   Check Gateway health and can offer to restart.
-   Detect and migrate older gateway services (launchd/systemd; legacy schtasks) to current OpenClaw services.
-   On Linux, ensure systemd user lingering (so the Gateway survives logout).

Details: [Doctor](https://docs.openclaw.ai/gateway/doctor)

## 

[​

](https://docs.openclaw.ai/install/updating)

Start / stop / restart the Gateway

CLI (works regardless of OS):

Copy

```
openclaw gateway status
openclaw gateway stop
openclaw gateway restart
openclaw gateway --port 18789
openclaw logs --follow
```

If you’re supervised:

-   macOS launchd (app-bundled LaunchAgent): `launchctl kickstart -k gui/$UID/ai.openclaw.gateway` (use `ai.openclaw.<profile>`; legacy `com.openclaw.*` still works)
-   Linux systemd user service: `systemctl --user restart openclaw-gateway[-<profile>].service`
-   Windows (WSL2): `systemctl --user restart openclaw-gateway[-<profile>].service`
    -   `launchctl`/`systemctl` only work if the service is installed; otherwise run `openclaw gateway install`.

Runbook + exact service labels: [Gateway runbook](https://docs.openclaw.ai/gateway)

## 

[​

](https://docs.openclaw.ai/install/updating)

Rollback / pinning (when something breaks)

### 

[​

](https://docs.openclaw.ai/install/updating)

Pin (global install)

Install a known-good version (replace `<version>` with the last working one):

Copy

```
npm i -g openclaw@<version>
```

Copy

```
pnpm add -g openclaw@<version>
```

Tip: to see the current published version, run `npm view openclaw version`. Then restart + re-run doctor:

Copy

```
openclaw doctor
openclaw gateway restart
```

### 

[​

](https://docs.openclaw.ai/install/updating)

Pin (source) by date

Pick a commit from a date (example: “state of main as of 2026-01-01”):

Copy

```
git fetch origin
git checkout "$(git rev-list -n 1 --before=\"2026-01-01\" origin/main)"
```

Then reinstall deps + restart:

Copy

```
pnpm install
pnpm build
openclaw gateway restart
```

If you want to go back to latest later:

Copy

```
git checkout main
git pull
```

## 

[​

](https://docs.openclaw.ai/install/updating)

If you’re stuck

-   Run `openclaw doctor` again and read the output carefully (it often tells you the fix).
-   Check: [Troubleshooting](https://docs.openclaw.ai/gateway/troubleshooting)
-   Ask in Discord: [https://discord.gg/clawd](https://discord.gg/clawd)

[Bun (Experimental)](https://docs.openclaw.ai/install/bun)[Migration Guide](https://docs.openclaw.ai/install/migrating)

⌘I
