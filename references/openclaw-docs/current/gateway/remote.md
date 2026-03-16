<!-- Source: https://docs.openclaw.ai/gateway/remote -->
<!-- Title: Remote Access - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/remote)

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

-   [Remote access (SSH, tunnels, and tailnets)](https://docs.openclaw.ai/gateway/remote)
-   [The core idea](https://docs.openclaw.ai/gateway/remote)
-   [Common VPN/tailnet setups (where the agent lives)](https://docs.openclaw.ai/gateway/remote)
-   [1) Always-on Gateway in your tailnet (VPS or home server)](https://docs.openclaw.ai/gateway/remote)
-   [2) Home desktop runs the Gateway, laptop is remote control](https://docs.openclaw.ai/gateway/remote)
-   [3) Laptop runs the Gateway, remote access from other machines](https://docs.openclaw.ai/gateway/remote)
-   [Command flow (what runs where)](https://docs.openclaw.ai/gateway/remote)
-   [SSH tunnel (CLI + tools)](https://docs.openclaw.ai/gateway/remote)
-   [CLI remote defaults](https://docs.openclaw.ai/gateway/remote)
-   [Credential precedence](https://docs.openclaw.ai/gateway/remote)
-   [Chat UI over SSH](https://docs.openclaw.ai/gateway/remote)
-   [macOS app “Remote over SSH”](https://docs.openclaw.ai/gateway/remote)
-   [Security rules (remote/VPN)](https://docs.openclaw.ai/gateway/remote)

Remote access

# Remote Access

# 

[​

](https://docs.openclaw.ai/gateway/remote)

Remote access (SSH, tunnels, and tailnets)

This repo supports “remote over SSH” by keeping a single Gateway (the master) running on a dedicated host (desktop/server) and connecting clients to it.

-   For **operators (you / the macOS app)**: SSH tunneling is the universal fallback.
-   For **nodes (iOS/Android and future devices)**: connect to the Gateway **WebSocket** (LAN/tailnet or SSH tunnel as needed).

## 

[​

](https://docs.openclaw.ai/gateway/remote)

The core idea

-   The Gateway WebSocket binds to **loopback** on your configured port (defaults to 18789).
-   For remote use, you forward that loopback port over SSH (or use a tailnet/VPN and tunnel less).

## 

[​

](https://docs.openclaw.ai/gateway/remote)

Common VPN/tailnet setups (where the agent lives)

Think of the **Gateway host** as “where the agent lives.” It owns sessions, auth profiles, channels, and state. Your laptop/desktop (and nodes) connect to that host.

### 

[​

](https://docs.openclaw.ai/gateway/remote)

1) Always-on Gateway in your tailnet (VPS or home server)

Run the Gateway on a persistent host and reach it via **Tailscale** or SSH.

-   **Best UX:** keep `gateway.bind: "loopback"` and use **Tailscale Serve** for the Control UI.
-   **Fallback:** keep loopback + SSH tunnel from any machine that needs access.
-   **Examples:** [exe.dev](https://docs.openclaw.ai/install/exe-dev) (easy VM) or [Hetzner](https://docs.openclaw.ai/install/hetzner) (production VPS).

This is ideal when your laptop sleeps often but you want the agent always-on.

### 

[​

](https://docs.openclaw.ai/gateway/remote)

2) Home desktop runs the Gateway, laptop is remote control

The laptop does **not** run the agent. It connects remotely:

-   Use the macOS app’s **Remote over SSH** mode (Settings → General → “OpenClaw runs”).
-   The app opens and manages the tunnel, so WebChat + health checks “just work.”

Runbook: [macOS remote access](https://docs.openclaw.ai/platforms/mac/remote).

### 

[​

](https://docs.openclaw.ai/gateway/remote)

3) Laptop runs the Gateway, remote access from other machines

Keep the Gateway local but expose it safely:

-   SSH tunnel to the laptop from other machines, or
-   Tailscale Serve the Control UI and keep the Gateway loopback-only.

Guide: [Tailscale](https://docs.openclaw.ai/gateway/tailscale) and [Web overview](https://docs.openclaw.ai/web).

## 

[​

](https://docs.openclaw.ai/gateway/remote)

Command flow (what runs where)

One gateway service owns state + channels. Nodes are peripherals. Flow example (Telegram → node):

-   Telegram message arrives at the **Gateway**.
-   Gateway runs the **agent** and decides whether to call a node tool.
-   Gateway calls the **node** over the Gateway WebSocket (`node.*` RPC).
-   Node returns the result; Gateway replies back out to Telegram.

Notes:

-   **Nodes do not run the gateway service.** Only one gateway should run per host unless you intentionally run isolated profiles (see [Multiple gateways](https://docs.openclaw.ai/gateway/multiple-gateways)).
-   macOS app “node mode” is just a node client over the Gateway WebSocket.

## 

[​

](https://docs.openclaw.ai/gateway/remote)

SSH tunnel (CLI + tools)

Create a local tunnel to the remote Gateway WS:

Copy

```
ssh -N -L 18789:127.0.0.1:18789 user@host
```

With the tunnel up:

-   `openclaw health` and `openclaw status --deep` now reach the remote gateway via `ws://127.0.0.1:18789`.
-   `openclaw gateway {status,health,send,agent,call}` can also target the forwarded URL via `--url` when needed.

Note: replace `18789` with your configured `gateway.port` (or `--port`/`OPENCLAW_GATEWAY_PORT`). Note: when you pass `--url`, the CLI does not fall back to config or environment credentials. Include `--token` or `--password` explicitly. Missing explicit credentials is an error.

## 

[​

](https://docs.openclaw.ai/gateway/remote)

CLI remote defaults

You can persist a remote target so CLI commands use it by default:

Copy

```
{
  gateway: {
    mode: "remote",
    remote: {
      url: "ws://127.0.0.1:18789",
      token: "your-token",
    },
  },
}
```

When the gateway is loopback-only, keep the URL at `ws://127.0.0.1:18789` and open the SSH tunnel first.

## 

[​

](https://docs.openclaw.ai/gateway/remote)

Credential precedence

Gateway credential resolution follows one shared contract across call/probe/status paths and Discord exec-approval monitoring. Node-host uses the same base contract with one local-mode exception (it intentionally ignores `gateway.remote.*`):

-   Explicit credentials (`--token`, `--password`, or tool `gatewayToken`) always win on call paths that accept explicit auth.
-   URL override safety:
    -   CLI URL overrides (`--url`) never reuse implicit config/env credentials.
    -   Env URL overrides (`OPENCLAW_GATEWAY_URL`) may use env credentials only (`OPENCLAW_GATEWAY_TOKEN` / `OPENCLAW_GATEWAY_PASSWORD`).
-   Local mode defaults:
    -   token: `OPENCLAW_GATEWAY_TOKEN` -> `gateway.auth.token` -> `gateway.remote.token` (remote fallback applies only when local auth token input is unset)
    -   password: `OPENCLAW_GATEWAY_PASSWORD` -> `gateway.auth.password` -> `gateway.remote.password` (remote fallback applies only when local auth password input is unset)
-   Remote mode defaults:
    -   token: `gateway.remote.token` -> `OPENCLAW_GATEWAY_TOKEN` -> `gateway.auth.token`
    -   password: `OPENCLAW_GATEWAY_PASSWORD` -> `gateway.remote.password` -> `gateway.auth.password`
-   Node-host local-mode exception: `gateway.remote.token` / `gateway.remote.password` are ignored.
-   Remote probe/status token checks are strict by default: they use `gateway.remote.token` only (no local token fallback) when targeting remote mode.
-   Legacy `CLAWDBOT_GATEWAY_*` env vars are only used by compatibility call paths; probe/status/auth resolution uses `OPENCLAW_GATEWAY_*` only.

## 

[​

](https://docs.openclaw.ai/gateway/remote)

Chat UI over SSH

WebChat no longer uses a separate HTTP port. The SwiftUI chat UI connects directly to the Gateway WebSocket.

-   Forward `18789` over SSH (see above), then connect clients to `ws://127.0.0.1:18789`.
-   On macOS, prefer the app’s “Remote over SSH” mode, which manages the tunnel automatically.

## 

[​

](https://docs.openclaw.ai/gateway/remote)

macOS app “Remote over SSH”

The macOS menu bar app can drive the same setup end-to-end (remote status checks, WebChat, and Voice Wake forwarding). Runbook: [macOS remote access](https://docs.openclaw.ai/platforms/mac/remote).

## 

[​

](https://docs.openclaw.ai/gateway/remote)

Security rules (remote/VPN)

Short version: **keep the Gateway loopback-only** unless you’re sure you need a bind.

-   **Loopback + SSH/Tailscale Serve** is the safest default (no public exposure).
-   Plaintext `ws://` is loopback-only by default. For trusted private networks, set `OPENCLAW_ALLOW_INSECURE_PRIVATE_WS=1` on the client process as break-glass.
-   **Non-loopback binds** (`lan`/`tailnet`/`custom`, or `auto` when loopback is unavailable) must use auth tokens/passwords.
-   `gateway.remote.token` / `.password` are client credential sources. They do **not** configure server auth by themselves.
-   Local call paths can use `gateway.remote.*` as fallback only when `gateway.auth.*` is unset.
-   If `gateway.auth.token` / `gateway.auth.password` is explicitly configured via SecretRef and unresolved, resolution fails closed (no remote fallback masking).
-   `gateway.remote.tlsFingerprint` pins the remote TLS cert when using `wss://`.
-   **Tailscale Serve** can authenticate Control UI/WebSocket traffic via identity headers when `gateway.auth.allowTailscale: true`; HTTP API endpoints still require token/password auth. This tokenless flow assumes the gateway host is trusted. Set it to `false` if you want tokens/passwords everywhere.
-   Treat browser control like operator access: tailnet-only + deliberate node pairing.

Deep dive: [Security](https://docs.openclaw.ai/gateway/security).

[Bonjour Discovery](https://docs.openclaw.ai/gateway/bonjour)[Remote Gateway Setup](https://docs.openclaw.ai/gateway/remote-gateway-readme)

⌘I
