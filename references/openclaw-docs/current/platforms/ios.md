<!-- Source: https://docs.openclaw.ai/platforms/ios -->
<!-- Title: iOS App - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/platforms/ios)

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

##### Platforms overview

-   [
    
    Platforms
    
    
    
    ](https://docs.openclaw.ai/platforms)
-   [
    
    macOS App
    
    
    
    ](https://docs.openclaw.ai/platforms/macos)
-   [
    
    Linux App
    
    
    
    ](https://docs.openclaw.ai/platforms/linux)
-   [
    
    Windows (WSL2)
    
    
    
    ](https://docs.openclaw.ai/platforms/windows)
-   [
    
    Android App
    
    
    
    ](https://docs.openclaw.ai/platforms/android)
-   [
    
    iOS App
    
    
    
    ](https://docs.openclaw.ai/platforms/ios)
-   [
    
    DigitalOcean
    
    
    
    ](https://docs.openclaw.ai/platforms/digitalocean)
-   [
    
    Oracle Cloud
    
    
    
    ](https://docs.openclaw.ai/platforms/oracle)
-   [
    
    Raspberry Pi
    
    
    
    ](https://docs.openclaw.ai/platforms/raspberry-pi)

##### macOS companion app

-   [
    
    macOS Dev Setup
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/dev-setup)
-   [
    
    Menu Bar
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/menu-bar)
-   [
    
    Voice Wake
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/voicewake)
-   [
    
    Voice Overlay
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/voice-overlay)
-   [
    
    WebChat
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/webchat)
-   [
    
    Canvas
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/canvas)
-   [
    
    Gateway Lifecycle
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/child-process)
-   [
    
    Health Checks
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/health)
-   [
    
    Menu Bar Icon
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/icon)
-   [
    
    macOS Logging
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/logging)
-   [
    
    macOS Permissions
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/permissions)
-   [
    
    Remote Control
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/remote)
-   [
    
    macOS Signing
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/signing)
-   [
    
    Gateway on macOS
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/bundled-gateway)
-   [
    
    macOS IPC
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/xpc)
-   [
    
    Skills
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/skills)
-   [
    
    Peekaboo Bridge
    
    
    
    ](https://docs.openclaw.ai/platforms/mac/peekaboo)

-   [iOS App (Node)](https://docs.openclaw.ai/platforms/ios)
-   [What it does](https://docs.openclaw.ai/platforms/ios)
-   [Requirements](https://docs.openclaw.ai/platforms/ios)
-   [Quick start (pair + connect)](https://docs.openclaw.ai/platforms/ios)
-   [Relay-backed push for official builds](https://docs.openclaw.ai/platforms/ios)
-   [Authentication and trust flow](https://docs.openclaw.ai/platforms/ios)
-   [Discovery paths](https://docs.openclaw.ai/platforms/ios)
-   [Bonjour (LAN)](https://docs.openclaw.ai/platforms/ios)
-   [Tailnet (cross-network)](https://docs.openclaw.ai/platforms/ios)
-   [Manual host/port](https://docs.openclaw.ai/platforms/ios)
-   [Canvas + A2UI](https://docs.openclaw.ai/platforms/ios)
-   [Canvas eval / snapshot](https://docs.openclaw.ai/platforms/ios)
-   [Voice wake + talk mode](https://docs.openclaw.ai/platforms/ios)
-   [Common errors](https://docs.openclaw.ai/platforms/ios)
-   [Related docs](https://docs.openclaw.ai/platforms/ios)

Platforms overview

# iOS App

# 

[​

](https://docs.openclaw.ai/platforms/ios)

iOS App (Node)

Availability: internal preview. The iOS app is not publicly distributed yet.

## 

[​

](https://docs.openclaw.ai/platforms/ios)

What it does

-   Connects to a Gateway over WebSocket (LAN or tailnet).
-   Exposes node capabilities: Canvas, Screen snapshot, Camera capture, Location, Talk mode, Voice wake.
-   Receives `node.invoke` commands and reports node status events.

## 

[​

](https://docs.openclaw.ai/platforms/ios)

Requirements

-   Gateway running on another device (macOS, Linux, or Windows via WSL2).
-   Network path:
    -   Same LAN via Bonjour, **or**
    -   Tailnet via unicast DNS-SD (example domain: `openclaw.internal.`), **or**
    -   Manual host/port (fallback).

## 

[​

](https://docs.openclaw.ai/platforms/ios)

Quick start (pair + connect)

1.  Start the Gateway:

Copy

```
openclaw gateway --port 18789
```

2.  In the iOS app, open Settings and pick a discovered gateway (or enable Manual Host and enter host/port).
3.  Approve the pairing request on the gateway host:

Copy

```
openclaw devices list
openclaw devices approve <requestId>
```

4.  Verify connection:

Copy

```
openclaw nodes status
openclaw gateway call node.list --params "{}"
```

## 

[​

](https://docs.openclaw.ai/platforms/ios)

Relay-backed push for official builds

Official distributed iOS builds use the external push relay instead of publishing the raw APNs token to the gateway. Gateway-side requirement:

Copy

```
{
  gateway: {
    push: {
      apns: {
        relay: {
          baseUrl: "https://relay.example.com",
        },
      },
    },
  },
}
```

How the flow works:

-   The iOS app registers with the relay using App Attest and the app receipt.
-   The relay returns an opaque relay handle plus a registration-scoped send grant.
-   The iOS app fetches the paired gateway identity and includes it in relay registration, so the relay-backed registration is delegated to that specific gateway.
-   The app forwards that relay-backed registration to the paired gateway with `push.apns.register`.
-   The gateway uses that stored relay handle for `push.test`, background wakes, and wake nudges.
-   The gateway relay base URL must match the relay URL baked into the official/TestFlight iOS build.
-   If the app later connects to a different gateway or a build with a different relay base URL, it refreshes the relay registration instead of reusing the old binding.

What the gateway does **not** need for this path:

-   No deployment-wide relay token.
-   No direct APNs key for official/TestFlight relay-backed sends.

Expected operator flow:

1.  Install the official/TestFlight iOS build.
2.  Set `gateway.push.apns.relay.baseUrl` on the gateway.
3.  Pair the app to the gateway and let it finish connecting.
4.  The app publishes `push.apns.register` automatically after it has an APNs token, the operator session is connected, and relay registration succeeds.
5.  After that, `push.test`, reconnect wakes, and wake nudges can use the stored relay-backed registration.

Compatibility note:

-   `OPENCLAW_APNS_RELAY_BASE_URL` still works as a temporary env override for the gateway.

## 

[​

](https://docs.openclaw.ai/platforms/ios)

Authentication and trust flow

The relay exists to enforce two constraints that direct APNs-on-gateway cannot provide for official iOS builds:

-   Only genuine OpenClaw iOS builds distributed through Apple can use the hosted relay.
-   A gateway can send relay-backed pushes only for iOS devices that paired with that specific gateway.

Hop by hop:

1.  `iOS app -> gateway`
    -   The app first pairs with the gateway through the normal Gateway auth flow.
    -   That gives the app an authenticated node session plus an authenticated operator session.
    -   The operator session is used to call `gateway.identity.get`.
2.  `iOS app -> relay`
    -   The app calls the relay registration endpoints over HTTPS.
    -   Registration includes App Attest proof plus the app receipt.
    -   The relay validates the bundle ID, App Attest proof, and Apple receipt, and requires the official/production distribution path.
    -   This is what blocks local Xcode/dev builds from using the hosted relay. A local build may be signed, but it does not satisfy the official Apple distribution proof the relay expects.
3.  `gateway identity delegation`
    -   Before relay registration, the app fetches the paired gateway identity from `gateway.identity.get`.
    -   The app includes that gateway identity in the relay registration payload.
    -   The relay returns a relay handle and a registration-scoped send grant that are delegated to that gateway identity.
4.  `gateway -> relay`
    -   The gateway stores the relay handle and send grant from `push.apns.register`.
    -   On `push.test`, reconnect wakes, and wake nudges, the gateway signs the send request with its own device identity.
    -   The relay verifies both the stored send grant and the gateway signature against the delegated gateway identity from registration.
    -   Another gateway cannot reuse that stored registration, even if it somehow obtains the handle.
5.  `relay -> APNs`
    -   The relay owns the production APNs credentials and the raw APNs token for the official build.
    -   The gateway never stores the raw APNs token for relay-backed official builds.
    -   The relay sends the final push to APNs on behalf of the paired gateway.

Why this design was created:

-   To keep production APNs credentials out of user gateways.
-   To avoid storing raw official-build APNs tokens on the gateway.
-   To allow hosted relay usage only for official/TestFlight OpenClaw builds.
-   To prevent one gateway from sending wake pushes to iOS devices owned by a different gateway.

Local/manual builds remain on direct APNs. If you are testing those builds without the relay, the gateway still needs direct APNs credentials:

Copy

```
export OPENCLAW_APNS_TEAM_ID="TEAMID"
export OPENCLAW_APNS_KEY_ID="KEYID"
export OPENCLAW_APNS_PRIVATE_KEY_P8="$(cat /path/to/AuthKey_KEYID.p8)"
```

## 

[​

](https://docs.openclaw.ai/platforms/ios)

Discovery paths

### 

[​

](https://docs.openclaw.ai/platforms/ios)

Bonjour (LAN)

The Gateway advertises `_openclaw-gw._tcp` on `local.`. The iOS app lists these automatically.

### 

[​

](https://docs.openclaw.ai/platforms/ios)

Tailnet (cross-network)

If mDNS is blocked, use a unicast DNS-SD zone (choose a domain; example: `openclaw.internal.`) and Tailscale split DNS. See [Bonjour](https://docs.openclaw.ai/gateway/bonjour) for the CoreDNS example.

### 

[​

](https://docs.openclaw.ai/platforms/ios)

Manual host/port

In Settings, enable **Manual Host** and enter the gateway host + port (default `18789`).

## 

[​

](https://docs.openclaw.ai/platforms/ios)

Canvas + A2UI

The iOS node renders a WKWebView canvas. Use `node.invoke` to drive it:

Copy

```
openclaw nodes invoke --node "iOS Node" --command canvas.navigate --params '{"url":"http://<gateway-host>:18789/__openclaw__/canvas/"}'
```

Notes:

-   The Gateway canvas host serves `/__openclaw__/canvas/` and `/__openclaw__/a2ui/`.
-   It is served from the Gateway HTTP server (same port as `gateway.port`, default `18789`).
-   The iOS node auto-navigates to A2UI on connect when a canvas host URL is advertised.
-   Return to the built-in scaffold with `canvas.navigate` and `{"url":""}`.

### 

[​

](https://docs.openclaw.ai/platforms/ios)

Canvas eval / snapshot

Copy

```
openclaw nodes invoke --node "iOS Node" --command canvas.eval --params '{"javaScript":"(() => { const {ctx} = window.__openclaw; ctx.clearRect(0,0,innerWidth,innerHeight); ctx.lineWidth=6; ctx.strokeStyle=\"#ff2d55\"; ctx.beginPath(); ctx.moveTo(40,40); ctx.lineTo(innerWidth-40, innerHeight-40); ctx.stroke(); return \"ok\"; })()"}'
```

Copy

```
openclaw nodes invoke --node "iOS Node" --command canvas.snapshot --params '{"maxWidth":900,"format":"jpeg"}'
```

## 

[​

](https://docs.openclaw.ai/platforms/ios)

Voice wake + talk mode

-   Voice wake and talk mode are available in Settings.
-   iOS may suspend background audio; treat voice features as best-effort when the app is not active.

## 

[​

](https://docs.openclaw.ai/platforms/ios)

Common errors

-   `NODE_BACKGROUND_UNAVAILABLE`: bring the iOS app to the foreground (canvas/camera/screen commands require it).
-   `A2UI_HOST_NOT_CONFIGURED`: the Gateway did not advertise a canvas host URL; check `canvasHost` in [Gateway configuration](https://docs.openclaw.ai/gateway/configuration).
-   Pairing prompt never appears: run `openclaw devices list` and approve manually.
-   Reconnect fails after reinstall: the Keychain pairing token was cleared; re-pair the node.

## 

[​

](https://docs.openclaw.ai/platforms/ios)

Related docs

-   [Pairing](https://docs.openclaw.ai/channels/pairing)
-   [Discovery](https://docs.openclaw.ai/gateway/discovery)
-   [Bonjour](https://docs.openclaw.ai/gateway/bonjour)

[Android App](https://docs.openclaw.ai/platforms/android)[DigitalOcean](https://docs.openclaw.ai/platforms/digitalocean)

⌘I
