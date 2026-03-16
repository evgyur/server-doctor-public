<!-- Source: https://docs.openclaw.ai/install/railway -->
<!-- Title: Deploy on Railway - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/railway)

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

-   [Quick checklist (new users)](https://docs.openclaw.ai/install/railway)
-   [One-click deploy](https://docs.openclaw.ai/install/railway)
-   [What you get](https://docs.openclaw.ai/install/railway)
-   [Required Railway settings](https://docs.openclaw.ai/install/railway)
-   [Public Networking](https://docs.openclaw.ai/install/railway)
-   [Volume (required)](https://docs.openclaw.ai/install/railway)
-   [Variables](https://docs.openclaw.ai/install/railway)
-   [Setup flow](https://docs.openclaw.ai/install/railway)
-   [Getting chat tokens](https://docs.openclaw.ai/install/railway)
-   [Telegram bot token](https://docs.openclaw.ai/install/railway)
-   [Discord bot token](https://docs.openclaw.ai/install/railway)
-   [Backups & migration](https://docs.openclaw.ai/install/railway)

Hosting and deployment

# Deploy on Railway

Deploy OpenClaw on Railway with a one-click template and finish setup in your browser. This is the easiest “no terminal on the server” path: Railway runs the Gateway for you, and you configure everything via the `/setup` web wizard.

## 

[​

](https://docs.openclaw.ai/install/railway)

Quick checklist (new users)

1.  Click **Deploy on Railway** (below).
2.  Add a **Volume** mounted at `/data`.
3.  Set the required **Variables** (at least `SETUP_PASSWORD`).
4.  Enable **HTTP Proxy** on port `8080`.
5.  Open `https://<your-railway-domain>/setup` and finish the wizard.

## 

[​

](https://docs.openclaw.ai/install/railway)

One-click deploy

[Deploy on Railway](https://railway.com/deploy/clawdbot-railway-template) After deploy, find your public URL in **Railway → your service → Settings → Domains**. Railway will either:

-   give you a generated domain (often `https://<something>.up.railway.app`), or
-   use your custom domain if you attached one.

Then open:

-   `https://<your-railway-domain>/setup` — setup wizard (password protected)
-   `https://<your-railway-domain>/openclaw` — Control UI

## 

[​

](https://docs.openclaw.ai/install/railway)

What you get

-   Hosted OpenClaw Gateway + Control UI
-   Web setup wizard at `/setup` (no terminal commands)
-   Persistent storage via Railway Volume (`/data`) so config/credentials/workspace survive redeploys
-   Backup export at `/setup/export` to migrate off Railway later

## 

[​

](https://docs.openclaw.ai/install/railway)

Required Railway settings

### 

[​

](https://docs.openclaw.ai/install/railway)

Public Networking

Enable **HTTP Proxy** for the service.

-   Port: `8080`

### 

[​

](https://docs.openclaw.ai/install/railway)

Volume (required)

Attach a volume mounted at:

-   `/data`

### 

[​

](https://docs.openclaw.ai/install/railway)

Variables

Set these variables on the service:

-   `SETUP_PASSWORD` (required)
-   `PORT=8080` (required — must match the port in Public Networking)
-   `OPENCLAW_STATE_DIR=/data/.openclaw` (recommended)
-   `OPENCLAW_WORKSPACE_DIR=/data/workspace` (recommended)
-   `OPENCLAW_GATEWAY_TOKEN` (recommended; treat as an admin secret)

## 

[​

](https://docs.openclaw.ai/install/railway)

Setup flow

1.  Visit `https://<your-railway-domain>/setup` and enter your `SETUP_PASSWORD`.
2.  Choose a model/auth provider and paste your key.
3.  (Optional) Add Telegram/Discord/Slack tokens.
4.  Click **Run setup**.

If Telegram DMs are set to pairing, the setup wizard can approve the pairing code.

## 

[​

](https://docs.openclaw.ai/install/railway)

Getting chat tokens

### 

[​

](https://docs.openclaw.ai/install/railway)

Telegram bot token

1.  Message `@BotFather` in Telegram
2.  Run `/newbot`
3.  Copy the token (looks like `123456789:AA...`)
4.  Paste it into `/setup`

### 

[​

](https://docs.openclaw.ai/install/railway)

Discord bot token

1.  Go to [https://discord.com/developers/applications](https://discord.com/developers/applications)
2.  **New Application** → choose a name
3.  **Bot** → **Add Bot**
4.  **Enable MESSAGE CONTENT INTENT** under Bot → Privileged Gateway Intents (required or the bot will crash on startup)
5.  Copy the **Bot Token** and paste into `/setup`
6.  Invite the bot to your server (OAuth2 URL Generator; scopes: `bot`, `applications.commands`)

## 

[​

](https://docs.openclaw.ai/install/railway)

Backups & migration

Download a backup at:

-   `https://<your-railway-domain>/setup/export`

This exports your OpenClaw state + workspace so you can migrate to another host without losing config or memory.

[exe.dev](https://docs.openclaw.ai/install/exe-dev)[Deploy on Render](https://docs.openclaw.ai/install/render)

⌘I
