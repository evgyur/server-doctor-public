<!-- Source: https://docs.openclaw.ai/install/podman -->
<!-- Title: Podman - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/podman)

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

-   [Podman](https://docs.openclaw.ai/install/podman)
-   [Requirements](https://docs.openclaw.ai/install/podman)
-   [Quick start](https://docs.openclaw.ai/install/podman)
-   [Systemd (Quadlet, optional)](https://docs.openclaw.ai/install/podman)
-   [The openclaw user (non-login)](https://docs.openclaw.ai/install/podman)
-   [Environment and config](https://docs.openclaw.ai/install/podman)
-   [Storage model](https://docs.openclaw.ai/install/podman)
-   [Useful commands](https://docs.openclaw.ai/install/podman)
-   [Troubleshooting](https://docs.openclaw.ai/install/podman)
-   [Optional: run as your own user](https://docs.openclaw.ai/install/podman)

Other install methods

# Podman

# 

[​

](https://docs.openclaw.ai/install/podman)

Podman

Run the OpenClaw gateway in a **rootless** Podman container. Uses the same image as Docker (build from the repo [Dockerfile](https://github.com/openclaw/openclaw/blob/main/Dockerfile)).

## 

[​

](https://docs.openclaw.ai/install/podman)

Requirements

-   Podman (rootless)
-   Sudo for one-time setup (create user, build image)

## 

[​

](https://docs.openclaw.ai/install/podman)

Quick start

**1\. One-time setup** (from repo root; creates user, builds image, installs launch script):

Copy

```
./setup-podman.sh
```

This also creates a minimal `~openclaw/.openclaw/openclaw.json` (sets `gateway.mode="local"`) so the gateway can start without running the wizard. By default the container is **not** installed as a systemd service, you start it manually (see below). For a production-style setup with auto-start and restarts, install it as a systemd Quadlet user service instead:

Copy

```
./setup-podman.sh --quadlet
```

(Or set `OPENCLAW_PODMAN_QUADLET=1`; use `--container` to install only the container and launch script.) Optional build-time env vars (set before running `setup-podman.sh`):

-   `OPENCLAW_DOCKER_APT_PACKAGES` — install extra apt packages during image build
-   `OPENCLAW_EXTENSIONS` — pre-install extension dependencies (space-separated extension names, e.g. `diagnostics-otel matrix`)

**2\. Start gateway** (manual, for quick smoke testing):

Copy

```
./scripts/run-openclaw-podman.sh launch
```

**3\. Onboarding wizard** (e.g. to add channels or providers):

Copy

```
./scripts/run-openclaw-podman.sh launch setup
```

Then open `http://127.0.0.1:18789/` and use the token from `~openclaw/.openclaw/.env` (or the value printed by setup).

## 

[​

](https://docs.openclaw.ai/install/podman)

Systemd (Quadlet, optional)

If you ran `./setup-podman.sh --quadlet` (or `OPENCLAW_PODMAN_QUADLET=1`), a [Podman Quadlet](https://docs.podman.io/en/latest/markdown/podman-systemd.unit.5.html) unit is installed so the gateway runs as a systemd user service for the openclaw user. The service is enabled and started at the end of setup.

-   **Start:** `sudo systemctl --machine openclaw@ --user start openclaw.service`
-   **Stop:** `sudo systemctl --machine openclaw@ --user stop openclaw.service`
-   **Status:** `sudo systemctl --machine openclaw@ --user status openclaw.service`
-   **Logs:** `sudo journalctl --machine openclaw@ --user -u openclaw.service -f`

The quadlet file lives at `~openclaw/.config/containers/systemd/openclaw.container`. To change ports or env, edit that file (or the `.env` it sources), then `sudo systemctl --machine openclaw@ --user daemon-reload` and restart the service. On boot, the service starts automatically if lingering is enabled for openclaw (setup does this when loginctl is available). To add quadlet **after** an initial setup that did not use it, re-run: `./setup-podman.sh --quadlet`.

## 

[​

](https://docs.openclaw.ai/install/podman)

The openclaw user (non-login)

`setup-podman.sh` creates a dedicated system user `openclaw`:

-   **Shell:** `nologin` — no interactive login; reduces attack surface.
-   **Home:** e.g. `/home/openclaw` — holds `~/.openclaw` (config, workspace) and the launch script `run-openclaw-podman.sh`.
-   **Rootless Podman:** The user must have a **subuid** and **subgid** range. Many distros assign these automatically when the user is created. If setup prints a warning, add lines to `/etc/subuid` and `/etc/subgid`:
    
    Copy
    
    ```
    openclaw:100000:65536
    ```
    
    Then start the gateway as that user (e.g. from cron or systemd):
    
    Copy
    
    ```
    sudo -u openclaw /home/openclaw/run-openclaw-podman.sh
    sudo -u openclaw /home/openclaw/run-openclaw-podman.sh setup
    ```
    
-   **Config:** Only `openclaw` and root can access `/home/openclaw/.openclaw`. To edit config: use the Control UI once the gateway is running, or `sudo -u openclaw $EDITOR /home/openclaw/.openclaw/openclaw.json`.

## 

[​

](https://docs.openclaw.ai/install/podman)

Environment and config

-   **Token:** Stored in `~openclaw/.openclaw/.env` as `OPENCLAW_GATEWAY_TOKEN`. `setup-podman.sh` and `run-openclaw-podman.sh` generate it if missing (uses `openssl`, `python3`, or `od`).
-   **Optional:** In that `.env` you can set provider keys (e.g. `GROQ_API_KEY`, `OLLAMA_API_KEY`) and other OpenClaw env vars.
-   **Host ports:** By default the script maps `18789` (gateway) and `18790` (bridge). Override the **host** port mapping with `OPENCLAW_PODMAN_GATEWAY_HOST_PORT` and `OPENCLAW_PODMAN_BRIDGE_HOST_PORT` when launching.
-   **Gateway bind:** By default, `run-openclaw-podman.sh` starts the gateway with `--bind loopback` for safe local access. To expose on LAN, set `OPENCLAW_GATEWAY_BIND=lan` and configure `gateway.controlUi.allowedOrigins` (or explicitly enable host-header fallback) in `openclaw.json`.
-   **Paths:** Host config and workspace default to `~openclaw/.openclaw` and `~openclaw/.openclaw/workspace`. Override the host paths used by the launch script with `OPENCLAW_CONFIG_DIR` and `OPENCLAW_WORKSPACE_DIR`.

## 

[​

](https://docs.openclaw.ai/install/podman)

Storage model

-   **Persistent host data:** `OPENCLAW_CONFIG_DIR` and `OPENCLAW_WORKSPACE_DIR` are bind-mounted into the container and retain state on the host.
-   **Ephemeral sandbox tmpfs:** if you enable `agents.defaults.sandbox`, the tool sandbox containers mount `tmpfs` at `/tmp`, `/var/tmp`, and `/run`. Those paths are memory-backed and disappear with the sandbox container; the top-level Podman container setup does not add its own tmpfs mounts.
-   **Disk growth hotspots:** the main paths to watch are `media/`, `agents/<agentId>/sessions/sessions.json`, transcript JSONL files, `cron/runs/*.jsonl`, and rolling file logs under `/tmp/openclaw/` (or your configured `logging.file`).

`setup-podman.sh` now stages the image tar in a private temp directory and prints the chosen base dir during setup. For non-root runs it accepts `TMPDIR` only when that base is safe to use; otherwise it falls back to `/var/tmp`, then `/tmp`. The saved tar stays owner-only and is streamed into the target user’s `podman load`, so private caller temp dirs do not block setup.

## 

[​

](https://docs.openclaw.ai/install/podman)

Useful commands

-   **Logs:** With quadlet: `sudo journalctl --machine openclaw@ --user -u openclaw.service -f`. With script: `sudo -u openclaw podman logs -f openclaw`
-   **Stop:** With quadlet: `sudo systemctl --machine openclaw@ --user stop openclaw.service`. With script: `sudo -u openclaw podman stop openclaw`
-   **Start again:** With quadlet: `sudo systemctl --machine openclaw@ --user start openclaw.service`. With script: re-run the launch script or `podman start openclaw`
-   **Remove container:** `sudo -u openclaw podman rm -f openclaw` — config and workspace on the host are kept

## 

[​

](https://docs.openclaw.ai/install/podman)

Troubleshooting

-   **Permission denied (EACCES) on config or auth-profiles:** The container defaults to `--userns=keep-id` and runs as the same uid/gid as the host user running the script. Ensure your host `OPENCLAW_CONFIG_DIR` and `OPENCLAW_WORKSPACE_DIR` are owned by that user.
-   **Gateway start blocked (missing `gateway.mode=local`):** Ensure `~openclaw/.openclaw/openclaw.json` exists and sets `gateway.mode="local"`. `setup-podman.sh` creates this file if missing.
-   **Rootless Podman fails for user openclaw:** Check `/etc/subuid` and `/etc/subgid` contain a line for `openclaw` (e.g. `openclaw:100000:65536`). Add it if missing and restart.
-   **Container name in use:** The launch script uses `podman run --replace`, so the existing container is replaced when you start again. To clean up manually: `podman rm -f openclaw`.
-   **Script not found when running as openclaw:** Ensure `setup-podman.sh` was run so that `run-openclaw-podman.sh` is copied to openclaw’s home (e.g. `/home/openclaw/run-openclaw-podman.sh`).
-   **Quadlet service not found or fails to start:** Run `sudo systemctl --machine openclaw@ --user daemon-reload` after editing the `.container` file. Quadlet requires cgroups v2: `podman info --format '{{.Host.CgroupsVersion}}'` should show `2`.

## 

[​

](https://docs.openclaw.ai/install/podman)

Optional: run as your own user

To run the gateway as your normal user (no dedicated openclaw user): build the image, create `~/.openclaw/.env` with `OPENCLAW_GATEWAY_TOKEN`, and run the container with `--userns=keep-id` and mounts to your `~/.openclaw`. The launch script is designed for the openclaw-user flow; for a single-user setup you can instead run the `podman run` command from the script manually, pointing config and workspace to your home. Recommended for most users: use `setup-podman.sh` and run as the openclaw user so config and process are isolated.

[Docker](https://docs.openclaw.ai/install/docker)[Nix](https://docs.openclaw.ai/install/nix)

⌘I
