<!-- Source: https://docs.openclaw.ai/install -->
<!-- Title: Install - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install)

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

-   [Install](https://docs.openclaw.ai/install)
-   [System requirements](https://docs.openclaw.ai/install)
-   [Install methods](https://docs.openclaw.ai/install)
-   [Other install methods](https://docs.openclaw.ai/install)
-   [After install](https://docs.openclaw.ai/install)
-   [Troubleshooting: openclaw not found](https://docs.openclaw.ai/install)
-   [Update / uninstall](https://docs.openclaw.ai/install)

Install overview

# Install

# 

[​

](https://docs.openclaw.ai/install)

Install

Already followed [Getting Started](https://docs.openclaw.ai/start/getting-started)? You’re all set — this page is for alternative install methods, platform-specific instructions, and maintenance.

## 

[​

](https://docs.openclaw.ai/install)

System requirements

-   **[Node 24 (recommended)](https://docs.openclaw.ai/install/node)** (Node 22 LTS, currently `22.16+`, is still supported for compatibility; the [installer script](https://docs.openclaw.ai/install) will install Node 24 if missing)
-   macOS, Linux, or Windows
-   `pnpm` only if you build from source

On Windows, we strongly recommend running OpenClaw under [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install).

## 

[​

](https://docs.openclaw.ai/install)

Install methods

The **installer script** is the recommended way to install OpenClaw. It handles Node detection, installation, and onboarding in one step.

For VPS/cloud hosts, avoid third-party “1-click” marketplace images when possible. Prefer a clean base OS image (for example Ubuntu LTS), then install OpenClaw yourself with the installer script.

Installer script

Downloads the CLI, installs it globally via npm, and launches the setup wizard.

-   macOS / Linux / WSL2
    
-   Windows (PowerShell)
    

Copy

```
curl -fsSL https://openclaw.ai/install.sh | bash
```

Copy

```
iwr -useb https://openclaw.ai/install.ps1 | iex
```

That’s it — the script handles Node detection, installation, and onboarding.To skip onboarding and just install the binary:

-   macOS / Linux / WSL2
    
-   Windows (PowerShell)
    

Copy

```
curl -fsSL https://openclaw.ai/install.sh | bash -s -- --no-onboard
```

Copy

```
& ([scriptblock]::Create((iwr -useb https://openclaw.ai/install.ps1))) -NoOnboard
```

For all flags, env vars, and CI/automation options, see [Installer internals](https://docs.openclaw.ai/install/installer).

npm / pnpm

If you already manage Node yourself, we recommend Node 24. OpenClaw still supports Node 22 LTS, currently `22.16+`, for compatibility:

-   npm
    
-   pnpm
    

Copy

```
npm install -g openclaw@latest
openclaw onboard --install-daemon
```

sharp build errors?

If you have libvips installed globally (common on macOS via Homebrew) and `sharp` fails, force prebuilt binaries:

Copy

```
SHARP_IGNORE_GLOBAL_LIBVIPS=1 npm install -g openclaw@latest
```

If you see `sharp: Please add node-gyp to your dependencies`, either install build tooling (macOS: Xcode CLT + `npm install -g node-gyp`) or use the env var above.

Copy

```
pnpm add -g openclaw@latest
pnpm approve-builds -g        # approve openclaw, node-llama-cpp, sharp, etc.
openclaw onboard --install-daemon
```

pnpm requires explicit approval for packages with build scripts. After the first install shows the “Ignored build scripts” warning, run `pnpm approve-builds -g` and select the listed packages.

Want the current GitHub `main` head with a package-manager install?

Copy

```
npm install -g github:openclaw/openclaw#main
```

Copy

```
pnpm add -g github:openclaw/openclaw#main
```

From source

For contributors or anyone who wants to run from a local checkout.

1

[

](https://docs.openclaw.ai/install)

Clone and build

Clone the [OpenClaw repo](https://github.com/openclaw/openclaw) and build:

Copy

```
git clone https://github.com/openclaw/openclaw.git
cd openclaw
pnpm install
pnpm ui:build
pnpm build
```

2

[

](https://docs.openclaw.ai/install)

Link the CLI

Make the `openclaw` command available globally:

Copy

```
pnpm link --global
```

Alternatively, skip the link and run commands via `pnpm openclaw ...` from inside the repo.

3

[

](https://docs.openclaw.ai/install)

Run onboarding

Copy

```
openclaw onboard --install-daemon
```

For deeper development workflows, see [Setup](https://docs.openclaw.ai/start/setup).

## 

[​

](https://docs.openclaw.ai/install)

Other install methods

[

## Docker

Containerized or headless deployments.





](https://docs.openclaw.ai/install/docker)[

## Podman

Rootless container: run `setup-podman.sh` once, then the launch script.





](https://docs.openclaw.ai/install/podman)[

## Nix

Declarative install via Nix.





](https://docs.openclaw.ai/install/nix)[

## Ansible

Automated fleet provisioning.





](https://docs.openclaw.ai/install/ansible)[

## Bun

CLI-only usage via the Bun runtime.





](https://docs.openclaw.ai/install/bun)

## 

[​

](https://docs.openclaw.ai/install)

After install

Verify everything is working:

Copy

```
openclaw doctor         # check for config issues
openclaw status         # gateway status
openclaw dashboard      # open the browser UI
```

If you need custom runtime paths, use:

-   `OPENCLAW_HOME` for home-directory based internal paths
-   `OPENCLAW_STATE_DIR` for mutable state location
-   `OPENCLAW_CONFIG_PATH` for config file location

See [Environment vars](https://docs.openclaw.ai/help/environment) for precedence and full details.

## 

[​

](https://docs.openclaw.ai/install)

Troubleshooting: `openclaw` not found

PATH diagnosis and fix

Quick diagnosis:

Copy

```
node -v
npm -v
npm prefix -g
echo "$PATH"
```

If `$(npm prefix -g)/bin` (macOS/Linux) or `$(npm prefix -g)` (Windows) is **not** in your `$PATH`, your shell can’t find global npm binaries (including `openclaw`).Fix — add it to your shell startup file (`~/.zshrc` or `~/.bashrc`):

Copy

```
export PATH="$(npm prefix -g)/bin:$PATH"
```

On Windows, add the output of `npm prefix -g` to your PATH.Then open a new terminal (or `rehash` in zsh / `hash -r` in bash).

## 

[​

](https://docs.openclaw.ai/install)

Update / uninstall

[

## Updating

Keep OpenClaw up to date.





](https://docs.openclaw.ai/install/updating)[

## Migrating

Move to a new machine.





](https://docs.openclaw.ai/install/migrating)[

## Uninstall

Remove OpenClaw completely.





](https://docs.openclaw.ai/install/uninstall)

[Installer Internals](https://docs.openclaw.ai/install/installer)

⌘I
