<!-- Source: https://docs.openclaw.ai/install/development-channels -->
<!-- Title: Development Channels - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/development-channels)

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

-   [Development channels](https://docs.openclaw.ai/install/development-channels)
-   [Switching channels](https://docs.openclaw.ai/install/development-channels)
-   [Plugins and channels](https://docs.openclaw.ai/install/development-channels)
-   [Tagging best practices](https://docs.openclaw.ai/install/development-channels)
-   [macOS app availability](https://docs.openclaw.ai/install/development-channels)

Advanced

# Development Channels

# 

[​

](https://docs.openclaw.ai/install/development-channels)

Development channels

Last updated: 2026-01-21 OpenClaw ships three update channels:

-   **stable**: npm dist-tag `latest`.
-   **beta**: npm dist-tag `beta` (builds under test).
-   **dev**: moving head of `main` (git). npm dist-tag: `dev` (when published).

We ship builds to **beta**, test them, then **promote a vetted build to `latest`** without changing the version number — dist-tags are the source of truth for npm installs.

## 

[​

](https://docs.openclaw.ai/install/development-channels)

Switching channels

Git checkout:

Copy

```
openclaw update --channel stable
openclaw update --channel beta
openclaw update --channel dev
```

-   `stable`/`beta` check out the latest matching tag (often the same tag).
-   `dev` switches to `main` and rebases on the upstream.

npm/pnpm global install:

Copy

```
openclaw update --channel stable
openclaw update --channel beta
openclaw update --channel dev
```

This updates via the corresponding npm dist-tag (`latest`, `beta`, `dev`). When you **explicitly** switch channels with `--channel`, OpenClaw also aligns the install method:

-   `dev` ensures a git checkout (default `~/openclaw`, override with `OPENCLAW_GIT_DIR`), updates it, and installs the global CLI from that checkout.
-   `stable`/`beta` installs from npm using the matching dist-tag.

Tip: if you want stable + dev in parallel, keep two clones and point your gateway at the stable one.

## 

[​

](https://docs.openclaw.ai/install/development-channels)

Plugins and channels

When you switch channels with `openclaw update`, OpenClaw also syncs plugin sources:

-   `dev` prefers bundled plugins from the git checkout.
-   `stable` and `beta` restore npm-installed plugin packages.

## 

[​

](https://docs.openclaw.ai/install/development-channels)

Tagging best practices

-   Tag releases you want git checkouts to land on (`vYYYY.M.D` for stable, `vYYYY.M.D-beta.N` for beta).
-   `vYYYY.M.D.beta.N` is also recognized for compatibility, but prefer `-beta.N`.
-   Legacy `vYYYY.M.D-<patch>` tags are still recognized as stable (non-beta).
-   Keep tags immutable: never move or reuse a tag.
-   npm dist-tags remain the source of truth for npm installs:
    -   `latest` → stable
    -   `beta` → candidate build
    -   `dev` → main snapshot (optional)

## 

[​

](https://docs.openclaw.ai/install/development-channels)

macOS app availability

Beta and dev builds may **not** include a macOS app release. That’s OK:

-   The git tag and npm dist-tag can still be published.
-   Call out “no macOS build for this beta” in release notes or changelog.

[Deploy on Northflank](https://docs.openclaw.ai/install/northflank)

⌘I
