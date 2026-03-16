<!-- Source: https://docs.openclaw.ai/auth-credential-semantics -->
<!-- Title: Auth credential semantics - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/auth-credential-semantics)

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

-   [Auth Credential Semantics](https://docs.openclaw.ai/auth-credential-semantics)
-   [Stable Reason Codes](https://docs.openclaw.ai/auth-credential-semantics)
-   [Token Credentials](https://docs.openclaw.ai/auth-credential-semantics)
-   [Eligibility rules](https://docs.openclaw.ai/auth-credential-semantics)
-   [Resolution rules](https://docs.openclaw.ai/auth-credential-semantics)
-   [Legacy-Compatible Messaging](https://docs.openclaw.ai/auth-credential-semantics)

Configuration and operations

# Auth credential semantics

# 

[​

](https://docs.openclaw.ai/auth-credential-semantics)

Auth Credential Semantics

This document defines the canonical credential eligibility and resolution semantics used across:

-   `resolveAuthProfileOrder`
-   `resolveApiKeyForProfile`
-   `models status --probe`
-   `doctor-auth`

The goal is to keep selection-time and runtime behavior aligned.

## 

[​

](https://docs.openclaw.ai/auth-credential-semantics)

Stable Reason Codes

-   `ok`
-   `missing_credential`
-   `invalid_expires`
-   `expired`
-   `unresolved_ref`

## 

[​

](https://docs.openclaw.ai/auth-credential-semantics)

Token Credentials

Token credentials (`type: "token"`) support inline `token` and/or `tokenRef`.

### 

[​

](https://docs.openclaw.ai/auth-credential-semantics)

Eligibility rules

1.  A token profile is ineligible when both `token` and `tokenRef` are absent.
2.  `expires` is optional.
3.  If `expires` is present, it must be a finite number greater than `0`.
4.  If `expires` is invalid (`NaN`, `0`, negative, non-finite, or wrong type), the profile is ineligible with `invalid_expires`.
5.  If `expires` is in the past, the profile is ineligible with `expired`.
6.  `tokenRef` does not bypass `expires` validation.

### 

[​

](https://docs.openclaw.ai/auth-credential-semantics)

Resolution rules

1.  Resolver semantics match eligibility semantics for `expires`.
2.  For eligible profiles, token material may be resolved from inline value or `tokenRef`.
3.  Unresolvable refs produce `unresolved_ref` in `models status --probe` output.

## 

[​

](https://docs.openclaw.ai/auth-credential-semantics)

Legacy-Compatible Messaging

For script compatibility, probe errors keep this first line unchanged: `Auth profile credentials are missing or expired.` Human-friendly detail and stable reason codes may be added on subsequent lines.

[Authentication](https://docs.openclaw.ai/gateway/authentication)[Secrets Management](https://docs.openclaw.ai/gateway/secrets)

⌘I
