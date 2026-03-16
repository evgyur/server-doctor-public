<!-- Source: https://docs.openclaw.ai/pi-dev -->
<!-- Title: Pi Development Workflow - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/pi-dev)

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

-   [Pi Development Workflow](https://docs.openclaw.ai/pi-dev)
-   [Type Checking and Linting](https://docs.openclaw.ai/pi-dev)
-   [Running Pi Tests](https://docs.openclaw.ai/pi-dev)
-   [Manual Testing](https://docs.openclaw.ai/pi-dev)
-   [Clean Slate Reset](https://docs.openclaw.ai/pi-dev)
-   [References](https://docs.openclaw.ai/pi-dev)

Developer setup

# Pi Development Workflow

# 

[​

](https://docs.openclaw.ai/pi-dev)

Pi Development Workflow

This guide summarizes a sane workflow for working on the pi integration in OpenClaw.

## 

[​

](https://docs.openclaw.ai/pi-dev)

Type Checking and Linting

-   Type check and build: `pnpm build`
-   Lint: `pnpm lint`
-   Format check: `pnpm format`
-   Full gate before pushing: `pnpm lint && pnpm build && pnpm test`

## 

[​

](https://docs.openclaw.ai/pi-dev)

Running Pi Tests

Run the Pi-focused test set directly with Vitest:

Copy

```
pnpm test -- \
  "src/agents/pi-*.test.ts" \
  "src/agents/pi-embedded-*.test.ts" \
  "src/agents/pi-tools*.test.ts" \
  "src/agents/pi-settings.test.ts" \
  "src/agents/pi-tool-definition-adapter*.test.ts" \
  "src/agents/pi-extensions/**/*.test.ts"
```

To include the live provider exercise:

Copy

```
OPENCLAW_LIVE_TEST=1 pnpm test -- src/agents/pi-embedded-runner-extraparams.live.test.ts
```

This covers the main Pi unit suites:

-   `src/agents/pi-*.test.ts`
-   `src/agents/pi-embedded-*.test.ts`
-   `src/agents/pi-tools*.test.ts`
-   `src/agents/pi-settings.test.ts`
-   `src/agents/pi-tool-definition-adapter.test.ts`
-   `src/agents/pi-extensions/*.test.ts`

## 

[​

](https://docs.openclaw.ai/pi-dev)

Manual Testing

Recommended flow:

-   Run the gateway in dev mode:
    -   `pnpm gateway:dev`
-   Trigger the agent directly:
    -   `pnpm openclaw agent --message "Hello" --thinking low`
-   Use the TUI for interactive debugging:
    -   `pnpm tui`

For tool call behavior, prompt for a `read` or `exec` action so you can see tool streaming and payload handling.

## 

[​

](https://docs.openclaw.ai/pi-dev)

Clean Slate Reset

State lives under the OpenClaw state directory. Default is `~/.openclaw`. If `OPENCLAW_STATE_DIR` is set, use that directory instead. To reset everything:

-   `openclaw.json` for config
-   `credentials/` for auth profiles and tokens
-   `agents/<agentId>/sessions/` for agent session history
-   `agents/<agentId>/sessions.json` for the session index
-   `sessions/` if legacy paths exist
-   `workspace/` if you want a blank workspace

If you only want to reset sessions, delete `agents/<agentId>/sessions/` and `agents/<agentId>/sessions.json` for that agent. Keep `credentials/` if you do not want to reauthenticate.

## 

[​

](https://docs.openclaw.ai/pi-dev)

References

-   [https://docs.openclaw.ai/testing](https://docs.openclaw.ai/testing)
-   [https://docs.openclaw.ai/start/getting-started](https://docs.openclaw.ai/start/getting-started)

[Setup](https://docs.openclaw.ai/start/setup)[CI Pipeline](https://docs.openclaw.ai/ci)

⌘I
