<!-- Source: https://docs.openclaw.ai/install/exe-dev -->
<!-- Title: exe.dev - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/exe-dev)

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

-   [exe.dev](https://docs.openclaw.ai/install/exe-dev)
-   [Beginner quick path](https://docs.openclaw.ai/install/exe-dev)
-   [What you need](https://docs.openclaw.ai/install/exe-dev)
-   [Automated Install with Shelley](https://docs.openclaw.ai/install/exe-dev)
-   [Manual installation](https://docs.openclaw.ai/install/exe-dev)
-   [1) Create the VM](https://docs.openclaw.ai/install/exe-dev)
-   [2) Install prerequisites (on the VM)](https://docs.openclaw.ai/install/exe-dev)
-   [3) Install OpenClaw](https://docs.openclaw.ai/install/exe-dev)
-   [4) Setup nginx to proxy OpenClaw to port 8000](https://docs.openclaw.ai/install/exe-dev)
-   [5) Access OpenClaw and grant privileges](https://docs.openclaw.ai/install/exe-dev)
-   [Remote Access](https://docs.openclaw.ai/install/exe-dev)
-   [Updating](https://docs.openclaw.ai/install/exe-dev)

Hosting and deployment

# exe.dev

# 

[​

](https://docs.openclaw.ai/install/exe-dev)

exe.dev

Goal: OpenClaw Gateway running on an exe.dev VM, reachable from your laptop via: `https://<vm-name>.exe.xyz` This page assumes exe.dev’s default **exeuntu** image. If you picked a different distro, map packages accordingly.

## 

[​

](https://docs.openclaw.ai/install/exe-dev)

Beginner quick path

1.  [https://exe.new/openclaw](https://exe.new/openclaw)
2.  Fill in your auth key/token as needed
3.  Click on “Agent” next to your VM, and wait…
4.  ???
5.  Profit

## 

[​

](https://docs.openclaw.ai/install/exe-dev)

What you need

-   exe.dev account
-   `ssh exe.dev` access to [exe.dev](https://exe.dev/) virtual machines (optional)

## 

[​

](https://docs.openclaw.ai/install/exe-dev)

Automated Install with Shelley

Shelley, [exe.dev](https://exe.dev/)’s agent, can install OpenClaw instantly with our prompt. The prompt used is as below:

Copy

```
Set up OpenClaw (https://docs.openclaw.ai/install) on this VM. Use the non-interactive and accept-risk flags for openclaw onboarding. Add the supplied auth or token as needed. Configure nginx to forward from the default port 18789 to the root location on the default enabled site config, making sure to enable Websocket support. Pairing is done by "openclaw devices list" and "openclaw devices approve <request id>". Make sure the dashboard shows that OpenClaw's health is OK. exe.dev handles forwarding from port 8000 to port 80/443 and HTTPS for us, so the final "reachable" should be <vm-name>.exe.xyz, without port specification.
```

## 

[​

](https://docs.openclaw.ai/install/exe-dev)

Manual installation

## 

[​

](https://docs.openclaw.ai/install/exe-dev)

1) Create the VM

From your device:

Copy

```
ssh exe.dev new
```

Then connect:

Copy

```
ssh <vm-name>.exe.xyz
```

Tip: keep this VM **stateful**. OpenClaw stores state under `~/.openclaw/` and `~/.openclaw/workspace/`.

## 

[​

](https://docs.openclaw.ai/install/exe-dev)

2) Install prerequisites (on the VM)

Copy

```
sudo apt-get update
sudo apt-get install -y git curl jq ca-certificates openssl
```

## 

[​

](https://docs.openclaw.ai/install/exe-dev)

3) Install OpenClaw

Run the OpenClaw install script:

Copy

```
curl -fsSL https://openclaw.ai/install.sh | bash
```

## 

[​

](https://docs.openclaw.ai/install/exe-dev)

4) Setup nginx to proxy OpenClaw to port 8000

Edit `/etc/nginx/sites-enabled/default` with

Copy

```
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    listen 8000;
    listen [::]:8000;

    server_name _;

    location / {
        proxy_pass http://127.0.0.1:18789;
        proxy_http_version 1.1;

        # WebSocket support
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        # Standard proxy headers
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # Timeout settings for long-lived connections
        proxy_read_timeout 86400s;
        proxy_send_timeout 86400s;
    }
}
```

## 

[​

](https://docs.openclaw.ai/install/exe-dev)

5) Access OpenClaw and grant privileges

Access `https://<vm-name>.exe.xyz/` (see the Control UI output from onboarding). If it prompts for auth, paste the token from `gateway.auth.token` on the VM (retrieve with `openclaw config get gateway.auth.token`, or generate one with `openclaw doctor --generate-gateway-token`). Approve devices with `openclaw devices list` and `openclaw devices approve <requestId>`. When in doubt, use Shelley from your browser!

## 

[​

](https://docs.openclaw.ai/install/exe-dev)

Remote Access

Remote access is handled by [exe.dev](https://exe.dev/)’s authentication. By default, HTTP traffic from port 8000 is forwarded to `https://<vm-name>.exe.xyz` with email auth.

## 

[​

](https://docs.openclaw.ai/install/exe-dev)

Updating

Copy

```
npm i -g openclaw@latest
openclaw doctor
openclaw gateway restart
openclaw health
```

Guide: [Updating](https://docs.openclaw.ai/install/updating)

[macOS VMs](https://docs.openclaw.ai/install/macos-vm)[Deploy on Railway](https://docs.openclaw.ai/install/railway)

⌘I
