<!-- Source: https://docs.openclaw.ai/gateway/authentication -->
<!-- Title: Authentication - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/authentication)

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
-   -   [
        
        Configuration
        
        
        
        ](https://docs.openclaw.ai/gateway/configuration)
    -   [
        
        Configuration Reference
        
        
        
        ](https://docs.openclaw.ai/gateway/configuration-reference)
    -   [
        
        Configuration Examples
        
        
        
        ](https://docs.openclaw.ai/gateway/configuration-examples)
    -   [
        
        Authentication
        
        
        
        ](https://docs.openclaw.ai/gateway/authentication)
    -   [
        
        Auth credential semantics
        
        
        
        ](https://docs.openclaw.ai/auth-credential-semantics)
    -   [
        
        Secrets Management
        
        
        
        ](https://docs.openclaw.ai/gateway/secrets)
    -   [
        
        Secrets Apply Plan Contract
        
        
        
        ](https://docs.openclaw.ai/gateway/secrets-plan-contract)
    -   [
        
        Trusted proxy auth
        
        
        
        ](https://docs.openclaw.ai/gateway/trusted-proxy-auth)
    -   [
        
        Health Checks
        
        
        
        ](https://docs.openclaw.ai/gateway/health)
    -   [
        
        Heartbeat
        
        
        
        ](https://docs.openclaw.ai/gateway/heartbeat)
    -   [
        
        Doctor
        
        
        
        ](https://docs.openclaw.ai/gateway/doctor)
    -   [
        
        Logging
        
        
        
        ](https://docs.openclaw.ai/gateway/logging)
    -   [
        
        Gateway Lock
        
        
        
        ](https://docs.openclaw.ai/gateway/gateway-lock)
    -   [
        
        Background Exec and Process Tool
        
        
        
        ](https://docs.openclaw.ai/gateway/background-process)
    -   [
        
        Multiple Gateways
        
        
        
        ](https://docs.openclaw.ai/gateway/multiple-gateways)
    -   [
        
        Troubleshooting
        
        
        
        ](https://docs.openclaw.ai/gateway/troubleshooting)

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

-   [Authentication](https://docs.openclaw.ai/gateway/authentication)
-   [Recommended setup (API key, any provider)](https://docs.openclaw.ai/gateway/authentication)
-   [Anthropic: setup-token (subscription auth)](https://docs.openclaw.ai/gateway/authentication)
-   [Checking model auth status](https://docs.openclaw.ai/gateway/authentication)
-   [API key rotation behavior (gateway)](https://docs.openclaw.ai/gateway/authentication)
-   [Controlling which credential is used](https://docs.openclaw.ai/gateway/authentication)
-   [Per-session (chat command)](https://docs.openclaw.ai/gateway/authentication)
-   [Per-agent (CLI override)](https://docs.openclaw.ai/gateway/authentication)
-   [Troubleshooting](https://docs.openclaw.ai/gateway/authentication)
-   [“No credentials found”](https://docs.openclaw.ai/gateway/authentication)
-   [Token expiring/expired](https://docs.openclaw.ai/gateway/authentication)
-   [Requirements](https://docs.openclaw.ai/gateway/authentication)

Configuration and operations

# Authentication

# 

[​

](https://docs.openclaw.ai/gateway/authentication)

Authentication

OpenClaw supports OAuth and API keys for model providers. For always-on gateway hosts, API keys are usually the most predictable option. Subscription/OAuth flows are also supported when they match your provider account model. See [/concepts/oauth](https://docs.openclaw.ai/concepts/oauth) for the full OAuth flow and storage layout. For SecretRef-based auth (`env`/`file`/`exec` providers), see [Secrets Management](https://docs.openclaw.ai/gateway/secrets). For credential eligibility/reason-code rules used by `models status --probe`, see [Auth Credential Semantics](https://docs.openclaw.ai/auth-credential-semantics).

## 

[​

](https://docs.openclaw.ai/gateway/authentication)

Recommended setup (API key, any provider)

If you’re running a long-lived gateway, start with an API key for your chosen provider. For Anthropic specifically, API key auth is the safe path and is recommended over subscription setup-token auth.

1.  Create an API key in your provider console.
2.  Put it on the **gateway host** (the machine running `openclaw gateway`).

Copy

```
export <PROVIDER>_API_KEY="..."
openclaw models status
```

3.  If the Gateway runs under systemd/launchd, prefer putting the key in `~/.openclaw/.env` so the daemon can read it:

Copy

```
cat >> ~/.openclaw/.env <<'EOF'
<PROVIDER>_API_KEY=...
EOF
```

Then restart the daemon (or restart your Gateway process) and re-check:

Copy

```
openclaw models status
openclaw doctor
```

If you’d rather not manage env vars yourself, the setup wizard can store API keys for daemon use: `openclaw onboard`. See [Help](https://docs.openclaw.ai/help) for details on env inheritance (`env.shellEnv`, `~/.openclaw/.env`, systemd/launchd).

## 

[​

](https://docs.openclaw.ai/gateway/authentication)

Anthropic: setup-token (subscription auth)

If you’re using a Claude subscription, the setup-token flow is supported. Run it on the **gateway host**:

Copy

```
claude setup-token
```

Then paste it into OpenClaw:

Copy

```
openclaw models auth setup-token --provider anthropic
```

If the token was created on another machine, paste it manually:

Copy

```
openclaw models auth paste-token --provider anthropic
```

If you see an Anthropic error like:

Copy

```
This credential is only authorized for use with Claude Code and cannot be used for other API requests.
```

…use an Anthropic API key instead.

Anthropic setup-token support is technical compatibility only. Anthropic has blocked some subscription usage outside Claude Code in the past. Use it only if you decide the policy risk is acceptable, and verify Anthropic’s current terms yourself.

Manual token entry (any provider; writes `auth-profiles.json` + updates config):

Copy

```
openclaw models auth paste-token --provider anthropic
openclaw models auth paste-token --provider openrouter
```

Auth profile refs are also supported for static credentials:

-   `api_key` credentials can use `keyRef: { source, provider, id }`
-   `token` credentials can use `tokenRef: { source, provider, id }`

Automation-friendly check (exit `1` when expired/missing, `2` when expiring):

Copy

```
openclaw models status --check
```

Optional ops scripts (systemd/Termux) are documented here: [/automation/auth-monitoring](https://docs.openclaw.ai/automation/auth-monitoring)

> `claude setup-token` requires an interactive TTY.

## 

[​

](https://docs.openclaw.ai/gateway/authentication)

Checking model auth status

Copy

```
openclaw models status
openclaw doctor
```

## 

[​

](https://docs.openclaw.ai/gateway/authentication)

API key rotation behavior (gateway)

Some providers support retrying a request with alternative keys when an API call hits a provider rate limit.

-   Priority order:
    -   `OPENCLAW_LIVE_<PROVIDER>_KEY` (single override)
    -   `<PROVIDER>_API_KEYS`
    -   `<PROVIDER>_API_KEY`
    -   `<PROVIDER>_API_KEY_*`
-   Google providers also include `GOOGLE_API_KEY` as an additional fallback.
-   The same key list is deduplicated before use.
-   OpenClaw retries with the next key only for rate-limit errors (for example `429`, `rate_limit`, `quota`, `resource exhausted`).
-   Non-rate-limit errors are not retried with alternate keys.
-   If all keys fail, the final error from the last attempt is returned.

## 

[​

](https://docs.openclaw.ai/gateway/authentication)

Controlling which credential is used

### 

[​

](https://docs.openclaw.ai/gateway/authentication)

Per-session (chat command)

Use `/model <alias-or-id>@<profileId>` to pin a specific provider credential for the current session (example profile ids: `anthropic:default`, `anthropic:work`). Use `/model` (or `/model list`) for a compact picker; use `/model status` for the full view (candidates + next auth profile, plus provider endpoint details when configured).

### 

[​

](https://docs.openclaw.ai/gateway/authentication)

Per-agent (CLI override)

Set an explicit auth profile order override for an agent (stored in that agent’s `auth-profiles.json`):

Copy

```
openclaw models auth order get --provider anthropic
openclaw models auth order set --provider anthropic anthropic:default
openclaw models auth order clear --provider anthropic
```

Use `--agent <id>` to target a specific agent; omit it to use the configured default agent.

## 

[​

](https://docs.openclaw.ai/gateway/authentication)

Troubleshooting

### 

[​

](https://docs.openclaw.ai/gateway/authentication)

“No credentials found”

If the Anthropic token profile is missing, run `claude setup-token` on the **gateway host**, then re-check:

Copy

```
openclaw models status
```

### 

[​

](https://docs.openclaw.ai/gateway/authentication)

Token expiring/expired

Run `openclaw models status` to confirm which profile is expiring. If the profile is missing, rerun `claude setup-token` and paste the token again.

## 

[​

](https://docs.openclaw.ai/gateway/authentication)

Requirements

-   Anthropic subscription account (for `claude setup-token`)
-   Claude Code CLI installed (`claude` command available)

[Configuration Examples](https://docs.openclaw.ai/gateway/configuration-examples)[Auth credential semantics](https://docs.openclaw.ai/auth-credential-semantics)

⌘I
