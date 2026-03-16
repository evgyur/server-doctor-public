<!-- Source: https://docs.openclaw.ai/vps -->
<!-- Title: VPS Hosting - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/vps)

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

-   [VPS hosting](https://docs.openclaw.ai/vps)
-   [Pick a provider](https://docs.openclaw.ai/vps)
-   [How cloud setups work](https://docs.openclaw.ai/vps)
-   [Shared company agent on a VPS](https://docs.openclaw.ai/vps)
-   [Using nodes with a VPS](https://docs.openclaw.ai/vps)
-   [Startup tuning for small VMs and ARM hosts](https://docs.openclaw.ai/vps)
-   [systemd tuning checklist (optional)](https://docs.openclaw.ai/vps)

Hosting and deployment

# VPS Hosting

# 

[​

](https://docs.openclaw.ai/vps)

VPS hosting

This hub links to the supported VPS/hosting guides and explains how cloud deployments work at a high level.

## 

[​

](https://docs.openclaw.ai/vps)

Pick a provider

-   **Railway** (one‑click + browser setup): [Railway](https://docs.openclaw.ai/install/railway)
-   **Northflank** (one‑click + browser setup): [Northflank](https://docs.openclaw.ai/install/northflank)
-   **Oracle Cloud (Always Free)**: [Oracle](https://docs.openclaw.ai/platforms/oracle) — $0/month (Always Free, ARM; capacity/signup can be finicky)
-   **Fly.io**: [Fly.io](https://docs.openclaw.ai/install/fly)
-   **Hetzner (Docker)**: [Hetzner](https://docs.openclaw.ai/install/hetzner)
-   **GCP (Compute Engine)**: [GCP](https://docs.openclaw.ai/install/gcp)
-   **exe.dev** (VM + HTTPS proxy): [exe.dev](https://docs.openclaw.ai/install/exe-dev)
-   **AWS (EC2/Lightsail/free tier)**: works well too. Video guide: [https://x.com/techfrenAJ/status/2014934471095812547](https://x.com/techfrenAJ/status/2014934471095812547)

## 

[​

](https://docs.openclaw.ai/vps)

How cloud setups work

-   The **Gateway runs on the VPS** and owns state + workspace.
-   You connect from your laptop/phone via the **Control UI** or **Tailscale/SSH**.
-   Treat the VPS as the source of truth and **back up** the state + workspace.
-   Secure default: keep the Gateway on loopback and access it via SSH tunnel or Tailscale Serve. If you bind to `lan`/`tailnet`, require `gateway.auth.token` or `gateway.auth.password`.

Remote access: [Gateway remote](https://docs.openclaw.ai/gateway/remote)  
Platforms hub: [Platforms](https://docs.openclaw.ai/platforms)

## 

[​

](https://docs.openclaw.ai/vps)

Shared company agent on a VPS

This is a valid setup when the users are in one trust boundary (for example one company team), and the agent is business-only.

-   Keep it on a dedicated runtime (VPS/VM/container + dedicated OS user/accounts).
-   Do not sign that runtime into personal Apple/Google accounts or personal browser/password-manager profiles.
-   If users are adversarial to each other, split by gateway/host/OS user.

Security model details: [Security](https://docs.openclaw.ai/gateway/security)

## 

[​

](https://docs.openclaw.ai/vps)

Using nodes with a VPS

You can keep the Gateway in the cloud and pair **nodes** on your local devices (Mac/iOS/Android/headless). Nodes provide local screen/camera/canvas and `system.run` capabilities while the Gateway stays in the cloud. Docs: [Nodes](https://docs.openclaw.ai/nodes), [Nodes CLI](https://docs.openclaw.ai/cli/nodes)

## 

[​

](https://docs.openclaw.ai/vps)

Startup tuning for small VMs and ARM hosts

If CLI commands feel slow on low-power VMs (or ARM hosts), enable Node’s module compile cache:

Copy

```
grep -q 'NODE_COMPILE_CACHE=/var/tmp/openclaw-compile-cache' ~/.bashrc || cat >> ~/.bashrc <<'EOF'
export NODE_COMPILE_CACHE=/var/tmp/openclaw-compile-cache
mkdir -p /var/tmp/openclaw-compile-cache
export OPENCLAW_NO_RESPAWN=1
EOF
source ~/.bashrc
```

-   `NODE_COMPILE_CACHE` improves repeated command startup times.
-   `OPENCLAW_NO_RESPAWN=1` avoids extra startup overhead from a self-respawn path.
-   First command run warms cache; subsequent runs are faster.
-   For Raspberry Pi specifics, see [Raspberry Pi](https://docs.openclaw.ai/platforms/raspberry-pi).

### 

[​

](https://docs.openclaw.ai/vps)

systemd tuning checklist (optional)

For VM hosts using `systemd`, consider:

-   Add service env for stable startup path:
    -   `OPENCLAW_NO_RESPAWN=1`
    -   `NODE_COMPILE_CACHE=/var/tmp/openclaw-compile-cache`
-   Keep restart behavior explicit:
    -   `Restart=always`
    -   `RestartSec=2`
    -   `TimeoutStartSec=90`
-   Prefer SSD-backed disks for state/cache paths to reduce random-I/O cold-start penalties.

Example:

Copy

```
sudo systemctl edit openclaw
```

Copy

```
[Service]
Environment=OPENCLAW_NO_RESPAWN=1
Environment=NODE_COMPILE_CACHE=/var/tmp/openclaw-compile-cache
Restart=always
RestartSec=2
TimeoutStartSec=90
```

How `Restart=` policies help automated recovery: [systemd can automate service recovery](https://www.redhat.com/en/blog/systemd-automate-recovery).

[Uninstall](https://docs.openclaw.ai/install/uninstall)[Kubernetes](https://docs.openclaw.ai/install/kubernetes)

⌘I
