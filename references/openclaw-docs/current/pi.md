<!-- Source: https://docs.openclaw.ai/pi -->
<!-- Title: Pi Integration Architecture - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/pi)

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

-   [Pi Integration Architecture](https://docs.openclaw.ai/pi)
-   [Overview](https://docs.openclaw.ai/pi)
-   [Package Dependencies](https://docs.openclaw.ai/pi)
-   [File Structure](https://docs.openclaw.ai/pi)
-   [Core Integration Flow](https://docs.openclaw.ai/pi)
-   [1\. Running an Embedded Agent](https://docs.openclaw.ai/pi)
-   [2\. Session Creation](https://docs.openclaw.ai/pi)
-   [3\. Event Subscription](https://docs.openclaw.ai/pi)
-   [4\. Prompting](https://docs.openclaw.ai/pi)
-   [Tool Architecture](https://docs.openclaw.ai/pi)
-   [Tool Pipeline](https://docs.openclaw.ai/pi)
-   [Tool Definition Adapter](https://docs.openclaw.ai/pi)
-   [Tool Split Strategy](https://docs.openclaw.ai/pi)
-   [System Prompt Construction](https://docs.openclaw.ai/pi)
-   [Session Management](https://docs.openclaw.ai/pi)
-   [Session Files](https://docs.openclaw.ai/pi)
-   [Session Caching](https://docs.openclaw.ai/pi)
-   [History Limiting](https://docs.openclaw.ai/pi)
-   [Compaction](https://docs.openclaw.ai/pi)
-   [Authentication & Model Resolution](https://docs.openclaw.ai/pi)
-   [Auth Profiles](https://docs.openclaw.ai/pi)
-   [Model Resolution](https://docs.openclaw.ai/pi)
-   [Failover](https://docs.openclaw.ai/pi)
-   [Pi Extensions](https://docs.openclaw.ai/pi)
-   [Compaction Safeguard](https://docs.openclaw.ai/pi)
-   [Context Pruning](https://docs.openclaw.ai/pi)
-   [Streaming & Block Replies](https://docs.openclaw.ai/pi)
-   [Block Chunking](https://docs.openclaw.ai/pi)
-   [Thinking/Final Tag Stripping](https://docs.openclaw.ai/pi)
-   [Reply Directives](https://docs.openclaw.ai/pi)
-   [Error Handling](https://docs.openclaw.ai/pi)
-   [Error Classification](https://docs.openclaw.ai/pi)
-   [Thinking Level Fallback](https://docs.openclaw.ai/pi)
-   [Sandbox Integration](https://docs.openclaw.ai/pi)
-   [Provider-Specific Handling](https://docs.openclaw.ai/pi)
-   [Anthropic](https://docs.openclaw.ai/pi)
-   [Google/Gemini](https://docs.openclaw.ai/pi)
-   [OpenAI](https://docs.openclaw.ai/pi)
-   [TUI Integration](https://docs.openclaw.ai/pi)
-   [Key Differences from Pi CLI](https://docs.openclaw.ai/pi)
-   [Future Considerations](https://docs.openclaw.ai/pi)
-   [Tests](https://docs.openclaw.ai/pi)

Fundamentals

# Pi Integration Architecture

# 

[​

](https://docs.openclaw.ai/pi)

Pi Integration Architecture

This document describes how OpenClaw integrates with [pi-coding-agent](https://github.com/badlogic/pi-mono/tree/main/packages/coding-agent) and its sibling packages (`pi-ai`, `pi-agent-core`, `pi-tui`) to power its AI agent capabilities.

## 

[​

](https://docs.openclaw.ai/pi)

Overview

OpenClaw uses the pi SDK to embed an AI coding agent into its messaging gateway architecture. Instead of spawning pi as a subprocess or using RPC mode, OpenClaw directly imports and instantiates pi’s `AgentSession` via `createAgentSession()`. This embedded approach provides:

-   Full control over session lifecycle and event handling
-   Custom tool injection (messaging, sandbox, channel-specific actions)
-   System prompt customization per channel/context
-   Session persistence with branching/compaction support
-   Multi-account auth profile rotation with failover
-   Provider-agnostic model switching

## 

[​

](https://docs.openclaw.ai/pi)

Package Dependencies

Copy

```
{
  "@mariozechner/pi-agent-core": "0.49.3",
  "@mariozechner/pi-ai": "0.49.3",
  "@mariozechner/pi-coding-agent": "0.49.3",
  "@mariozechner/pi-tui": "0.49.3"
}
```

| Package | Purpose |
| --- | --- |
| `pi-ai` | Core LLM abstractions: `Model`, `streamSimple`, message types, provider APIs |
| `pi-agent-core` | Agent loop, tool execution, `AgentMessage` types |
| `pi-coding-agent` | High-level SDK: `createAgentSession`, `SessionManager`, `AuthStorage`, `ModelRegistry`, built-in tools |
| `pi-tui` | Terminal UI components (used in OpenClaw’s local TUI mode) |

## 

[​

](https://docs.openclaw.ai/pi)

File Structure

Copy

```
src/agents/
├── pi-embedded-runner.ts          # Re-exports from pi-embedded-runner/
├── pi-embedded-runner/
│   ├── run.ts                     # Main entry: runEmbeddedPiAgent()
│   ├── run/
│   │   ├── attempt.ts             # Single attempt logic with session setup
│   │   ├── params.ts              # RunEmbeddedPiAgentParams type
│   │   ├── payloads.ts            # Build response payloads from run results
│   │   ├── images.ts              # Vision model image injection
│   │   └── types.ts               # EmbeddedRunAttemptResult
│   ├── abort.ts                   # Abort error detection
│   ├── cache-ttl.ts               # Cache TTL tracking for context pruning
│   ├── compact.ts                 # Manual/auto compaction logic
│   ├── extensions.ts              # Load pi extensions for embedded runs
│   ├── extra-params.ts            # Provider-specific stream params
│   ├── google.ts                  # Google/Gemini turn ordering fixes
│   ├── history.ts                 # History limiting (DM vs group)
│   ├── lanes.ts                   # Session/global command lanes
│   ├── logger.ts                  # Subsystem logger
│   ├── model.ts                   # Model resolution via ModelRegistry
│   ├── runs.ts                    # Active run tracking, abort, queue
│   ├── sandbox-info.ts            # Sandbox info for system prompt
│   ├── session-manager-cache.ts   # SessionManager instance caching
│   ├── session-manager-init.ts    # Session file initialization
│   ├── system-prompt.ts           # System prompt builder
│   ├── tool-split.ts              # Split tools into builtIn vs custom
│   ├── types.ts                   # EmbeddedPiAgentMeta, EmbeddedPiRunResult
│   └── utils.ts                   # ThinkLevel mapping, error description
├── pi-embedded-subscribe.ts       # Session event subscription/dispatch
├── pi-embedded-subscribe.types.ts # SubscribeEmbeddedPiSessionParams
├── pi-embedded-subscribe.handlers.ts # Event handler factory
├── pi-embedded-subscribe.handlers.lifecycle.ts
├── pi-embedded-subscribe.handlers.types.ts
├── pi-embedded-block-chunker.ts   # Streaming block reply chunking
├── pi-embedded-messaging.ts       # Messaging tool sent tracking
├── pi-embedded-helpers.ts         # Error classification, turn validation
├── pi-embedded-helpers/           # Helper modules
├── pi-embedded-utils.ts           # Formatting utilities
├── pi-tools.ts                    # createOpenClawCodingTools()
├── pi-tools.abort.ts              # AbortSignal wrapping for tools
├── pi-tools.policy.ts             # Tool allowlist/denylist policy
├── pi-tools.read.ts               # Read tool customizations
├── pi-tools.schema.ts             # Tool schema normalization
├── pi-tools.types.ts              # AnyAgentTool type alias
├── pi-tool-definition-adapter.ts  # AgentTool -> ToolDefinition adapter
├── pi-settings.ts                 # Settings overrides
├── pi-extensions/                 # Custom pi extensions
│   ├── compaction-safeguard.ts    # Safeguard extension
│   ├── compaction-safeguard-runtime.ts
│   ├── context-pruning.ts         # Cache-TTL context pruning extension
│   └── context-pruning/
├── model-auth.ts                  # Auth profile resolution
├── auth-profiles.ts               # Profile store, cooldown, failover
├── model-selection.ts             # Default model resolution
├── models-config.ts               # models.json generation
├── model-catalog.ts               # Model catalog cache
├── context-window-guard.ts        # Context window validation
├── failover-error.ts              # FailoverError class
├── defaults.ts                    # DEFAULT_PROVIDER, DEFAULT_MODEL
├── system-prompt.ts               # buildAgentSystemPrompt()
├── system-prompt-params.ts        # System prompt parameter resolution
├── system-prompt-report.ts        # Debug report generation
├── tool-summaries.ts              # Tool description summaries
├── tool-policy.ts                 # Tool policy resolution
├── transcript-policy.ts           # Transcript validation policy
├── skills.ts                      # Skill snapshot/prompt building
├── skills/                        # Skill subsystem
├── sandbox.ts                     # Sandbox context resolution
├── sandbox/                       # Sandbox subsystem
├── channel-tools.ts               # Channel-specific tool injection
├── openclaw-tools.ts              # OpenClaw-specific tools
├── bash-tools.ts                  # exec/process tools
├── apply-patch.ts                 # apply_patch tool (OpenAI)
├── tools/                         # Individual tool implementations
│   ├── browser-tool.ts
│   ├── canvas-tool.ts
│   ├── cron-tool.ts
│   ├── discord-actions*.ts
│   ├── gateway-tool.ts
│   ├── image-tool.ts
│   ├── message-tool.ts
│   ├── nodes-tool.ts
│   ├── session*.ts
│   ├── slack-actions.ts
│   ├── telegram-actions.ts
│   ├── web-*.ts
│   └── whatsapp-actions.ts
└── ...
```

## 

[​

](https://docs.openclaw.ai/pi)

Core Integration Flow

### 

[​

](https://docs.openclaw.ai/pi)

1\. Running an Embedded Agent

The main entry point is `runEmbeddedPiAgent()` in `pi-embedded-runner/run.ts`:

Copy

```
import { runEmbeddedPiAgent } from "./agents/pi-embedded-runner.js";

const result = await runEmbeddedPiAgent({
  sessionId: "user-123",
  sessionKey: "main:whatsapp:+1234567890",
  sessionFile: "/path/to/session.jsonl",
  workspaceDir: "/path/to/workspace",
  config: openclawConfig,
  prompt: "Hello, how are you?",
  provider: "anthropic",
  model: "claude-sonnet-4-20250514",
  timeoutMs: 120_000,
  runId: "run-abc",
  onBlockReply: async (payload) => {
    await sendToChannel(payload.text, payload.mediaUrls);
  },
});
```

### 

[​

](https://docs.openclaw.ai/pi)

2\. Session Creation

Inside `runEmbeddedAttempt()` (called by `runEmbeddedPiAgent()`), the pi SDK is used:

Copy

```
import {
  createAgentSession,
  DefaultResourceLoader,
  SessionManager,
  SettingsManager,
} from "@mariozechner/pi-coding-agent";

const resourceLoader = new DefaultResourceLoader({
  cwd: resolvedWorkspace,
  agentDir,
  settingsManager,
  additionalExtensionPaths,
});
await resourceLoader.reload();

const { session } = await createAgentSession({
  cwd: resolvedWorkspace,
  agentDir,
  authStorage: params.authStorage,
  modelRegistry: params.modelRegistry,
  model: params.model,
  thinkingLevel: mapThinkingLevel(params.thinkLevel),
  tools: builtInTools,
  customTools: allCustomTools,
  sessionManager,
  settingsManager,
  resourceLoader,
});

applySystemPromptOverrideToSession(session, systemPromptOverride);
```

### 

[​

](https://docs.openclaw.ai/pi)

3\. Event Subscription

`subscribeEmbeddedPiSession()` subscribes to pi’s `AgentSession` events:

Copy

```
const subscription = subscribeEmbeddedPiSession({
  session: activeSession,
  runId: params.runId,
  verboseLevel: params.verboseLevel,
  reasoningMode: params.reasoningLevel,
  toolResultFormat: params.toolResultFormat,
  onToolResult: params.onToolResult,
  onReasoningStream: params.onReasoningStream,
  onBlockReply: params.onBlockReply,
  onPartialReply: params.onPartialReply,
  onAgentEvent: params.onAgentEvent,
});
```

Events handled include:

-   `message_start` / `message_end` / `message_update` (streaming text/thinking)
-   `tool_execution_start` / `tool_execution_update` / `tool_execution_end`
-   `turn_start` / `turn_end`
-   `agent_start` / `agent_end`
-   `auto_compaction_start` / `auto_compaction_end`

### 

[​

](https://docs.openclaw.ai/pi)

4\. Prompting

After setup, the session is prompted:

Copy

```
await session.prompt(effectivePrompt, { images: imageResult.images });
```

The SDK handles the full agent loop: sending to LLM, executing tool calls, streaming responses. Image injection is prompt-local: OpenClaw loads image refs from the current prompt and passes them via `images` for that turn only. It does not re-scan older history turns to re-inject image payloads.

## 

[​

](https://docs.openclaw.ai/pi)

Tool Architecture

### 

[​

](https://docs.openclaw.ai/pi)

Tool Pipeline

1.  **Base Tools**: pi’s `codingTools` (read, bash, edit, write)
2.  **Custom Replacements**: OpenClaw replaces bash with `exec`/`process`, customizes read/edit/write for sandbox
3.  **OpenClaw Tools**: messaging, browser, canvas, sessions, cron, gateway, etc.
4.  **Channel Tools**: Discord/Telegram/Slack/WhatsApp-specific action tools
5.  **Policy Filtering**: Tools filtered by profile, provider, agent, group, sandbox policies
6.  **Schema Normalization**: Schemas cleaned for Gemini/OpenAI quirks
7.  **AbortSignal Wrapping**: Tools wrapped to respect abort signals

### 

[​

](https://docs.openclaw.ai/pi)

Tool Definition Adapter

pi-agent-core’s `AgentTool` has a different `execute` signature than pi-coding-agent’s `ToolDefinition`. The adapter in `pi-tool-definition-adapter.ts` bridges this:

Copy

```
export function toToolDefinitions(tools: AnyAgentTool[]): ToolDefinition[] {
  return tools.map((tool) => ({
    name: tool.name,
    label: tool.label ?? name,
    description: tool.description ?? "",
    parameters: tool.parameters,
    execute: async (toolCallId, params, onUpdate, _ctx, signal) => {
      // pi-coding-agent signature differs from pi-agent-core
      return await tool.execute(toolCallId, params, signal, onUpdate);
    },
  }));
}
```

### 

[​

](https://docs.openclaw.ai/pi)

Tool Split Strategy

`splitSdkTools()` passes all tools via `customTools`:

Copy

```
export function splitSdkTools(options: { tools: AnyAgentTool[]; sandboxEnabled: boolean }) {
  return {
    builtInTools: [], // Empty. We override everything
    customTools: toToolDefinitions(options.tools),
  };
}
```

This ensures OpenClaw’s policy filtering, sandbox integration, and extended toolset remain consistent across providers.

## 

[​

](https://docs.openclaw.ai/pi)

System Prompt Construction

The system prompt is built in `buildAgentSystemPrompt()` (`system-prompt.ts`). It assembles a full prompt with sections including Tooling, Tool Call Style, Safety guardrails, OpenClaw CLI reference, Skills, Docs, Workspace, Sandbox, Messaging, Reply Tags, Voice, Silent Replies, Heartbeats, Runtime metadata, plus Memory and Reactions when enabled, and optional context files and extra system prompt content. Sections are trimmed for minimal prompt mode used by subagents. The prompt is applied after session creation via `applySystemPromptOverrideToSession()`:

Copy

```
const systemPromptOverride = createSystemPromptOverride(appendPrompt);
applySystemPromptOverrideToSession(session, systemPromptOverride);
```

## 

[​

](https://docs.openclaw.ai/pi)

Session Management

### 

[​

](https://docs.openclaw.ai/pi)

Session Files

Sessions are JSONL files with tree structure (id/parentId linking). Pi’s `SessionManager` handles persistence:

Copy

```
const sessionManager = SessionManager.open(params.sessionFile);
```

OpenClaw wraps this with `guardSessionManager()` for tool result safety.

### 

[​

](https://docs.openclaw.ai/pi)

Session Caching

`session-manager-cache.ts` caches SessionManager instances to avoid repeated file parsing:

Copy

```
await prewarmSessionFile(params.sessionFile);
sessionManager = SessionManager.open(params.sessionFile);
trackSessionManagerAccess(params.sessionFile);
```

### 

[​

](https://docs.openclaw.ai/pi)

History Limiting

`limitHistoryTurns()` trims conversation history based on channel type (DM vs group).

### 

[​

](https://docs.openclaw.ai/pi)

Compaction

Auto-compaction triggers on context overflow. `compactEmbeddedPiSessionDirect()` handles manual compaction:

Copy

```
const compactResult = await compactEmbeddedPiSessionDirect({
  sessionId, sessionFile, provider, model, ...
});
```

## 

[​

](https://docs.openclaw.ai/pi)

Authentication & Model Resolution

### 

[​

](https://docs.openclaw.ai/pi)

Auth Profiles

OpenClaw maintains an auth profile store with multiple API keys per provider:

Copy

```
const authStore = ensureAuthProfileStore(agentDir, { allowKeychainPrompt: false });
const profileOrder = resolveAuthProfileOrder({ cfg, store: authStore, provider, preferredProfile });
```

Profiles rotate on failures with cooldown tracking:

Copy

```
await markAuthProfileFailure({ store, profileId, reason, cfg, agentDir });
const rotated = await advanceAuthProfile();
```

### 

[​

](https://docs.openclaw.ai/pi)

Model Resolution

Copy

```
import { resolveModel } from "./pi-embedded-runner/model.js";

const { model, error, authStorage, modelRegistry } = resolveModel(
  provider,
  modelId,
  agentDir,
  config,
);

// Uses pi's ModelRegistry and AuthStorage
authStorage.setRuntimeApiKey(model.provider, apiKeyInfo.apiKey);
```

### 

[​

](https://docs.openclaw.ai/pi)

Failover

`FailoverError` triggers model fallback when configured:

Copy

```
if (fallbackConfigured && isFailoverErrorMessage(errorText)) {
  throw new FailoverError(errorText, {
    reason: promptFailoverReason ?? "unknown",
    provider,
    model: modelId,
    profileId,
    status: resolveFailoverStatus(promptFailoverReason),
  });
}
```

## 

[​

](https://docs.openclaw.ai/pi)

Pi Extensions

OpenClaw loads custom pi extensions for specialized behavior:

### 

[​

](https://docs.openclaw.ai/pi)

Compaction Safeguard

`src/agents/pi-extensions/compaction-safeguard.ts` adds guardrails to compaction, including adaptive token budgeting plus tool failure and file operation summaries:

Copy

```
if (resolveCompactionMode(params.cfg) === "safeguard") {
  setCompactionSafeguardRuntime(params.sessionManager, { maxHistoryShare });
  paths.push(resolvePiExtensionPath("compaction-safeguard"));
}
```

### 

[​

](https://docs.openclaw.ai/pi)

Context Pruning

`src/agents/pi-extensions/context-pruning.ts` implements cache-TTL based context pruning:

Copy

```
if (cfg?.agents?.defaults?.contextPruning?.mode === "cache-ttl") {
  setContextPruningRuntime(params.sessionManager, {
    settings,
    contextWindowTokens,
    isToolPrunable,
    lastCacheTouchAt,
  });
  paths.push(resolvePiExtensionPath("context-pruning"));
}
```

## 

[​

](https://docs.openclaw.ai/pi)

Streaming & Block Replies

### 

[​

](https://docs.openclaw.ai/pi)

Block Chunking

`EmbeddedBlockChunker` manages streaming text into discrete reply blocks:

Copy

```
const blockChunker = blockChunking ? new EmbeddedBlockChunker(blockChunking) : null;
```

### 

[​

](https://docs.openclaw.ai/pi)

Thinking/Final Tag Stripping

Streaming output is processed to strip `<think>`/`<thinking>` blocks and extract `<final>` content:

Copy

```
const stripBlockTags = (text: string, state: { thinking: boolean; final: boolean }) => {
  // Strip <think>...</think> content
  // If enforceFinalTag, only return <final>...</final> content
};
```

### 

[​

](https://docs.openclaw.ai/pi)

Reply Directives

Reply directives like `[[media:url]]`, `[[voice]]`, `[[reply:id]]` are parsed and extracted:

Copy

```
const { text: cleanedText, mediaUrls, audioAsVoice, replyToId } = consumeReplyDirectives(chunk);
```

## 

[​

](https://docs.openclaw.ai/pi)

Error Handling

### 

[​

](https://docs.openclaw.ai/pi)

Error Classification

`pi-embedded-helpers.ts` classifies errors for appropriate handling:

Copy

```
isContextOverflowError(errorText)     // Context too large
isCompactionFailureError(errorText)   // Compaction failed
isAuthAssistantError(lastAssistant)   // Auth failure
isRateLimitAssistantError(...)        // Rate limited
isFailoverAssistantError(...)         // Should failover
classifyFailoverReason(errorText)     // "auth" | "rate_limit" | "quota" | "timeout" | ...
```

### 

[​

](https://docs.openclaw.ai/pi)

Thinking Level Fallback

If a thinking level is unsupported, it falls back:

Copy

```
const fallbackThinking = pickFallbackThinkingLevel({
  message: errorText,
  attempted: attemptedThinking,
});
if (fallbackThinking) {
  thinkLevel = fallbackThinking;
  continue;
}
```

## 

[​

](https://docs.openclaw.ai/pi)

Sandbox Integration

When sandbox mode is enabled, tools and paths are constrained:

Copy

```
const sandbox = await resolveSandboxContext({
  config: params.config,
  sessionKey: sandboxSessionKey,
  workspaceDir: resolvedWorkspace,
});

if (sandboxRoot) {
  // Use sandboxed read/edit/write tools
  // Exec runs in container
  // Browser uses bridge URL
}
```

## 

[​

](https://docs.openclaw.ai/pi)

Provider-Specific Handling

### 

[​

](https://docs.openclaw.ai/pi)

Anthropic

-   Refusal magic string scrubbing
-   Turn validation for consecutive roles
-   Claude Code parameter compatibility

### 

[​

](https://docs.openclaw.ai/pi)

Google/Gemini

-   Turn ordering fixes (`applyGoogleTurnOrderingFix`)
-   Tool schema sanitization (`sanitizeToolsForGoogle`)
-   Session history sanitization (`sanitizeSessionHistory`)

### 

[​

](https://docs.openclaw.ai/pi)

OpenAI

-   `apply_patch` tool for Codex models
-   Thinking level downgrade handling

## 

[​

](https://docs.openclaw.ai/pi)

TUI Integration

OpenClaw also has a local TUI mode that uses pi-tui components directly:

Copy

```
// src/tui/tui.ts
import { ... } from "@mariozechner/pi-tui";
```

This provides the interactive terminal experience similar to pi’s native mode.

## 

[​

](https://docs.openclaw.ai/pi)

Key Differences from Pi CLI

| Aspect | Pi CLI | OpenClaw Embedded |
| --- | --- | --- |
| Invocation | `pi` command / RPC | SDK via `createAgentSession()` |
| Tools | Default coding tools | Custom OpenClaw tool suite |
| System prompt | AGENTS.md + prompts | Dynamic per-channel/context |
| Session storage | `~/.pi/agent/sessions/` | `~/.openclaw/agents/<agentId>/sessions/` (or `$OPENCLAW_STATE_DIR/agents/<agentId>/sessions/`) |
| Auth | Single credential | Multi-profile with rotation |
| Extensions | Loaded from disk | Programmatic + disk paths |
| Event handling | TUI rendering | Callback-based (onBlockReply, etc.) |

## 

[​

](https://docs.openclaw.ai/pi)

Future Considerations

Areas for potential rework:

1.  **Tool signature alignment**: Currently adapting between pi-agent-core and pi-coding-agent signatures
2.  **Session manager wrapping**: `guardSessionManager` adds safety but increases complexity
3.  **Extension loading**: Could use pi’s `ResourceLoader` more directly
4.  **Streaming handler complexity**: `subscribeEmbeddedPiSession` has grown large
5.  **Provider quirks**: Many provider-specific codepaths that pi could potentially handle

## 

[​

](https://docs.openclaw.ai/pi)

Tests

Pi integration coverage spans these suites:

-   `src/agents/pi-*.test.ts`
-   `src/agents/pi-auth-json.test.ts`
-   `src/agents/pi-embedded-*.test.ts`
-   `src/agents/pi-embedded-helpers*.test.ts`
-   `src/agents/pi-embedded-runner*.test.ts`
-   `src/agents/pi-embedded-runner/**/*.test.ts`
-   `src/agents/pi-embedded-subscribe*.test.ts`
-   `src/agents/pi-tools*.test.ts`
-   `src/agents/pi-tool-definition-adapter*.test.ts`
-   `src/agents/pi-settings.test.ts`
-   `src/agents/pi-extensions/**/*.test.ts`

Live/opt-in:

-   `src/agents/pi-embedded-runner-extraparams.live.test.ts` (enable `OPENCLAW_LIVE_TEST=1`)

For current run commands, see [Pi Development Workflow](https://docs.openclaw.ai/pi-dev).

[Gateway Architecture](https://docs.openclaw.ai/concepts/architecture)

⌘I
