<!-- Source: https://docs.openclaw.ai/start/getting-started -->
<!-- Title: Getting Started - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/start/getting-started)

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

##### Home

-   [
    
    OpenClaw
    
    
    
    ](https://docs.openclaw.ai/)

##### Overview

-   [
    
    Showcase
    
    
    
    ](https://docs.openclaw.ai/start/showcase)

##### Core concepts

-   [
    
    Features
    
    
    
    ](https://docs.openclaw.ai/concepts/features)

##### First steps

-   [
    
    Getting Started
    
    
    
    ](https://docs.openclaw.ai/start/getting-started)
-   [
    
    Onboarding Overview
    
    
    
    ](https://docs.openclaw.ai/start/onboarding-overview)
-   [
    
    Onboarding: CLI
    
    
    
    ](https://docs.openclaw.ai/start/wizard)
-   [
    
    Onboarding: macOS App
    
    
    
    ](https://docs.openclaw.ai/start/onboarding)

##### Guides

-   [
    
    Personal Assistant Setup
    
    
    
    ](https://docs.openclaw.ai/start/openclaw)
-   [
    
    CLI reference
    
    
    
    ](https://docs.openclaw.ai/start/wizard-cli-reference)
-   [
    
    CLI automation
    
    
    
    ](https://docs.openclaw.ai/start/wizard-cli-automation)

-   [Getting Started](https://docs.openclaw.ai/start/getting-started)
-   [Prereqs](https://docs.openclaw.ai/start/getting-started)
-   [Quick setup (CLI)](https://docs.openclaw.ai/start/getting-started)
-   [Optional checks and extras](https://docs.openclaw.ai/start/getting-started)
-   [Useful environment variables](https://docs.openclaw.ai/start/getting-started)
-   [Go deeper](https://docs.openclaw.ai/start/getting-started)
-   [What you will have](https://docs.openclaw.ai/start/getting-started)
-   [Next steps](https://docs.openclaw.ai/start/getting-started)

First steps

# Getting Started

# 

[​

](https://docs.openclaw.ai/start/getting-started)

Getting Started

Goal: go from zero to a first working chat with minimal setup.

Fastest chat: open the Control UI (no channel setup needed). Run `openclaw dashboard` and chat in the browser, or open `http://127.0.0.1:18789/` on the . Docs: [Dashboard](https://docs.openclaw.ai/web/dashboard) and [Control UI](https://docs.openclaw.ai/web/control-ui).

## 

[​

](https://docs.openclaw.ai/start/getting-started)

Prereqs

-   Node 24 recommended (Node 22 LTS, currently `22.16+`, still supported for compatibility)

Check your Node version with `node --version` if you are unsure.

## 

[​

](https://docs.openclaw.ai/start/getting-started)

Quick setup (CLI)

1

[

](https://docs.openclaw.ai/start/getting-started)

Install OpenClaw (recommended)

-   macOS/Linux
    
-   Windows (PowerShell)
    

Copy

```
curl -fsSL https://openclaw.ai/install.sh | bash
```

![Install Script Process](https://mintcdn.com/clawdhub/U8jr7qEbUc9OU9YR/assets/install-script.svg?fit=max&auto=format&n=U8jr7qEbUc9OU9YR&q=85&s=50706f81e3210a610262f14facb11f65)

Copy

```
iwr -useb https://openclaw.ai/install.ps1 | iex
```

Other install methods and requirements: [Install](https://docs.openclaw.ai/install).

2

[

](https://docs.openclaw.ai/start/getting-started)

Run the setup wizard

Copy

```
openclaw onboard --install-daemon
```

The wizard configures auth, gateway settings, and optional channels. See [Setup Wizard](https://docs.openclaw.ai/start/wizard) for details.

3

[

](https://docs.openclaw.ai/start/getting-started)

Check the Gateway

If you installed the service, it should already be running:

Copy

```
openclaw gateway status
```

4

[

](https://docs.openclaw.ai/start/getting-started)

Open the Control UI

Copy

```
openclaw dashboard
```

If the Control UI loads, your Gateway is ready for use.

## 

[​

](https://docs.openclaw.ai/start/getting-started)

Optional checks and extras

Run the Gateway in the foreground

Useful for quick tests or troubleshooting.

Copy

```
openclaw gateway --port 18789
```
Send a test message

Requires a configured channel.

Copy

```
openclaw message send --target +15555550123 --message "Hello from OpenClaw"
```

## 

[​

](https://docs.openclaw.ai/start/getting-started)

Useful environment variables

If you run OpenClaw as a service account or want custom config/state locations:

-   `OPENCLAW_HOME` sets the home directory used for internal path resolution.
-   `OPENCLAW_STATE_DIR` overrides the state directory.
-   `OPENCLAW_CONFIG_PATH` overrides the config file path.

Full environment variable reference: [Environment vars](https://docs.openclaw.ai/help/environment).

## 

[​

](https://docs.openclaw.ai/start/getting-started)

Go deeper

[

## Setup Wizard (details)

Full CLI wizard reference and advanced options.





](https://docs.openclaw.ai/start/wizard)[

## macOS app onboarding

First run flow for the macOS app.





](https://docs.openclaw.ai/start/onboarding)

## 

[​

](https://docs.openclaw.ai/start/getting-started)

What you will have

-   A running Gateway
-   Auth configured
-   Control UI access or a connected channel

## 

[​

](https://docs.openclaw.ai/start/getting-started)

Next steps

-   DM safety and approvals: [Pairing](https://docs.openclaw.ai/channels/pairing)
-   Connect more channels: [Channels](https://docs.openclaw.ai/channels)
-   Advanced workflows and from source: [Setup](https://docs.openclaw.ai/start/setup)

[Features](https://docs.openclaw.ai/concepts/features)[Onboarding Overview](https://docs.openclaw.ai/start/onboarding-overview)

⌘I
