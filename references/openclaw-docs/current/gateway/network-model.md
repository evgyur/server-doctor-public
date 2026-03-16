<!-- Source: https://docs.openclaw.ai/gateway/network-model -->
<!-- Title: Network model - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/network-model)

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

-   [Core rules](https://docs.openclaw.ai/gateway/network-model)

Networking and discovery

# Network model

Most operations flow through the Gateway (`openclaw gateway`), a single long-running process that owns channel connections and the WebSocket control plane.

## 

[​

](https://docs.openclaw.ai/gateway/network-model)

Core rules

-   One Gateway per host is recommended. It is the only process allowed to own the WhatsApp Web session. For rescue bots or strict isolation, run multiple gateways with isolated profiles and ports. See [Multiple gateways](https://docs.openclaw.ai/gateway/multiple-gateways).
-   Loopback first: the Gateway WS defaults to `ws://127.0.0.1:18789`. The wizard generates a gateway token by default, even for loopback. For tailnet access, run `openclaw gateway --bind tailnet --token ...` because tokens are required for non-loopback binds.
-   Nodes connect to the Gateway WS over LAN, tailnet, or SSH as needed. The legacy TCP bridge is deprecated.
-   Canvas host is served by the Gateway HTTP server on the **same port** as the Gateway (default `18789`):
    -   `/__openclaw__/canvas/`
    -   `/__openclaw__/a2ui/` When `gateway.auth` is configured and the Gateway binds beyond loopback, these routes are protected by Gateway auth. Node clients use node-scoped capability URLs tied to their active WS session. See [Gateway configuration](https://docs.openclaw.ai/gateway/configuration) (`canvasHost`, `gateway`).
-   Remote use is typically SSH tunnel or tailnet VPN. See [Remote access](https://docs.openclaw.ai/gateway/remote) and [Discovery](https://docs.openclaw.ai/gateway/discovery).

[Local Models](https://docs.openclaw.ai/gateway/local-models)[Gateway-Owned Pairing](https://docs.openclaw.ai/gateway/pairing)

⌘I
