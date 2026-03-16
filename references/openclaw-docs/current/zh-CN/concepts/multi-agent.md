<!-- Source: https://docs.openclaw.ai/zh-CN/concepts/multi-agent -->
<!-- Title: 多智能体路由 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

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

-   [多智能体路由](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [什么是”一个智能体”？](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [路径（快速映射）](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [单智能体模式（默认）](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [智能体助手](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [多个智能体 = 多个人、多种人格](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [一个 WhatsApp 号码，多个人（私信分割）](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [路由规则（消息如何选择智能体）](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [多账户/电话号码](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [概念](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [示例：两个 WhatsApp → 两个智能体](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [示例：WhatsApp 日常聊天 + Telegram 深度工作](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [示例：同一渠道，一个对等方到 Opus](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [绑定到 WhatsApp 群组的家庭智能体](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)
-   [每智能体沙箱和工具配置](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

多代理

# 多智能体路由

# 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

多智能体路由

目标：多个_隔离的_智能体（独立的工作区 + `agentDir` + 会话），加上多个渠道账户（例如两个 WhatsApp）在一个运行的 Gateway 网关中。入站消息通过绑定路由到智能体。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

什么是”一个智能体”？

一个**智能体**是一个完全独立作用域的大脑，拥有自己的：

-   **工作区**（文件、AGENTS.md/SOUL.md/USER.md、本地笔记、人设规则）。
-   **状态目录**（`agentDir`）用于认证配置文件、模型注册表和每智能体配置。
-   **会话存储**（聊天历史 + 路由状态）位于 `~/.openclaw/agents/<agentId>/sessions` 下。

认证配置文件是**每智能体独立的**。每个智能体从自己的位置读取：

复制

```
~/.openclaw/agents/<agentId>/agent/auth-profiles.json
```

主智能体凭证**不会**自动共享。切勿在智能体之间重用 `agentDir`（这会导致认证/会话冲突）。如果你想共享凭证，请将 `auth-profiles.json` 复制到另一个智能体的 `agentDir`。 Skills 通过每个工作区的 `skills/` 文件夹实现每智能体独立，共享的 Skills 可从 `~/.openclaw/skills` 获取。参见 [Skills：每智能体 vs 共享](https://docs.openclaw.ai/tools/skills)。 Gateway 网关可以托管**一个智能体**（默认）或**多个智能体**并行。 **工作区注意事项：** 每个智能体的工作区是**默认 cwd**，而不是硬性沙箱。相对路径在工作区内解析，但绝对路径可以访问主机的其他位置，除非启用了沙箱隔离。参见 [沙箱隔离](https://docs.openclaw.ai/gateway/sandboxing)。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

路径（快速映射）

-   配置：`~/.openclaw/openclaw.json`（或 `OPENCLAW_CONFIG_PATH`）
-   状态目录：`~/.openclaw`（或 `OPENCLAW_STATE_DIR`）
-   工作区：`~/.openclaw/workspace`（或 `~/.openclaw/workspace-<agentId>`）
-   智能体目录：`~/.openclaw/agents/<agentId>/agent`（或 `agents.list[].agentDir`）
-   会话：`~/.openclaw/agents/<agentId>/sessions`

### 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

单智能体模式（默认）

如果你什么都不做，OpenClaw 运行单个智能体：

-   `agentId` 默认为 **`main`**。
-   会话键为 `agent:main:<mainKey>`。
-   工作区默认为 `~/.openclaw/workspace`（或当设置了 `OPENCLAW_PROFILE` 时为 `~/.openclaw/workspace-<profile>`）。
-   状态默认为 `~/.openclaw/agents/main/agent`。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

智能体助手

使用智能体向导添加新的隔离智能体：

复制

```
openclaw agents add work
```

然后添加 `bindings`（或让向导完成）来路由入站消息。 验证：

复制

```
openclaw agents list --bindings
```

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

多个智能体 = 多个人、多种人格

使用**多个智能体**，每个 `agentId` 成为一个**完全隔离的人格**：

-   **不同的电话号码/账户**（每渠道 `accountId`）。
-   **不同的人格**（每智能体工作区文件如 `AGENTS.md` 和 `SOUL.md`）。
-   **独立的认证 + 会话**（除非明确启用，否则无交叉通信）。

这让**多个人**共享一个 Gateway 网关服务器，同时保持他们的 AI”大脑”和数据隔离。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

一个 WhatsApp 号码，多个人（私信分割）

你可以将**不同的 WhatsApp 私信**路由到不同的智能体，同时保持**一个 WhatsApp 账户**。使用 `peer.kind: "dm"` 匹配发送者 E.164（如 `+15551234567`）。回复仍然来自同一个 WhatsApp 号码（无每智能体发送者身份）。 重要细节：直接聊天折叠到智能体的**主会话键**，因此真正的隔离需要**每人一个智能体**。 示例：

复制

```
{
  agents: {
    list: [
      { id: "alex", workspace: "~/.openclaw/workspace-alex" },
      { id: "mia", workspace: "~/.openclaw/workspace-mia" },
    ],
  },
  bindings: [
    { agentId: "alex", match: { channel: "whatsapp", peer: { kind: "dm", id: "+15551230001" } } },
    { agentId: "mia", match: { channel: "whatsapp", peer: { kind: "dm", id: "+15551230002" } } },
  ],
  channels: {
    whatsapp: {
      dmPolicy: "allowlist",
      allowFrom: ["+15551230001", "+15551230002"],
    },
  },
}
```

注意事项：

-   私信访问控制是**每 WhatsApp 账户全局的**（配对/允许列表），而不是每智能体。
-   对于共享群组，将群组绑定到一个智能体或使用 [广播群组](https://docs.openclaw.ai/channels/broadcast-groups)。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

路由规则（消息如何选择智能体）

绑定是**确定性的**，**最具体的优先**：

1.  `peer` 匹配（精确私信/群组/频道 id）
2.  `guildId`（Discord）
3.  `teamId`（Slack）
4.  渠道的 `accountId` 匹配
5.  渠道级匹配（`accountId: "*"`）
6.  回退到默认智能体（`agents.list[].default`，否则列表中的第一个条目，默认：`main`）

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

多账户/电话号码

支持**多账户**的渠道（如 WhatsApp）使用 `accountId` 来识别每个登录。每个 `accountId` 可以路由到不同的智能体，因此一个服务器可以托管多个电话号码而不混合会话。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

概念

-   `agentId`：一个”大脑”（工作区、每智能体认证、每智能体会话存储）。
-   `accountId`：一个渠道账户实例（例如 WhatsApp 账户 `"personal"` vs `"biz"`）。
-   `binding`：通过 `(channel, accountId, peer)` 以及可选的 guild/team id 将入站消息路由到 `agentId`。
-   直接聊天折叠到 `agent:<agentId>:<mainKey>`（每智能体”主”；`session.mainKey`）。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

示例：两个 WhatsApp → 两个智能体

`~/.openclaw/openclaw.json`（JSON5）：

复制

```
{
  agents: {
    list: [
      {
        id: "home",
        default: true,
        name: "Home",
        workspace: "~/.openclaw/workspace-home",
        agentDir: "~/.openclaw/agents/home/agent",
      },
      {
        id: "work",
        name: "Work",
        workspace: "~/.openclaw/workspace-work",
        agentDir: "~/.openclaw/agents/work/agent",
      },
    ],
  },

  // 确定性路由：第一个匹配获胜（最具体的优先）。
  bindings: [
    { agentId: "home", match: { channel: "whatsapp", accountId: "personal" } },
    { agentId: "work", match: { channel: "whatsapp", accountId: "biz" } },

    // 可选的每对等方覆盖（示例：将特定群组发送到 work 智能体）。
    {
      agentId: "work",
      match: {
        channel: "whatsapp",
        accountId: "personal",
        peer: { kind: "group", id: "1203630...@g.us" },
      },
    },
  ],

  // 默认关闭：智能体到智能体的消息必须明确启用 + 加入允许列表。
  tools: {
    agentToAgent: {
      enabled: false,
      allow: ["home", "work"],
    },
  },

  channels: {
    whatsapp: {
      accounts: {
        personal: {
          // 可选覆盖。默认：~/.openclaw/credentials/whatsapp/personal
          // authDir: "~/.openclaw/credentials/whatsapp/personal",
        },
        biz: {
          // 可选覆盖。默认：~/.openclaw/credentials/whatsapp/biz
          // authDir: "~/.openclaw/credentials/whatsapp/biz",
        },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

示例：WhatsApp 日常聊天 + Telegram 深度工作

按渠道分割：将 WhatsApp 路由到快速日常智能体，Telegram 路由到 Opus 智能体。

复制

```
{
  agents: {
    list: [
      {
        id: "chat",
        name: "Everyday",
        workspace: "~/.openclaw/workspace-chat",
        model: "anthropic/claude-sonnet-4-5",
      },
      {
        id: "opus",
        name: "Deep Work",
        workspace: "~/.openclaw/workspace-opus",
        model: "anthropic/claude-opus-4-5",
      },
    ],
  },
  bindings: [
    { agentId: "chat", match: { channel: "whatsapp" } },
    { agentId: "opus", match: { channel: "telegram" } },
  ],
}
```

注意事项：

-   如果你有一个渠道的多个账户，请在绑定中添加 `accountId`（例如 `{ channel: "whatsapp", accountId: "personal" }`）。
-   要将单个私信/群组路由到 Opus 而保持其余在 chat 上，请为该对等方添加 `match.peer` 绑定；对等方匹配始终优先于渠道级规则。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

示例：同一渠道，一个对等方到 Opus

保持 WhatsApp 在快速智能体上，但将一个私信路由到 Opus：

复制

```
{
  agents: {
    list: [
      {
        id: "chat",
        name: "Everyday",
        workspace: "~/.openclaw/workspace-chat",
        model: "anthropic/claude-sonnet-4-5",
      },
      {
        id: "opus",
        name: "Deep Work",
        workspace: "~/.openclaw/workspace-opus",
        model: "anthropic/claude-opus-4-5",
      },
    ],
  },
  bindings: [
    { agentId: "opus", match: { channel: "whatsapp", peer: { kind: "dm", id: "+15551234567" } } },
    { agentId: "chat", match: { channel: "whatsapp" } },
  ],
}
```

对等方绑定始终获胜，因此将它们放在渠道级规则之上。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

绑定到 WhatsApp 群组的家庭智能体

将专用家庭智能体绑定到单个 WhatsApp 群组，使用提及限制和更严格的工具策略：

复制

```
{
  agents: {
    list: [
      {
        id: "family",
        name: "Family",
        workspace: "~/.openclaw/workspace-family",
        identity: { name: "Family Bot" },
        groupChat: {
          mentionPatterns: ["@family", "@familybot", "@Family Bot"],
        },
        sandbox: {
          mode: "all",
          scope: "agent",
        },
        tools: {
          allow: [
            "exec",
            "read",
            "sessions_list",
            "sessions_history",
            "sessions_send",
            "sessions_spawn",
            "session_status",
          ],
          deny: ["write", "edit", "apply_patch", "browser", "canvas", "nodes", "cron"],
        },
      },
    ],
  },
  bindings: [
    {
      agentId: "family",
      match: {
        channel: "whatsapp",
        peer: { kind: "group", id: "120363999999999999@g.us" },
      },
    },
  ],
}
```

注意事项：

-   工具允许/拒绝列表是**工具**，不是 Skills。如果 skill 需要运行二进制文件，请确保 `exec` 被允许且二进制文件存在于沙箱中。
-   对于更严格的限制，设置 `agents.list[].groupChat.mentionPatterns` 并为渠道保持群组允许列表启用。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/multi-agent)

每智能体沙箱和工具配置

从 v2026.1.6 开始，每个智能体可以有自己的沙箱和工具限制：

复制

```
{
  agents: {
    list: [
      {
        id: "personal",
        workspace: "~/.openclaw/workspace-personal",
        sandbox: {
          mode: "off",  // 个人智能体无沙箱
        },
        // 无工具限制 - 所有工具可用
      },
      {
        id: "family",
        workspace: "~/.openclaw/workspace-family",
        sandbox: {
          mode: "all",     // 始终沙箱隔离
          scope: "agent",  // 每智能体一个容器
          docker: {
            // 容器创建后的可选一次性设置
            setupCommand: "apt-get update && apt-get install -y git curl",
          },
        },
        tools: {
          allow: ["read"],                    // 仅 read 工具
          deny: ["exec", "write", "edit", "apply_patch"],    // 拒绝其他
        },
      },
    ],
  },
}
```

注意：`setupCommand` 位于 `sandbox.docker` 下，在容器创建时运行一次。 当解析的 scope 为 `"shared"` 时，每智能体 `sandbox.docker.*` 覆盖会被忽略。 **好处：**

-   **安全隔离**：限制不受信任智能体的工具
-   **资源控制**：沙箱隔离特定智能体同时保持其他智能体在主机上
-   **灵活策略**：每智能体不同的权限

注意：`tools.elevated` 是**全局的**且基于发送者；不能按智能体配置。 如果你需要每智能体边界，使用 `agents.list[].tools` 拒绝 `exec`。 对于群组定向，使用 `agents.list[].groupChat.mentionPatterns` 使 @提及清晰地映射到目标智能体。 参见 [多智能体沙箱和工具](https://docs.openclaw.ai/tools/multi-agent-sandbox-tools) 了解详细示例。

[压缩](https://docs.openclaw.ai/zh-CN/concepts/compaction)[在线状态](https://docs.openclaw.ai/zh-CN/concepts/presence)

⌘I
