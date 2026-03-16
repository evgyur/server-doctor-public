<!-- Source: https://docs.openclaw.ai/gateway/discovery -->
<!-- Title: Discovery and Transports - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/discovery)

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
        
        Network model
        
        
        
        ](https://docs.openclaw.ai/gateway/network-model)
    -   [
        
        Gateway-Owned Pairing
        
        
        
        ](https://docs.openclaw.ai/gateway/pairing)
    -   [
        
        Discovery and Transports
        
        
        
        ](https://docs.openclaw.ai/gateway/discovery)
    -   [
        
        Bonjour Discovery
        
        
        
        ](https://docs.openclaw.ai/gateway/bonjour)

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

-   [Discovery & transports](https://docs.openclaw.ai/gateway/discovery)
-   [Terms](https://docs.openclaw.ai/gateway/discovery)
-   [Why we keep both “direct” and SSH](https://docs.openclaw.ai/gateway/discovery)
-   [Discovery inputs (how clients learn where the gateway is)](https://docs.openclaw.ai/gateway/discovery)
-   [1) Bonjour / mDNS (LAN only)](https://docs.openclaw.ai/gateway/discovery)
-   [Service beacon details](https://docs.openclaw.ai/gateway/discovery)
-   [2) Tailnet (cross-network)](https://docs.openclaw.ai/gateway/discovery)
-   [3) Manual / SSH target](https://docs.openclaw.ai/gateway/discovery)
-   [Transport selection (client policy)](https://docs.openclaw.ai/gateway/discovery)
-   [Pairing + auth (direct transport)](https://docs.openclaw.ai/gateway/discovery)
-   [Responsibilities by component](https://docs.openclaw.ai/gateway/discovery)

Networking and discovery

# Discovery and Transports

# 

[​

](https://docs.openclaw.ai/gateway/discovery)

Discovery & transports

OpenClaw has two distinct problems that look similar on the surface:

1.  **Operator remote control**: the macOS menu bar app controlling a gateway running elsewhere.
2.  **Node pairing**: iOS/Android (and future nodes) finding a gateway and pairing securely.

The design goal is to keep all network discovery/advertising in the **Node Gateway** (`openclaw gateway`) and keep clients (mac app, iOS) as consumers.

## 

[​

](https://docs.openclaw.ai/gateway/discovery)

Terms

-   **Gateway**: a single long-running gateway process that owns state (sessions, pairing, node registry) and runs channels. Most setups use one per host; isolated multi-gateway setups are possible.
-   **Gateway WS (control plane)**: the WebSocket endpoint on `127.0.0.1:18789` by default; can be bound to LAN/tailnet via `gateway.bind`.
-   **Direct WS transport**: a LAN/tailnet-facing Gateway WS endpoint (no SSH).
-   **SSH transport (fallback)**: remote control by forwarding `127.0.0.1:18789` over SSH.
-   **Legacy TCP bridge (deprecated/removed)**: older node transport (see [Bridge protocol](https://docs.openclaw.ai/gateway/bridge-protocol)); no longer advertised for discovery.

Protocol details:

-   [Gateway protocol](https://docs.openclaw.ai/gateway/protocol)
-   [Bridge protocol (legacy)](https://docs.openclaw.ai/gateway/bridge-protocol)

## 

[​

](https://docs.openclaw.ai/gateway/discovery)

Why we keep both “direct” and SSH

-   **Direct WS** is the best UX on the same network and within a tailnet:
    -   auto-discovery on LAN via Bonjour
    -   pairing tokens + ACLs owned by the gateway
    -   no shell access required; protocol surface can stay tight and auditable
-   **SSH** remains the universal fallback:
    -   works anywhere you have SSH access (even across unrelated networks)
    -   survives multicast/mDNS issues
    -   requires no new inbound ports besides SSH

## 

[​

](https://docs.openclaw.ai/gateway/discovery)

Discovery inputs (how clients learn where the gateway is)

### 

[​

](https://docs.openclaw.ai/gateway/discovery)

1) Bonjour / mDNS (LAN only)

Bonjour is best-effort and does not cross networks. It is only used for “same LAN” convenience. Target direction:

-   The **gateway** advertises its WS endpoint via Bonjour.
-   Clients browse and show a “pick a gateway” list, then store the chosen endpoint.

Troubleshooting and beacon details: [Bonjour](https://docs.openclaw.ai/gateway/bonjour).

#### 

[​

](https://docs.openclaw.ai/gateway/discovery)

Service beacon details

-   Service types:
    -   `_openclaw-gw._tcp` (gateway transport beacon)
-   TXT keys (non-secret):
    -   `role=gateway`
    -   `lanHost=<hostname>.local`
    -   `sshPort=22` (or whatever is advertised)
    -   `gatewayPort=18789` (Gateway WS + HTTP)
    -   `gatewayTls=1` (only when TLS is enabled)
    -   `gatewayTlsSha256=<sha256>` (only when TLS is enabled and fingerprint is available)
    -   `canvasPort=<port>` (canvas host port; currently the same as `gatewayPort` when the canvas host is enabled)
    -   `cliPath=<path>` (optional; absolute path to a runnable `openclaw` entrypoint or binary)
    -   `tailnetDns=<magicdns>` (optional hint; auto-detected when Tailscale is available)

Security notes:

-   Bonjour/mDNS TXT records are **unauthenticated**. Clients must treat TXT values as UX hints only.
-   Routing (host/port) should prefer the **resolved service endpoint** (SRV + A/AAAA) over TXT-provided `lanHost`, `tailnetDns`, or `gatewayPort`.
-   TLS pinning must never allow an advertised `gatewayTlsSha256` to override a previously stored pin.
-   iOS/Android nodes should treat discovery-based direct connects as **TLS-only** and require an explicit “trust this fingerprint” confirmation before storing a first-time pin (out-of-band verification).

Disable/override:

-   `OPENCLAW_DISABLE_BONJOUR=1` disables advertising.
-   `gateway.bind` in `~/.openclaw/openclaw.json` controls the Gateway bind mode.
-   `OPENCLAW_SSH_PORT` overrides the SSH port advertised in TXT (defaults to 22).
-   `OPENCLAW_TAILNET_DNS` publishes a `tailnetDns` hint (MagicDNS).
-   `OPENCLAW_CLI_PATH` overrides the advertised CLI path.

### 

[​

](https://docs.openclaw.ai/gateway/discovery)

2) Tailnet (cross-network)

For London/Vienna style setups, Bonjour won’t help. The recommended “direct” target is:

-   Tailscale MagicDNS name (preferred) or a stable tailnet IP.

If the gateway can detect it is running under Tailscale, it publishes `tailnetDns` as an optional hint for clients (including wide-area beacons).

### 

[​

](https://docs.openclaw.ai/gateway/discovery)

3) Manual / SSH target

When there is no direct route (or direct is disabled), clients can always connect via SSH by forwarding the loopback gateway port. See [Remote access](https://docs.openclaw.ai/gateway/remote).

## 

[​

](https://docs.openclaw.ai/gateway/discovery)

Transport selection (client policy)

Recommended client behavior:

1.  If a paired direct endpoint is configured and reachable, use it.
2.  Else, if Bonjour finds a gateway on LAN, offer a one-tap “Use this gateway” choice and save it as the direct endpoint.
3.  Else, if a tailnet DNS/IP is configured, try direct.
4.  Else, fall back to SSH.

## 

[​

](https://docs.openclaw.ai/gateway/discovery)

Pairing + auth (direct transport)

The gateway is the source of truth for node/client admission.

-   Pairing requests are created/approved/rejected in the gateway (see [Gateway pairing](https://docs.openclaw.ai/gateway/pairing)).
-   The gateway enforces:
    -   auth (token / keypair)
    -   scopes/ACLs (the gateway is not a raw proxy to every method)
    -   rate limits

## 

[​

](https://docs.openclaw.ai/gateway/discovery)

Responsibilities by component

-   **Gateway**: advertises discovery beacons, owns pairing decisions, and hosts the WS endpoint.
-   **macOS app**: helps you pick a gateway, shows pairing prompts, and uses SSH only as a fallback.
-   **iOS/Android nodes**: browse Bonjour as a convenience and connect to the paired Gateway WS.

[Gateway-Owned Pairing](https://docs.openclaw.ai/gateway/pairing)[Bonjour Discovery](https://docs.openclaw.ai/gateway/bonjour)

⌘I
