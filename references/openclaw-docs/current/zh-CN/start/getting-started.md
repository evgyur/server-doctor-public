<!-- Source: https://docs.openclaw.ai/zh-CN/start/getting-started -->
<!-- Title: 入门指南 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/start/getting-started)

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

-   [入门指南](https://docs.openclaw.ai/zh-CN/start/getting-started)
-   [前置条件](https://docs.openclaw.ai/zh-CN/start/getting-started)
-   [快速设置（CLI）](https://docs.openclaw.ai/zh-CN/start/getting-started)
-   [可选检查和附加内容](https://docs.openclaw.ai/zh-CN/start/getting-started)
-   [常用环境变量](https://docs.openclaw.ai/zh-CN/start/getting-started)
-   [深入了解](https://docs.openclaw.ai/zh-CN/start/getting-started)
-   [你将获得什么](https://docs.openclaw.ai/zh-CN/start/getting-started)
-   [后续步骤](https://docs.openclaw.ai/zh-CN/start/getting-started)

第一步

# 入门指南

# 

[​

](https://docs.openclaw.ai/zh-CN/start/getting-started)

入门指南

目标：以最少的设置，从零开始到完成第一次可用聊天。

最快的聊天方式：打开 Control UI（无需设置渠道）。运行 `openclaw dashboard` 并在浏览器中聊天，或在 上打开 `http://127.0.0.1:18789/`。 文档：[Dashboard](https://docs.openclaw.ai/web/dashboard) 和 [Control UI](https://docs.openclaw.ai/web/control-ui)。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/getting-started)

前置条件

-   推荐使用 Node 24（Node 22 LTS，目前为 `22.16+`，仍因兼容性而受支持）

如果你不确定，请使用 `node --version` 检查你的 Node 版本。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/getting-started)

快速设置（CLI）

1

[

](https://docs.openclaw.ai/zh-CN/start/getting-started)

安装 OpenClaw（推荐）

-   macOS/Linux
    
-   Windows（PowerShell）
    

复制

```
curl -fsSL https://openclaw.ai/install.sh | bash
```

![安装脚本流程](https://mintcdn.com/clawdhub/U8jr7qEbUc9OU9YR/assets/install-script.svg?fit=max&auto=format&n=U8jr7qEbUc9OU9YR&q=85&s=50706f81e3210a610262f14facb11f65)

复制

```
iwr -useb https://openclaw.ai/install.ps1 | iex
```

其他安装方式和要求： [Install](https://docs.openclaw.ai/install)。

2

[

](https://docs.openclaw.ai/zh-CN/start/getting-started)

运行设置向导

复制

```
openclaw onboard --install-daemon
```

向导会配置认证、Gateway 网关设置和可选渠道。 详情请参见 [Setup Wizard](https://docs.openclaw.ai/start/wizard)。

3

[

](https://docs.openclaw.ai/zh-CN/start/getting-started)

检查 Gateway 网关

如果你已安装服务，它应该已经在运行：

复制

```
openclaw gateway status
```

4

[

](https://docs.openclaw.ai/zh-CN/start/getting-started)

打开 Control UI

复制

```
openclaw dashboard
```

如果 Control UI 能加载，你的 Gateway 网关就已准备就绪，可以使用。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/getting-started)

可选检查和附加内容

在前台运行 Gateway 网关

适合快速测试或故障排除。

复制

```
openclaw gateway --port 18789
```
发送一条测试消息

需要已配置的渠道。

复制

```
openclaw message send --target +15555550123 --message "Hello from OpenClaw"
```

## 

[​

](https://docs.openclaw.ai/zh-CN/start/getting-started)

常用环境变量

如果你将 OpenClaw 作为服务账户运行，或想使用自定义配置/状态位置：

-   `OPENCLAW_HOME` 设置用于内部路径解析的主目录。
-   `OPENCLAW_STATE_DIR` 覆盖状态目录。
-   `OPENCLAW_CONFIG_PATH` 覆盖配置文件路径。

完整的环境变量参考： [环境变量](https://docs.openclaw.ai/help/environment)。

## 

[​

](https://docs.openclaw.ai/zh-CN/start/getting-started)

深入了解

[

## 设置向导（详情）

完整的 CLI 向导参考和高级选项。





](https://docs.openclaw.ai/start/wizard)[

## macOS 应用新手引导

macOS 应用的首次运行流程。





](https://docs.openclaw.ai/start/onboarding)

## 

[​

](https://docs.openclaw.ai/zh-CN/start/getting-started)

你将获得什么

-   一个正在运行的 Gateway 网关
-   已配置好的认证
-   Control UI 访问权限或一个已连接的渠道

## 

[​

](https://docs.openclaw.ai/zh-CN/start/getting-started)

后续步骤

-   私信安全和批准：[Pairing](https://docs.openclaw.ai/channels/pairing)
-   连接更多渠道：[Channels](https://docs.openclaw.ai/channels)
-   高级工作流和源码安装：[Setup](https://docs.openclaw.ai/start/setup)

[功能](https://docs.openclaw.ai/zh-CN/concepts/features)[Onboarding: CLI](https://docs.openclaw.ai/zh-CN/start/wizard)

⌘I
