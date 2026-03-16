<!-- Source: https://docs.openclaw.ai/concepts/streaming -->
<!-- Title: Streaming and Chunking - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/concepts/streaming)

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

-   [Streaming + chunking](https://docs.openclaw.ai/concepts/streaming)
-   [Block streaming (channel messages)](https://docs.openclaw.ai/concepts/streaming)
-   [Chunking algorithm (low/high bounds)](https://docs.openclaw.ai/concepts/streaming)
-   [Coalescing (merge streamed blocks)](https://docs.openclaw.ai/concepts/streaming)
-   [Human-like pacing between blocks](https://docs.openclaw.ai/concepts/streaming)
-   [“Stream chunks or everything”](https://docs.openclaw.ai/concepts/streaming)
-   [Preview streaming modes](https://docs.openclaw.ai/concepts/streaming)
-   [Channel mapping](https://docs.openclaw.ai/concepts/streaming)
-   [Runtime behavior](https://docs.openclaw.ai/concepts/streaming)

Messages and delivery

# Streaming and Chunking

# 

[​

](https://docs.openclaw.ai/concepts/streaming)

Streaming + chunking

OpenClaw has two separate streaming layers:

-   **Block streaming (channels):** emit completed **blocks** as the assistant writes. These are normal channel messages (not token deltas).
-   **Preview streaming (Telegram/Discord/Slack):** update a temporary **preview message** while generating.

There is **no true token-delta streaming** to channel messages today. Preview streaming is message-based (send + edits/appends).

## 

[​

](https://docs.openclaw.ai/concepts/streaming)

Block streaming (channel messages)

Block streaming sends assistant output in coarse chunks as it becomes available.

Copy

```
Model output
  └─ text_delta/events
       ├─ (blockStreamingBreak=text_end)
       │    └─ chunker emits blocks as buffer grows
       └─ (blockStreamingBreak=message_end)
            └─ chunker flushes at message_end
                   └─ channel send (block replies)
```

Legend:

-   `text_delta/events`: model stream events (may be sparse for non-streaming models).
-   `chunker`: `EmbeddedBlockChunker` applying min/max bounds + break preference.
-   `channel send`: actual outbound messages (block replies).

**Controls:**

-   `agents.defaults.blockStreamingDefault`: `"on"`/`"off"` (default off).
-   Channel overrides: `*.blockStreaming` (and per-account variants) to force `"on"`/`"off"` per channel.
-   `agents.defaults.blockStreamingBreak`: `"text_end"` or `"message_end"`.
-   `agents.defaults.blockStreamingChunk`: `{ minChars, maxChars, breakPreference? }`.
-   `agents.defaults.blockStreamingCoalesce`: `{ minChars?, maxChars?, idleMs? }` (merge streamed blocks before send).
-   Channel hard cap: `*.textChunkLimit` (e.g., `channels.whatsapp.textChunkLimit`).
-   Channel chunk mode: `*.chunkMode` (`length` default, `newline` splits on blank lines (paragraph boundaries) before length chunking).
-   Discord soft cap: `channels.discord.maxLinesPerMessage` (default 17) splits tall replies to avoid UI clipping.

**Boundary semantics:**

-   `text_end`: stream blocks as soon as chunker emits; flush on each `text_end`.
-   `message_end`: wait until assistant message finishes, then flush buffered output.

`message_end` still uses the chunker if the buffered text exceeds `maxChars`, so it can emit multiple chunks at the end.

## 

[​

](https://docs.openclaw.ai/concepts/streaming)

Chunking algorithm (low/high bounds)

Block chunking is implemented by `EmbeddedBlockChunker`:

-   **Low bound:** don’t emit until buffer >= `minChars` (unless forced).
-   **High bound:** prefer splits before `maxChars`; if forced, split at `maxChars`.
-   **Break preference:** `paragraph` → `newline` → `sentence` → `whitespace` → hard break.
-   **Code fences:** never split inside fences; when forced at `maxChars`, close + reopen the fence to keep Markdown valid.

`maxChars` is clamped to the channel `textChunkLimit`, so you can’t exceed per-channel caps.

## 

[​

](https://docs.openclaw.ai/concepts/streaming)

Coalescing (merge streamed blocks)

When block streaming is enabled, OpenClaw can **merge consecutive block chunks** before sending them out. This reduces “single-line spam” while still providing progressive output.

-   Coalescing waits for **idle gaps** (`idleMs`) before flushing.
-   Buffers are capped by `maxChars` and will flush if they exceed it.
-   `minChars` prevents tiny fragments from sending until enough text accumulates (final flush always sends remaining text).
-   Joiner is derived from `blockStreamingChunk.breakPreference` (`paragraph` → `\n\n`, `newline` → `\n`, `sentence` → space).
-   Channel overrides are available via `*.blockStreamingCoalesce` (including per-account configs).
-   Default coalesce `minChars` is bumped to 1500 for Signal/Slack/Discord unless overridden.

## 

[​

](https://docs.openclaw.ai/concepts/streaming)

Human-like pacing between blocks

When block streaming is enabled, you can add a **randomized pause** between block replies (after the first block). This makes multi-bubble responses feel more natural.

-   Config: `agents.defaults.humanDelay` (override per agent via `agents.list[].humanDelay`).
-   Modes: `off` (default), `natural` (800–2500ms), `custom` (`minMs`/`maxMs`).
-   Applies only to **block replies**, not final replies or tool summaries.

## 

[​

](https://docs.openclaw.ai/concepts/streaming)

“Stream chunks or everything”

This maps to:

-   **Stream chunks:** `blockStreamingDefault: "on"` + `blockStreamingBreak: "text_end"` (emit as you go). Non-Telegram channels also need `*.blockStreaming: true`.
-   **Stream everything at end:** `blockStreamingBreak: "message_end"` (flush once, possibly multiple chunks if very long).
-   **No block streaming:** `blockStreamingDefault: "off"` (only final reply).

**Channel note:** Block streaming is **off unless** `*.blockStreaming` is explicitly set to `true`. Channels can stream a live preview (`channels.<channel>.streaming`) without block replies. Config location reminder: the `blockStreaming*` defaults live under `agents.defaults`, not the root config.

## 

[​

](https://docs.openclaw.ai/concepts/streaming)

Preview streaming modes

Canonical key: `channels.<channel>.streaming` Modes:

-   `off`: disable preview streaming.
-   `partial`: single preview that is replaced with latest text.
-   `block`: preview updates in chunked/appended steps.
-   `progress`: progress/status preview during generation, final answer at completion.

### 

[​

](https://docs.openclaw.ai/concepts/streaming)

Channel mapping

| Channel | `off` | `partial` | `block` | `progress` |
| --- | --- | --- | --- | --- |
| Telegram | ✅ | ✅ | ✅ | maps to `partial` |
| Discord | ✅ | ✅ | ✅ | maps to `partial` |
| Slack | ✅ | ✅ | ✅ | ✅ |

Slack-only:

-   `channels.slack.nativeStreaming` toggles Slack native streaming API calls when `streaming=partial` (default: `true`).

Legacy key migration:

-   Telegram: `streamMode` + boolean `streaming` auto-migrate to `streaming` enum.
-   Discord: `streamMode` + boolean `streaming` auto-migrate to `streaming` enum.
-   Slack: `streamMode` auto-migrates to `streaming` enum; boolean `streaming` auto-migrates to `nativeStreaming`.

### 

[​

](https://docs.openclaw.ai/concepts/streaming)

Runtime behavior

Telegram:

-   Uses `sendMessage` + `editMessageText` preview updates across DMs and group/topics.
-   Preview streaming is skipped when Telegram block streaming is explicitly enabled (to avoid double-streaming).
-   `/reasoning stream` can write reasoning to preview.

Discord:

-   Uses send + edit preview messages.
-   `block` mode uses draft chunking (`draftChunk`).
-   Preview streaming is skipped when Discord block streaming is explicitly enabled.

Slack:

-   `partial` can use Slack native streaming (`chat.startStream`/`append`/`stop`) when available.
-   `block` uses append-style draft previews.
-   `progress` uses status preview text, then final answer.

[Messages](https://docs.openclaw.ai/concepts/messages)[Retry Policy](https://docs.openclaw.ai/concepts/retry)

⌘I
