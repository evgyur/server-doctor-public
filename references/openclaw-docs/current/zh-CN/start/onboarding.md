<!-- Source: https://docs.openclaw.ai/zh-CN/start/onboarding -->
<!-- Title: 新手引导 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/start/onboarding)

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

##### 首页

-   [
    
    OpenClaw
    
    
    
    ](https://docs.openclaw.ai/zh-CN)

##### 概览

-   [
    
    案例展示
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/showcase)

##### 核心概念

-   [
    
    功能
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/features)

##### 第一步

-   [
    
    入门指南
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/getting-started)
-   [
    
    Onboarding: CLI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/wizard)
-   [
    
    新手引导
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/onboarding)

##### 指南

-   [
    
    个人助手设置
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/openclaw)

-   [新手引导（macOS 应用）](https://docs.openclaw.ai/zh-CN/start/onboarding)
-   [页面顺序（当前）](https://docs.openclaw.ai/zh-CN/start/onboarding)
-   [1) 欢迎 + 安全提示](https://docs.openclaw.ai/zh-CN/start/onboarding)
-   [2) 本地 vs 远程](https://docs.openclaw.ai/zh-CN/start/onboarding)
-   [3) 仅限本地的认证（Anthropic OAuth）](https://docs.openclaw.ai/zh-CN/start/onboarding)
-   [4) 设置向导（Gateway 网关驱动）](https://docs.openclaw.ai/zh-CN/start/onboarding)
-   [5) 权限](https://docs.openclaw.ai/zh-CN/start/onboarding)
-   [6) CLI（可选）](https://docs.openclaw.ai/zh-CN/start/onboarding)
-   [7) 新手引导聊天（专用会话）](https://docs.openclaw.ai/zh-CN/start/onboarding)
-   [智能体引导仪式](https://docs.openclaw.ai/zh-CN/start/onboarding)
-   [可选：Gmail 钩子（手动）](https://docs.openclaw.ai/zh-CN/start/onboarding)
-   [远程模式说明](https://docs.openclaw.ai/zh-CN/start/onboarding)

第一步

# 新手引导

# 

[​

](https://docs.openclaw.ai/zh-CN/start/onboarding)

新手引导（macOS 应用）

本文档描述**当前**的首次运行新手引导流程。目标是流畅的”第 0 天”体验：选择 Gateway 网关运行位置、连接认证、运行向导，然后让智能体自行引导。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/onboarding)

页面顺序（当前）

1.  欢迎 + 安全提示
2.  **Gateway 网关选择**（本地 / 远程 / 稍后配置）
3.  **认证（Anthropic OAuth）** — 仅限本地
4.  **设置向导**（Gateway 网关驱动）
5.  **权限**（TCC 提示）
6.  **CLI**（可选）
7.  **新手引导聊天**（专用会话）
8.  就绪

## 

[​

](https://docs.openclaw.ai/zh-CN/start/onboarding)

1) 欢迎 + 安全提示

阅读显示的安全提示并相应决定。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/onboarding)

2) 本地 vs 远程

**Gateway 网关**在哪里运行？

-   **本地（此 Mac）：** 新手引导可以在本地运行 OAuth 流程并写入凭证。
-   **远程（通过 SSH/Tailnet）：** 新手引导**不会**在本地运行 OAuth；凭证必须存在于 Gateway 网关主机上。
-   **稍后配置：** 跳过设置并保持应用未配置状态。

Gateway 网关认证提示：

-   向导现在即使对于 loopback 也会生成**令牌**，因此本地 WS 客户端必须认证。
-   如果你禁用认证，任何本地进程都可以连接；仅在完全受信任的机器上使用。
-   对于多机器访问或非 loopback 绑定，使用**令牌**。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/onboarding)

3) 仅限本地的认证（Anthropic OAuth）

macOS 应用支持 Anthropic OAuth（Claude Pro/Max）。流程：

-   打开浏览器进行 OAuth（PKCE）
-   要求用户粘贴 `code#state` 值
-   将凭证写入 `~/.openclaw/credentials/oauth.json`

其他提供商（OpenAI、自定义 API）目前通过环境变量或配置文件配置。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/onboarding)

4) 设置向导（Gateway 网关驱动）

应用可以运行与 CLI 相同的设置向导。这使新手引导与 Gateway 网关端行为保持同步，避免在 SwiftUI 中重复逻辑。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/onboarding)

5) 权限

新手引导请求以下所需的 TCC 权限：

-   通知
-   辅助功能
-   屏幕录制
-   麦克风 / 语音识别
-   自动化（AppleScript）

## 

[​

](https://docs.openclaw.ai/zh-CN/start/onboarding)

6) CLI（可选）

应用可以通过 npm/pnpm 安装全局 `openclaw` CLI，以便终端工作流和 launchd 任务开箱即用。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/onboarding)

7) 新手引导聊天（专用会话）

设置完成后，应用会打开一个专用的新手引导聊天会话，让智能体可以自我介绍并指导后续步骤。这使首次运行指导与你的正常对话分开。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/onboarding)

智能体引导仪式

在首次智能体运行时，OpenClaw 会引导一个工作区（默认 `~/.openclaw/workspace`）：

-   初始化 `AGENTS.md`、`BOOTSTRAP.md`、`IDENTITY.md`、`USER.md`
-   运行简短的问答仪式（一次一个问题）
-   将身份 + 偏好写入 `IDENTITY.md`、`USER.md`、`SOUL.md`
-   完成后删除 `BOOTSTRAP.md`，使其只运行一次

## 

[​

](https://docs.openclaw.ai/zh-CN/start/onboarding)

可选：Gmail 钩子（手动）

Gmail Pub/Sub 设置目前是手动步骤。使用：

复制

```
openclaw webhooks gmail setup --account you@gmail.com
```

参阅 [/automation/gmail-pubsub](https://docs.openclaw.ai/automation/gmail-pubsub) 了解详情。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/onboarding)

远程模式说明

当 Gateway 网关在另一台机器上运行时，凭证和工作区文件存储在**该主机上**。如果你需要在远程模式下使用 OAuth，请在 Gateway 网关主机上创建：

-   `~/.openclaw/credentials/oauth.json`
-   `~/.openclaw/agents/<agentId>/agent/auth-profiles.json`

[Onboarding: CLI](https://docs.openclaw.ai/zh-CN/start/wizard)[个人助手设置](https://docs.openclaw.ai/zh-CN/start/openclaw)

⌘I
