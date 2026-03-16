<!-- Source: https://docs.openclaw.ai/install/hetzner -->
<!-- Title: Hetzner - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/hetzner)

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

-   [OpenClaw on Hetzner (Docker, Production VPS Guide)](https://docs.openclaw.ai/install/hetzner)
-   [Goal](https://docs.openclaw.ai/install/hetzner)
-   [What are we doing (simple terms)?](https://docs.openclaw.ai/install/hetzner)
-   [Quick path (experienced operators)](https://docs.openclaw.ai/install/hetzner)
-   [What you need](https://docs.openclaw.ai/install/hetzner)
-   [1) Provision the VPS](https://docs.openclaw.ai/install/hetzner)
-   [2) Install Docker (on the VPS)](https://docs.openclaw.ai/install/hetzner)
-   [3) Clone the OpenClaw repository](https://docs.openclaw.ai/install/hetzner)
-   [4) Create persistent host directories](https://docs.openclaw.ai/install/hetzner)
-   [5) Configure environment variables](https://docs.openclaw.ai/install/hetzner)
-   [6) Docker Compose configuration](https://docs.openclaw.ai/install/hetzner)
-   [7) Shared Docker VM runtime steps](https://docs.openclaw.ai/install/hetzner)
-   [8) Hetzner-specific access](https://docs.openclaw.ai/install/hetzner)
-   [Infrastructure as Code (Terraform)](https://docs.openclaw.ai/install/hetzner)

Hosting and deployment

# Hetzner

# 

[​

](https://docs.openclaw.ai/install/hetzner)

OpenClaw on Hetzner (Docker, Production VPS Guide)

## 

[​

](https://docs.openclaw.ai/install/hetzner)

Goal

Run a persistent OpenClaw Gateway on a Hetzner VPS using Docker, with durable state, baked-in binaries, and safe restart behavior. If you want “OpenClaw 24/7 for ~$5”, this is the simplest reliable setup. Hetzner pricing changes; pick the smallest Debian/Ubuntu VPS and scale up if you hit OOMs. Security model reminder:

-   Company-shared agents are fine when everyone is in the same trust boundary and the runtime is business-only.
-   Keep strict separation: dedicated VPS/runtime + dedicated accounts; no personal Apple/Google/browser/password-manager profiles on that host.
-   If users are adversarial to each other, split by gateway/host/OS user.

See [Security](https://docs.openclaw.ai/gateway/security) and [VPS hosting](https://docs.openclaw.ai/vps).

## 

[​

](https://docs.openclaw.ai/install/hetzner)

What are we doing (simple terms)?

-   Rent a small Linux server (Hetzner VPS)
-   Install Docker (isolated app runtime)
-   Start the OpenClaw Gateway in Docker
-   Persist `~/.openclaw` + `~/.openclaw/workspace` on the host (survives restarts/rebuilds)
-   Access the Control UI from your laptop via an SSH tunnel

The Gateway can be accessed via:

-   SSH port forwarding from your laptop
-   Direct port exposure if you manage firewalling and tokens yourself

This guide assumes Ubuntu or Debian on Hetzner.  
If you are on another Linux VPS, map packages accordingly. For the generic Docker flow, see [Docker](https://docs.openclaw.ai/install/docker).

* * *

## 

[​

](https://docs.openclaw.ai/install/hetzner)

Quick path (experienced operators)

1.  Provision Hetzner VPS
2.  Install Docker
3.  Clone OpenClaw repository
4.  Create persistent host directories
5.  Configure `.env` and `docker-compose.yml`
6.  Bake required binaries into the image
7.  `docker compose up -d`
8.  Verify persistence and Gateway access

* * *

## 

[​

](https://docs.openclaw.ai/install/hetzner)

What you need

-   Hetzner VPS with root access
-   SSH access from your laptop
-   Basic comfort with SSH + copy/paste
-   ~20 minutes
-   Docker and Docker Compose
-   Model auth credentials
-   Optional provider credentials
    -   WhatsApp QR
    -   Telegram bot token
    -   Gmail OAuth

* * *

## 

[​

](https://docs.openclaw.ai/install/hetzner)

1) Provision the VPS

Create an Ubuntu or Debian VPS in Hetzner. Connect as root:

Copy

```
ssh root@YOUR_VPS_IP
```

This guide assumes the VPS is stateful. Do not treat it as disposable infrastructure.

* * *

## 

[​

](https://docs.openclaw.ai/install/hetzner)

2) Install Docker (on the VPS)

Copy

```
apt-get update
apt-get install -y git curl ca-certificates
curl -fsSL https://get.docker.com | sh
```

Verify:

Copy

```
docker --version
docker compose version
```

* * *

## 

[​

](https://docs.openclaw.ai/install/hetzner)

3) Clone the OpenClaw repository

Copy

```
git clone https://github.com/openclaw/openclaw.git
cd openclaw
```

This guide assumes you will build a custom image to guarantee binary persistence.

* * *

## 

[​

](https://docs.openclaw.ai/install/hetzner)

4) Create persistent host directories

Docker containers are ephemeral. All long-lived state must live on the host.

Copy

```
mkdir -p /root/.openclaw/workspace

# Set ownership to the container user (uid 1000):
chown -R 1000:1000 /root/.openclaw
```

* * *

## 

[​

](https://docs.openclaw.ai/install/hetzner)

5) Configure environment variables

Create `.env` in the repository root.

Copy

```
OPENCLAW_IMAGE=openclaw:latest
OPENCLAW_GATEWAY_TOKEN=change-me-now
OPENCLAW_GATEWAY_BIND=lan
OPENCLAW_GATEWAY_PORT=18789

OPENCLAW_CONFIG_DIR=/root/.openclaw
OPENCLAW_WORKSPACE_DIR=/root/.openclaw/workspace

GOG_KEYRING_PASSWORD=change-me-now
XDG_CONFIG_HOME=/home/node/.openclaw
```

Generate strong secrets:

Copy

```
openssl rand -hex 32
```

**Do not commit this file.**

* * *

## 

[​

](https://docs.openclaw.ai/install/hetzner)

6) Docker Compose configuration

Create or update `docker-compose.yml`.

Copy

```
services:
  openclaw-gateway:
    image: ${OPENCLAW_IMAGE}
    build: .
    restart: unless-stopped
    env_file:
      - .env
    environment:
      - HOME=/home/node
      - NODE_ENV=production
      - TERM=xterm-256color
      - OPENCLAW_GATEWAY_BIND=${OPENCLAW_GATEWAY_BIND}
      - OPENCLAW_GATEWAY_PORT=${OPENCLAW_GATEWAY_PORT}
      - OPENCLAW_GATEWAY_TOKEN=${OPENCLAW_GATEWAY_TOKEN}
      - GOG_KEYRING_PASSWORD=${GOG_KEYRING_PASSWORD}
      - XDG_CONFIG_HOME=${XDG_CONFIG_HOME}
      - PATH=/home/linuxbrew/.linuxbrew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
    volumes:
      - ${OPENCLAW_CONFIG_DIR}:/home/node/.openclaw
      - ${OPENCLAW_WORKSPACE_DIR}:/home/node/.openclaw/workspace
    ports:
      # Recommended: keep the Gateway loopback-only on the VPS; access via SSH tunnel.
      # To expose it publicly, remove the `127.0.0.1:` prefix and firewall accordingly.
      - "127.0.0.1:${OPENCLAW_GATEWAY_PORT}:18789"
    command:
      [
        "node",
        "dist/index.js",
        "gateway",
        "--bind",
        "${OPENCLAW_GATEWAY_BIND}",
        "--port",
        "${OPENCLAW_GATEWAY_PORT}",
        "--allow-unconfigured",
      ]
```

`--allow-unconfigured` is only for bootstrap convenience, it is not a replacement for a proper gateway configuration. Still set auth (`gateway.auth.token` or password) and use safe bind settings for your deployment.

* * *

## 

[​

](https://docs.openclaw.ai/install/hetzner)

7) Shared Docker VM runtime steps

Use the shared runtime guide for the common Docker host flow:

-   [Bake required binaries into the image](https://docs.openclaw.ai/install/docker-vm-runtime)
-   [Build and launch](https://docs.openclaw.ai/install/docker-vm-runtime)
-   [What persists where](https://docs.openclaw.ai/install/docker-vm-runtime)
-   [Updates](https://docs.openclaw.ai/install/docker-vm-runtime)

* * *

## 

[​

](https://docs.openclaw.ai/install/hetzner)

8) Hetzner-specific access

After the shared build and launch steps, tunnel from your laptop:

Copy

```
ssh -N -L 18789:127.0.0.1:18789 root@YOUR_VPS_IP
```

Open: `http://127.0.0.1:18789/` Paste your gateway token.

* * *

The shared persistence map lives in [Docker VM Runtime](https://docs.openclaw.ai/install/docker-vm-runtime).

## 

[​

](https://docs.openclaw.ai/install/hetzner)

Infrastructure as Code (Terraform)

For teams preferring infrastructure-as-code workflows, a community-maintained Terraform setup provides:

-   Modular Terraform configuration with remote state management
-   Automated provisioning via cloud-init
-   Deployment scripts (bootstrap, deploy, backup/restore)
-   Security hardening (firewall, UFW, SSH-only access)
-   SSH tunnel configuration for gateway access

**Repositories:**

-   Infrastructure: [openclaw-terraform-hetzner](https://github.com/andreesg/openclaw-terraform-hetzner)
-   Docker config: [openclaw-docker-config](https://github.com/andreesg/openclaw-docker-config)

This approach complements the Docker setup above with reproducible deployments, version-controlled infrastructure, and automated disaster recovery.

> **Note:** Community-maintained. For issues or contributions, see the repository links above.

[Fly.io](https://docs.openclaw.ai/install/fly)[GCP](https://docs.openclaw.ai/install/gcp)

⌘I
