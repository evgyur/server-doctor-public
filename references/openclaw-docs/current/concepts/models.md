<!-- Source: https://docs.openclaw.ai/concepts/models -->
<!-- Title: Models CLI - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/concepts/models)

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

##### Overview

-   [
    
    Model Providers
    
    
    
    ](https://docs.openclaw.ai/providers)
-   [
    
    Model Provider Quickstart
    
    
    
    ](https://docs.openclaw.ai/providers/models)

##### Model concepts

-   [
    
    Models CLI
    
    
    
    ](https://docs.openclaw.ai/concepts/models)

##### Configuration

-   [
    
    Model Providers
    
    
    
    ](https://docs.openclaw.ai/concepts/model-providers)
-   [
    
    Model Failover
    
    
    
    ](https://docs.openclaw.ai/concepts/model-failover)

##### Providers

-   [
    
    Anthropic
    
    
    
    ](https://docs.openclaw.ai/providers/anthropic)
-   [
    
    Amazon Bedrock
    
    
    
    ](https://docs.openclaw.ai/providers/bedrock)
-   [
    
    Cloudflare AI Gateway
    
    
    
    ](https://docs.openclaw.ai/providers/cloudflare-ai-gateway)
-   [
    
    Claude Max API Proxy
    
    
    
    ](https://docs.openclaw.ai/providers/claude-max-api-proxy)
-   [
    
    Deepgram
    
    
    
    ](https://docs.openclaw.ai/providers/deepgram)
-   [
    
    GitHub Copilot
    
    
    
    ](https://docs.openclaw.ai/providers/github-copilot)
-   [
    
    Hugging Face (Inference)
    
    
    
    ](https://docs.openclaw.ai/providers/huggingface)
-   [
    
    Kilocode
    
    
    
    ](https://docs.openclaw.ai/providers/kilocode)
-   [
    
    Litellm
    
    
    
    ](https://docs.openclaw.ai/providers/litellm)
-   [
    
    GLM Models
    
    
    
    ](https://docs.openclaw.ai/providers/glm)
-   [
    
    MiniMax
    
    
    
    ](https://docs.openclaw.ai/providers/minimax)
-   [
    
    Moonshot AI
    
    
    
    ](https://docs.openclaw.ai/providers/moonshot)
-   [
    
    Mistral
    
    
    
    ](https://docs.openclaw.ai/providers/mistral)
-   [
    
    NVIDIA
    
    
    
    ](https://docs.openclaw.ai/providers/nvidia)
-   [
    
    Ollama
    
    
    
    ](https://docs.openclaw.ai/providers/ollama)
-   [
    
    OpenAI
    
    
    
    ](https://docs.openclaw.ai/providers/openai)
-   [
    
    OpenCode Go
    
    
    
    ](https://docs.openclaw.ai/providers/opencode-go)
-   [
    
    OpenCode
    
    
    
    ](https://docs.openclaw.ai/providers/opencode)
-   [
    
    OpenRouter
    
    
    
    ](https://docs.openclaw.ai/providers/openrouter)
-   [
    
    Qianfan
    
    
    
    ](https://docs.openclaw.ai/providers/qianfan)
-   [
    
    Qwen
    
    
    
    ](https://docs.openclaw.ai/providers/qwen)
-   [
    
    Synthetic
    
    
    
    ](https://docs.openclaw.ai/providers/synthetic)
-   [
    
    Together
    
    
    
    ](https://docs.openclaw.ai/providers/together)
-   [
    
    Vercel AI Gateway
    
    
    
    ](https://docs.openclaw.ai/providers/vercel-ai-gateway)
-   [
    
    Venice AI
    
    
    
    ](https://docs.openclaw.ai/providers/venice)
-   [
    
    vLLM
    
    
    
    ](https://docs.openclaw.ai/providers/vllm)
-   [
    
    Xiaomi MiMo
    
    
    
    ](https://docs.openclaw.ai/providers/xiaomi)
-   [
    
    Z.AI
    
    
    
    ](https://docs.openclaw.ai/providers/zai)

-   [Models CLI](https://docs.openclaw.ai/concepts/models)
-   [How model selection works](https://docs.openclaw.ai/concepts/models)
-   [Quick model policy](https://docs.openclaw.ai/concepts/models)
-   [Setup wizard (recommended)](https://docs.openclaw.ai/concepts/models)
-   [Config keys (overview)](https://docs.openclaw.ai/concepts/models)
-   [“Model is not allowed” (and why replies stop)](https://docs.openclaw.ai/concepts/models)
-   [Switching models in chat (/model)](https://docs.openclaw.ai/concepts/models)
-   [CLI commands](https://docs.openclaw.ai/concepts/models)
-   [models list](https://docs.openclaw.ai/concepts/models)
-   [models status](https://docs.openclaw.ai/concepts/models)
-   [Scanning (OpenRouter free models)](https://docs.openclaw.ai/concepts/models)
-   [Models registry (models.json)](https://docs.openclaw.ai/concepts/models)

Model concepts

# Models CLI

# 

[​

](https://docs.openclaw.ai/concepts/models)

Models CLI

See [/concepts/model-failover](https://docs.openclaw.ai/concepts/model-failover) for auth profile rotation, cooldowns, and how that interacts with fallbacks. Quick provider overview + examples: [/concepts/model-providers](https://docs.openclaw.ai/concepts/model-providers).

## 

[​

](https://docs.openclaw.ai/concepts/models)

How model selection works

OpenClaw selects models in this order:

1.  **Primary** model (`agents.defaults.model.primary` or `agents.defaults.model`).
2.  **Fallbacks** in `agents.defaults.model.fallbacks` (in order).
3.  **Provider auth failover** happens inside a provider before moving to the next model.

Related:

-   `agents.defaults.models` is the allowlist/catalog of models OpenClaw can use (plus aliases).
-   `agents.defaults.imageModel` is used **only when** the primary model can’t accept images.
-   Per-agent defaults can override `agents.defaults.model` via `agents.list[].model` plus bindings (see [/concepts/multi-agent](https://docs.openclaw.ai/concepts/multi-agent)).

## 

[​

](https://docs.openclaw.ai/concepts/models)

Quick model policy

-   Set your primary to the strongest latest-generation model available to you.
-   Use fallbacks for cost/latency-sensitive tasks and lower-stakes chat.
-   For tool-enabled agents or untrusted inputs, avoid older/weaker model tiers.

## 

[​

](https://docs.openclaw.ai/concepts/models)

Setup wizard (recommended)

If you don’t want to hand-edit config, run the setup wizard:

Copy

```
openclaw onboard
```

It can set up model + auth for common providers, including **OpenAI Code (Codex) subscription** (OAuth) and **Anthropic** (API key or `claude setup-token`).

## 

[​

](https://docs.openclaw.ai/concepts/models)

Config keys (overview)

-   `agents.defaults.model.primary` and `agents.defaults.model.fallbacks`
-   `agents.defaults.imageModel.primary` and `agents.defaults.imageModel.fallbacks`
-   `agents.defaults.models` (allowlist + aliases + provider params)
-   `models.providers` (custom providers written into `models.json`)

Model refs are normalized to lowercase. Provider aliases like `z.ai/*` normalize to `zai/*`. Provider configuration examples (including OpenCode) live in [/gateway/configuration](https://docs.openclaw.ai/gateway/configuration).

## 

[​

](https://docs.openclaw.ai/concepts/models)

“Model is not allowed” (and why replies stop)

If `agents.defaults.models` is set, it becomes the **allowlist** for `/model` and for session overrides. When a user selects a model that isn’t in that allowlist, OpenClaw returns:

Copy

```
Model "provider/model" is not allowed. Use /model to list available models.
```

This happens **before** a normal reply is generated, so the message can feel like it “didn’t respond.” The fix is to either:

-   Add the model to `agents.defaults.models`, or
-   Clear the allowlist (remove `agents.defaults.models`), or
-   Pick a model from `/model list`.

Example allowlist config:

Copy

```
{
  agent: {
    model: { primary: "anthropic/claude-sonnet-4-5" },
    models: {
      "anthropic/claude-sonnet-4-5": { alias: "Sonnet" },
      "anthropic/claude-opus-4-6": { alias: "Opus" },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/concepts/models)

Switching models in chat (`/model`)

You can switch models for the current session without restarting:

Copy

```
/model
/model list
/model 3
/model openai/gpt-5.2
/model status
```

Notes:

-   `/model` (and `/model list`) is a compact, numbered picker (model family + available providers).
-   On Discord, `/model` and `/models` open an interactive picker with provider and model dropdowns plus a Submit step.
-   `/model <#>` selects from that picker.
-   `/model status` is the detailed view (auth candidates and, when configured, provider endpoint `baseUrl` + `api` mode).
-   Model refs are parsed by splitting on the **first** `/`. Use `provider/model` when typing `/model <ref>`.
-   If the model ID itself contains `/` (OpenRouter-style), you must include the provider prefix (example: `/model openrouter/moonshotai/kimi-k2`).
-   If you omit the provider, OpenClaw treats the input as an alias or a model for the **default provider** (only works when there is no `/` in the model ID).

Full command behavior/config: [Slash commands](https://docs.openclaw.ai/tools/slash-commands).

## 

[​

](https://docs.openclaw.ai/concepts/models)

CLI commands

Copy

```
openclaw models list
openclaw models status
openclaw models set <provider/model>
openclaw models set-image <provider/model>

openclaw models aliases list
openclaw models aliases add <alias> <provider/model>
openclaw models aliases remove <alias>

openclaw models fallbacks list
openclaw models fallbacks add <provider/model>
openclaw models fallbacks remove <provider/model>
openclaw models fallbacks clear

openclaw models image-fallbacks list
openclaw models image-fallbacks add <provider/model>
openclaw models image-fallbacks remove <provider/model>
openclaw models image-fallbacks clear
```

`openclaw models` (no subcommand) is a shortcut for `models status`.

### 

[​

](https://docs.openclaw.ai/concepts/models)

`models list`

Shows configured models by default. Useful flags:

-   `--all`: full catalog
-   `--local`: local providers only
-   `--provider <name>`: filter by provider
-   `--plain`: one model per line
-   `--json`: machine‑readable output

### 

[​

](https://docs.openclaw.ai/concepts/models)

`models status`

Shows the resolved primary model, fallbacks, image model, and an auth overview of configured providers. It also surfaces OAuth expiry status for profiles found in the auth store (warns within 24h by default). `--plain` prints only the resolved primary model. OAuth status is always shown (and included in `--json` output). If a configured provider has no credentials, `models status` prints a **Missing auth** section. JSON includes `auth.oauth` (warn window + profiles) and `auth.providers` (effective auth per provider). Use `--check` for automation (exit `1` when missing/expired, `2` when expiring). Auth choice is provider/account dependent. For always-on gateway hosts, API keys are usually the most predictable; subscription token flows are also supported. Example (Anthropic setup-token):

Copy

```
claude setup-token
openclaw models status
```

## 

[​

](https://docs.openclaw.ai/concepts/models)

Scanning (OpenRouter free models)

`openclaw models scan` inspects OpenRouter’s **free model catalog** and can optionally probe models for tool and image support. Key flags:

-   `--no-probe`: skip live probes (metadata only)
-   `--min-params <b>`: minimum parameter size (billions)
-   `--max-age-days <days>`: skip older models
-   `--provider <name>`: provider prefix filter
-   `--max-candidates <n>`: fallback list size
-   `--set-default`: set `agents.defaults.model.primary` to the first selection
-   `--set-image`: set `agents.defaults.imageModel.primary` to the first image selection

Probing requires an OpenRouter API key (from auth profiles or `OPENROUTER_API_KEY`). Without a key, use `--no-probe` to list candidates only. Scan results are ranked by:

1.  Image support
2.  Tool latency
3.  Context size
4.  Parameter count

Input

-   OpenRouter `/models` list (filter `:free`)
-   Requires OpenRouter API key from auth profiles or `OPENROUTER_API_KEY` (see [/environment](https://docs.openclaw.ai/help/environment))
-   Optional filters: `--max-age-days`, `--min-params`, `--provider`, `--max-candidates`
-   Probe controls: `--timeout`, `--concurrency`

When run in a TTY, you can select fallbacks interactively. In non‑interactive mode, pass `--yes` to accept defaults.

## 

[​

](https://docs.openclaw.ai/concepts/models)

Models registry (`models.json`)

Custom providers in `models.providers` are written into `models.json` under the agent directory (default `~/.openclaw/agents/<agentId>/agent/models.json`). This file is merged by default unless `models.mode` is set to `replace`. Merge mode precedence for matching provider IDs:

-   Non-empty `baseUrl` already present in the agent `models.json` wins.
-   Non-empty `apiKey` in the agent `models.json` wins only when that provider is not SecretRef-managed in current config/auth-profile context.
-   SecretRef-managed provider `apiKey` values are refreshed from source markers (`ENV_VAR_NAME` for env refs, `secretref-managed` for file/exec refs) instead of persisting resolved secrets.
-   SecretRef-managed provider header values are refreshed from source markers (`secretref-env:ENV_VAR_NAME` for env refs, `secretref-managed` for file/exec refs).
-   Empty or missing agent `apiKey`/`baseUrl` fall back to config `models.providers`.
-   Other provider fields are refreshed from config and normalized catalog data.

Marker persistence is source-authoritative: OpenClaw writes markers from the active source config snapshot (pre-resolution), not from resolved runtime secret values. This applies whenever OpenClaw regenerates `models.json`, including command-driven paths like `openclaw agent`.

[Model Provider Quickstart](https://docs.openclaw.ai/providers/models)[Model Providers](https://docs.openclaw.ai/concepts/model-providers)

⌘I
