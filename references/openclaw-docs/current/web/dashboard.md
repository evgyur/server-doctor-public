<!-- Source: https://docs.openclaw.ai/web/dashboard -->
<!-- Title: Dashboard - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/web/dashboard)

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

-   [Dashboard (Control UI)](https://docs.openclaw.ai/web/dashboard)
-   [Fast path (recommended)](https://docs.openclaw.ai/web/dashboard)
-   [Token basics (local vs remote)](https://docs.openclaw.ai/web/dashboard)
-   [If you see “unauthorized” / 1008](https://docs.openclaw.ai/web/dashboard)

Web interfaces

# Dashboard

# 

[​

](https://docs.openclaw.ai/web/dashboard)

Dashboard (Control UI)

The Gateway dashboard is the browser Control UI served at `/` by default (override with `gateway.controlUi.basePath`). Quick open (local Gateway):

-   [http://127.0.0.1:18789/](http://127.0.0.1:18789/) (or [http://localhost:18789/](http://localhost:18789/))

Key references:

-   [Control UI](https://docs.openclaw.ai/web/control-ui) for usage and UI capabilities.
-   [Tailscale](https://docs.openclaw.ai/gateway/tailscale) for Serve/Funnel automation.
-   [Web surfaces](https://docs.openclaw.ai/web) for bind modes and security notes.

Authentication is enforced at the WebSocket handshake via `connect.params.auth` (token or password). See `gateway.auth` in [Gateway configuration](https://docs.openclaw.ai/gateway/configuration). Security note: the Control UI is an **admin surface** (chat, config, exec approvals). Do not expose it publicly. The UI keeps dashboard URL tokens in sessionStorage for the current browser tab session and selected gateway URL, and strips them from the URL after load. Prefer localhost, Tailscale Serve, or an SSH tunnel.

## 

[​

](https://docs.openclaw.ai/web/dashboard)

Fast path (recommended)

-   After onboarding, the CLI auto-opens the dashboard and prints a clean (non-tokenized) link.
-   Re-open anytime: `openclaw dashboard` (copies link, opens browser if possible, shows SSH hint if headless).
-   If the UI prompts for auth, paste the token from `gateway.auth.token` (or `OPENCLAW_GATEWAY_TOKEN`) into Control UI settings.

## 

[​

](https://docs.openclaw.ai/web/dashboard)

Token basics (local vs remote)

-   **Localhost**: open `http://127.0.0.1:18789/`.
-   **Token source**: `gateway.auth.token` (or `OPENCLAW_GATEWAY_TOKEN`); `openclaw dashboard` can pass it via URL fragment for one-time bootstrap, and the Control UI keeps it in sessionStorage for the current browser tab session and selected gateway URL instead of localStorage.
-   If `gateway.auth.token` is SecretRef-managed, `openclaw dashboard` prints/copies/opens a non-tokenized URL by design. This avoids exposing externally managed tokens in shell logs, clipboard history, or browser-launch arguments.
-   If `gateway.auth.token` is configured as a SecretRef and is unresolved in your current shell, `openclaw dashboard` still prints a non-tokenized URL plus actionable auth setup guidance.
-   **Not localhost**: use Tailscale Serve (tokenless for Control UI/WebSocket if `gateway.auth.allowTailscale: true`, assumes trusted gateway host; HTTP APIs still need token/password), tailnet bind with a token, or an SSH tunnel. See [Web surfaces](https://docs.openclaw.ai/web).

## 

[​

](https://docs.openclaw.ai/web/dashboard)

If you see “unauthorized” / 1008

-   Ensure the gateway is reachable (local: `openclaw status`; remote: SSH tunnel `ssh -N -L 18789:127.0.0.1:18789 user@host` then open `http://127.0.0.1:18789/`).
-   For `AUTH_TOKEN_MISMATCH`, clients may do one trusted retry with a cached device token when the gateway returns retry hints. If auth still fails after that retry, resolve token drift manually.
-   For token drift repair steps, follow [Token drift recovery checklist](https://docs.openclaw.ai/cli/devices).
-   Retrieve or supply the token from the gateway host:
    -   Plaintext config: `openclaw config get gateway.auth.token`
    -   SecretRef-managed config: resolve the external secret provider or export `OPENCLAW_GATEWAY_TOKEN` in this shell, then rerun `openclaw dashboard`
    -   No token configured: `openclaw doctor --generate-gateway-token`
-   In the dashboard settings, paste the token into the auth field, then connect.

[Control UI](https://docs.openclaw.ai/web/control-ui)[WebChat](https://docs.openclaw.ai/web/webchat)

⌘I
