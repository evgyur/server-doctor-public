<!-- Source: https://docs.openclaw.ai/gateway/cli-backends -->
<!-- Title: CLI Backends - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/gateway/cli-backends)

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
        
        Gateway Protocol
        
        
        
        ](https://docs.openclaw.ai/gateway/protocol)
    -   [
        
        Bridge Protocol
        
        
        
        ](https://docs.openclaw.ai/gateway/bridge-protocol)
    -   [
        
        OpenAI Chat Completions
        
        
        
        ](https://docs.openclaw.ai/gateway/openai-http-api)
    -   [
        
        OpenResponses API
        
        
        
        ](https://docs.openclaw.ai/gateway/openresponses-http-api)
    -   [
        
        Tools Invoke API
        
        
        
        ](https://docs.openclaw.ai/gateway/tools-invoke-http-api)
    -   [
        
        CLI Backends
        
        
        
        ](https://docs.openclaw.ai/gateway/cli-backends)
    -   [
        
        Local Models
        
        
        
        ](https://docs.openclaw.ai/gateway/local-models)

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

-   [CLI backends (fallback runtime)](https://docs.openclaw.ai/gateway/cli-backends)
-   [Beginner-friendly quick start](https://docs.openclaw.ai/gateway/cli-backends)
-   [Using it as a fallback](https://docs.openclaw.ai/gateway/cli-backends)
-   [Configuration overview](https://docs.openclaw.ai/gateway/cli-backends)
-   [Example configuration](https://docs.openclaw.ai/gateway/cli-backends)
-   [How it works](https://docs.openclaw.ai/gateway/cli-backends)
-   [Sessions](https://docs.openclaw.ai/gateway/cli-backends)
-   [Images (pass-through)](https://docs.openclaw.ai/gateway/cli-backends)
-   [Inputs / outputs](https://docs.openclaw.ai/gateway/cli-backends)
-   [Defaults (built-in)](https://docs.openclaw.ai/gateway/cli-backends)
-   [Limitations](https://docs.openclaw.ai/gateway/cli-backends)
-   [Troubleshooting](https://docs.openclaw.ai/gateway/cli-backends)

Protocols and APIs

# CLI Backends

# 

[​

](https://docs.openclaw.ai/gateway/cli-backends)

CLI backends (fallback runtime)

OpenClaw can run **local AI CLIs** as a **text-only fallback** when API providers are down, rate-limited, or temporarily misbehaving. This is intentionally conservative:

-   **Tools are disabled** (no tool calls).
-   **Text in → text out** (reliable).
-   **Sessions are supported** (so follow-up turns stay coherent).
-   **Images can be passed through** if the CLI accepts image paths.

This is designed as a **safety net** rather than a primary path. Use it when you want “always works” text responses without relying on external APIs.

## 

[​

](https://docs.openclaw.ai/gateway/cli-backends)

Beginner-friendly quick start

You can use Claude Code CLI **without any config** (OpenClaw ships a built-in default):

Copy

```
openclaw agent --message "hi" --model claude-cli/opus-4.6
```

Codex CLI also works out of the box:

Copy

```
openclaw agent --message "hi" --model codex-cli/gpt-5.4
```

If your gateway runs under launchd/systemd and PATH is minimal, add just the command path:

Copy

```
{
  agents: {
    defaults: {
      cliBackends: {
        "claude-cli": {
          command: "/opt/homebrew/bin/claude",
        },
      },
    },
  },
}
```

That’s it. No keys, no extra auth config needed beyond the CLI itself.

## 

[​

](https://docs.openclaw.ai/gateway/cli-backends)

Using it as a fallback

Add a CLI backend to your fallback list so it only runs when primary models fail:

Copy

```
{
  agents: {
    defaults: {
      model: {
        primary: "anthropic/claude-opus-4-6",
        fallbacks: ["claude-cli/opus-4.6", "claude-cli/opus-4.5"],
      },
      models: {
        "anthropic/claude-opus-4-6": { alias: "Opus" },
        "claude-cli/opus-4.6": {},
        "claude-cli/opus-4.5": {},
      },
    },
  },
}
```

Notes:

-   If you use `agents.defaults.models` (allowlist), you must include `claude-cli/...`.
-   If the primary provider fails (auth, rate limits, timeouts), OpenClaw will try the CLI backend next.

## 

[​

](https://docs.openclaw.ai/gateway/cli-backends)

Configuration overview

All CLI backends live under:

Copy

```
agents.defaults.cliBackends
```

Each entry is keyed by a **provider id** (e.g. `claude-cli`, `my-cli`). The provider id becomes the left side of your model ref:

Copy

```
<provider>/<model>
```

### 

[​

](https://docs.openclaw.ai/gateway/cli-backends)

Example configuration

Copy

```
{
  agents: {
    defaults: {
      cliBackends: {
        "claude-cli": {
          command: "/opt/homebrew/bin/claude",
        },
        "my-cli": {
          command: "my-cli",
          args: ["--json"],
          output: "json",
          input: "arg",
          modelArg: "--model",
          modelAliases: {
            "claude-opus-4-6": "opus",
            "claude-opus-4-5": "opus",
            "claude-sonnet-4-5": "sonnet",
          },
          sessionArg: "--session",
          sessionMode: "existing",
          sessionIdFields: ["session_id", "conversation_id"],
          systemPromptArg: "--system",
          systemPromptWhen: "first",
          imageArg: "--image",
          imageMode: "repeat",
          serialize: true,
        },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/gateway/cli-backends)

How it works

1.  **Selects a backend** based on the provider prefix (`claude-cli/...`).
2.  **Builds a system prompt** using the same OpenClaw prompt + workspace context.
3.  **Executes the CLI** with a session id (if supported) so history stays consistent.
4.  **Parses output** (JSON or plain text) and returns the final text.
5.  **Persists session ids** per backend, so follow-ups reuse the same CLI session.

## 

[​

](https://docs.openclaw.ai/gateway/cli-backends)

Sessions

-   If the CLI supports sessions, set `sessionArg` (e.g. `--session-id`) or `sessionArgs` (placeholder `{sessionId}`) when the ID needs to be inserted into multiple flags.
-   If the CLI uses a **resume subcommand** with different flags, set `resumeArgs` (replaces `args` when resuming) and optionally `resumeOutput` (for non-JSON resumes).
-   `sessionMode`:
    -   `always`: always send a session id (new UUID if none stored).
    -   `existing`: only send a session id if one was stored before.
    -   `none`: never send a session id.

## 

[​

](https://docs.openclaw.ai/gateway/cli-backends)

Images (pass-through)

If your CLI accepts image paths, set `imageArg`:

Copy

```
imageArg: "--image",
imageMode: "repeat"
```

OpenClaw will write base64 images to temp files. If `imageArg` is set, those paths are passed as CLI args. If `imageArg` is missing, OpenClaw appends the file paths to the prompt (path injection), which is enough for CLIs that auto- load local files from plain paths (Claude Code CLI behavior).

## 

[​

](https://docs.openclaw.ai/gateway/cli-backends)

Inputs / outputs

-   `output: "json"` (default) tries to parse JSON and extract text + session id.
-   `output: "jsonl"` parses JSONL streams (Codex CLI `--json`) and extracts the last agent message plus `thread_id` when present.
-   `output: "text"` treats stdout as the final response.

Input modes:

-   `input: "arg"` (default) passes the prompt as the last CLI arg.
-   `input: "stdin"` sends the prompt via stdin.
-   If the prompt is very long and `maxPromptArgChars` is set, stdin is used.

## 

[​

](https://docs.openclaw.ai/gateway/cli-backends)

Defaults (built-in)

OpenClaw ships a default for `claude-cli`:

-   `command: "claude"`
-   `args: ["-p", "--output-format", "json", "--permission-mode", "bypassPermissions"]`
-   `resumeArgs: ["-p", "--output-format", "json", "--permission-mode", "bypassPermissions", "--resume", "{sessionId}"]`
-   `modelArg: "--model"`
-   `systemPromptArg: "--append-system-prompt"`
-   `sessionArg: "--session-id"`
-   `systemPromptWhen: "first"`
-   `sessionMode: "always"`

OpenClaw also ships a default for `codex-cli`:

-   `command: "codex"`
-   `args: ["exec","--json","--color","never","--sandbox","read-only","--skip-git-repo-check"]`
-   `resumeArgs: ["exec","resume","{sessionId}","--color","never","--sandbox","read-only","--skip-git-repo-check"]`
-   `output: "jsonl"`
-   `resumeOutput: "text"`
-   `modelArg: "--model"`
-   `imageArg: "--image"`
-   `sessionMode: "existing"`

Override only if needed (common: absolute `command` path).

## 

[​

](https://docs.openclaw.ai/gateway/cli-backends)

Limitations

-   **No OpenClaw tools** (the CLI backend never receives tool calls). Some CLIs may still run their own agent tooling.
-   **No streaming** (CLI output is collected then returned).
-   **Structured outputs** depend on the CLI’s JSON format.
-   **Codex CLI sessions** resume via text output (no JSONL), which is less structured than the initial `--json` run. OpenClaw sessions still work normally.

## 

[​

](https://docs.openclaw.ai/gateway/cli-backends)

Troubleshooting

-   **CLI not found**: set `command` to a full path.
-   **Wrong model name**: use `modelAliases` to map `provider/model` → CLI model.
-   **No session continuity**: ensure `sessionArg` is set and `sessionMode` is not `none` (Codex CLI currently cannot resume with JSON output).
-   **Images ignored**: set `imageArg` (and verify CLI supports file paths).

[Tools Invoke API](https://docs.openclaw.ai/gateway/tools-invoke-http-api)[Local Models](https://docs.openclaw.ai/gateway/local-models)

⌘I
