<!-- Source: https://docs.openclaw.ai/install/render -->
<!-- Title: Deploy on Render - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/render)

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

-   [Prerequisites](https://docs.openclaw.ai/install/render)
-   [Deploy with a Render Blueprint](https://docs.openclaw.ai/install/render)
-   [Understanding the Blueprint](https://docs.openclaw.ai/install/render)
-   [Choosing a plan](https://docs.openclaw.ai/install/render)
-   [After deployment](https://docs.openclaw.ai/install/render)
-   [Complete the setup wizard](https://docs.openclaw.ai/install/render)
-   [Access the Control UI](https://docs.openclaw.ai/install/render)
-   [Render Dashboard features](https://docs.openclaw.ai/install/render)
-   [Logs](https://docs.openclaw.ai/install/render)
-   [Shell access](https://docs.openclaw.ai/install/render)
-   [Environment variables](https://docs.openclaw.ai/install/render)
-   [Auto-deploy](https://docs.openclaw.ai/install/render)
-   [Custom domain](https://docs.openclaw.ai/install/render)
-   [Scaling](https://docs.openclaw.ai/install/render)
-   [Backups and migration](https://docs.openclaw.ai/install/render)
-   [Troubleshooting](https://docs.openclaw.ai/install/render)
-   [Service won’t start](https://docs.openclaw.ai/install/render)
-   [Slow cold starts (free tier)](https://docs.openclaw.ai/install/render)
-   [Data loss after redeploy](https://docs.openclaw.ai/install/render)
-   [Health check failures](https://docs.openclaw.ai/install/render)

Hosting and deployment

# Deploy on Render

Deploy OpenClaw on Render using Infrastructure as Code. The included `render.yaml` Blueprint defines your entire stack declaratively, service, disk, environment variables, so you can deploy with a single click and version your infrastructure alongside your code.

## 

[​

](https://docs.openclaw.ai/install/render)

Prerequisites

-   A [Render account](https://render.com/) (free tier available)
-   An API key from your preferred [model provider](https://docs.openclaw.ai/providers)

## 

[​

](https://docs.openclaw.ai/install/render)

Deploy with a Render Blueprint

[Deploy to Render](https://render.com/deploy) Clicking this link will:

1.  Create a new Render service from the `render.yaml` Blueprint at the root of this repo.
2.  Prompt you to set `SETUP_PASSWORD`
3.  Build the Docker image and deploy

Once deployed, your service URL follows the pattern `https://<service-name>.onrender.com`.

## 

[​

](https://docs.openclaw.ai/install/render)

Understanding the Blueprint

Render Blueprints are YAML files that define your infrastructure. The `render.yaml` in this repository configures everything needed to run OpenClaw:

Copy

```
services:
  - type: web
    name: openclaw
    runtime: docker
    plan: starter
    healthCheckPath: /health
    envVars:
      - key: PORT
        value: "8080"
      - key: SETUP_PASSWORD
        sync: false # prompts during deploy
      - key: OPENCLAW_STATE_DIR
        value: /data/.openclaw
      - key: OPENCLAW_WORKSPACE_DIR
        value: /data/workspace
      - key: OPENCLAW_GATEWAY_TOKEN
        generateValue: true # auto-generates a secure token
    disk:
      name: openclaw-data
      mountPath: /data
      sizeGB: 1
```

Key Blueprint features used:

| Feature | Purpose |
| --- | --- |
| `runtime: docker` | Builds from the repo’s Dockerfile |
| `healthCheckPath` | Render monitors `/health` and restarts unhealthy instances |
| `sync: false` | Prompts for value during deploy (secrets) |
| `generateValue: true` | Auto-generates a cryptographically secure value |
| `disk` | Persistent storage that survives redeploys |

## 

[​

](https://docs.openclaw.ai/install/render)

Choosing a plan

| Plan | Spin-down | Disk | Best for |
| --- | --- | --- | --- |
| Free | After 15 min idle | Not available | Testing, demos |
| Starter | Never | 1GB+ | Personal use, small teams |
| Standard+ | Never | 1GB+ | Production, multiple channels |

The Blueprint defaults to `starter`. To use free tier, change `plan: free` in your fork’s `render.yaml` (but note: no persistent disk means config resets on each deploy).

## 

[​

](https://docs.openclaw.ai/install/render)

After deployment

### 

[​

](https://docs.openclaw.ai/install/render)

Complete the setup wizard

1.  Navigate to `https://<your-service>.onrender.com/setup`
2.  Enter your `SETUP_PASSWORD`
3.  Select a model provider and paste your API key
4.  Optionally configure messaging channels (Telegram, Discord, Slack)
5.  Click **Run setup**

### 

[​

](https://docs.openclaw.ai/install/render)

Access the Control UI

The web dashboard is available at `https://<your-service>.onrender.com/openclaw`.

## 

[​

](https://docs.openclaw.ai/install/render)

Render Dashboard features

### 

[​

](https://docs.openclaw.ai/install/render)

Logs

View real-time logs in **Dashboard → your service → Logs**. Filter by:

-   Build logs (Docker image creation)
-   Deploy logs (service startup)
-   Runtime logs (application output)

### 

[​

](https://docs.openclaw.ai/install/render)

Shell access

For debugging, open a shell session via **Dashboard → your service → Shell**. The persistent disk is mounted at `/data`.

### 

[​

](https://docs.openclaw.ai/install/render)

Environment variables

Modify variables in **Dashboard → your service → Environment**. Changes trigger an automatic redeploy.

### 

[​

](https://docs.openclaw.ai/install/render)

Auto-deploy

If you use the original OpenClaw repository, Render will not auto-deploy your OpenClaw. To update it, run a manual Blueprint sync from the dashboard.

## 

[​

](https://docs.openclaw.ai/install/render)

Custom domain

1.  Go to **Dashboard → your service → Settings → Custom Domains**
2.  Add your domain
3.  Configure DNS as instructed (CNAME to `*.onrender.com`)
4.  Render provisions a TLS certificate automatically

## 

[​

](https://docs.openclaw.ai/install/render)

Scaling

Render supports horizontal and vertical scaling:

-   **Vertical**: Change the plan to get more CPU/RAM
-   **Horizontal**: Increase instance count (Standard plan and above)

For OpenClaw, vertical scaling is usually sufficient. Horizontal scaling requires sticky sessions or external state management.

## 

[​

](https://docs.openclaw.ai/install/render)

Backups and migration

Export your configuration and workspace at any time:

Copy

```
https://<your-service>.onrender.com/setup/export
```

This downloads a portable backup you can restore on any OpenClaw host.

## 

[​

](https://docs.openclaw.ai/install/render)

Troubleshooting

### 

[​

](https://docs.openclaw.ai/install/render)

Service won’t start

Check the deploy logs in the Render Dashboard. Common issues:

-   Missing `SETUP_PASSWORD` — the Blueprint prompts for this, but verify it’s set
-   Port mismatch — ensure `PORT=8080` matches the Dockerfile’s exposed port

### 

[​

](https://docs.openclaw.ai/install/render)

Slow cold starts (free tier)

Free tier services spin down after 15 minutes of inactivity. The first request after spin-down takes a few seconds while the container starts. Upgrade to Starter plan for always-on.

### 

[​

](https://docs.openclaw.ai/install/render)

Data loss after redeploy

This happens on free tier (no persistent disk). Upgrade to a paid plan, or regularly export your config via `/setup/export`.

### 

[​

](https://docs.openclaw.ai/install/render)

Health check failures

Render expects a 200 response from `/health` within 30 seconds. If builds succeed but deploys fail, the service may be taking too long to start. Check:

-   Build logs for errors
-   Whether the container runs locally with `docker build && docker run`

[Deploy on Railway](https://docs.openclaw.ai/install/railway)[Deploy on Northflank](https://docs.openclaw.ai/install/northflank)

⌘I
