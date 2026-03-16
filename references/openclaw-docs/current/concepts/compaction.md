<!-- Source: https://docs.openclaw.ai/concepts/compaction -->
<!-- Title: Compaction - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/concepts/compaction)

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

-   [Context Window & Compaction](https://docs.openclaw.ai/concepts/compaction)
-   [What compaction is](https://docs.openclaw.ai/concepts/compaction)
-   [Configuration](https://docs.openclaw.ai/concepts/compaction)
-   [Auto-compaction (default on)](https://docs.openclaw.ai/concepts/compaction)
-   [Manual compaction](https://docs.openclaw.ai/concepts/compaction)
-   [Context window source](https://docs.openclaw.ai/concepts/compaction)
-   [Compaction vs pruning](https://docs.openclaw.ai/concepts/compaction)
-   [OpenAI server-side compaction](https://docs.openclaw.ai/concepts/compaction)
-   [Tips](https://docs.openclaw.ai/concepts/compaction)

Sessions and memory

# Compaction

# 

[​

](https://docs.openclaw.ai/concepts/compaction)

Context Window & Compaction

Every model has a **context window** (max tokens it can see). Long-running chats accumulate messages and tool results; once the window is tight, OpenClaw **compacts** older history to stay within limits.

## 

[​

](https://docs.openclaw.ai/concepts/compaction)

What compaction is

Compaction **summarizes older conversation** into a compact summary entry and keeps recent messages intact. The summary is stored in the session history, so future requests use:

-   The compaction summary
-   Recent messages after the compaction point

Compaction **persists** in the session’s JSONL history.

## 

[​

](https://docs.openclaw.ai/concepts/compaction)

Configuration

Use the `agents.defaults.compaction` setting in your `openclaw.json` to configure compaction behavior (mode, target tokens, etc.). Compaction summarization preserves opaque identifiers by default (`identifierPolicy: "strict"`). You can override this with `identifierPolicy: "off"` or provide custom text with `identifierPolicy: "custom"` and `identifierInstructions`. You can optionally specify a different model for compaction summarization via `agents.defaults.compaction.model`. This is useful when your primary model is a local or small model and you want compaction summaries produced by a more capable model. The override accepts any `provider/model-id` string:

Copy

```
{
  "agents": {
    "defaults": {
      "compaction": {
        "model": "openrouter/anthropic/claude-sonnet-4-5"
      }
    }
  }
}
```

This also works with local models, for example a second Ollama model dedicated to summarization or a fine-tuned compaction specialist:

Copy

```
{
  "agents": {
    "defaults": {
      "compaction": {
        "model": "ollama/llama3.1:8b"
      }
    }
  }
}
```

When unset, compaction uses the agent’s primary model.

## 

[​

](https://docs.openclaw.ai/concepts/compaction)

Auto-compaction (default on)

When a session nears or exceeds the model’s context window, OpenClaw triggers auto-compaction and may retry the original request using the compacted context. You’ll see:

-   `🧹 Auto-compaction complete` in verbose mode
-   `/status` showing `🧹 Compactions: <count>`

Before compaction, OpenClaw can run a **silent memory flush** turn to store durable notes to disk. See [Memory](https://docs.openclaw.ai/concepts/memory) for details and config.

## 

[​

](https://docs.openclaw.ai/concepts/compaction)

Manual compaction

Use `/compact` (optionally with instructions) to force a compaction pass:

Copy

```
/compact Focus on decisions and open questions
```

## 

[​

](https://docs.openclaw.ai/concepts/compaction)

Context window source

Context window is model-specific. OpenClaw uses the model definition from the configured provider catalog to determine limits.

## 

[​

](https://docs.openclaw.ai/concepts/compaction)

Compaction vs pruning

-   **Compaction**: summarises and **persists** in JSONL.
-   **Session pruning**: trims old **tool results** only, **in-memory**, per request.

See [/concepts/session-pruning](https://docs.openclaw.ai/concepts/session-pruning) for pruning details.

## 

[​

](https://docs.openclaw.ai/concepts/compaction)

OpenAI server-side compaction

OpenClaw also supports OpenAI Responses server-side compaction hints for compatible direct OpenAI models. This is separate from local OpenClaw compaction and can run alongside it.

-   Local compaction: OpenClaw summarizes and persists into session JSONL.
-   Server-side compaction: OpenAI compacts context on the provider side when `store` + `context_management` are enabled.

See [OpenAI provider](https://docs.openclaw.ai/providers/openai) for model params and overrides.

## 

[​

](https://docs.openclaw.ai/concepts/compaction)

Tips

-   Use `/compact` when sessions feel stale or context is bloated.
-   Large tool outputs are already truncated; pruning can further reduce tool-result buildup.
-   If you need a fresh slate, `/new` or `/reset` starts a new session id.

[Memory](https://docs.openclaw.ai/concepts/memory)[Multi-Agent Routing](https://docs.openclaw.ai/concepts/multi-agent)

⌘I
