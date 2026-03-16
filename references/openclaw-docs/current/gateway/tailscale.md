<!-- Source: https://docs.openclaw.ai/gateway/tailscale -->
<!-- Title: Tailscale - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/tailscale)

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

-   [Tailscale (Gateway dashboard)](https://docs.openclaw.ai/gateway/tailscale)
-   [Modes](https://docs.openclaw.ai/gateway/tailscale)
-   [Auth](https://docs.openclaw.ai/gateway/tailscale)
-   [Config examples](https://docs.openclaw.ai/gateway/tailscale)
-   [Tailnet-only (Serve)](https://docs.openclaw.ai/gateway/tailscale)
-   [Tailnet-only (bind to Tailnet IP)](https://docs.openclaw.ai/gateway/tailscale)
-   [Public internet (Funnel + shared password)](https://docs.openclaw.ai/gateway/tailscale)
-   [CLI examples](https://docs.openclaw.ai/gateway/tailscale)
-   [Notes](https://docs.openclaw.ai/gateway/tailscale)
-   [Browser control (remote Gateway + local browser)](https://docs.openclaw.ai/gateway/tailscale)
-   [Tailscale prerequisites + limits](https://docs.openclaw.ai/gateway/tailscale)
-   [Learn more](https://docs.openclaw.ai/gateway/tailscale)

Remote access

# Tailscale

# 

[​

](https://docs.openclaw.ai/gateway/tailscale)

Tailscale (Gateway dashboard)

OpenClaw can auto-configure Tailscale **Serve** (tailnet) or **Funnel** (public) for the Gateway dashboard and WebSocket port. This keeps the Gateway bound to loopback while Tailscale provides HTTPS, routing, and (for Serve) identity headers.

## 

[​

](https://docs.openclaw.ai/gateway/tailscale)

Modes

-   `serve`: Tailnet-only Serve via `tailscale serve`. The gateway stays on `127.0.0.1`.
-   `funnel`: Public HTTPS via `tailscale funnel`. OpenClaw requires a shared password.
-   `off`: Default (no Tailscale automation).

## 

[​

](https://docs.openclaw.ai/gateway/tailscale)

Auth

Set `gateway.auth.mode` to control the handshake:

-   `token` (default when `OPENCLAW_GATEWAY_TOKEN` is set)
-   `password` (shared secret via `OPENCLAW_GATEWAY_PASSWORD` or config)

When `tailscale.mode = "serve"` and `gateway.auth.allowTailscale` is `true`, Control UI/WebSocket auth can use Tailscale identity headers (`tailscale-user-login`) without supplying a token/password. OpenClaw verifies the identity by resolving the `x-forwarded-for` address via the local Tailscale daemon (`tailscale whois`) and matching it to the header before accepting it. OpenClaw only treats a request as Serve when it arrives from loopback with Tailscale’s `x-forwarded-for`, `x-forwarded-proto`, and `x-forwarded-host` headers. HTTP API endpoints (for example `/v1/*`, `/tools/invoke`, and `/api/channels/*`) still require token/password auth. This tokenless flow assumes the gateway host is trusted. If untrusted local code may run on the same host, disable `gateway.auth.allowTailscale` and require token/password auth instead. To require explicit credentials, set `gateway.auth.allowTailscale: false` or force `gateway.auth.mode: "password"`.

## 

[​

](https://docs.openclaw.ai/gateway/tailscale)

Config examples

### 

[​

](https://docs.openclaw.ai/gateway/tailscale)

Tailnet-only (Serve)

Copy

```
{
  gateway: {
    bind: "loopback",
    tailscale: { mode: "serve" },
  },
}
```

Open: `https://<magicdns>/` (or your configured `gateway.controlUi.basePath`)

### 

[​

](https://docs.openclaw.ai/gateway/tailscale)

Tailnet-only (bind to Tailnet IP)

Use this when you want the Gateway to listen directly on the Tailnet IP (no Serve/Funnel).

Copy

```
{
  gateway: {
    bind: "tailnet",
    auth: { mode: "token", token: "your-token" },
  },
}
```

Connect from another Tailnet device:

-   Control UI: `http://<tailscale-ip>:18789/`
-   WebSocket: `ws://<tailscale-ip>:18789`

Note: loopback (`http://127.0.0.1:18789`) will **not** work in this mode.

### 

[​

](https://docs.openclaw.ai/gateway/tailscale)

Public internet (Funnel + shared password)

Copy

```
{
  gateway: {
    bind: "loopback",
    tailscale: { mode: "funnel" },
    auth: { mode: "password", password: "replace-me" },
  },
}
```

Prefer `OPENCLAW_GATEWAY_PASSWORD` over committing a password to disk.

## 

[​

](https://docs.openclaw.ai/gateway/tailscale)

CLI examples

Copy

```
openclaw gateway --tailscale serve
openclaw gateway --tailscale funnel --auth password
```

## 

[​

](https://docs.openclaw.ai/gateway/tailscale)

Notes

-   Tailscale Serve/Funnel requires the `tailscale` CLI to be installed and logged in.
-   `tailscale.mode: "funnel"` refuses to start unless auth mode is `password` to avoid public exposure.
-   Set `gateway.tailscale.resetOnExit` if you want OpenClaw to undo `tailscale serve` or `tailscale funnel` configuration on shutdown.
-   `gateway.bind: "tailnet"` is a direct Tailnet bind (no HTTPS, no Serve/Funnel).
-   `gateway.bind: "auto"` prefers loopback; use `tailnet` if you want Tailnet-only.
-   Serve/Funnel only expose the **Gateway control UI + WS**. Nodes connect over the same Gateway WS endpoint, so Serve can work for node access.

## 

[​

](https://docs.openclaw.ai/gateway/tailscale)

Browser control (remote Gateway + local browser)

If you run the Gateway on one machine but want to drive a browser on another machine, run a **node host** on the browser machine and keep both on the same tailnet. The Gateway will proxy browser actions to the node; no separate control server or Serve URL needed. Avoid Funnel for browser control; treat node pairing like operator access.

## 

[​

](https://docs.openclaw.ai/gateway/tailscale)

Tailscale prerequisites + limits

-   Serve requires HTTPS enabled for your tailnet; the CLI prompts if it is missing.
-   Serve injects Tailscale identity headers; Funnel does not.
-   Funnel requires Tailscale v1.38.3+, MagicDNS, HTTPS enabled, and a funnel node attribute.
-   Funnel only supports ports `443`, `8443`, and `10000` over TLS.
-   Funnel on macOS requires the open-source Tailscale app variant.

## 

[​

](https://docs.openclaw.ai/gateway/tailscale)

Learn more

-   Tailscale Serve overview: [https://tailscale.com/kb/1312/serve](https://tailscale.com/kb/1312/serve)
-   `tailscale serve` command: [https://tailscale.com/kb/1242/tailscale-serve](https://tailscale.com/kb/1242/tailscale-serve)
-   Tailscale Funnel overview: [https://tailscale.com/kb/1223/tailscale-funnel](https://tailscale.com/kb/1223/tailscale-funnel)
-   `tailscale funnel` command: [https://tailscale.com/kb/1311/tailscale-funnel](https://tailscale.com/kb/1311/tailscale-funnel)

[Remote Gateway Setup](https://docs.openclaw.ai/gateway/remote-gateway-readme)[Formal Verification (Security Models)](https://docs.openclaw.ai/security/formal-verification)

⌘I
