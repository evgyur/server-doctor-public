<!-- Source: https://docs.openclaw.ai/gateway/remote-gateway-readme -->
<!-- Title: Remote Gateway Setup - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/remote-gateway-readme)

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

##### Gateway

-   [
    
    Gateway Runbook
    
    
    
    ](https://docs.openclaw.ai/gateway)

##### Remote access

-   [
    
    Remote Access
    
    
    
    ](https://docs.openclaw.ai/gateway/remote)
-   [
    
    Remote Gateway Setup
    
    
    
    ](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [
    
    Tailscale
    
    
    
    ](https://docs.openclaw.ai/gateway/tailscale)

##### Security

-   [
    
    Formal Verification (Security Models)
    
    
    
    ](https://docs.openclaw.ai/security/formal-verification)
-   [
    
    THREAT MODEL ATLAS
    
    
    
    ](https://docs.openclaw.ai/security/THREAT-MODEL-ATLAS)
-   [
    
    CONTRIBUTING THREAT MODEL
    
    
    
    ](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)

##### Web interfaces

-   [
    
    Web
    
    
    
    ](https://docs.openclaw.ai/web)
-   [
    
    Control UI
    
    
    
    ](https://docs.openclaw.ai/web/control-ui)
-   [
    
    Dashboard
    
    
    
    ](https://docs.openclaw.ai/web/dashboard)
-   [
    
    WebChat
    
    
    
    ](https://docs.openclaw.ai/web/webchat)
-   [
    
    TUI
    
    
    
    ](https://docs.openclaw.ai/web/tui)

-   [Running OpenClaw.app with a Remote Gateway](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [Overview](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [Quick Setup](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [Step 1: Add SSH Config](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [Step 2: Copy SSH Key](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [Step 3: Set Gateway Token](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [Step 4: Start SSH Tunnel](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [Step 5: Restart OpenClaw.app](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [Auto-Start Tunnel on Login](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [Create the PLIST file](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [Load the Launch Agent](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [Troubleshooting](https://docs.openclaw.ai/gateway/remote-gateway-readme)
-   [How It Works](https://docs.openclaw.ai/gateway/remote-gateway-readme)

Remote access

# Remote Gateway Setup

# 

[​

](https://docs.openclaw.ai/gateway/remote-gateway-readme)

Running OpenClaw.app with a Remote Gateway

OpenClaw.app uses SSH tunneling to connect to a remote gateway. This guide shows you how to set it up.

## 

[​

](https://docs.openclaw.ai/gateway/remote-gateway-readme)

Overview

## 

[​

](https://docs.openclaw.ai/gateway/remote-gateway-readme)

Quick Setup

### 

[​

](https://docs.openclaw.ai/gateway/remote-gateway-readme)

Step 1: Add SSH Config

Edit `~/.ssh/config` and add:

Copy

```
Host remote-gateway
    HostName <REMOTE_IP>          # e.g., 172.27.187.184
    User <REMOTE_USER>            # e.g., jefferson
    LocalForward 18789 127.0.0.1:18789
    IdentityFile ~/.ssh/id_rsa
```

Replace `<REMOTE_IP>` and `<REMOTE_USER>` with your values.

### 

[​

](https://docs.openclaw.ai/gateway/remote-gateway-readme)

Step 2: Copy SSH Key

Copy your public key to the remote machine (enter password once):

Copy

```
ssh-copy-id -i ~/.ssh/id_rsa <REMOTE_USER>@<REMOTE_IP>
```

### 

[​

](https://docs.openclaw.ai/gateway/remote-gateway-readme)

Step 3: Set Gateway Token

Copy

```
launchctl setenv OPENCLAW_GATEWAY_TOKEN "<your-token>"
```

### 

[​

](https://docs.openclaw.ai/gateway/remote-gateway-readme)

Step 4: Start SSH Tunnel

Copy

```
ssh -N remote-gateway &
```

### 

[​

](https://docs.openclaw.ai/gateway/remote-gateway-readme)

Step 5: Restart OpenClaw.app

Copy

```
# Quit OpenClaw.app (⌘Q), then reopen:
open /path/to/OpenClaw.app
```

The app will now connect to the remote gateway through the SSH tunnel.

* * *

## 

[​

](https://docs.openclaw.ai/gateway/remote-gateway-readme)

Auto-Start Tunnel on Login

To have the SSH tunnel start automatically when you log in, create a Launch Agent.

### 

[​

](https://docs.openclaw.ai/gateway/remote-gateway-readme)

Create the PLIST file

Save this as `~/Library/LaunchAgents/ai.openclaw.ssh-tunnel.plist`:

Copy

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>ai.openclaw.ssh-tunnel</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/bin/ssh</string>
        <string>-N</string>
        <string>remote-gateway</string>
    </array>
    <key>KeepAlive</key>
    <true/>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
```

### 

[​

](https://docs.openclaw.ai/gateway/remote-gateway-readme)

Load the Launch Agent

Copy

```
launchctl bootstrap gui/$UID ~/Library/LaunchAgents/ai.openclaw.ssh-tunnel.plist
```

The tunnel will now:

-   Start automatically when you log in
-   Restart if it crashes
-   Keep running in the background

Legacy note: remove any leftover `com.openclaw.ssh-tunnel` LaunchAgent if present.

* * *

## 

[​

](https://docs.openclaw.ai/gateway/remote-gateway-readme)

Troubleshooting

**Check if tunnel is running:**

Copy

```
ps aux | grep "ssh -N remote-gateway" | grep -v grep
lsof -i :18789
```

**Restart the tunnel:**

Copy

```
launchctl kickstart -k gui/$UID/ai.openclaw.ssh-tunnel
```

**Stop the tunnel:**

Copy

```
launchctl bootout gui/$UID/ai.openclaw.ssh-tunnel
```

* * *

## 

[​

](https://docs.openclaw.ai/gateway/remote-gateway-readme)

How It Works

| Component | What It Does |
| --- | --- |
| `LocalForward 18789 127.0.0.1:18789` | Forwards local port 18789 to remote port 18789 |
| `ssh -N` | SSH without executing remote commands (just port forwarding) |
| `KeepAlive` | Automatically restarts tunnel if it crashes |
| `RunAtLoad` | Starts tunnel when the agent loads |

OpenClaw.app connects to `ws://127.0.0.1:18789` on your client machine. The SSH tunnel forwards that connection to port 18789 on the remote machine where the Gateway is running.

[Remote Access](https://docs.openclaw.ai/gateway/remote)[Tailscale](https://docs.openclaw.ai/gateway/tailscale)

⌘I
