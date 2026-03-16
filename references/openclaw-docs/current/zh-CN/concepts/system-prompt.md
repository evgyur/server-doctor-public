<!-- Source: https://docs.openclaw.ai/zh-CN/concepts/system-prompt -->
<!-- Title: 系统提示词 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)

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

-   [系统提示词](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)
-   [结构](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)
-   [提示词模式](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)
-   [工作区引导注入](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)
-   [时间处理](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)
-   [Skills](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)
-   [文档](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)

基础

# 系统提示词

# 

[​

](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)

系统提示词

OpenClaw 为每次智能体运行构建自定义系统提示词。该提示词由 **OpenClaw 拥有**，不使用 pi-coding-agent 默认提示词。 该提示词由 OpenClaw 组装并注入到每次智能体运行中。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)

结构

该提示词设计紧凑，使用固定部分：

-   **Tooling**：当前工具列表 + 简短描述。
-   **Safety**：简短的防护提醒，避免追求权力的行为或绕过监督。
-   **Skills**（如果可用）：告诉模型如何按需加载 Skill 指令。
-   **OpenClaw Self-Update**：如何运行 `config.apply` 和 `update.run`。
-   **Workspace**：工作目录（`agents.defaults.workspace`）。
-   **Documentation**：OpenClaw 文档的本地路径（仓库或 npm 包）以及何时阅读它们。
-   **Workspace Files (injected)**：表示下方包含引导文件。
-   **Sandbox**（启用时）：表示沙箱隔离运行时、沙箱路径，以及是否可用提权执行。
-   **Current Date & Time**：用户本地时间、时区和时间格式。
-   **Reply Tags**：支持的提供商的可选回复标签语法。
-   **Heartbeats**：心跳提示词和确认行为。
-   **Runtime**：主机、操作系统、node、模型、仓库根目录（检测到时）、思考级别（一行）。
-   **Reasoning**：当前可见性级别 + /reasoning 切换提示。

系统提示词中的安全防护是建议性的。它们指导模型行为但不强制执行策略。使用工具策略、执行审批、沙箱隔离和渠道允许列表进行硬性执行；运维人员可以按设计禁用这些。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)

提示词模式

OpenClaw 可以为子智能体渲染更小的系统提示词。运行时为每次运行设置一个 `promptMode`（不是面向用户的配置）：

-   `full`（默认）：包含上述所有部分。
-   `minimal`：用于子智能体；省略 **Skills**、**Memory Recall**、**OpenClaw Self-Update**、**Model Aliases**、**User Identity**、**Reply Tags**、**Messaging**、**Silent Replies** 和 **Heartbeats**。Tooling、**Safety**、Workspace、Sandbox、Current Date & Time（已知时）、Runtime 和注入的上下文仍然可用。
-   `none`：仅返回基本身份行。

当 `promptMode=minimal` 时，额外注入的提示词标记为 **Subagent Context** 而不是 **Group Chat Context**。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)

工作区引导注入

引导文件被修剪后附加在 **Project Context** 下，这样模型无需显式读取即可看到身份和配置上下文：

-   `AGENTS.md`
-   `SOUL.md`
-   `TOOLS.md`
-   `IDENTITY.md`
-   `USER.md`
-   `HEARTBEAT.md`
-   `BOOTSTRAP.md`（仅在全新工作区上）

大文件会带截断标记被截断。每个文件的最大大小由 `agents.defaults.bootstrapMaxChars` 控制（默认：20000）。缺失的文件会注入一个简短的缺失文件标记。 内部钩子可以通过 `agent:bootstrap` 拦截此步骤以修改或替换注入的引导文件（例如将 `SOUL.md` 替换为其他角色）。 要检查每个注入文件贡献了多少（原始 vs 注入、截断，加上工具 schema 开销），使用 `/context list` 或 `/context detail`。参见[上下文](https://docs.openclaw.ai/concepts/context)。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)

时间处理

当用户时区已知时，系统提示词包含专用的 **Current Date & Time** 部分。为保持提示词缓存稳定，它现在只包含**时区**（没有动态时钟或时间格式）。 当智能体需要当前时间时使用 `session_status`；状态卡片包含时间戳行。 配置方式：

-   `agents.defaults.userTimezone`
-   `agents.defaults.timeFormat`（`auto` | `12` | `24`）

完整行为详情参见[日期和时间](https://docs.openclaw.ai/date-time)。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)

Skills

当存在符合条件的 Skills 时，OpenClaw 注入一个紧凑的**可用 Skills 列表**（`formatSkillsForPrompt`），其中包含每个 Skill 的**文件路径**。提示词指示模型使用 `read` 加载列出位置（工作区、托管或内置）的 SKILL.md。如果没有符合条件的 Skills，则省略 Skills 部分。

复制

```
<available_skills>
  <skill>
    <name>...</name>
    <description>...</description>
    <location>...</location>
  </skill>
</available_skills>
```

这使基础提示词保持小巧，同时仍然支持有针对性的 Skill 使用。

## 

[​

](https://docs.openclaw.ai/zh-CN/concepts/system-prompt)

文档

如果可用，系统提示词包含一个 **Documentation** 部分，指向本地 OpenClaw 文档目录（仓库工作区中的 `docs/` 或打包的 npm 包文档），并注明公共镜像、源仓库、社区 Discord 和 ClawHub ([https://clawhub.com](https://clawhub.com/)) 用于 Skills 发现。提示词指示模型首先查阅本地文档了解 OpenClaw 行为、命令、配置或架构，并尽可能自己运行 `openclaw status`（仅在无法访问时询问用户）。

[智能体循环](https://docs.openclaw.ai/zh-CN/concepts/agent-loop)[上下文](https://docs.openclaw.ai/zh-CN/concepts/context)

⌘I
