<!-- Source: https://docs.openclaw.ai/install/migrating -->
<!-- Title: Migration Guide - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/migrating)

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

-   [Migrating OpenClaw to a new machine](https://docs.openclaw.ai/install/migrating)
-   [Before you start (what you are migrating)](https://docs.openclaw.ai/install/migrating)
-   [1) Identify your state directory](https://docs.openclaw.ai/install/migrating)
-   [2) Identify your workspace](https://docs.openclaw.ai/install/migrating)
-   [3) Understand what you will preserve](https://docs.openclaw.ai/install/migrating)
-   [Migration steps (recommended)](https://docs.openclaw.ai/install/migrating)
-   [Step 0 — Make a backup (old machine)](https://docs.openclaw.ai/install/migrating)
-   [Step 1 — Install OpenClaw on the new machine](https://docs.openclaw.ai/install/migrating)
-   [Step 2 — Copy the state dir + workspace to the new machine](https://docs.openclaw.ai/install/migrating)
-   [Step 3 — Run Doctor (migrations + service repair)](https://docs.openclaw.ai/install/migrating)
-   [Common footguns (and how to avoid them)](https://docs.openclaw.ai/install/migrating)
-   [Footgun: profile / state-dir mismatch](https://docs.openclaw.ai/install/migrating)
-   [Footgun: copying only openclaw.json](https://docs.openclaw.ai/install/migrating)
-   [Footgun: permissions / ownership](https://docs.openclaw.ai/install/migrating)
-   [Footgun: migrating between remote/local modes](https://docs.openclaw.ai/install/migrating)
-   [Footgun: secrets in backups](https://docs.openclaw.ai/install/migrating)
-   [Verification checklist](https://docs.openclaw.ai/install/migrating)
-   [Related](https://docs.openclaw.ai/install/migrating)

Maintenance

# Migration Guide

# 

[​

](https://docs.openclaw.ai/install/migrating)

Migrating OpenClaw to a new machine

This guide migrates a OpenClaw Gateway from one machine to another **without redoing onboarding**. The migration is simple conceptually:

-   Copy the **state directory** (`$OPENCLAW_STATE_DIR`, default: `~/.openclaw/`) — this includes config, auth, sessions, and channel state.
-   Copy your **workspace** (`~/.openclaw/workspace/` by default) — this includes your agent files (memory, prompts, etc.).

But there are common footguns around **profiles**, **permissions**, and **partial copies**.

## 

[​

](https://docs.openclaw.ai/install/migrating)

Before you start (what you are migrating)

### 

[​

](https://docs.openclaw.ai/install/migrating)

1) Identify your state directory

Most installs use the default:

-   **State dir:** `~/.openclaw/`

But it may be different if you use:

-   `--profile <name>` (often becomes `~/.openclaw-<profile>/`)
-   `OPENCLAW_STATE_DIR=/some/path`

If you’re not sure, run on the **old** machine:

Copy

```
openclaw status
```

Look for mentions of `OPENCLAW_STATE_DIR` / profile in the output. If you run multiple gateways, repeat for each profile.

### 

[​

](https://docs.openclaw.ai/install/migrating)

2) Identify your workspace

Common defaults:

-   `~/.openclaw/workspace/` (recommended workspace)
-   a custom folder you created

Your workspace is where files like `MEMORY.md`, `USER.md`, and `memory/*.md` live.

### 

[​

](https://docs.openclaw.ai/install/migrating)

3) Understand what you will preserve

If you copy **both** the state dir and workspace, you keep:

-   Gateway configuration (`openclaw.json`)
-   Auth profiles / API keys / OAuth tokens
-   Session history + agent state
-   Channel state (e.g. WhatsApp login/session)
-   Your workspace files (memory, skills notes, etc.)

If you copy **only** the workspace (e.g., via Git), you do **not** preserve:

-   sessions
-   credentials
-   channel logins

Those live under `$OPENCLAW_STATE_DIR`.

## 

[​

](https://docs.openclaw.ai/install/migrating)

Migration steps (recommended)

### 

[​

](https://docs.openclaw.ai/install/migrating)

Step 0 — Make a backup (old machine)

On the **old** machine, stop the gateway first so files aren’t changing mid-copy:

Copy

```
openclaw gateway stop
```

(Optional but recommended) archive the state dir and workspace:

Copy

```
# Adjust paths if you use a profile or custom locations
cd ~
tar -czf openclaw-state.tgz .openclaw

tar -czf openclaw-workspace.tgz .openclaw/workspace
```

If you have multiple profiles/state dirs (e.g. `~/.openclaw-main`, `~/.openclaw-work`), archive each.

### 

[​

](https://docs.openclaw.ai/install/migrating)

Step 1 — Install OpenClaw on the new machine

On the **new** machine, install the CLI (and Node if needed):

-   See: [Install](https://docs.openclaw.ai/install)

At this stage, it’s OK if onboarding creates a fresh `~/.openclaw/` — you will overwrite it in the next step.

### 

[​

](https://docs.openclaw.ai/install/migrating)

Step 2 — Copy the state dir + workspace to the new machine

Copy **both**:

-   `$OPENCLAW_STATE_DIR` (default `~/.openclaw/`)
-   your workspace (default `~/.openclaw/workspace/`)

Common approaches:

-   `scp` the tarballs and extract
-   `rsync -a` over SSH
-   external drive

After copying, ensure:

-   Hidden directories were included (e.g. `.openclaw/`)
-   File ownership is correct for the user running the gateway

### 

[​

](https://docs.openclaw.ai/install/migrating)

Step 3 — Run Doctor (migrations + service repair)

On the **new** machine:

Copy

```
openclaw doctor
```

Doctor is the “safe boring” command. It repairs services, applies config migrations, and warns about mismatches. Then:

Copy

```
openclaw gateway restart
openclaw status
```

## 

[​

](https://docs.openclaw.ai/install/migrating)

Common footguns (and how to avoid them)

### 

[​

](https://docs.openclaw.ai/install/migrating)

Footgun: profile / state-dir mismatch

If you ran the old gateway with a profile (or `OPENCLAW_STATE_DIR`), and the new gateway uses a different one, you’ll see symptoms like:

-   config changes not taking effect
-   channels missing / logged out
-   empty session history

Fix: run the gateway/service using the **same** profile/state dir you migrated, then rerun:

Copy

```
openclaw doctor
```

### 

[​

](https://docs.openclaw.ai/install/migrating)

Footgun: copying only `openclaw.json`

`openclaw.json` is not enough. Many providers store state under:

-   `$OPENCLAW_STATE_DIR/credentials/`
-   `$OPENCLAW_STATE_DIR/agents/<agentId>/...`

Always migrate the entire `$OPENCLAW_STATE_DIR` folder.

### 

[​

](https://docs.openclaw.ai/install/migrating)

Footgun: permissions / ownership

If you copied as root or changed users, the gateway may fail to read credentials/sessions. Fix: ensure the state dir + workspace are owned by the user running the gateway.

### 

[​

](https://docs.openclaw.ai/install/migrating)

Footgun: migrating between remote/local modes

-   If your UI (WebUI/TUI) points at a **remote** gateway, the remote host owns the session store + workspace.
-   Migrating your laptop won’t move the remote gateway’s state.

If you’re in remote mode, migrate the **gateway host**.

### 

[​

](https://docs.openclaw.ai/install/migrating)

Footgun: secrets in backups

`$OPENCLAW_STATE_DIR` contains secrets (API keys, OAuth tokens, WhatsApp creds). Treat backups like production secrets:

-   store encrypted
-   avoid sharing over insecure channels
-   rotate keys if you suspect exposure

## 

[​

](https://docs.openclaw.ai/install/migrating)

Verification checklist

On the new machine, confirm:

-   `openclaw status` shows the gateway running
-   Your channels are still connected (e.g. WhatsApp doesn’t require re-pair)
-   The dashboard opens and shows existing sessions
-   Your workspace files (memory, configs) are present

## 

[​

](https://docs.openclaw.ai/install/migrating)

Related

-   [Doctor](https://docs.openclaw.ai/gateway/doctor)
-   [Gateway troubleshooting](https://docs.openclaw.ai/gateway/troubleshooting)
-   [Where does OpenClaw store its data?](https://docs.openclaw.ai/help/faq)

[Updating](https://docs.openclaw.ai/install/updating)[Uninstall](https://docs.openclaw.ai/install/uninstall)

⌘I
