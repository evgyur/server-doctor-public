<!-- Source: https://docs.openclaw.ai/zh-CN/help/troubleshooting -->
<!-- Title: 故障排除 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

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

##### 帮助

-   [
    
    帮助
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help)
-   [
    
    故障排除
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
-   [
    
    常见问题
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help/faq)

##### 社区

-   [
    
    OpenClaw 传说
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/lore)

##### 环境与调试

-   [
    
    环境变量
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help/environment)
-   [
    
    调试
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help/debugging)
-   [
    
    测试
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help/testing)
-   [
    
    脚本
    
    
    
    ](https://docs.openclaw.ai/zh-CN/help/scripts)
-   [
    
    Node + tsx 崩溃
    
    
    
    ](https://docs.openclaw.ai/zh-CN/debug/node-issue)
-   [
    
    诊断标志
    
    
    
    ](https://docs.openclaw.ai/zh-CN/diagnostics/flags)

##### Node 运行时

-   [
    
    Node.js
    
    
    
    ](https://docs.openclaw.ai/zh-CN/install/node)

##### 压缩机制内部参考

-   [
    
    会话管理深入了解
    
    
    
    ](https://docs.openclaw.ai/zh-CN/reference/session-management-compaction)

##### 开发者设置

-   [
    
    设置
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/setup)
-   [
    
    Pi 开发工作流程
    
    
    
    ](https://docs.openclaw.ai/zh-CN/pi-dev)

##### 文档元信息

-   [
    
    文档导航中心
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/hubs)
-   [
    
    文档目录
    
    
    
    ](https://docs.openclaw.ai/zh-CN/start/docs-directory)
-   [
    
    AGENTS
    
    
    
    ](https://docs.openclaw.ai/zh-CN/AGENTS)

-   [故障排除](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
-   [最初的六十秒](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
-   [常见的“它坏了”情况](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
-   [openclaw: command not found](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
-   [安装程序失败（或你需要完整日志）](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
-   [Gateway 网关“unauthorized”、无法连接或持续重连](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
-   [控制 UI 在 HTTP 上失败（需要设备身份）](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
-   [docs.openclaw.ai 显示 SSL 错误（Comcast/Xfinity）](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
-   [服务显示运行中，但 RPC 探测失败](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
-   [模型/认证失败（速率限制、账单、“all models failed”）](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
-   [/model 显示 model not allowed](https://docs.openclaw.ai/zh-CN/help/troubleshooting)
-   [提交问题时](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

帮助

# 故障排除

# 

[​

](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

故障排除

## 

[​

](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

最初的六十秒

按顺序运行这些命令：

复制

```
openclaw status
openclaw status --all
openclaw gateway probe
openclaw logs --follow
openclaw doctor
```

如果 Gateway 网关可达，进行深度探测：

复制

```
openclaw status --deep
```

## 

[​

](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

常见的“它坏了”情况

### 

[​

](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

`openclaw: command not found`

几乎总是 Node/npm PATH 问题。从这里开始：

-   [安装（Node/npm PATH 安装完整性检查）](https://docs.openclaw.ai/install)

### 

[​

](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

安装程序失败（或你需要完整日志）

以详细模式重新运行安装程序以查看完整跟踪和 npm 输出：

复制

```
curl -fsSL https://openclaw.ai/install.sh | bash -s -- --verbose
```

对于 beta 安装：

复制

```
curl -fsSL https://openclaw.ai/install.sh | bash -s -- --beta --verbose
```

你也可以设置 `OPENCLAW_VERBOSE=1` 代替标志。

### 

[​

](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

Gateway 网关“unauthorized”、无法连接或持续重连

-   [Gateway 网关故障排除](https://docs.openclaw.ai/gateway/troubleshooting)
-   [Gateway 网关认证](https://docs.openclaw.ai/gateway/authentication)

### 

[​

](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

控制 UI 在 HTTP 上失败（需要设备身份）

-   [Gateway 网关故障排除](https://docs.openclaw.ai/gateway/troubleshooting)
-   [控制 UI](https://docs.openclaw.ai/web/control-ui)

### 

[​

](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

`docs.openclaw.ai` 显示 SSL 错误（Comcast/Xfinity）

一些 Comcast/Xfinity 连接通过 Xfinity Advanced Security 阻止 `docs.openclaw.ai`。 禁用 Advanced Security 或将 `docs.openclaw.ai` 添加到允许列表，然后重试。

-   Xfinity Advanced Security 帮助：[https://www.xfinity.com/support/articles/using-xfinity-xfi-advanced-security](https://www.xfinity.com/support/articles/using-xfinity-xfi-advanced-security)
-   快速检查：尝试移动热点或 VPN 以确认这是 ISP 级别的过滤

### 

[​

](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

服务显示运行中，但 RPC 探测失败

-   [Gateway 网关故障排除](https://docs.openclaw.ai/gateway/troubleshooting)
-   [后台进程/服务](https://docs.openclaw.ai/gateway/background-process)

### 

[​

](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

模型/认证失败（速率限制、账单、“all models failed”）

-   [模型](https://docs.openclaw.ai/cli/models)
-   [OAuth / 认证概念](https://docs.openclaw.ai/concepts/oauth)

### 

[​

](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

`/model` 显示 `model not allowed`

这通常意味着 `agents.defaults.models` 配置为允许列表。当它非空时，只能选择那些提供商/模型键。

-   检查允许列表：`openclaw config get agents.defaults.models`
-   添加你想要的模型（或清除允许列表）然后重试 `/model`
-   使用 `/models` 浏览允许的提供商/模型

### 

[​

](https://docs.openclaw.ai/zh-CN/help/troubleshooting)

提交问题时

粘贴一份安全报告：

复制

```
openclaw status --all
```

如果可以的话，包含来自 `openclaw logs --follow` 的相关日志尾部。

[帮助](https://docs.openclaw.ai/zh-CN/help)[常见问题](https://docs.openclaw.ai/zh-CN/help/faq)

⌘I
