<!-- Source: https://docs.openclaw.ai/ci -->
<!-- Title: CI Pipeline - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/ci)

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

-   [CI Pipeline](https://docs.openclaw.ai/ci)
-   [Job Overview](https://docs.openclaw.ai/ci)
-   [Fail-Fast Order](https://docs.openclaw.ai/ci)
-   [Runners](https://docs.openclaw.ai/ci)
-   [Local Equivalents](https://docs.openclaw.ai/ci)

Contributing

# CI Pipeline

How the OpenClaw CI pipeline works

# 

[​

](https://docs.openclaw.ai/ci)

CI Pipeline

The CI runs on every push to `main` and every pull request. It uses smart scoping to skip expensive jobs when only unrelated areas changed.

## 

[​

](https://docs.openclaw.ai/ci)

Job Overview

| Job | Purpose | When it runs |
| --- | --- | --- |
| `docs-scope` | Detect docs-only changes | Always |
| `changed-scope` | Detect which areas changed (node/macos/android/windows) | Non-doc changes |
| `check` | TypeScript types, lint, format | Non-docs, node changes |
| `check-docs` | Markdown lint + broken link check | Docs changed |
| `secrets` | Detect leaked secrets | Always |
| `build-artifacts` | Build dist once, share with `release-check` | Pushes to `main`, node changes |
| `release-check` | Validate npm pack contents | Pushes to `main` after build |
| `checks` | Node tests + protocol check on PRs; Bun compat on push | Non-docs, node changes |
| `compat-node22` | Minimum supported Node runtime compatibility | Pushes to `main`, node changes |
| `checks-windows` | Windows-specific tests | Non-docs, windows-relevant changes |
| `macos` | Swift lint/build/test + TS tests | PRs with macos changes |
| `android` | Gradle build + tests | Non-docs, android changes |

## 

[​

](https://docs.openclaw.ai/ci)

Fail-Fast Order

Jobs are ordered so cheap checks fail before expensive ones run:

1.  `docs-scope` + `changed-scope` + `check` + `secrets` (parallel, cheap gates first)
2.  PRs: `checks` (Linux Node test split into 2 shards), `checks-windows`, `macos`, `android`
3.  Pushes to `main`: `build-artifacts` + `release-check` + Bun compat + `compat-node22`

Scope logic lives in `scripts/ci-changed-scope.mjs` and is covered by unit tests in `src/scripts/ci-changed-scope.test.ts`.

## 

[​

](https://docs.openclaw.ai/ci)

Runners

| Runner | Jobs |
| --- | --- |
| `blacksmith-16vcpu-ubuntu-2404` | Most Linux jobs, including scope detection |
| `blacksmith-32vcpu-windows-2025` | `checks-windows` |
| `macos-latest` | `macos`, `ios` |

## 

[​

](https://docs.openclaw.ai/ci)

Local Equivalents

Copy

```
pnpm check          # types + lint + format
pnpm test           # vitest tests
pnpm check:docs     # docs format + lint + broken links
pnpm release:check  # validate npm pack
```

[Pi Development Workflow](https://docs.openclaw.ai/pi-dev)[Docs Hubs](https://docs.openclaw.ai/start/hubs)

⌘I
