<!-- Source: https://docs.openclaw.ai/install/ansible -->
<!-- Title: Ansible - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/ansible)

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

-   [Ansible Installation](https://docs.openclaw.ai/install/ansible)
-   [Quick Start](https://docs.openclaw.ai/install/ansible)
-   [What You Get](https://docs.openclaw.ai/install/ansible)
-   [Requirements](https://docs.openclaw.ai/install/ansible)
-   [What Gets Installed](https://docs.openclaw.ai/install/ansible)
-   [Post-Install Setup](https://docs.openclaw.ai/install/ansible)
-   [Quick commands](https://docs.openclaw.ai/install/ansible)
-   [Security Architecture](https://docs.openclaw.ai/install/ansible)
-   [4-Layer Defense](https://docs.openclaw.ai/install/ansible)
-   [Verification](https://docs.openclaw.ai/install/ansible)
-   [Docker Availability](https://docs.openclaw.ai/install/ansible)
-   [Manual Installation](https://docs.openclaw.ai/install/ansible)
-   [Updating OpenClaw](https://docs.openclaw.ai/install/ansible)
-   [Troubleshooting](https://docs.openclaw.ai/install/ansible)
-   [Firewall blocks my connection](https://docs.openclaw.ai/install/ansible)
-   [Service won’t start](https://docs.openclaw.ai/install/ansible)
-   [Docker sandbox issues](https://docs.openclaw.ai/install/ansible)
-   [Provider login fails](https://docs.openclaw.ai/install/ansible)
-   [Advanced Configuration](https://docs.openclaw.ai/install/ansible)
-   [Related](https://docs.openclaw.ai/install/ansible)

Other install methods

# Ansible

# 

[​

](https://docs.openclaw.ai/install/ansible)

Ansible Installation

The recommended way to deploy OpenClaw to production servers is via **[openclaw-ansible](https://github.com/openclaw/openclaw-ansible)** — an automated installer with security-first architecture.

## 

[​

](https://docs.openclaw.ai/install/ansible)

Quick Start

One-command install:

Copy

```
curl -fsSL https://raw.githubusercontent.com/openclaw/openclaw-ansible/main/install.sh | bash
```

> **📦 Full guide: [github.com/openclaw/openclaw-ansible](https://github.com/openclaw/openclaw-ansible)** The openclaw-ansible repo is the source of truth for Ansible deployment. This page is a quick overview.

## 

[​

](https://docs.openclaw.ai/install/ansible)

What You Get

-   🔒 **Firewall-first security**: UFW + Docker isolation (only SSH + Tailscale accessible)
-   🔐 **Tailscale VPN**: Secure remote access without exposing services publicly
-   🐳 **Docker**: Isolated sandbox containers, localhost-only bindings
-   🛡️ **Defense in depth**: 4-layer security architecture
-   🚀 **One-command setup**: Complete deployment in minutes
-   🔧 **Systemd integration**: Auto-start on boot with hardening

## 

[​

](https://docs.openclaw.ai/install/ansible)

Requirements

-   **OS**: Debian 11+ or Ubuntu 20.04+
-   **Access**: Root or sudo privileges
-   **Network**: Internet connection for package installation
-   **Ansible**: 2.14+ (installed automatically by quick-start script)

## 

[​

](https://docs.openclaw.ai/install/ansible)

What Gets Installed

The Ansible playbook installs and configures:

1.  **Tailscale** (mesh VPN for secure remote access)
2.  **UFW firewall** (SSH + Tailscale ports only)
3.  **Docker CE + Compose V2** (for agent sandboxes)
4.  **Node.js 24 + pnpm** (runtime dependencies; Node 22 LTS, currently `22.16+`, remains supported for compatibility)
5.  **OpenClaw** (host-based, not containerized)
6.  **Systemd service** (auto-start with security hardening)

Note: The gateway runs **directly on the host** (not in Docker), but agent sandboxes use Docker for isolation. See [Sandboxing](https://docs.openclaw.ai/gateway/sandboxing) for details.

## 

[​

](https://docs.openclaw.ai/install/ansible)

Post-Install Setup

After installation completes, switch to the openclaw user:

Copy

```
sudo -i -u openclaw
```

The post-install script will guide you through:

1.  **Onboarding wizard**: Configure OpenClaw settings
2.  **Provider login**: Connect WhatsApp/Telegram/Discord/Signal
3.  **Gateway testing**: Verify the installation
4.  **Tailscale setup**: Connect to your VPN mesh

### 

[​

](https://docs.openclaw.ai/install/ansible)

Quick commands

Copy

```
# Check service status
sudo systemctl status openclaw

# View live logs
sudo journalctl -u openclaw -f

# Restart gateway
sudo systemctl restart openclaw

# Provider login (run as openclaw user)
sudo -i -u openclaw
openclaw channels login
```

## 

[​

](https://docs.openclaw.ai/install/ansible)

Security Architecture

### 

[​

](https://docs.openclaw.ai/install/ansible)

4-Layer Defense

1.  **Firewall (UFW)**: Only SSH (22) + Tailscale (41641/udp) exposed publicly
2.  **VPN (Tailscale)**: Gateway accessible only via VPN mesh
3.  **Docker Isolation**: DOCKER-USER iptables chain prevents external port exposure
4.  **Systemd Hardening**: NoNewPrivileges, PrivateTmp, unprivileged user

### 

[​

](https://docs.openclaw.ai/install/ansible)

Verification

Test external attack surface:

Copy

```
nmap -p- YOUR_SERVER_IP
```

Should show **only port 22** (SSH) open. All other services (gateway, Docker) are locked down.

### 

[​

](https://docs.openclaw.ai/install/ansible)

Docker Availability

Docker is installed for **agent sandboxes** (isolated tool execution), not for running the gateway itself. The gateway binds to localhost only and is accessible via Tailscale VPN. See [Multi-Agent Sandbox & Tools](https://docs.openclaw.ai/tools/multi-agent-sandbox-tools) for sandbox configuration.

## 

[​

](https://docs.openclaw.ai/install/ansible)

Manual Installation

If you prefer manual control over the automation:

Copy

```
# 1. Install prerequisites
sudo apt update && sudo apt install -y ansible git

# 2. Clone repository
git clone https://github.com/openclaw/openclaw-ansible.git
cd openclaw-ansible

# 3. Install Ansible collections
ansible-galaxy collection install -r requirements.yml

# 4. Run playbook
./run-playbook.sh

# Or run directly (then manually execute /tmp/openclaw-setup.sh after)
# ansible-playbook playbook.yml --ask-become-pass
```

## 

[​

](https://docs.openclaw.ai/install/ansible)

Updating OpenClaw

The Ansible installer sets up OpenClaw for manual updates. See [Updating](https://docs.openclaw.ai/install/updating) for the standard update flow. To re-run the Ansible playbook (e.g., for configuration changes):

Copy

```
cd openclaw-ansible
./run-playbook.sh
```

Note: This is idempotent and safe to run multiple times.

## 

[​

](https://docs.openclaw.ai/install/ansible)

Troubleshooting

### 

[​

](https://docs.openclaw.ai/install/ansible)

Firewall blocks my connection

If you’re locked out:

-   Ensure you can access via Tailscale VPN first
-   SSH access (port 22) is always allowed
-   The gateway is **only** accessible via Tailscale by design

### 

[​

](https://docs.openclaw.ai/install/ansible)

Service won’t start

Copy

```
# Check logs
sudo journalctl -u openclaw -n 100

# Verify permissions
sudo ls -la /opt/openclaw

# Test manual start
sudo -i -u openclaw
cd ~/openclaw
pnpm start
```

### 

[​

](https://docs.openclaw.ai/install/ansible)

Docker sandbox issues

Copy

```
# Verify Docker is running
sudo systemctl status docker

# Check sandbox image
sudo docker images | grep openclaw-sandbox

# Build sandbox image if missing
cd /opt/openclaw/openclaw
sudo -u openclaw ./scripts/sandbox-setup.sh
```

### 

[​

](https://docs.openclaw.ai/install/ansible)

Provider login fails

Make sure you’re running as the `openclaw` user:

Copy

```
sudo -i -u openclaw
openclaw channels login
```

## 

[​

](https://docs.openclaw.ai/install/ansible)

Advanced Configuration

For detailed security architecture and troubleshooting:

-   [Security Architecture](https://github.com/openclaw/openclaw-ansible/blob/main/docs/security.md)
-   [Technical Details](https://github.com/openclaw/openclaw-ansible/blob/main/docs/architecture.md)
-   [Troubleshooting Guide](https://github.com/openclaw/openclaw-ansible/blob/main/docs/troubleshooting.md)

## 

[​

](https://docs.openclaw.ai/install/ansible)

Related

-   [openclaw-ansible](https://github.com/openclaw/openclaw-ansible) — full deployment guide
-   [Docker](https://docs.openclaw.ai/install/docker) — containerized gateway setup
-   [Sandboxing](https://docs.openclaw.ai/gateway/sandboxing) — agent sandbox configuration
-   [Multi-Agent Sandbox & Tools](https://docs.openclaw.ai/tools/multi-agent-sandbox-tools) — per-agent isolation

[Nix](https://docs.openclaw.ai/install/nix)[Bun (Experimental)](https://docs.openclaw.ai/install/bun)

⌘I
