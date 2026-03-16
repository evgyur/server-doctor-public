<!-- Source: https://docs.openclaw.ai/start/wizard-cli-automation -->
<!-- Title: CLI Automation - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/start/wizard-cli-automation)

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

-   [CLI Automation](https://docs.openclaw.ai/start/wizard-cli-automation)
-   [Baseline non-interactive example](https://docs.openclaw.ai/start/wizard-cli-automation)
-   [Provider-specific examples](https://docs.openclaw.ai/start/wizard-cli-automation)
-   [Add another agent](https://docs.openclaw.ai/start/wizard-cli-automation)
-   [Related docs](https://docs.openclaw.ai/start/wizard-cli-automation)

Guides

# CLI Automation

# 

[​

](https://docs.openclaw.ai/start/wizard-cli-automation)

CLI Automation

Use `--non-interactive` to automate `openclaw onboard`.

`--json` does not imply non-interactive mode. Use `--non-interactive` (and `--workspace`) for scripts.

## 

[​

](https://docs.openclaw.ai/start/wizard-cli-automation)

Baseline non-interactive example

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice apiKey \
  --anthropic-api-key "$ANTHROPIC_API_KEY" \
  --secret-input-mode plaintext \
  --gateway-port 18789 \
  --gateway-bind loopback \
  --install-daemon \
  --daemon-runtime node \
  --skip-skills
```

Add `--json` for a machine-readable summary. Use `--secret-input-mode ref` to store env-backed refs in auth profiles instead of plaintext values. Interactive selection between env refs and configured provider refs (`file` or `exec`) is available in the setup wizard flow. In non-interactive `ref` mode, provider env vars must be set in the process environment. Passing inline key flags without the matching env var now fails fast. Example:

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice openai-api-key \
  --secret-input-mode ref \
  --accept-risk
```

## 

[​

](https://docs.openclaw.ai/start/wizard-cli-automation)

Provider-specific examples

Gemini example

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice gemini-api-key \
  --gemini-api-key "$GEMINI_API_KEY" \
  --gateway-port 18789 \
  --gateway-bind loopback
```
Z.AI example

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice zai-api-key \
  --zai-api-key "$ZAI_API_KEY" \
  --gateway-port 18789 \
  --gateway-bind loopback
```
Vercel AI Gateway example

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice ai-gateway-api-key \
  --ai-gateway-api-key "$AI_GATEWAY_API_KEY" \
  --gateway-port 18789 \
  --gateway-bind loopback
```
Cloudflare AI Gateway example

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice cloudflare-ai-gateway-api-key \
  --cloudflare-ai-gateway-account-id "your-account-id" \
  --cloudflare-ai-gateway-gateway-id "your-gateway-id" \
  --cloudflare-ai-gateway-api-key "$CLOUDFLARE_AI_GATEWAY_API_KEY" \
  --gateway-port 18789 \
  --gateway-bind loopback
```
Moonshot example

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice moonshot-api-key \
  --moonshot-api-key "$MOONSHOT_API_KEY" \
  --gateway-port 18789 \
  --gateway-bind loopback
```
Mistral example

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice mistral-api-key \
  --mistral-api-key "$MISTRAL_API_KEY" \
  --gateway-port 18789 \
  --gateway-bind loopback
```
Synthetic example

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice synthetic-api-key \
  --synthetic-api-key "$SYNTHETIC_API_KEY" \
  --gateway-port 18789 \
  --gateway-bind loopback
```

OpenCode example

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice opencode-zen \
  --opencode-zen-api-key "$OPENCODE_API_KEY" \
  --gateway-port 18789 \
  --gateway-bind loopback
```

Swap to `--auth-choice opencode-go --opencode-go-api-key "$OPENCODE_API_KEY"` for the Go catalog.

Ollama example

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice ollama \
  --custom-model-id "qwen3.5:27b" \
  --accept-risk \
  --gateway-port 18789 \
  --gateway-bind loopback
```

Custom provider example

Copy

```
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice custom-api-key \
  --custom-base-url "https://llm.example.com/v1" \
  --custom-model-id "foo-large" \
  --custom-api-key "$CUSTOM_API_KEY" \
  --custom-provider-id "my-custom" \
  --custom-compatibility anthropic \
  --gateway-port 18789 \
  --gateway-bind loopback
```

`--custom-api-key` is optional. If omitted, onboarding checks `CUSTOM_API_KEY`.Ref-mode variant:

Copy

```
export CUSTOM_API_KEY="your-key"
openclaw onboard --non-interactive \
  --mode local \
  --auth-choice custom-api-key \
  --custom-base-url "https://llm.example.com/v1" \
  --custom-model-id "foo-large" \
  --secret-input-mode ref \
  --custom-provider-id "my-custom" \
  --custom-compatibility anthropic \
  --gateway-port 18789 \
  --gateway-bind loopback
```

In this mode, onboarding stores `apiKey` as `{ source: "env", provider: "default", id: "CUSTOM_API_KEY" }`.

## 

[​

](https://docs.openclaw.ai/start/wizard-cli-automation)

Add another agent

Use `openclaw agents add <name>` to create a separate agent with its own workspace, sessions, and auth profiles. Running without `--workspace` launches the wizard.

Copy

```
openclaw agents add work \
  --workspace ~/.openclaw/workspace-work \
  --model openai/gpt-5.2 \
  --bind whatsapp:biz \
  --non-interactive \
  --json
```

What it sets:

-   `agents.list[].name`
-   `agents.list[].workspace`
-   `agents.list[].agentDir`

Notes:

-   Default workspaces follow `~/.openclaw/workspace-<agentId>`.
-   Add `bindings` to route inbound messages (the wizard can do this).
-   Non-interactive flags: `--model`, `--agent-dir`, `--bind`, `--non-interactive`.

## 

[​

](https://docs.openclaw.ai/start/wizard-cli-automation)

Related docs

-   Onboarding hub: [Setup Wizard (CLI)](https://docs.openclaw.ai/start/wizard)
-   Full reference: [CLI Setup Reference](https://docs.openclaw.ai/start/wizard-cli-reference)
-   Command reference: [`openclaw onboard`](https://docs.openclaw.ai/cli/onboard)

[CLI reference](https://docs.openclaw.ai/start/wizard-cli-reference)

⌘I
