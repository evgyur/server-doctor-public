<!-- Source: https://docs.openclaw.ai/start/onboarding-overview -->
<!-- Title: Onboarding Overview - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/start/onboarding-overview)

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

-   [Onboarding Overview](https://docs.openclaw.ai/start/onboarding-overview)
-   [Choose your onboarding path](https://docs.openclaw.ai/start/onboarding-overview)
-   [CLI setup wizard](https://docs.openclaw.ai/start/onboarding-overview)
-   [macOS app onboarding](https://docs.openclaw.ai/start/onboarding-overview)
-   [Custom Provider](https://docs.openclaw.ai/start/onboarding-overview)

First steps

# Onboarding Overview

# 

[​

](https://docs.openclaw.ai/start/onboarding-overview)

Onboarding Overview

OpenClaw supports multiple onboarding paths depending on where the Gateway runs and how you prefer to configure providers.

## 

[​

](https://docs.openclaw.ai/start/onboarding-overview)

Choose your onboarding path

-   **CLI wizard** for macOS, Linux, and Windows (via WSL2).
-   **macOS app** for a guided first run on Apple silicon or Intel Macs.

## 

[​

](https://docs.openclaw.ai/start/onboarding-overview)

CLI setup wizard

Run the wizard in a terminal:

Copy

```
openclaw onboard
```

Use the CLI wizard when you want full control of the Gateway, workspace, channels, and skills. Docs:

-   [Setup Wizard (CLI)](https://docs.openclaw.ai/start/wizard)
-   [`openclaw onboard` command](https://docs.openclaw.ai/cli/onboard)

## 

[​

](https://docs.openclaw.ai/start/onboarding-overview)

macOS app onboarding

Use the OpenClaw app when you want a fully guided setup on macOS. Docs:

-   [Onboarding (macOS App)](https://docs.openclaw.ai/start/onboarding)

## 

[​

](https://docs.openclaw.ai/start/onboarding-overview)

Custom Provider

If you need an endpoint that is not listed, including hosted providers that expose standard OpenAI or Anthropic APIs, choose **Custom Provider** in the CLI wizard. You will be asked to:

-   Pick OpenAI-compatible, Anthropic-compatible, or **Unknown** (auto-detect).
-   Enter a base URL and API key (if required by the provider).
-   Provide a model ID and optional alias.
-   Choose an Endpoint ID so multiple custom endpoints can coexist.

For detailed steps, follow the CLI onboarding docs above.

[Getting Started](https://docs.openclaw.ai/start/getting-started)[Onboarding: CLI](https://docs.openclaw.ai/start/wizard)

⌘I
