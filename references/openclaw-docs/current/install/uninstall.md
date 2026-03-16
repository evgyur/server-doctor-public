<!-- Source: https://docs.openclaw.ai/install/uninstall -->
<!-- Title: Uninstall - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/uninstall)

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

-   [Uninstall](https://docs.openclaw.ai/install/uninstall)
-   [Easy path (CLI still installed)](https://docs.openclaw.ai/install/uninstall)
-   [Manual service removal (CLI not installed)](https://docs.openclaw.ai/install/uninstall)
-   [macOS (launchd)](https://docs.openclaw.ai/install/uninstall)
-   [Linux (systemd user unit)](https://docs.openclaw.ai/install/uninstall)
-   [Windows (Scheduled Task)](https://docs.openclaw.ai/install/uninstall)
-   [Normal install vs source checkout](https://docs.openclaw.ai/install/uninstall)
-   [Normal install (install.sh / npm / pnpm / bun)](https://docs.openclaw.ai/install/uninstall)
-   [Source checkout (git clone)](https://docs.openclaw.ai/install/uninstall)

Maintenance

# Uninstall

# 

[​

](https://docs.openclaw.ai/install/uninstall)

Uninstall

Two paths:

-   **Easy path** if `openclaw` is still installed.
-   **Manual service removal** if the CLI is gone but the service is still running.

## 

[​

](https://docs.openclaw.ai/install/uninstall)

Easy path (CLI still installed)

Recommended: use the built-in uninstaller:

Copy

```
openclaw uninstall
```

Non-interactive (automation / npx):

Copy

```
openclaw uninstall --all --yes --non-interactive
npx -y openclaw uninstall --all --yes --non-interactive
```

Manual steps (same result):

1.  Stop the gateway service:

Copy

```
openclaw gateway stop
```

2.  Uninstall the gateway service (launchd/systemd/schtasks):

Copy

```
openclaw gateway uninstall
```

3.  Delete state + config:

Copy

```
rm -rf "${OPENCLAW_STATE_DIR:-$HOME/.openclaw}"
```

If you set `OPENCLAW_CONFIG_PATH` to a custom location outside the state dir, delete that file too.

4.  Delete your workspace (optional, removes agent files):

Copy

```
rm -rf ~/.openclaw/workspace
```

5.  Remove the CLI install (pick the one you used):

Copy

```
npm rm -g openclaw
pnpm remove -g openclaw
bun remove -g openclaw
```

6.  If you installed the macOS app:

Copy

```
rm -rf /Applications/OpenClaw.app
```

Notes:

-   If you used profiles (`--profile` / `OPENCLAW_PROFILE`), repeat step 3 for each state dir (defaults are `~/.openclaw-<profile>`).
-   In remote mode, the state dir lives on the **gateway host**, so run steps 1-4 there too.

## 

[​

](https://docs.openclaw.ai/install/uninstall)

Manual service removal (CLI not installed)

Use this if the gateway service keeps running but `openclaw` is missing.

### 

[​

](https://docs.openclaw.ai/install/uninstall)

macOS (launchd)

Default label is `ai.openclaw.gateway` (or `ai.openclaw.<profile>`; legacy `com.openclaw.*` may still exist):

Copy

```
launchctl bootout gui/$UID/ai.openclaw.gateway
rm -f ~/Library/LaunchAgents/ai.openclaw.gateway.plist
```

If you used a profile, replace the label and plist name with `ai.openclaw.<profile>`. Remove any legacy `com.openclaw.*` plists if present.

### 

[​

](https://docs.openclaw.ai/install/uninstall)

Linux (systemd user unit)

Default unit name is `openclaw-gateway.service` (or `openclaw-gateway-<profile>.service`):

Copy

```
systemctl --user disable --now openclaw-gateway.service
rm -f ~/.config/systemd/user/openclaw-gateway.service
systemctl --user daemon-reload
```

### 

[​

](https://docs.openclaw.ai/install/uninstall)

Windows (Scheduled Task)

Default task name is `OpenClaw Gateway` (or `OpenClaw Gateway (<profile>)`). The task script lives under your state dir.

Copy

```
schtasks /Delete /F /TN "OpenClaw Gateway"
Remove-Item -Force "$env:USERPROFILE\.openclaw\gateway.cmd"
```

If you used a profile, delete the matching task name and `~\.openclaw-<profile>\gateway.cmd`.

## 

[​

](https://docs.openclaw.ai/install/uninstall)

Normal install vs source checkout

### 

[​

](https://docs.openclaw.ai/install/uninstall)

Normal install (install.sh / npm / pnpm / bun)

If you used `https://openclaw.ai/install.sh` or `install.ps1`, the CLI was installed with `npm install -g openclaw@latest`. Remove it with `npm rm -g openclaw` (or `pnpm remove -g` / `bun remove -g` if you installed that way).

### 

[​

](https://docs.openclaw.ai/install/uninstall)

Source checkout (git clone)

If you run from a repo checkout (`git clone` + `openclaw ...` / `bun run openclaw ...`):

1.  Uninstall the gateway service **before** deleting the repo (use the easy path above or manual service removal).
2.  Delete the repo directory.
3.  Remove state + workspace as shown above.

[Migration Guide](https://docs.openclaw.ai/install/migrating)[VPS Hosting](https://docs.openclaw.ai/vps)

⌘I
