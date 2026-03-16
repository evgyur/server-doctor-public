<!-- Source: https://docs.openclaw.ai/concepts/session-pruning -->
<!-- Title: Session Pruning - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/concepts/session-pruning)

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

##### Fundamentals

-   [
    
    Pi Integration Architecture
    
    
    
    ](https://docs.openclaw.ai/pi)
-   [
    
    Gateway Architecture
    
    
    
    ](https://docs.openclaw.ai/concepts/architecture)
-   [
    
    Agent Runtime
    
    
    
    ](https://docs.openclaw.ai/concepts/agent)
-   [
    
    Agent Loop
    
    
    
    ](https://docs.openclaw.ai/concepts/agent-loop)
-   [
    
    System Prompt
    
    
    
    ](https://docs.openclaw.ai/concepts/system-prompt)
-   [
    
    Context
    
    
    
    ](https://docs.openclaw.ai/concepts/context)
-   [
    
    Agent Workspace
    
    
    
    ](https://docs.openclaw.ai/concepts/agent-workspace)
-   [
    
    OAuth
    
    
    
    ](https://docs.openclaw.ai/concepts/oauth)

##### Bootstrapping

-   [
    
    Bootstrapping
    
    
    
    ](https://docs.openclaw.ai/start/bootstrapping)

##### Sessions and memory

-   [
    
    Session Management
    
    
    
    ](https://docs.openclaw.ai/concepts/session)
-   [
    
    Session Pruning
    
    
    
    ](https://docs.openclaw.ai/concepts/session-pruning)
-   [
    
    Session Tools
    
    
    
    ](https://docs.openclaw.ai/concepts/session-tool)
-   [
    
    Memory
    
    
    
    ](https://docs.openclaw.ai/concepts/memory)
-   [
    
    Compaction
    
    
    
    ](https://docs.openclaw.ai/concepts/compaction)

##### Multi-agent

-   [
    
    Multi-Agent Routing
    
    
    
    ](https://docs.openclaw.ai/concepts/multi-agent)
-   [
    
    Presence
    
    
    
    ](https://docs.openclaw.ai/concepts/presence)

##### Messages and delivery

-   [
    
    Messages
    
    
    
    ](https://docs.openclaw.ai/concepts/messages)
-   [
    
    Streaming and Chunking
    
    
    
    ](https://docs.openclaw.ai/concepts/streaming)
-   [
    
    Retry Policy
    
    
    
    ](https://docs.openclaw.ai/concepts/retry)
-   [
    
    Command Queue
    
    
    
    ](https://docs.openclaw.ai/concepts/queue)

-   [Session Pruning](https://docs.openclaw.ai/concepts/session-pruning)
-   [When it runs](https://docs.openclaw.ai/concepts/session-pruning)
-   [Smart defaults (Anthropic)](https://docs.openclaw.ai/concepts/session-pruning)
-   [What this improves (cost + cache behavior)](https://docs.openclaw.ai/concepts/session-pruning)
-   [What can be pruned](https://docs.openclaw.ai/concepts/session-pruning)
-   [Context window estimation](https://docs.openclaw.ai/concepts/session-pruning)
-   [Mode](https://docs.openclaw.ai/concepts/session-pruning)
-   [cache-ttl](https://docs.openclaw.ai/concepts/session-pruning)
-   [Soft vs hard pruning](https://docs.openclaw.ai/concepts/session-pruning)
-   [Tool selection](https://docs.openclaw.ai/concepts/session-pruning)
-   [Interaction with other limits](https://docs.openclaw.ai/concepts/session-pruning)
-   [Defaults (when enabled)](https://docs.openclaw.ai/concepts/session-pruning)
-   [Examples](https://docs.openclaw.ai/concepts/session-pruning)

Sessions and memory

# Session Pruning

# 

[​

](https://docs.openclaw.ai/concepts/session-pruning)

Session Pruning

Session pruning trims **old tool results** from the in-memory context right before each LLM call. It does **not** rewrite the on-disk session history (`*.jsonl`).

## 

[​

](https://docs.openclaw.ai/concepts/session-pruning)

When it runs

-   When `mode: "cache-ttl"` is enabled and the last Anthropic call for the session is older than `ttl`.
-   Only affects the messages sent to the model for that request.
-   Only active for Anthropic API calls (and OpenRouter Anthropic models).
-   For best results, match `ttl` to your model `cacheRetention` policy (`short` = 5m, `long` = 1h).
-   After a prune, the TTL window resets so subsequent requests keep cache until `ttl` expires again.

## 

[​

](https://docs.openclaw.ai/concepts/session-pruning)

Smart defaults (Anthropic)

-   **OAuth or setup-token** profiles: enable `cache-ttl` pruning and set heartbeat to `1h`.
-   **API key** profiles: enable `cache-ttl` pruning, set heartbeat to `30m`, and default `cacheRetention: "short"` on Anthropic models.
-   If you set any of these values explicitly, OpenClaw does **not** override them.

## 

[​

](https://docs.openclaw.ai/concepts/session-pruning)

What this improves (cost + cache behavior)

-   **Why prune:** Anthropic prompt caching only applies within the TTL. If a session goes idle past the TTL, the next request re-caches the full prompt unless you trim it first.
-   **What gets cheaper:** pruning reduces the **cacheWrite** size for that first request after the TTL expires.
-   **Why the TTL reset matters:** once pruning runs, the cache window resets, so follow‑up requests can reuse the freshly cached prompt instead of re-caching the full history again.
-   **What it does not do:** pruning doesn’t add tokens or “double” costs; it only changes what gets cached on that first post‑TTL request.

## 

[​

](https://docs.openclaw.ai/concepts/session-pruning)

What can be pruned

-   Only `toolResult` messages.
-   User + assistant messages are **never** modified.
-   The last `keepLastAssistants` assistant messages are protected; tool results after that cutoff are not pruned.
-   If there aren’t enough assistant messages to establish the cutoff, pruning is skipped.
-   Tool results containing **image blocks** are skipped (never trimmed/cleared).

## 

[​

](https://docs.openclaw.ai/concepts/session-pruning)

Context window estimation

Pruning uses an estimated context window (chars ≈ tokens × 4). The base window is resolved in this order:

1.  `models.providers.*.models[].contextWindow` override.
2.  Model definition `contextWindow` (from the model registry).
3.  Default `200000` tokens.

If `agents.defaults.contextTokens` is set, it is treated as a cap (min) on the resolved window.

## 

[​

](https://docs.openclaw.ai/concepts/session-pruning)

Mode

### 

[​

](https://docs.openclaw.ai/concepts/session-pruning)

cache-ttl

-   Pruning only runs if the last Anthropic call is older than `ttl` (default `5m`).
-   When it runs: same soft-trim + hard-clear behavior as before.

## 

[​

](https://docs.openclaw.ai/concepts/session-pruning)

Soft vs hard pruning

-   **Soft-trim**: only for oversized tool results.
    -   Keeps head + tail, inserts `...`, and appends a note with the original size.
    -   Skips results with image blocks.
-   **Hard-clear**: replaces the entire tool result with `hardClear.placeholder`.

## 

[​

](https://docs.openclaw.ai/concepts/session-pruning)

Tool selection

-   `tools.allow` / `tools.deny` support `*` wildcards.
-   Deny wins.
-   Matching is case-insensitive.
-   Empty allow list => all tools allowed.

## 

[​

](https://docs.openclaw.ai/concepts/session-pruning)

Interaction with other limits

-   Built-in tools already truncate their own output; session pruning is an extra layer that prevents long-running chats from accumulating too much tool output in the model context.
-   Compaction is separate: compaction summarizes and persists, pruning is transient per request. See [/concepts/compaction](https://docs.openclaw.ai/concepts/compaction).

## 

[​

](https://docs.openclaw.ai/concepts/session-pruning)

Defaults (when enabled)

-   `ttl`: `"5m"`
-   `keepLastAssistants`: `3`
-   `softTrimRatio`: `0.3`
-   `hardClearRatio`: `0.5`
-   `minPrunableToolChars`: `50000`
-   `softTrim`: `{ maxChars: 4000, headChars: 1500, tailChars: 1500 }`
-   `hardClear`: `{ enabled: true, placeholder: "[Old tool result content cleared]" }`

## 

[​

](https://docs.openclaw.ai/concepts/session-pruning)

Examples

Default (off):

Copy

```
{
  agents: { defaults: { contextPruning: { mode: "off" } } },
}
```

Enable TTL-aware pruning:

Copy

```
{
  agents: { defaults: { contextPruning: { mode: "cache-ttl", ttl: "5m" } } },
}
```

Restrict pruning to specific tools:

Copy

```
{
  agents: {
    defaults: {
      contextPruning: {
        mode: "cache-ttl",
        tools: { allow: ["exec", "read"], deny: ["*image*"] },
      },
    },
  },
}
```

See config reference: [Gateway Configuration](https://docs.openclaw.ai/gateway/configuration)

[Session Management](https://docs.openclaw.ai/concepts/session)[Session Tools](https://docs.openclaw.ai/concepts/session-tool)

⌘I
