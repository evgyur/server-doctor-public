<!-- Source: https://docs.openclaw.ai/debug/node-issue -->
<!-- Title: Node + tsx Crash - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/debug/node-issue)

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

##### Help

-   [
    
    Help
    
    
    
    ](https://docs.openclaw.ai/help)
-   [
    
    Troubleshooting
    
    
    
    ](https://docs.openclaw.ai/help/troubleshooting)
-   [
    
    FAQ
    
    
    
    ](https://docs.openclaw.ai/help/faq)

##### Community

-   [
    
    OpenClaw Lore
    
    
    
    ](https://docs.openclaw.ai/start/lore)

##### Environment and debugging

-   [
    
    Environment Variables
    
    
    
    ](https://docs.openclaw.ai/help/environment)
-   [
    
    Debugging
    
    
    
    ](https://docs.openclaw.ai/help/debugging)
-   [
    
    Testing
    
    
    
    ](https://docs.openclaw.ai/help/testing)
-   [
    
    Scripts
    
    
    
    ](https://docs.openclaw.ai/help/scripts)
-   [
    
    Node + tsx Crash
    
    
    
    ](https://docs.openclaw.ai/debug/node-issue)
-   [
    
    Diagnostics Flags
    
    
    
    ](https://docs.openclaw.ai/diagnostics/flags)

##### Node runtime

-   [
    
    Node.js
    
    
    
    ](https://docs.openclaw.ai/install/node)

##### Compaction internals

-   [
    
    Session Management Deep Dive
    
    
    
    ](https://docs.openclaw.ai/reference/session-management-compaction)

##### Developer setup

-   [
    
    Setup
    
    
    
    ](https://docs.openclaw.ai/start/setup)
-   [
    
    Pi Development Workflow
    
    
    
    ](https://docs.openclaw.ai/pi-dev)

##### Contributing

-   [
    
    CI Pipeline
    
    
    
    ](https://docs.openclaw.ai/ci)

##### Docs meta

-   [
    
    Docs Hubs
    
    
    
    ](https://docs.openclaw.ai/start/hubs)
-   [
    
    Docs directory
    
    
    
    ](https://docs.openclaw.ai/start/docs-directory)

-   [Node + tsx “\_\_name is not a function” crash](https://docs.openclaw.ai/debug/node-issue)
-   [Summary](https://docs.openclaw.ai/debug/node-issue)
-   [Environment](https://docs.openclaw.ai/debug/node-issue)
-   [Repro (Node-only)](https://docs.openclaw.ai/debug/node-issue)
-   [Minimal repro in repo](https://docs.openclaw.ai/debug/node-issue)
-   [Node version check](https://docs.openclaw.ai/debug/node-issue)
-   [Notes / hypothesis](https://docs.openclaw.ai/debug/node-issue)
-   [Regression history](https://docs.openclaw.ai/debug/node-issue)
-   [Workarounds](https://docs.openclaw.ai/debug/node-issue)
-   [References](https://docs.openclaw.ai/debug/node-issue)
-   [Next steps](https://docs.openclaw.ai/debug/node-issue)

Environment and debugging

# Node + tsx Crash

# 

[​

](https://docs.openclaw.ai/debug/node-issue)

Node + tsx “\_\_name is not a function” crash

## 

[​

](https://docs.openclaw.ai/debug/node-issue)

Summary

Running OpenClaw via Node with `tsx` fails at startup with:

Copy

```
[openclaw] Failed to start CLI: TypeError: __name is not a function
    at createSubsystemLogger (.../src/logging/subsystem.ts:203:25)
    at .../src/agents/auth-profiles/constants.ts:25:20
```

This began after switching dev scripts from Bun to `tsx` (commit `2871657e`, 2026-01-06). The same runtime path worked with Bun.

## 

[​

](https://docs.openclaw.ai/debug/node-issue)

Environment

-   Node: v25.x (observed on v25.3.0)
-   tsx: 4.21.0
-   OS: macOS (repro also likely on other platforms that run Node 25)

## 

[​

](https://docs.openclaw.ai/debug/node-issue)

Repro (Node-only)

Copy

```
# in repo root
node --version
pnpm install
node --import tsx src/entry.ts status
```

## 

[​

](https://docs.openclaw.ai/debug/node-issue)

Minimal repro in repo

Copy

```
node --import tsx scripts/repro/tsx-name-repro.ts
```

## 

[​

](https://docs.openclaw.ai/debug/node-issue)

Node version check

-   Node 25.3.0: fails
-   Node 22.22.0 (Homebrew `node@22`): fails
-   Node 24: not installed here yet; needs verification

## 

[​

](https://docs.openclaw.ai/debug/node-issue)

Notes / hypothesis

-   `tsx` uses esbuild to transform TS/ESM. esbuild’s `keepNames` emits a `__name` helper and wraps function definitions with `__name(...)`.
-   The crash indicates `__name` exists but is not a function at runtime, which implies the helper is missing or overwritten for this module in the Node 25 loader path.
-   Similar `__name` helper issues have been reported in other esbuild consumers when the helper is missing or rewritten.

## 

[​

](https://docs.openclaw.ai/debug/node-issue)

Regression history

-   `2871657e` (2026-01-06): scripts changed from Bun to tsx to make Bun optional.
-   Before that (Bun path), `openclaw status` and `gateway:watch` worked.

## 

[​

](https://docs.openclaw.ai/debug/node-issue)

Workarounds

-   Use Bun for dev scripts (current temporary revert).
-   Use Node + tsc watch, then run compiled output:
    
    Copy
    
    ```
    pnpm exec tsc --watch --preserveWatchOutput
    node --watch openclaw.mjs status
    ```
    
-   Confirmed locally: `pnpm exec tsc -p tsconfig.json` + `node openclaw.mjs status` works on Node 25.
-   Disable esbuild keepNames in the TS loader if possible (prevents `__name` helper insertion); tsx does not currently expose this.
-   Test Node LTS (22/24) with `tsx` to see if the issue is Node 25–specific.

## 

[​

](https://docs.openclaw.ai/debug/node-issue)

References

-   [https://opennext.js.org/cloudflare/howtos/keep\_names](https://opennext.js.org/cloudflare/howtos/keep_names)
-   [https://esbuild.github.io/api/#keep-names](https://esbuild.github.io/api)
-   [https://github.com/evanw/esbuild/issues/1031](https://github.com/evanw/esbuild/issues/1031)

## 

[​

](https://docs.openclaw.ai/debug/node-issue)

Next steps

-   Repro on Node 22/24 to confirm Node 25 regression.
-   Test `tsx` nightly or pin to earlier version if a known regression exists.
-   If reproduces on Node LTS, file a minimal repro upstream with the `__name` stack trace.

[Scripts](https://docs.openclaw.ai/help/scripts)[Diagnostics Flags](https://docs.openclaw.ai/diagnostics/flags)

⌘I
