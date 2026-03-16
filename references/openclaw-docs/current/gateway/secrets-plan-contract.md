<!-- Source: https://docs.openclaw.ai/gateway/secrets-plan-contract -->
<!-- Title: Secrets Apply Plan Contract - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/secrets-plan-contract)

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

-   [Secrets apply plan contract](https://docs.openclaw.ai/gateway/secrets-plan-contract)
-   [Plan file shape](https://docs.openclaw.ai/gateway/secrets-plan-contract)
-   [Supported target scope](https://docs.openclaw.ai/gateway/secrets-plan-contract)
-   [Target type behavior](https://docs.openclaw.ai/gateway/secrets-plan-contract)
-   [Path validation rules](https://docs.openclaw.ai/gateway/secrets-plan-contract)
-   [Failure behavior](https://docs.openclaw.ai/gateway/secrets-plan-contract)
-   [Runtime and audit scope notes](https://docs.openclaw.ai/gateway/secrets-plan-contract)
-   [Operator checks](https://docs.openclaw.ai/gateway/secrets-plan-contract)
-   [Related docs](https://docs.openclaw.ai/gateway/secrets-plan-contract)

Configuration and operations

# Secrets Apply Plan Contract

# 

[​

](https://docs.openclaw.ai/gateway/secrets-plan-contract)

Secrets apply plan contract

This page defines the strict contract enforced by `openclaw secrets apply`. If a target does not match these rules, apply fails before mutating configuration.

## 

[​

](https://docs.openclaw.ai/gateway/secrets-plan-contract)

Plan file shape

`openclaw secrets apply --from <plan.json>` expects a `targets` array of plan targets:

Copy

```
{
  version: 1,
  protocolVersion: 1,
  targets: [
    {
      type: "models.providers.apiKey",
      path: "models.providers.openai.apiKey",
      pathSegments: ["models", "providers", "openai", "apiKey"],
      providerId: "openai",
      ref: { source: "env", provider: "default", id: "OPENAI_API_KEY" },
    },
    {
      type: "auth-profiles.api_key.key",
      path: "profiles.openai:default.key",
      pathSegments: ["profiles", "openai:default", "key"],
      agentId: "main",
      ref: { source: "env", provider: "default", id: "OPENAI_API_KEY" },
    },
  ],
}
```

## 

[​

](https://docs.openclaw.ai/gateway/secrets-plan-contract)

Supported target scope

Plan targets are accepted for supported credential paths in:

-   [SecretRef Credential Surface](https://docs.openclaw.ai/reference/secretref-credential-surface)

## 

[​

](https://docs.openclaw.ai/gateway/secrets-plan-contract)

Target type behavior

General rule:

-   `target.type` must be recognized and must match the normalized `target.path` shape.

Compatibility aliases remain accepted for existing plans:

-   `models.providers.apiKey`
-   `skills.entries.apiKey`
-   `channels.googlechat.serviceAccount`

## 

[​

](https://docs.openclaw.ai/gateway/secrets-plan-contract)

Path validation rules

Each target is validated with all of the following:

-   `type` must be a recognized target type.
-   `path` must be a non-empty dot path.
-   `pathSegments` can be omitted. If provided, it must normalize to exactly the same path as `path`.
-   Forbidden segments are rejected: `__proto__`, `prototype`, `constructor`.
-   The normalized path must match the registered path shape for the target type.
-   If `providerId` or `accountId` is set, it must match the id encoded in the path.
-   `auth-profiles.json` targets require `agentId`.
-   When creating a new `auth-profiles.json` mapping, include `authProfileProvider`.

## 

[​

](https://docs.openclaw.ai/gateway/secrets-plan-contract)

Failure behavior

If a target fails validation, apply exits with an error like:

Copy

```
Invalid plan target path for models.providers.apiKey: models.providers.openai.baseUrl
```

No writes are committed for an invalid plan.

## 

[​

](https://docs.openclaw.ai/gateway/secrets-plan-contract)

Runtime and audit scope notes

-   Ref-only `auth-profiles.json` entries (`keyRef`/`tokenRef`) are included in runtime resolution and audit coverage.
-   `secrets apply` writes supported `openclaw.json` targets, supported `auth-profiles.json` targets, and optional scrub targets.

## 

[​

](https://docs.openclaw.ai/gateway/secrets-plan-contract)

Operator checks

Copy

```
# Validate plan without writes
openclaw secrets apply --from /tmp/openclaw-secrets-plan.json --dry-run

# Then apply for real
openclaw secrets apply --from /tmp/openclaw-secrets-plan.json
```

If apply fails with an invalid target path message, regenerate the plan with `openclaw secrets configure` or fix the target path to a supported shape above.

## 

[​

](https://docs.openclaw.ai/gateway/secrets-plan-contract)

Related docs

-   [Secrets Management](https://docs.openclaw.ai/gateway/secrets)
-   [CLI `secrets`](https://docs.openclaw.ai/cli/secrets)
-   [SecretRef Credential Surface](https://docs.openclaw.ai/reference/secretref-credential-surface)
-   [Configuration Reference](https://docs.openclaw.ai/gateway/configuration-reference)

[Secrets Management](https://docs.openclaw.ai/gateway/secrets)[Trusted proxy auth](https://docs.openclaw.ai/gateway/trusted-proxy-auth)

⌘I
