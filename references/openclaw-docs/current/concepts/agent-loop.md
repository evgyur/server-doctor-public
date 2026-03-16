<!-- Source: https://docs.openclaw.ai/concepts/agent-loop -->
<!-- Title: Agent Loop - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/concepts/agent-loop)

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

-   [Agent Loop (OpenClaw)](https://docs.openclaw.ai/concepts/agent-loop)
-   [Entry points](https://docs.openclaw.ai/concepts/agent-loop)
-   [How it works (high-level)](https://docs.openclaw.ai/concepts/agent-loop)
-   [Queueing + concurrency](https://docs.openclaw.ai/concepts/agent-loop)
-   [Session + workspace preparation](https://docs.openclaw.ai/concepts/agent-loop)
-   [Prompt assembly + system prompt](https://docs.openclaw.ai/concepts/agent-loop)
-   [Hook points (where you can intercept)](https://docs.openclaw.ai/concepts/agent-loop)
-   [Internal hooks (Gateway hooks)](https://docs.openclaw.ai/concepts/agent-loop)
-   [Plugin hooks (agent + gateway lifecycle)](https://docs.openclaw.ai/concepts/agent-loop)
-   [Streaming + partial replies](https://docs.openclaw.ai/concepts/agent-loop)
-   [Tool execution + messaging tools](https://docs.openclaw.ai/concepts/agent-loop)
-   [Reply shaping + suppression](https://docs.openclaw.ai/concepts/agent-loop)
-   [Compaction + retries](https://docs.openclaw.ai/concepts/agent-loop)
-   [Event streams (today)](https://docs.openclaw.ai/concepts/agent-loop)
-   [Chat channel handling](https://docs.openclaw.ai/concepts/agent-loop)
-   [Timeouts](https://docs.openclaw.ai/concepts/agent-loop)
-   [Where things can end early](https://docs.openclaw.ai/concepts/agent-loop)

Fundamentals

# Agent Loop

# 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Agent Loop (OpenClaw)

An agentic loop is the full “real” run of an agent: intake → context assembly → model inference → tool execution → streaming replies → persistence. It’s the authoritative path that turns a message into actions and a final reply, while keeping session state consistent. In OpenClaw, a loop is a single, serialized run per session that emits lifecycle and stream events as the model thinks, calls tools, and streams output. This doc explains how that authentic loop is wired end-to-end.

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Entry points

-   Gateway RPC: `agent` and `agent.wait`.
-   CLI: `agent` command.

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

How it works (high-level)

1.  `agent` RPC validates params, resolves session (sessionKey/sessionId), persists session metadata, returns `{ runId, acceptedAt }` immediately.
2.  `agentCommand` runs the agent:
    -   resolves model + thinking/verbose defaults
    -   loads skills snapshot
    -   calls `runEmbeddedPiAgent` (pi-agent-core runtime)
    -   emits **lifecycle end/error** if the embedded loop does not emit one
3.  `runEmbeddedPiAgent`:
    -   serializes runs via per-session + global queues
    -   resolves model + auth profile and builds the pi session
    -   subscribes to pi events and streams assistant/tool deltas
    -   enforces timeout -> aborts run if exceeded
    -   returns payloads + usage metadata
4.  `subscribeEmbeddedPiSession` bridges pi-agent-core events to OpenClaw `agent` stream:
    -   tool events => `stream: "tool"`
    -   assistant deltas => `stream: "assistant"`
    -   lifecycle events => `stream: "lifecycle"` (`phase: "start" | "end" | "error"`)
5.  `agent.wait` uses `waitForAgentJob`:
    -   waits for **lifecycle end/error** for `runId`
    -   returns `{ status: ok|error|timeout, startedAt, endedAt, error? }`

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Queueing + concurrency

-   Runs are serialized per session key (session lane) and optionally through a global lane.
-   This prevents tool/session races and keeps session history consistent.
-   Messaging channels can choose queue modes (collect/steer/followup) that feed this lane system. See [Command Queue](https://docs.openclaw.ai/concepts/queue).

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Session + workspace preparation

-   Workspace is resolved and created; sandboxed runs may redirect to a sandbox workspace root.
-   Skills are loaded (or reused from a snapshot) and injected into env and prompt.
-   Bootstrap/context files are resolved and injected into the system prompt report.
-   A session write lock is acquired; `SessionManager` is opened and prepared before streaming.

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Prompt assembly + system prompt

-   System prompt is built from OpenClaw’s base prompt, skills prompt, bootstrap context, and per-run overrides.
-   Model-specific limits and compaction reserve tokens are enforced.
-   See [System prompt](https://docs.openclaw.ai/concepts/system-prompt) for what the model sees.

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Hook points (where you can intercept)

OpenClaw has two hook systems:

-   **Internal hooks** (Gateway hooks): event-driven scripts for commands and lifecycle events.
-   **Plugin hooks**: extension points inside the agent/tool lifecycle and gateway pipeline.

### 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Internal hooks (Gateway hooks)

-   **`agent:bootstrap`**: runs while building bootstrap files before the system prompt is finalized. Use this to add/remove bootstrap context files.
-   **Command hooks**: `/new`, `/reset`, `/stop`, and other command events (see Hooks doc).

See [Hooks](https://docs.openclaw.ai/automation/hooks) for setup and examples.

### 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Plugin hooks (agent + gateway lifecycle)

These run inside the agent loop or gateway pipeline:

-   **`before_model_resolve`**: runs pre-session (no `messages`) to deterministically override provider/model before model resolution.
-   **`before_prompt_build`**: runs after session load (with `messages`) to inject `prependContext`, `systemPrompt`, `prependSystemContext`, or `appendSystemContext` before prompt submission. Use `prependContext` for per-turn dynamic text and system-context fields for stable guidance that should sit in system prompt space.
-   **`before_agent_start`**: legacy compatibility hook that may run in either phase; prefer the explicit hooks above.
-   **`agent_end`**: inspect the final message list and run metadata after completion.
-   **`before_compaction` / `after_compaction`**: observe or annotate compaction cycles.
-   **`before_tool_call` / `after_tool_call`**: intercept tool params/results.
-   **`tool_result_persist`**: synchronously transform tool results before they are written to the session transcript.
-   **`message_received` / `message_sending` / `message_sent`**: inbound + outbound message hooks.
-   **`session_start` / `session_end`**: session lifecycle boundaries.
-   **`gateway_start` / `gateway_stop`**: gateway lifecycle events.

See [Plugins](https://docs.openclaw.ai/tools/plugin) for the hook API and registration details.

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Streaming + partial replies

-   Assistant deltas are streamed from pi-agent-core and emitted as `assistant` events.
-   Block streaming can emit partial replies either on `text_end` or `message_end`.
-   Reasoning streaming can be emitted as a separate stream or as block replies.
-   See [Streaming](https://docs.openclaw.ai/concepts/streaming) for chunking and block reply behavior.

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Tool execution + messaging tools

-   Tool start/update/end events are emitted on the `tool` stream.
-   Tool results are sanitized for size and image payloads before logging/emitting.
-   Messaging tool sends are tracked to suppress duplicate assistant confirmations.

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Reply shaping + suppression

-   Final payloads are assembled from:
    -   assistant text (and optional reasoning)
    -   inline tool summaries (when verbose + allowed)
    -   assistant error text when the model errors
-   `NO_REPLY` is treated as a silent token and filtered from outgoing payloads.
-   Messaging tool duplicates are removed from the final payload list.
-   If no renderable payloads remain and a tool errored, a fallback tool error reply is emitted (unless a messaging tool already sent a user-visible reply).

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Compaction + retries

-   Auto-compaction emits `compaction` stream events and can trigger a retry.
-   On retry, in-memory buffers and tool summaries are reset to avoid duplicate output.
-   See [Compaction](https://docs.openclaw.ai/concepts/compaction) for the compaction pipeline.

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Event streams (today)

-   `lifecycle`: emitted by `subscribeEmbeddedPiSession` (and as a fallback by `agentCommand`)
-   `assistant`: streamed deltas from pi-agent-core
-   `tool`: streamed tool events from pi-agent-core

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Chat channel handling

-   Assistant deltas are buffered into chat `delta` messages.
-   A chat `final` is emitted on **lifecycle end/error**.

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Timeouts

-   `agent.wait` default: 30s (just the wait). `timeoutMs` param overrides.
-   Agent runtime: `agents.defaults.timeoutSeconds` default 600s; enforced in `runEmbeddedPiAgent` abort timer.

## 

[​

](https://docs.openclaw.ai/concepts/agent-loop)

Where things can end early

-   Agent timeout (abort)
-   AbortSignal (cancel)
-   Gateway disconnect or RPC timeout
-   `agent.wait` timeout (wait-only, does not stop agent)

[Agent Runtime](https://docs.openclaw.ai/concepts/agent)[System Prompt](https://docs.openclaw.ai/concepts/system-prompt)

⌘I
