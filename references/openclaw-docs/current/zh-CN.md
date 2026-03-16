<!-- Source: https://docs.openclaw.ai/zh-CN -->
<!-- Title: OpenClaw - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN)

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

-   [OpenClaw 🦞](https://docs.openclaw.ai/zh-CN)
-   [工作原理](https://docs.openclaw.ai/zh-CN)
-   [核心功能](https://docs.openclaw.ai/zh-CN)
-   [快速开始](https://docs.openclaw.ai/zh-CN)
-   [仪表板](https://docs.openclaw.ai/zh-CN)
-   [配置（可选）](https://docs.openclaw.ai/zh-CN)
-   [从这里开始](https://docs.openclaw.ai/zh-CN)
-   [了解更多](https://docs.openclaw.ai/zh-CN)

首页

# OpenClaw

# 

[​

](https://docs.openclaw.ai/zh-CN)

OpenClaw 🦞

![OpenClaw](https://mintcdn.com/clawdhub/-t5HSeZ3Y_0_wH4i/assets/openclaw-logo-text-dark.png?fit=max&auto=format&n=-t5HSeZ3Y_0_wH4i&q=85&s=61797dcb0c37d6e9279b8c5ad2e850e4)![OpenClaw](https://mintcdn.com/clawdhub/FaXdIfo7gPK_jSWb/assets/openclaw-logo-text.png?fit=max&auto=format&n=FaXdIfo7gPK_jSWb&q=85&s=d799bea41acb92d4c9fd1075c575879f)

> _“去壳！去壳！”_ — 大概是一只太空龙虾说的

**适用于任何操作系统的 AI 智能体 Gateway 网关，支持 WhatsApp、Telegram、Discord、iMessage 等。**  
发送消息，随时随地获取智能体响应。通过插件可添加 Mattermost 等更多渠道。

[

## 入门指南

安装 OpenClaw 并在几分钟内启动 Gateway 网关。





](https://docs.openclaw.ai/start/getting-started)[

## 运行向导

通过 `openclaw onboard` 和配对流程进行引导式设置。





](https://docs.openclaw.ai/start/wizard)[

## 打开控制界面

启动浏览器仪表板，管理聊天、配置和会话。





](https://docs.openclaw.ai/web/control-ui)

OpenClaw 通过单个 Gateway 网关进程将聊天应用连接到 Pi 等编程智能体。它为 OpenClaw 助手提供支持，并支持本地或远程部署。

## 

[​

](https://docs.openclaw.ai/zh-CN)

工作原理

Gateway 网关是会话、路由和渠道连接的唯一事实来源。

## 

[​

](https://docs.openclaw.ai/zh-CN)

核心功能

## 多渠道 Gateway 网关

通过单个 Gateway 网关进程连接 WhatsApp、Telegram、Discord 和 iMessage。

## 插件渠道

通过扩展包添加 Mattermost 等更多渠道。

## 多智能体路由

按智能体、工作区或发送者隔离会话。

## 媒体支持

发送和接收图片、音频和文档。

## Web 控制界面

浏览器仪表板，用于聊天、配置、会话和节点管理。

## 移动节点

配对 iOS 和 Android 节点，支持 Canvas。

## 

[​

](https://docs.openclaw.ai/zh-CN)

快速开始

1

[

](https://docs.openclaw.ai/zh-CN)

安装 OpenClaw

复制

```
npm install -g openclaw@latest
```

2

[

](https://docs.openclaw.ai/zh-CN)

新手引导并安装服务

复制

```
openclaw onboard --install-daemon
```

3

[

](https://docs.openclaw.ai/zh-CN)

配对 WhatsApp 并启动 Gateway 网关

复制

```
openclaw channels login
openclaw gateway --port 18789
```

需要完整的安装和开发环境设置？请参阅[快速开始](https://docs.openclaw.ai/start/quickstart)。

## 

[​

](https://docs.openclaw.ai/zh-CN)

仪表板

Gateway 网关启动后，打开浏览器控制界面。

-   本地默认地址：[http://127.0.0.1:18789/](http://127.0.0.1:18789/)
-   远程访问：[Web 界面](https://docs.openclaw.ai/web)和 [Tailscale](https://docs.openclaw.ai/gateway/tailscale)

![OpenClaw](https://mintcdn.com/clawdhub/FaXdIfo7gPK_jSWb/whatsapp-openclaw.jpg?fit=max&auto=format&n=FaXdIfo7gPK_jSWb&q=85&s=b74a3630b0e971f466eff15fbdc642cb)

## 

[​

](https://docs.openclaw.ai/zh-CN)

配置（可选）

配置文件位于 `~/.openclaw/openclaw.json`。

-   如果你**不做任何修改**，OpenClaw 将使用内置的 Pi 二进制文件以 RPC 模式运行，并按发送者创建独立会话。
-   如果你想要限制访问，可以从 `channels.whatsapp.allowFrom` 和（针对群组的）提及规则开始配置。

示例：

复制

```
{
  channels: {
    whatsapp: {
      allowFrom: ["+15555550123"],
      groups: { "*": { requireMention: true } },
    },
  },
  messages: { groupChat: { mentionPatterns: ["@openclaw"] } },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN)

从这里开始

[

## 文档中心

所有文档和指南，按用例分类。





](https://docs.openclaw.ai/start/hubs)[

## 配置

核心 Gateway 网关设置、令牌和提供商配置。





](https://docs.openclaw.ai/gateway/configuration)[

## 远程访问

SSH 和 tailnet 访问模式。





](https://docs.openclaw.ai/gateway/remote)[

## 渠道

WhatsApp、Telegram、Discord 等渠道的具体设置。





](https://docs.openclaw.ai/channels/telegram)[

## 节点

iOS 和 Android 节点的配对与 Canvas 功能。





](https://docs.openclaw.ai/nodes)[

## 帮助

常见修复方法和故障排除入口。





](https://docs.openclaw.ai/help)

## 

[​

](https://docs.openclaw.ai/zh-CN)

了解更多

[

## 完整功能列表

全部渠道、路由和媒体功能。





](https://docs.openclaw.ai/concepts/features)[

## 多智能体路由

工作区隔离和按智能体的会话管理。





](https://docs.openclaw.ai/concepts/multi-agent)[

## 安全

令牌、白名单和安全控制。





](https://docs.openclaw.ai/gateway/security)[

## 故障排除

Gateway 网关诊断和常见错误。





](https://docs.openclaw.ai/gateway/troubleshooting)[

## 关于与致谢

项目起源、贡献者和许可证。





](https://docs.openclaw.ai/reference/credits)

[案例展示](https://docs.openclaw.ai/zh-CN/start/showcase)

⌘I
