<!-- Source: https://docs.openclaw.ai/install/bun -->
<!-- Title: Bun (Experimental) - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/bun)

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

-   [Bun (experimental)](https://docs.openclaw.ai/install/bun)
-   [Status](https://docs.openclaw.ai/install/bun)
-   [Install](https://docs.openclaw.ai/install/bun)
-   [Build / Test (Bun)](https://docs.openclaw.ai/install/bun)
-   [Bun lifecycle scripts (blocked by default)](https://docs.openclaw.ai/install/bun)
-   [Caveats](https://docs.openclaw.ai/install/bun)

Other install methods

# Bun (Experimental)

# 

[​

](https://docs.openclaw.ai/install/bun)

Bun (experimental)

Goal: run this repo with **Bun** (optional, not recommended for WhatsApp/Telegram) without diverging from pnpm workflows. ⚠️ **Not recommended for Gateway runtime** (WhatsApp/Telegram bugs). Use Node for production.

## 

[​

](https://docs.openclaw.ai/install/bun)

Status

-   Bun is an optional local runtime for running TypeScript directly (`bun run …`, `bun --watch …`).
-   `pnpm` is the default for builds and remains fully supported (and used by some docs tooling).
-   Bun cannot use `pnpm-lock.yaml` and will ignore it.

## 

[​

](https://docs.openclaw.ai/install/bun)

Install

Default:

Copy

```
bun install
```

Note: `bun.lock`/`bun.lockb` are gitignored, so there’s no repo churn either way. If you want _no lockfile writes_:

Copy

```
bun install --no-save
```

## 

[​

](https://docs.openclaw.ai/install/bun)

Build / Test (Bun)

Copy

```
bun run build
bun run vitest run
```

## 

[​

](https://docs.openclaw.ai/install/bun)

Bun lifecycle scripts (blocked by default)

Bun may block dependency lifecycle scripts unless explicitly trusted (`bun pm untrusted` / `bun pm trust`). For this repo, the commonly blocked scripts are not required:

-   `@whiskeysockets/baileys` `preinstall`: checks Node major >= 20 (OpenClaw defaults to Node 24 and still supports Node 22 LTS, currently `22.16+`).
-   `protobufjs` `postinstall`: emits warnings about incompatible version schemes (no build artifacts).

If you hit a real runtime issue that requires these scripts, trust them explicitly:

Copy

```
bun pm trust @whiskeysockets/baileys protobufjs
```

## 

[​

](https://docs.openclaw.ai/install/bun)

Caveats

-   Some scripts still hardcode pnpm (e.g. `docs:build`, `ui:*`, `protocol:check`). Run those via pnpm for now.

[Ansible](https://docs.openclaw.ai/install/ansible)[Updating](https://docs.openclaw.ai/install/updating)

⌘I
