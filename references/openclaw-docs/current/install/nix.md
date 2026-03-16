<!-- Source: https://docs.openclaw.ai/install/nix -->
<!-- Title: Nix - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/nix)

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

-   [Nix Installation](https://docs.openclaw.ai/install/nix)
-   [Quick Start](https://docs.openclaw.ai/install/nix)
-   [What you get](https://docs.openclaw.ai/install/nix)
-   [Nix Mode Runtime Behavior](https://docs.openclaw.ai/install/nix)
-   [Config + state paths](https://docs.openclaw.ai/install/nix)
-   [Runtime behavior in Nix mode](https://docs.openclaw.ai/install/nix)
-   [Packaging note (macOS)](https://docs.openclaw.ai/install/nix)
-   [Related](https://docs.openclaw.ai/install/nix)

Other install methods

# Nix

# 

[​

](https://docs.openclaw.ai/install/nix)

Nix Installation

The recommended way to run OpenClaw with Nix is via **[nix-openclaw](https://github.com/openclaw/nix-openclaw)** — a batteries-included Home Manager module.

## 

[​

](https://docs.openclaw.ai/install/nix)

Quick Start

Paste this to your AI agent (Claude, Cursor, etc.):

Copy

```
I want to set up nix-openclaw on my Mac.
Repository: github:openclaw/nix-openclaw

What I need you to do:
1. Check if Determinate Nix is installed (if not, install it)
2. Create a local flake at ~/code/openclaw-local using templates/agent-first/flake.nix
3. Help me create a Telegram bot (@BotFather) and get my chat ID (@userinfobot)
4. Set up secrets (bot token, model provider API key) - plain files at ~/.secrets/ is fine
5. Fill in the template placeholders and run home-manager switch
6. Verify: launchd running, bot responds to messages

Reference the nix-openclaw README for module options.
```

> **📦 Full guide: [github.com/openclaw/nix-openclaw](https://github.com/openclaw/nix-openclaw)** The nix-openclaw repo is the source of truth for Nix installation. This page is just a quick overview.

## 

[​

](https://docs.openclaw.ai/install/nix)

What you get

-   Gateway + macOS app + tools (whisper, spotify, cameras) — all pinned
-   Launchd service that survives reboots
-   Plugin system with declarative config
-   Instant rollback: `home-manager switch --rollback`

* * *

## 

[​

](https://docs.openclaw.ai/install/nix)

Nix Mode Runtime Behavior

When `OPENCLAW_NIX_MODE=1` is set (automatic with nix-openclaw): OpenClaw supports a **Nix mode** that makes configuration deterministic and disables auto-install flows. Enable it by exporting:

Copy

```
OPENCLAW_NIX_MODE=1
```

On macOS, the GUI app does not automatically inherit shell env vars. You can also enable Nix mode via defaults:

Copy

```
defaults write ai.openclaw.mac openclaw.nixMode -bool true
```

### 

[​

](https://docs.openclaw.ai/install/nix)

Config + state paths

OpenClaw reads JSON5 config from `OPENCLAW_CONFIG_PATH` and stores mutable data in `OPENCLAW_STATE_DIR`. When needed, you can also set `OPENCLAW_HOME` to control the base home directory used for internal path resolution.

-   `OPENCLAW_HOME` (default precedence: `HOME` / `USERPROFILE` / `os.homedir()`)
-   `OPENCLAW_STATE_DIR` (default: `~/.openclaw`)
-   `OPENCLAW_CONFIG_PATH` (default: `$OPENCLAW_STATE_DIR/openclaw.json`)

When running under Nix, set these explicitly to Nix-managed locations so runtime state and config stay out of the immutable store.

### 

[​

](https://docs.openclaw.ai/install/nix)

Runtime behavior in Nix mode

-   Auto-install and self-mutation flows are disabled
-   Missing dependencies surface Nix-specific remediation messages
-   UI surfaces a read-only Nix mode banner when present

## 

[​

](https://docs.openclaw.ai/install/nix)

Packaging note (macOS)

The macOS packaging flow expects a stable Info.plist template at:

Copy

```
apps/macos/Sources/OpenClaw/Resources/Info.plist
```

[`scripts/package-mac-app.sh`](https://github.com/openclaw/openclaw/blob/main/scripts/package-mac-app.sh) copies this template into the app bundle and patches dynamic fields (bundle ID, version/build, Git SHA, Sparkle keys). This keeps the plist deterministic for SwiftPM packaging and Nix builds (which do not rely on a full Xcode toolchain).

## 

[​

](https://docs.openclaw.ai/install/nix)

Related

-   [nix-openclaw](https://github.com/openclaw/nix-openclaw) — full setup guide
-   [Wizard](https://docs.openclaw.ai/start/wizard) — non-Nix CLI setup
-   [Docker](https://docs.openclaw.ai/install/docker) — containerized setup

[Podman](https://docs.openclaw.ai/install/podman)[Ansible](https://docs.openclaw.ai/install/ansible)

⌘I
