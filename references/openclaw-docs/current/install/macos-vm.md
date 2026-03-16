<!-- Source: https://docs.openclaw.ai/install/macos-vm -->
<!-- Title: macOS VMs - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/macos-vm)

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

-   [OpenClaw on macOS VMs (Sandboxing)](https://docs.openclaw.ai/install/macos-vm)
-   [Recommended default (most users)](https://docs.openclaw.ai/install/macos-vm)
-   [macOS VM options](https://docs.openclaw.ai/install/macos-vm)
-   [Local VM on your Apple Silicon Mac (Lume)](https://docs.openclaw.ai/install/macos-vm)
-   [Hosted Mac providers (cloud)](https://docs.openclaw.ai/install/macos-vm)
-   [Quick path (Lume, experienced users)](https://docs.openclaw.ai/install/macos-vm)
-   [What you need (Lume)](https://docs.openclaw.ai/install/macos-vm)
-   [1) Install Lume](https://docs.openclaw.ai/install/macos-vm)
-   [2) Create the macOS VM](https://docs.openclaw.ai/install/macos-vm)
-   [3) Complete Setup Assistant](https://docs.openclaw.ai/install/macos-vm)
-   [4) Get the VM’s IP address](https://docs.openclaw.ai/install/macos-vm)
-   [5) SSH into the VM](https://docs.openclaw.ai/install/macos-vm)
-   [6) Install OpenClaw](https://docs.openclaw.ai/install/macos-vm)
-   [7) Configure channels](https://docs.openclaw.ai/install/macos-vm)
-   [8) Run the VM headlessly](https://docs.openclaw.ai/install/macos-vm)
-   [Bonus: iMessage integration](https://docs.openclaw.ai/install/macos-vm)
-   [Save a golden image](https://docs.openclaw.ai/install/macos-vm)
-   [Running 24/7](https://docs.openclaw.ai/install/macos-vm)
-   [Troubleshooting](https://docs.openclaw.ai/install/macos-vm)
-   [Related docs](https://docs.openclaw.ai/install/macos-vm)

Hosting and deployment

# macOS VMs

# 

[​

](https://docs.openclaw.ai/install/macos-vm)

OpenClaw on macOS VMs (Sandboxing)

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

Recommended default (most users)

-   **Small Linux VPS** for an always-on Gateway and low cost. See [VPS hosting](https://docs.openclaw.ai/vps).
-   **Dedicated hardware** (Mac mini or Linux box) if you want full control and a **residential IP** for browser automation. Many sites block data center IPs, so local browsing often works better.
-   **Hybrid:** keep the Gateway on a cheap VPS, and connect your Mac as a **node** when you need browser/UI automation. See [Nodes](https://docs.openclaw.ai/nodes) and [Gateway remote](https://docs.openclaw.ai/gateway/remote).

Use a macOS VM when you specifically need macOS-only capabilities (iMessage/BlueBubbles) or want strict isolation from your daily Mac.

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

macOS VM options

### 

[​

](https://docs.openclaw.ai/install/macos-vm)

Local VM on your Apple Silicon Mac (Lume)

Run OpenClaw in a sandboxed macOS VM on your existing Apple Silicon Mac using [Lume](https://cua.ai/docs/lume). This gives you:

-   Full macOS environment in isolation (your host stays clean)
-   iMessage support via BlueBubbles (impossible on Linux/Windows)
-   Instant reset by cloning VMs
-   No extra hardware or cloud costs

### 

[​

](https://docs.openclaw.ai/install/macos-vm)

Hosted Mac providers (cloud)

If you want macOS in the cloud, hosted Mac providers work too:

-   [MacStadium](https://www.macstadium.com/) (hosted Macs)
-   Other hosted Mac vendors also work; follow their VM + SSH docs

Once you have SSH access to a macOS VM, continue at step 6 below.

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

Quick path (Lume, experienced users)

1.  Install Lume
2.  `lume create openclaw --os macos --ipsw latest`
3.  Complete Setup Assistant, enable Remote Login (SSH)
4.  `lume run openclaw --no-display`
5.  SSH in, install OpenClaw, configure channels
6.  Done

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

What you need (Lume)

-   Apple Silicon Mac (M1/M2/M3/M4)
-   macOS Sequoia or later on the host
-   ~60 GB free disk space per VM
-   ~20 minutes

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

1) Install Lume

Copy

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/trycua/cua/main/libs/lume/scripts/install.sh)"
```

If `~/.local/bin` isn’t in your PATH:

Copy

```
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.zshrc && source ~/.zshrc
```

Verify:

Copy

```
lume --version
```

Docs: [Lume Installation](https://cua.ai/docs/lume/guide/getting-started/installation)

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

2) Create the macOS VM

Copy

```
lume create openclaw --os macos --ipsw latest
```

This downloads macOS and creates the VM. A VNC window opens automatically. Note: The download can take a while depending on your connection.

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

3) Complete Setup Assistant

In the VNC window:

1.  Select language and region
2.  Skip Apple ID (or sign in if you want iMessage later)
3.  Create a user account (remember the username and password)
4.  Skip all optional features

After setup completes, enable SSH:

1.  Open System Settings → General → Sharing
2.  Enable “Remote Login”

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

4) Get the VM’s IP address

Copy

```
lume get openclaw
```

Look for the IP address (usually `192.168.64.x`).

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

5) SSH into the VM

Copy

```
ssh youruser@192.168.64.X
```

Replace `youruser` with the account you created, and the IP with your VM’s IP.

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

6) Install OpenClaw

Inside the VM:

Copy

```
npm install -g openclaw@latest
openclaw onboard --install-daemon
```

Follow the onboarding prompts to set up your model provider (Anthropic, OpenAI, etc.).

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

7) Configure channels

Edit the config file:

Copy

```
nano ~/.openclaw/openclaw.json
```

Add your channels:

Copy

```
{
  "channels": {
    "whatsapp": {
      "dmPolicy": "allowlist",
      "allowFrom": ["+15551234567"]
    },
    "telegram": {
      "botToken": "YOUR_BOT_TOKEN"
    }
  }
}
```

Then login to WhatsApp (scan QR):

Copy

```
openclaw channels login
```

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

8) Run the VM headlessly

Stop the VM and restart without display:

Copy

```
lume stop openclaw
lume run openclaw --no-display
```

The VM runs in the background. OpenClaw’s daemon keeps the gateway running. To check status:

Copy

```
ssh youruser@192.168.64.X "openclaw status"
```

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

Bonus: iMessage integration

This is the killer feature of running on macOS. Use [BlueBubbles](https://bluebubbles.app/) to add iMessage to OpenClaw. Inside the VM:

1.  Download BlueBubbles from bluebubbles.app
2.  Sign in with your Apple ID
3.  Enable the Web API and set a password
4.  Point BlueBubbles webhooks at your gateway (example: `https://your-gateway-host:3000/bluebubbles-webhook?password=<password>`)

Add to your OpenClaw config:

Copy

```
{
  "channels": {
    "bluebubbles": {
      "serverUrl": "http://localhost:1234",
      "password": "your-api-password",
      "webhookPath": "/bluebubbles-webhook"
    }
  }
}
```

Restart the gateway. Now your agent can send and receive iMessages. Full setup details: [BlueBubbles channel](https://docs.openclaw.ai/channels/bluebubbles)

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

Save a golden image

Before customizing further, snapshot your clean state:

Copy

```
lume stop openclaw
lume clone openclaw openclaw-golden
```

Reset anytime:

Copy

```
lume stop openclaw && lume delete openclaw
lume clone openclaw-golden openclaw
lume run openclaw --no-display
```

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

Running 24/7

Keep the VM running by:

-   Keeping your Mac plugged in
-   Disabling sleep in System Settings → Energy Saver
-   Using `caffeinate` if needed

For true always-on, consider a dedicated Mac mini or a small VPS. See [VPS hosting](https://docs.openclaw.ai/vps).

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

Troubleshooting

| Problem | Solution |
| --- | --- |
| Can’t SSH into VM | Check “Remote Login” is enabled in VM’s System Settings |
| VM IP not showing | Wait for VM to fully boot, run `lume get openclaw` again |
| Lume command not found | Add `~/.local/bin` to your PATH |
| WhatsApp QR not scanning | Ensure you’re logged into the VM (not host) when running `openclaw channels login` |

* * *

## 

[​

](https://docs.openclaw.ai/install/macos-vm)

Related docs

-   [VPS hosting](https://docs.openclaw.ai/vps)
-   [Nodes](https://docs.openclaw.ai/nodes)
-   [Gateway remote](https://docs.openclaw.ai/gateway/remote)
-   [BlueBubbles channel](https://docs.openclaw.ai/channels/bluebubbles)
-   [Lume Quickstart](https://cua.ai/docs/lume/guide/getting-started/quickstart)
-   [Lume CLI Reference](https://cua.ai/docs/lume/reference/cli-reference)
-   [Unattended VM Setup](https://cua.ai/docs/lume/guide/fundamentals/unattended-setup) (advanced)
-   [Docker Sandboxing](https://docs.openclaw.ai/install/docker) (alternative isolation approach)

[GCP](https://docs.openclaw.ai/install/gcp)[exe.dev](https://docs.openclaw.ai/install/exe-dev)

⌘I
