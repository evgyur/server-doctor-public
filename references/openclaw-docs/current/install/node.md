<!-- Source: https://docs.openclaw.ai/install/node -->
<!-- Title: Node.js - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/node)

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

-   [Node.js](https://docs.openclaw.ai/install/node)
-   [Check your version](https://docs.openclaw.ai/install/node)
-   [Install Node](https://docs.openclaw.ai/install/node)
-   [Troubleshooting](https://docs.openclaw.ai/install/node)
-   [openclaw: command not found](https://docs.openclaw.ai/install/node)
-   [Permission errors on npm install -g (Linux)](https://docs.openclaw.ai/install/node)

Node runtime

# Node.js

# 

[​

](https://docs.openclaw.ai/install/node)

Node.js

OpenClaw requires **Node 22.16 or newer**. **Node 24 is the default and recommended runtime** for installs, CI, and release workflows. Node 22 remains supported via the active LTS line. The [installer script](https://docs.openclaw.ai/install) will detect and install Node automatically — this page is for when you want to set up Node yourself and make sure everything is wired up correctly (versions, PATH, global installs).

## 

[​

](https://docs.openclaw.ai/install/node)

Check your version

Copy

```
node -v
```

If this prints `v24.x.x` or higher, you’re on the recommended default. If it prints `v22.16.x` or higher, you’re on the supported Node 22 LTS path, but we still recommend upgrading to Node 24 when convenient. If Node isn’t installed or the version is too old, pick an install method below.

## 

[​

](https://docs.openclaw.ai/install/node)

Install Node

-   macOS
    
-   Linux
    
-   Windows
    

**Homebrew** (recommended):

Copy

```
brew install node
```

Or download the macOS installer from [nodejs.org](https://nodejs.org/).

**Ubuntu / Debian:**

Copy

```
curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -
sudo apt-get install -y nodejs
```

**Fedora / RHEL:**

Copy

```
sudo dnf install nodejs
```

Or use a version manager (see below).

**winget** (recommended):

Copy

```
winget install OpenJS.NodeJS.LTS
```

**Chocolatey:**

Copy

```
choco install nodejs-lts
```

Or download the Windows installer from [nodejs.org](https://nodejs.org/).

Using a version manager (nvm, fnm, mise, asdf)

Version managers let you switch between Node versions easily. Popular options:

-   [**fnm**](https://github.com/Schniz/fnm) — fast, cross-platform
-   [**nvm**](https://github.com/nvm-sh/nvm) — widely used on macOS/Linux
-   [**mise**](https://mise.jdx.dev/) — polyglot (Node, Python, Ruby, etc.)

Example with fnm:

Copy

```
fnm install 24
fnm use 24
```

Make sure your version manager is initialized in your shell startup file (`~/.zshrc` or `~/.bashrc`). If it isn’t, `openclaw` may not be found in new terminal sessions because the PATH won’t include Node’s bin directory.

## 

[​

](https://docs.openclaw.ai/install/node)

Troubleshooting

### 

[​

](https://docs.openclaw.ai/install/node)

`openclaw: command not found`

This almost always means npm’s global bin directory isn’t on your PATH.

1

[

](https://docs.openclaw.ai/install/node)

Find your global npm prefix

Copy

```
npm prefix -g
```

2

[

](https://docs.openclaw.ai/install/node)

Check if it's on your PATH

Copy

```
echo "$PATH"
```

Look for `<npm-prefix>/bin` (macOS/Linux) or `<npm-prefix>` (Windows) in the output.

3

[

](https://docs.openclaw.ai/install/node)

Add it to your shell startup file

-   macOS / Linux
    
-   Windows
    

Add to `~/.zshrc` or `~/.bashrc`:

Copy

```
export PATH="$(npm prefix -g)/bin:$PATH"
```

Then open a new terminal (or run `rehash` in zsh / `hash -r` in bash).

Add the output of `npm prefix -g` to your system PATH via Settings → System → Environment Variables.

### 

[​

](https://docs.openclaw.ai/install/node)

Permission errors on `npm install -g` (Linux)

If you see `EACCES` errors, switch npm’s global prefix to a user-writable directory:

Copy

```
mkdir -p "$HOME/.npm-global"
npm config set prefix "$HOME/.npm-global"
export PATH="$HOME/.npm-global/bin:$PATH"
```

Add the `export PATH=...` line to your `~/.bashrc` or `~/.zshrc` to make it permanent.

[Diagnostics Flags](https://docs.openclaw.ai/diagnostics/flags)[Session Management Deep Dive](https://docs.openclaw.ai/reference/session-management-compaction)

⌘I
