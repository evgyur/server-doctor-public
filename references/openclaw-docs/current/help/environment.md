<!-- Source: https://docs.openclaw.ai/help/environment -->
<!-- Title: Environment Variables - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/help/environment)

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

-   [Environment variables](https://docs.openclaw.ai/help/environment)
-   [Precedence (highest → lowest)](https://docs.openclaw.ai/help/environment)
-   [Config env block](https://docs.openclaw.ai/help/environment)
-   [Shell env import](https://docs.openclaw.ai/help/environment)
-   [Runtime-injected env vars](https://docs.openclaw.ai/help/environment)
-   [UI env vars](https://docs.openclaw.ai/help/environment)
-   [Env var substitution in config](https://docs.openclaw.ai/help/environment)
-   [Secret refs vs ${ENV} strings](https://docs.openclaw.ai/help/environment)
-   [Path-related env vars](https://docs.openclaw.ai/help/environment)
-   [Logging](https://docs.openclaw.ai/help/environment)
-   [OPENCLAW\_HOME](https://docs.openclaw.ai/help/environment)
-   [Related](https://docs.openclaw.ai/help/environment)

Environment and debugging

# Environment Variables

# 

[​

](https://docs.openclaw.ai/help/environment)

Environment variables

OpenClaw pulls environment variables from multiple sources. The rule is **never override existing values**.

## 

[​

](https://docs.openclaw.ai/help/environment)

Precedence (highest → lowest)

1.  **Process environment** (what the Gateway process already has from the parent shell/daemon).
2.  **`.env` in the current working directory** (dotenv default; does not override).
3.  **Global `.env`** at `~/.openclaw/.env` (aka `$OPENCLAW_STATE_DIR/.env`; does not override).
4.  **Config `env` block** in `~/.openclaw/openclaw.json` (applied only if missing).
5.  **Optional login-shell import** (`env.shellEnv.enabled` or `OPENCLAW_LOAD_SHELL_ENV=1`), applied only for missing expected keys.

If the config file is missing entirely, step 4 is skipped; shell import still runs if enabled.

## 

[​

](https://docs.openclaw.ai/help/environment)

Config `env` block

Two equivalent ways to set inline env vars (both are non-overriding):

Copy

```
{
  env: {
    OPENROUTER_API_KEY: "sk-or-...",
    vars: {
      GROQ_API_KEY: "gsk-...",
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/help/environment)

Shell env import

`env.shellEnv` runs your login shell and imports only **missing** expected keys:

Copy

```
{
  env: {
    shellEnv: {
      enabled: true,
      timeoutMs: 15000,
    },
  },
}
```

Env var equivalents:

-   `OPENCLAW_LOAD_SHELL_ENV=1`
-   `OPENCLAW_SHELL_ENV_TIMEOUT_MS=15000`

## 

[​

](https://docs.openclaw.ai/help/environment)

Runtime-injected env vars

OpenClaw also injects context markers into spawned child processes:

-   `OPENCLAW_SHELL=exec`: set for commands run through the `exec` tool.
-   `OPENCLAW_SHELL=acp`: set for ACP runtime backend process spawns (for example `acpx`).
-   `OPENCLAW_SHELL=acp-client`: set for `openclaw acp client` when it spawns the ACP bridge process.
-   `OPENCLAW_SHELL=tui-local`: set for local TUI `!` shell commands.

These are runtime markers (not required user config). They can be used in shell/profile logic to apply context-specific rules.

## 

[​

](https://docs.openclaw.ai/help/environment)

UI env vars

-   `OPENCLAW_THEME=light`: force the light TUI palette when your terminal has a light background.
-   `OPENCLAW_THEME=dark`: force the dark TUI palette.
-   `COLORFGBG`: if your terminal exports it, OpenClaw uses the background color hint to auto-pick the TUI palette.

## 

[​

](https://docs.openclaw.ai/help/environment)

Env var substitution in config

You can reference env vars directly in config string values using `${VAR_NAME}` syntax:

Copy

```
{
  models: {
    providers: {
      "vercel-gateway": {
        apiKey: "${VERCEL_GATEWAY_API_KEY}",
      },
    },
  },
}
```

See [Configuration: Env var substitution](https://docs.openclaw.ai/gateway/configuration) for full details.

## 

[​

](https://docs.openclaw.ai/help/environment)

Secret refs vs `${ENV}` strings

OpenClaw supports two env-driven patterns:

-   `${VAR}` string substitution in config values.
-   SecretRef objects (`{ source: "env", provider: "default", id: "VAR" }`) for fields that support secrets references.

Both resolve from process env at activation time. SecretRef details are documented in [Secrets Management](https://docs.openclaw.ai/gateway/secrets).

## 

[​

](https://docs.openclaw.ai/help/environment)

Path-related env vars

| Variable | Purpose |
| --- | --- |
| `OPENCLAW_HOME` | Override the home directory used for all internal path resolution (`~/.openclaw/`, agent dirs, sessions, credentials). Useful when running OpenClaw as a dedicated service user. |
| `OPENCLAW_STATE_DIR` | Override the state directory (default `~/.openclaw`). |
| `OPENCLAW_CONFIG_PATH` | Override the config file path (default `~/.openclaw/openclaw.json`). |

## 

[​

](https://docs.openclaw.ai/help/environment)

Logging

| Variable | Purpose |
| --- | --- |
| `OPENCLAW_LOG_LEVEL` | Override log level for both file and console (e.g. `debug`, `trace`). Takes precedence over `logging.level` and `logging.consoleLevel` in config. Invalid values are ignored with a warning. |

### 

[​

](https://docs.openclaw.ai/help/environment)

`OPENCLAW_HOME`

When set, `OPENCLAW_HOME` replaces the system home directory (`$HOME` / `os.homedir()`) for all internal path resolution. This enables full filesystem isolation for headless service accounts. **Precedence:** `OPENCLAW_HOME` > `$HOME` > `USERPROFILE` > `os.homedir()` **Example** (macOS LaunchDaemon):

Copy

```
<key>EnvironmentVariables</key>
<dict>
  <key>OPENCLAW_HOME</key>
  <string>/Users/kira</string>
</dict>
```

`OPENCLAW_HOME` can also be set to a tilde path (e.g. `~/svc`), which gets expanded using `$HOME` before use.

## 

[​

](https://docs.openclaw.ai/help/environment)

Related

-   [Gateway configuration](https://docs.openclaw.ai/gateway/configuration)
-   [FAQ: env vars and .env loading](https://docs.openclaw.ai/help/faq)
-   [Models overview](https://docs.openclaw.ai/concepts/models)

[OpenClaw Lore](https://docs.openclaw.ai/start/lore)[Debugging](https://docs.openclaw.ai/help/debugging)

⌘I
