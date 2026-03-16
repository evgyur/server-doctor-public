<!-- Source: https://docs.openclaw.ai/web -->
<!-- Title: Web - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/web)

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

-   [Web (Gateway)](https://docs.openclaw.ai/web)
-   [Webhooks](https://docs.openclaw.ai/web)
-   [Config (default-on)](https://docs.openclaw.ai/web)
-   [Tailscale access](https://docs.openclaw.ai/web)
-   [Integrated Serve (recommended)](https://docs.openclaw.ai/web)
-   [Tailnet bind + token](https://docs.openclaw.ai/web)
-   [Public internet (Funnel)](https://docs.openclaw.ai/web)
-   [Security notes](https://docs.openclaw.ai/web)
-   [Building the UI](https://docs.openclaw.ai/web)

Web interfaces

# Web

# 

[​

](https://docs.openclaw.ai/web)

Web (Gateway)

The Gateway serves a small **browser Control UI** (Vite + Lit) from the same port as the Gateway WebSocket:

-   default: `http://<host>:18789/`
-   optional prefix: set `gateway.controlUi.basePath` (e.g. `/openclaw`)

Capabilities live in [Control UI](https://docs.openclaw.ai/web/control-ui). This page focuses on bind modes, security, and web-facing surfaces.

## 

[​

](https://docs.openclaw.ai/web)

Webhooks

When `hooks.enabled=true`, the Gateway also exposes a small webhook endpoint on the same HTTP server. See [Gateway configuration](https://docs.openclaw.ai/gateway/configuration) → `hooks` for auth + payloads.

## 

[​

](https://docs.openclaw.ai/web)

Config (default-on)

The Control UI is **enabled by default** when assets are present (`dist/control-ui`). You can control it via config:

Copy

```
{
  gateway: {
    controlUi: { enabled: true, basePath: "/openclaw" }, // basePath optional
  },
}
```

## 

[​

](https://docs.openclaw.ai/web)

Tailscale access

### 

[​

](https://docs.openclaw.ai/web)

Integrated Serve (recommended)

Keep the Gateway on loopback and let Tailscale Serve proxy it:

Copy

```
{
  gateway: {
    bind: "loopback",
    tailscale: { mode: "serve" },
  },
}
```

Then start the gateway:

Copy

```
openclaw gateway
```

Open:

-   `https://<magicdns>/` (or your configured `gateway.controlUi.basePath`)

### 

[​

](https://docs.openclaw.ai/web)

Tailnet bind + token

Copy

```
{
  gateway: {
    bind: "tailnet",
    controlUi: { enabled: true },
    auth: { mode: "token", token: "your-token" },
  },
}
```

Then start the gateway (token required for non-loopback binds):

Copy

```
openclaw gateway
```

Open:

-   `http://<tailscale-ip>:18789/` (or your configured `gateway.controlUi.basePath`)

### 

[​

](https://docs.openclaw.ai/web)

Public internet (Funnel)

Copy

```
{
  gateway: {
    bind: "loopback",
    tailscale: { mode: "funnel" },
    auth: { mode: "password" }, // or OPENCLAW_GATEWAY_PASSWORD
  },
}
```

## 

[​

](https://docs.openclaw.ai/web)

Security notes

-   Gateway auth is required by default (token/password or Tailscale identity headers).
-   Non-loopback binds still **require** a shared token/password (`gateway.auth` or env).
-   The wizard generates a gateway token by default (even on loopback).
-   The UI sends `connect.params.auth.token` or `connect.params.auth.password`.
-   For non-loopback Control UI deployments, set `gateway.controlUi.allowedOrigins` explicitly (full origins). Without it, gateway startup is refused by default.
-   `gateway.controlUi.dangerouslyAllowHostHeaderOriginFallback=true` enables Host-header origin fallback mode, but is a dangerous security downgrade.
-   With Serve, Tailscale identity headers can satisfy Control UI/WebSocket auth when `gateway.auth.allowTailscale` is `true` (no token/password required). HTTP API endpoints still require token/password. Set `gateway.auth.allowTailscale: false` to require explicit credentials. See [Tailscale](https://docs.openclaw.ai/gateway/tailscale) and [Security](https://docs.openclaw.ai/gateway/security). This tokenless flow assumes the gateway host is trusted.
-   `gateway.tailscale.mode: "funnel"` requires `gateway.auth.mode: "password"` (shared password).

## 

[​

](https://docs.openclaw.ai/web)

Building the UI

The Gateway serves static files from `dist/control-ui`. Build them with:

Copy

```
pnpm ui:build # auto-installs UI deps on first run
```

[CONTRIBUTING THREAT MODEL](https://docs.openclaw.ai/security/CONTRIBUTING-THREAT-MODEL)[Control UI](https://docs.openclaw.ai/web/control-ui)

⌘I
