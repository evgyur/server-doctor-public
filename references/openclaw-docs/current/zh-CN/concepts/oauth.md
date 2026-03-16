<!-- Source: https://docs.openclaw.ai/zh-CN/concepts/oauth -->
<!-- Title: OAuth - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/concepts/oauth)

[OpenClaw home page![light logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)![dark logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)](https://docs.openclaw.ai/zh-CN)

[快速开始

](https://docs.openclaw.ai/zh-CN)[安装

](https://docs.openclaw.ai/zh-CN/install)[消息渠道

](https://docs.openclaw.ai/zh-CN/channels)[代理

](https://docs.openclaw.ai/zh-CN/pi)[工具

](https://docs.openclaw.ai/zh-CN/tools)[模型

](https://docs.openclaw.ai/zh-CN/providers)[平台

](https://docs.openclaw.ai/zh-CN/platforms)[网关与运维

](https://docs.openclaw.ai/zh-CN/gateway)[参考

](https://docs.openclaw.ai/zh-CN/cli)[帮助

](https://docs.openclaw.ai/zh-CN/help)

##### 基础

-   [
    
    Pi 集成架构
    
    
    
    ](https://docs.openclaw.ai/zh-CN/pi)
-   [
    
    Gateway 网关架构
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/architecture)
-   [
    
    智能体运行时
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/agent)
-   [
    
    智能体循环
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/agent-loop)
-   [
    
    系统提示词
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)
-   [
    
    上下文
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/context)
-   [
    
    智能体工作区
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/agent-workspace)
-   [
    
    OAuth
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/oauth)

##### 引导

-   [
    
    引导
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/bootstrapping)

##### 会话与记忆

-   [
    
    会话管理
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/session)
-   [
    
    Session pruning
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/session-pruning)
-   [
    
    会话工具
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/session-tool)
-   [
    
    记忆
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/memory)
-   [
    
    压缩
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/compaction)

##### 多代理

-   [
    
    多智能体路由
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [
    
    在线状态
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/presence)

##### 消息与投递

-   [
    
    消息
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/messages)
-   [
    
    流式传输和分块
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/streaming)
-   [
    
    重试策略
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/retry)
-   [
    
    命令队列
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/queue)

-   [OAuth](https://docs.openclaw.ai/zh-CN/concepts/oauth)
-   [令牌汇点（为什么需要它）](https://docs.openclaw.ai/zh-CN/concepts/oauth)
-   [存储（令牌存放位置）](https://docs.openclaw.ai/zh-CN/concepts/oauth)
-   [Anthropic setup-token（订阅认证）](https://docs.openclaw.ai/zh-CN/concepts/oauth)
-   [OAuth 交换（登录如何工作）](https://docs.openclaw.ai/zh-CN/concepts/oauth)
-   [Anthropic setup-token](https://docs.openclaw.ai/zh-CN/concepts/oauth)
-   [OpenAI Codex（ChatGPT OAuth）](https://docs.openclaw.ai/zh-CN/concepts/oauth)
-   [刷新和过期](https://docs.openclaw.ai/zh-CN/concepts/oauth)
-   [多个账户（配置文件）+ 路由](https://docs.openclaw.ai/zh-CN/concepts/oauth)
-   [1）推荐：分离的智能体](https://docs.openclaw.ai/zh-CN/concepts/oauth)
-   [2）高级：单个智能体中的多个配置文件](https://docs.openclaw.ai/zh-CN/concepts/oauth)

基础

# OAuth

# 

[​

](https://docs.openclaw.ai/zh-CN/concepts/oauth)

OAuth

OpenClaw 通过 OAuth 支持提供商提供的“订阅认证”，适用于支持此方式的提供商（尤其是 **OpenAI Codex（ChatGPT OAuth）**）。对于 Anthropic 订阅，请使用 **setup-token** 流程。过去有些用户在 Claude Code 之外使用 Anthropic 订阅时曾受限，因此这应视为用户自行选择承担的风险，你应自行核实 Anthropic 当前的政策。OpenAI Codex OAuth 明确支持在 OpenClaw 这样的外部工具中使用。本页说明： 对于生产环境中的 Anthropic，相比订阅 setup-token 认证，API 密钥认证是更安全、也更推荐的路径。

-   OAuth **令牌交换** 如何工作（PKCE）
-   令牌**存储**在哪里（以及为什么）
-   如何处理**多个账户**（配置文件 + 按会话覆盖）

OpenClaw 也支持自带 OAuth 或 API 密钥流程的**提供商插件**。运行方式如下：

复制

```
openclaw models auth login --provider <id>
```

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/oauth)

令牌汇点（为什么需要它）

OAuth 提供商通常会在登录/刷新流程中签发一个**新的刷新令牌**。某些提供商（或 OAuth 客户端）会在为同一用户/应用签发新令牌时使旧的刷新令牌失效。 实际症状：

-   你同时通过 OpenClaw _和_ Claude Code / Codex CLI 登录 → 之后其中一个会随机“被登出”

为减少这种情况，OpenClaw 将 `auth-profiles.json` 视为一个**令牌汇点**：

-   运行时从**同一个地方**读取凭证
-   我们可以保留多个配置文件，并进行确定性路由

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/oauth)

存储（令牌存放位置）

密钥按**每个智能体**存储：

-   认证配置文件（OAuth + API 密钥 + 可选的值级引用）：`~/.openclaw/agents/<agentId>/agent/auth-profiles.json`
-   旧版兼容文件：`~/.openclaw/agents/<agentId>/agent/auth.json` （发现静态 `api_key` 条目时会进行清理）

仅用于旧版导入的文件（仍受支持，但不是主存储）：

-   `~/.openclaw/credentials/oauth.json`（首次使用时会导入到 `auth-profiles.json`）

以上所有位置也都遵循 `$OPENCLAW_STATE_DIR`（状态目录覆盖）。完整参考：[/gateway/configuration](https://docs.openclaw.ai/gateway/configuration) 有关静态密钥引用和运行时快照激活行为，请参见 [Secrets Management](https://docs.openclaw.ai/gateway/secrets)。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/oauth)

Anthropic setup-token（订阅认证）

Anthropic setup-token 支持是技术兼容性，并非策略保证。 Anthropic 过去曾阻止过某些在 Claude Code 之外的订阅使用。 是否使用订阅认证由你自行决定，并请核实 Anthropic 当前的条款。

在任意机器上运行 `claude setup-token`，然后将其粘贴到 OpenClaw 中：

复制

```
openclaw models auth setup-token --provider anthropic
```

如果你是在其他地方生成的令牌，可手动粘贴：

复制

```
openclaw models auth paste-token --provider anthropic
```

验证：

复制

```
openclaw models status
```

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/oauth)

OAuth 交换（登录如何工作）

OpenClaw 的交互式登录流程在 `@mariozechner/pi-ai` 中实现，并接入到各类向导/命令中。

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/oauth)

Anthropic setup-token

流程形态：

1.  运行 `claude setup-token`
2.  将令牌粘贴到 OpenClaw
3.  存储为令牌认证配置文件（不刷新）

向导路径为 `openclaw onboard` → 认证选择 `setup-token`（Anthropic）。

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/oauth)

OpenAI Codex（ChatGPT OAuth）

OpenAI Codex OAuth 明确支持在 Codex CLI 之外使用，包括 OpenClaw 工作流。 流程形态（PKCE）：

1.  生成 PKCE verifier/challenge 和随机 `state`
2.  打开 `https://auth.openai.com/oauth/authorize?...`
3.  尝试在 `http://127.0.0.1:1455/auth/callback` 捕获回调
4.  如果回调无法绑定（或你是在远程/无头环境中），则粘贴重定向 URL/code
5.  在 `https://auth.openai.com/oauth/token` 交换令牌
6.  从访问令牌中提取 `accountId` 并存储 `{ access, refresh, expires, accountId }`

向导路径为 `openclaw onboard` → 认证选择 `openai-codex`。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/oauth)

刷新和过期

配置文件会存储一个 `expires` 时间戳。 在运行时：

-   如果 `expires` 尚未到期 → 使用已存储的访问令牌
-   如果已过期 → 在文件锁下刷新，并覆盖已存储的凭证

刷新流程是自动的；通常你不需要手动管理令牌。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/oauth)

多个账户（配置文件）+ 路由

有两种模式：

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/oauth)

1）推荐：分离的智能体

如果你希望“个人”和“工作”永不交叉，请使用隔离的智能体（独立的会话 + 凭证 + 工作区）：

复制

```
openclaw agents add work
openclaw agents add personal
```

然后按智能体配置认证（使用向导），并将聊天路由到正确的智能体。

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/oauth)

2）高级：单个智能体中的多个配置文件

`auth-profiles.json` 支持同一提供商下的多个配置文件 ID。 选择使用哪个配置文件：

-   通过配置排序全局选择（`auth.order`）
-   通过 `/model ...@<profileId>` 按会话选择

示例（会话覆盖）：

-   `/model Opus@anthropic:work`

查看现有配置文件 ID 的方法：

-   `openclaw channels list --json`（显示 `auth[]`）

相关文档：

-   [/concepts/model-failover](https://docs.openclaw.ai/concepts/model-failover)（轮换 + 冷却规则）
-   [/tools/slash-commands](https://docs.openclaw.ai/tools/slash-commands)（命令入口）

[智能体工作区](https://docs.openclaw.ai/zh-CN/concepts/agent-workspace)[引导](https://docs.openclaw.ai/zh-CN/start/bootstrapping)

⌘I
