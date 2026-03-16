<!-- Source: https://docs.openclaw.ai/install/fly -->
<!-- Title: Fly.io - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/fly)

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

-   [Fly.io Deployment](https://docs.openclaw.ai/install/fly)
-   [What you need](https://docs.openclaw.ai/install/fly)
-   [Beginner quick path](https://docs.openclaw.ai/install/fly)
-   [1) Create the Fly app](https://docs.openclaw.ai/install/fly)
-   [2) Configure fly.toml](https://docs.openclaw.ai/install/fly)
-   [3) Set secrets](https://docs.openclaw.ai/install/fly)
-   [4) Deploy](https://docs.openclaw.ai/install/fly)
-   [5) Create config file](https://docs.openclaw.ai/install/fly)
-   [6) Access the Gateway](https://docs.openclaw.ai/install/fly)
-   [Control UI](https://docs.openclaw.ai/install/fly)
-   [Logs](https://docs.openclaw.ai/install/fly)
-   [SSH Console](https://docs.openclaw.ai/install/fly)
-   [Troubleshooting](https://docs.openclaw.ai/install/fly)
-   [”App is not listening on expected address”](https://docs.openclaw.ai/install/fly)
-   [Health checks failing / connection refused](https://docs.openclaw.ai/install/fly)
-   [OOM / Memory Issues](https://docs.openclaw.ai/install/fly)
-   [Gateway Lock Issues](https://docs.openclaw.ai/install/fly)
-   [Config Not Being Read](https://docs.openclaw.ai/install/fly)
-   [Writing Config via SSH](https://docs.openclaw.ai/install/fly)
-   [State Not Persisting](https://docs.openclaw.ai/install/fly)
-   [Updates](https://docs.openclaw.ai/install/fly)
-   [Updating Machine Command](https://docs.openclaw.ai/install/fly)
-   [Private Deployment (Hardened)](https://docs.openclaw.ai/install/fly)
-   [When to use private deployment](https://docs.openclaw.ai/install/fly)
-   [Setup](https://docs.openclaw.ai/install/fly)
-   [Accessing a private deployment](https://docs.openclaw.ai/install/fly)
-   [Webhooks with private deployment](https://docs.openclaw.ai/install/fly)
-   [Security benefits](https://docs.openclaw.ai/install/fly)
-   [Notes](https://docs.openclaw.ai/install/fly)
-   [Cost](https://docs.openclaw.ai/install/fly)

Hosting and deployment

# Fly.io

Deploy OpenClaw on Fly.io

# 

[​

](https://docs.openclaw.ai/install/fly)

Fly.io Deployment

**Goal:** OpenClaw Gateway running on a [Fly.io](https://fly.io/) machine with persistent storage, automatic HTTPS, and Discord/channel access.

## 

[​

](https://docs.openclaw.ai/install/fly)

What you need

-   [flyctl CLI](https://fly.io/docs/hands-on/install-flyctl) installed
-   Fly.io account (free tier works)
-   Model auth: API key for your chosen model provider
-   Channel credentials: Discord bot token, Telegram token, etc.

## 

[​

](https://docs.openclaw.ai/install/fly)

Beginner quick path

1.  Clone repo → customize `fly.toml`
2.  Create app + volume → set secrets
3.  Deploy with `fly deploy`
4.  SSH in to create config or use Control UI

## 

[​

](https://docs.openclaw.ai/install/fly)

1) Create the Fly app

Copy

```
# Clone the repo
git clone https://github.com/openclaw/openclaw.git
cd openclaw

# Create a new Fly app (pick your own name)
fly apps create my-openclaw

# Create a persistent volume (1GB is usually enough)
fly volumes create openclaw_data --size 1 --region iad
```

**Tip:** Choose a region close to you. Common options: `lhr` (London), `iad` (Virginia), `sjc` (San Jose).

## 

[​

](https://docs.openclaw.ai/install/fly)

2) Configure fly.toml

Edit `fly.toml` to match your app name and requirements. **Security note:** The default config exposes a public URL. For a hardened deployment with no public IP, see [Private Deployment](https://docs.openclaw.ai/install/fly) or use `fly.private.toml`.

Copy

```
app = "my-openclaw"  # Your app name
primary_region = "iad"

[build]
  dockerfile = "Dockerfile"

[env]
  NODE_ENV = "production"
  OPENCLAW_PREFER_PNPM = "1"
  OPENCLAW_STATE_DIR = "/data"
  NODE_OPTIONS = "--max-old-space-size=1536"

[processes]
  app = "node dist/index.js gateway --allow-unconfigured --port 3000 --bind lan"

[http_service]
  internal_port = 3000
  force_https = true
  auto_stop_machines = false
  auto_start_machines = true
  min_machines_running = 1
  processes = ["app"]

[[vm]]
  size = "shared-cpu-2x"
  memory = "2048mb"

[mounts]
  source = "openclaw_data"
  destination = "/data"
```

**Key settings:**

| Setting | Why |
| --- | --- |
| `--bind lan` | Binds to `0.0.0.0` so Fly’s proxy can reach the gateway |
| `--allow-unconfigured` | Starts without a config file (you’ll create one after) |
| `internal_port = 3000` | Must match `--port 3000` (or `OPENCLAW_GATEWAY_PORT`) for Fly health checks |
| `memory = "2048mb"` | 512MB is too small; 2GB recommended |
| `OPENCLAW_STATE_DIR = "/data"` | Persists state on the volume |

## 

[​

](https://docs.openclaw.ai/install/fly)

3) Set secrets

Copy

```
# Required: Gateway token (for non-loopback binding)
fly secrets set OPENCLAW_GATEWAY_TOKEN=$(openssl rand -hex 32)

# Model provider API keys
fly secrets set ANTHROPIC_API_KEY=sk-ant-...

# Optional: Other providers
fly secrets set OPENAI_API_KEY=sk-...
fly secrets set GOOGLE_API_KEY=...

# Channel tokens
fly secrets set DISCORD_BOT_TOKEN=MTQ...
```

**Notes:**

-   Non-loopback binds (`--bind lan`) require `OPENCLAW_GATEWAY_TOKEN` for security.
-   Treat these tokens like passwords.
-   **Prefer env vars over config file** for all API keys and tokens. This keeps secrets out of `openclaw.json` where they could be accidentally exposed or logged.

## 

[​

](https://docs.openclaw.ai/install/fly)

4) Deploy

Copy

```
fly deploy
```

First deploy builds the Docker image (~2-3 minutes). Subsequent deploys are faster. After deployment, verify:

Copy

```
fly status
fly logs
```

You should see:

Copy

```
[gateway] listening on ws://0.0.0.0:3000 (PID xxx)
[discord] logged in to discord as xxx
```

## 

[​

](https://docs.openclaw.ai/install/fly)

5) Create config file

SSH into the machine to create a proper config:

Copy

```
fly ssh console
```

Create the config directory and file:

Copy

```
mkdir -p /data
cat > /data/openclaw.json << 'EOF'
{
  "agents": {
    "defaults": {
      "model": {
        "primary": "anthropic/claude-opus-4-6",
        "fallbacks": ["anthropic/claude-sonnet-4-5", "openai/gpt-4o"]
      },
      "maxConcurrent": 4
    },
    "list": [
      {
        "id": "main",
        "default": true
      }
    ]
  },
  "auth": {
    "profiles": {
      "anthropic:default": { "mode": "token", "provider": "anthropic" },
      "openai:default": { "mode": "token", "provider": "openai" }
    }
  },
  "bindings": [
    {
      "agentId": "main",
      "match": { "channel": "discord" }
    }
  ],
  "channels": {
    "discord": {
      "enabled": true,
      "groupPolicy": "allowlist",
      "guilds": {
        "YOUR_GUILD_ID": {
          "channels": { "general": { "allow": true } },
          "requireMention": false
        }
      }
    }
  },
  "gateway": {
    "mode": "local",
    "bind": "auto"
  },
  "meta": {
    "lastTouchedVersion": "2026.1.29"
  }
}
EOF
```

**Note:** With `OPENCLAW_STATE_DIR=/data`, the config path is `/data/openclaw.json`. **Note:** The Discord token can come from either:

-   Environment variable: `DISCORD_BOT_TOKEN` (recommended for secrets)
-   Config file: `channels.discord.token`

If using env var, no need to add token to config. The gateway reads `DISCORD_BOT_TOKEN` automatically. Restart to apply:

Copy

```
exit
fly machine restart <machine-id>
```

## 

[​

](https://docs.openclaw.ai/install/fly)

6) Access the Gateway

### 

[​

](https://docs.openclaw.ai/install/fly)

Control UI

Open in browser:

Copy

```
fly open
```

Or visit `https://my-openclaw.fly.dev/` Paste your gateway token (the one from `OPENCLAW_GATEWAY_TOKEN`) to authenticate.

### 

[​

](https://docs.openclaw.ai/install/fly)

Logs

Copy

```
fly logs              # Live logs
fly logs --no-tail    # Recent logs
```

### 

[​

](https://docs.openclaw.ai/install/fly)

SSH Console

Copy

```
fly ssh console
```

## 

[​

](https://docs.openclaw.ai/install/fly)

Troubleshooting

### 

[​

](https://docs.openclaw.ai/install/fly)

”App is not listening on expected address”

The gateway is binding to `127.0.0.1` instead of `0.0.0.0`. **Fix:** Add `--bind lan` to your process command in `fly.toml`.

### 

[​

](https://docs.openclaw.ai/install/fly)

Health checks failing / connection refused

Fly can’t reach the gateway on the configured port. **Fix:** Ensure `internal_port` matches the gateway port (set `--port 3000` or `OPENCLAW_GATEWAY_PORT=3000`).

### 

[​

](https://docs.openclaw.ai/install/fly)

OOM / Memory Issues

Container keeps restarting or getting killed. Signs: `SIGABRT`, `v8::internal::Runtime_AllocateInYoungGeneration`, or silent restarts. **Fix:** Increase memory in `fly.toml`:

Copy

```
[[vm]]
  memory = "2048mb"
```

Or update an existing machine:

Copy

```
fly machine update <machine-id> --vm-memory 2048 -y
```

**Note:** 512MB is too small. 1GB may work but can OOM under load or with verbose logging. **2GB is recommended.**

### 

[​

](https://docs.openclaw.ai/install/fly)

Gateway Lock Issues

Gateway refuses to start with “already running” errors. This happens when the container restarts but the PID lock file persists on the volume. **Fix:** Delete the lock file:

Copy

```
fly ssh console --command "rm -f /data/gateway.*.lock"
fly machine restart <machine-id>
```

The lock file is at `/data/gateway.*.lock` (not in a subdirectory).

### 

[​

](https://docs.openclaw.ai/install/fly)

Config Not Being Read

If using `--allow-unconfigured`, the gateway creates a minimal config. Your custom config at `/data/openclaw.json` should be read on restart. Verify the config exists:

Copy

```
fly ssh console --command "cat /data/openclaw.json"
```

### 

[​

](https://docs.openclaw.ai/install/fly)

Writing Config via SSH

The `fly ssh console -C` command doesn’t support shell redirection. To write a config file:

Copy

```
# Use echo + tee (pipe from local to remote)
echo '{"your":"config"}' | fly ssh console -C "tee /data/openclaw.json"

# Or use sftp
fly sftp shell
> put /local/path/config.json /data/openclaw.json
```

**Note:** `fly sftp` may fail if the file already exists. Delete first:

Copy

```
fly ssh console --command "rm /data/openclaw.json"
```

### 

[​

](https://docs.openclaw.ai/install/fly)

State Not Persisting

If you lose credentials or sessions after a restart, the state dir is writing to the container filesystem. **Fix:** Ensure `OPENCLAW_STATE_DIR=/data` is set in `fly.toml` and redeploy.

## 

[​

](https://docs.openclaw.ai/install/fly)

Updates

Copy

```
# Pull latest changes
git pull

# Redeploy
fly deploy

# Check health
fly status
fly logs
```

### 

[​

](https://docs.openclaw.ai/install/fly)

Updating Machine Command

If you need to change the startup command without a full redeploy:

Copy

```
# Get machine ID
fly machines list

# Update command
fly machine update <machine-id> --command "node dist/index.js gateway --port 3000 --bind lan" -y

# Or with memory increase
fly machine update <machine-id> --vm-memory 2048 --command "node dist/index.js gateway --port 3000 --bind lan" -y
```

**Note:** After `fly deploy`, the machine command may reset to what’s in `fly.toml`. If you made manual changes, re-apply them after deploy.

## 

[​

](https://docs.openclaw.ai/install/fly)

Private Deployment (Hardened)

By default, Fly allocates public IPs, making your gateway accessible at `https://your-app.fly.dev`. This is convenient but means your deployment is discoverable by internet scanners (Shodan, Censys, etc.). For a hardened deployment with **no public exposure**, use the private template.

### 

[​

](https://docs.openclaw.ai/install/fly)

When to use private deployment

-   You only make **outbound** calls/messages (no inbound webhooks)
-   You use **ngrok or Tailscale** tunnels for any webhook callbacks
-   You access the gateway via **SSH, proxy, or WireGuard** instead of browser
-   You want the deployment **hidden from internet scanners**

### 

[​

](https://docs.openclaw.ai/install/fly)

Setup

Use `fly.private.toml` instead of the standard config:

Copy

```
# Deploy with private config
fly deploy -c fly.private.toml
```

Or convert an existing deployment:

Copy

```
# List current IPs
fly ips list -a my-openclaw

# Release public IPs
fly ips release <public-ipv4> -a my-openclaw
fly ips release <public-ipv6> -a my-openclaw

# Switch to private config so future deploys don't re-allocate public IPs
# (remove [http_service] or deploy with the private template)
fly deploy -c fly.private.toml

# Allocate private-only IPv6
fly ips allocate-v6 --private -a my-openclaw
```

After this, `fly ips list` should show only a `private` type IP:

Copy

```
VERSION  IP                   TYPE             REGION
v6       fdaa:x:x:x:x::x      private          global
```

### 

[​

](https://docs.openclaw.ai/install/fly)

Accessing a private deployment

Since there’s no public URL, use one of these methods: **Option 1: Local proxy (simplest)**

Copy

```
# Forward local port 3000 to the app
fly proxy 3000:3000 -a my-openclaw

# Then open http://localhost:3000 in browser
```

**Option 2: WireGuard VPN**

Copy

```
# Create WireGuard config (one-time)
fly wireguard create

# Import to WireGuard client, then access via internal IPv6
# Example: http://[fdaa:x:x:x:x::x]:3000
```

**Option 3: SSH only**

Copy

```
fly ssh console -a my-openclaw
```

### 

[​

](https://docs.openclaw.ai/install/fly)

Webhooks with private deployment

If you need webhook callbacks (Twilio, Telnyx, etc.) without public exposure:

1.  **ngrok tunnel** - Run ngrok inside the container or as a sidecar
2.  **Tailscale Funnel** - Expose specific paths via Tailscale
3.  **Outbound-only** - Some providers (Twilio) work fine for outbound calls without webhooks

Example voice-call config with ngrok:

Copy

```
{
  "plugins": {
    "entries": {
      "voice-call": {
        "enabled": true,
        "config": {
          "provider": "twilio",
          "tunnel": { "provider": "ngrok" },
          "webhookSecurity": {
            "allowedHosts": ["example.ngrok.app"]
          }
        }
      }
    }
  }
}
```

The ngrok tunnel runs inside the container and provides a public webhook URL without exposing the Fly app itself. Set `webhookSecurity.allowedHosts` to the public tunnel hostname so forwarded host headers are accepted.

### 

[​

](https://docs.openclaw.ai/install/fly)

Security benefits

| Aspect | Public | Private |
| --- | --- | --- |
| Internet scanners | Discoverable | Hidden |
| Direct attacks | Possible | Blocked |
| Control UI access | Browser | Proxy/VPN |
| Webhook delivery | Direct | Via tunnel |

## 

[​

](https://docs.openclaw.ai/install/fly)

Notes

-   Fly.io uses **x86 architecture** (not ARM)
-   The Dockerfile is compatible with both architectures
-   For WhatsApp/Telegram onboarding, use `fly ssh console`
-   Persistent data lives on the volume at `/data`
-   Signal requires Java + signal-cli; use a custom image and keep memory at 2GB+.

## 

[​

](https://docs.openclaw.ai/install/fly)

Cost

With the recommended config (`shared-cpu-2x`, 2GB RAM):

-   ~$10-15/month depending on usage
-   Free tier includes some allowance

See [Fly.io pricing](https://fly.io/docs/about/pricing) for details.

[Kubernetes](https://docs.openclaw.ai/install/kubernetes)[Hetzner](https://docs.openclaw.ai/install/hetzner)

⌘I
