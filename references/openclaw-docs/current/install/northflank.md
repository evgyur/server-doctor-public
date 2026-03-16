<!-- Source: https://docs.openclaw.ai/install/northflank -->
<!-- Title: Deploy on Northflank - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/northflank)

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

-   [How to get started](https://docs.openclaw.ai/install/northflank)
-   [What you get](https://docs.openclaw.ai/install/northflank)
-   [Setup flow](https://docs.openclaw.ai/install/northflank)
-   [Getting chat tokens](https://docs.openclaw.ai/install/northflank)
-   [Telegram bot token](https://docs.openclaw.ai/install/northflank)
-   [Discord bot token](https://docs.openclaw.ai/install/northflank)

Hosting and deployment

# Deploy on Northflank

Deploy OpenClaw on Northflank with a one-click template and finish setup in your browser. This is the easiest “no terminal on the server” path: Northflank runs the Gateway for you, and you configure everything via the `/setup` web wizard.

## 

[​

](https://docs.openclaw.ai/install/northflank)

How to get started

1.  Click [Deploy OpenClaw](https://northflank.com/stacks/deploy-openclaw) to open the template.
2.  Create an [account on Northflank](https://app.northflank.com/signup) if you don’t already have one.
3.  Click **Deploy OpenClaw now**.
4.  Set the required environment variable: `SETUP_PASSWORD`.
5.  Click **Deploy stack** to build and run the OpenClaw template.
6.  Wait for the deployment to complete, then click **View resources**.
7.  Open the OpenClaw service.
8.  Open the public OpenClaw URL and complete setup at `/setup`.
9.  Open the Control UI at `/openclaw`.

## 

[​

](https://docs.openclaw.ai/install/northflank)

What you get

-   Hosted OpenClaw Gateway + Control UI
-   Web setup wizard at `/setup` (no terminal commands)
-   Persistent storage via Northflank Volume (`/data`) so config/credentials/workspace survive redeploys

## 

[​

](https://docs.openclaw.ai/install/northflank)

Setup flow

1.  Visit `https://<your-northflank-domain>/setup` and enter your `SETUP_PASSWORD`.
2.  Choose a model/auth provider and paste your key.
3.  (Optional) Add Telegram/Discord/Slack tokens.
4.  Click **Run setup**.
5.  Open the Control UI at `https://<your-northflank-domain>/openclaw`

If Telegram DMs are set to pairing, the setup wizard can approve the pairing code.

## 

[​

](https://docs.openclaw.ai/install/northflank)

Getting chat tokens

### 

[​

](https://docs.openclaw.ai/install/northflank)

Telegram bot token

1.  Message `@BotFather` in Telegram
2.  Run `/newbot`
3.  Copy the token (looks like `123456789:AA...`)
4.  Paste it into `/setup`

### 

[​

](https://docs.openclaw.ai/install/northflank)

Discord bot token

1.  Go to [https://discord.com/developers/applications](https://discord.com/developers/applications)
2.  **New Application** → choose a name
3.  **Bot** → **Add Bot**
4.  **Enable MESSAGE CONTENT INTENT** under Bot → Privileged Gateway Intents (required or the bot will crash on startup)
5.  Copy the **Bot Token** and paste into `/setup`
6.  Invite the bot to your server (OAuth2 URL Generator; scopes: `bot`, `applications.commands`)

[Deploy on Render](https://docs.openclaw.ai/install/render)[Development Channels](https://docs.openclaw.ai/install/development-channels)

⌘I
