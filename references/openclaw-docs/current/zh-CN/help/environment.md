<!-- Source: https://docs.openclaw.ai/zh-CN/help/environment -->
<!-- Title: 环境变量 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/help/environment)

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

-   [环境变量](https://docs.openclaw.ai/zh-CN/help/environment)
-   [优先级（从高到低）](https://docs.openclaw.ai/zh-CN/help/environment)
-   [配置 env 块](https://docs.openclaw.ai/zh-CN/help/environment)
-   [Shell 环境导入](https://docs.openclaw.ai/zh-CN/help/environment)
-   [配置中的环境变量替换](https://docs.openclaw.ai/zh-CN/help/environment)
-   [相关内容](https://docs.openclaw.ai/zh-CN/help/environment)

环境与调试

# 环境变量

# 

[​

](https://docs.openclaw.ai/zh-CN/help/environment)

环境变量

OpenClaw 从多个来源拉取环境变量。规则是**永不覆盖现有值**。

## 

[​

](https://docs.openclaw.ai/zh-CN/help/environment)

优先级（从高到低）

1.  **进程环境**（Gateway 网关进程从父 shell/守护进程已有的内容）。
2.  **当前工作目录中的 `.env`**（dotenv 默认；不覆盖）。
3.  **全局 `.env`** 位于 `~/.openclaw/.env`（即 `$OPENCLAW_STATE_DIR/.env`；不覆盖）。
4.  **配置 `env` 块** 位于 `~/.openclaw/openclaw.json`（仅在缺失时应用）。
5.  **可选的登录 shell 导入**（`env.shellEnv.enabled` 或 `OPENCLAW_LOAD_SHELL_ENV=1`），仅对缺失的预期键名应用。

如果配置文件完全缺失，步骤 4 将被跳过；如果启用了 shell 导入，它仍会运行。

## 

[​

](https://docs.openclaw.ai/zh-CN/help/environment)

配置 `env` 块

两种等效方式设置内联环境变量（都是非覆盖的）：

复制

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

](https://docs.openclaw.ai/zh-CN/help/environment)

Shell 环境导入

`env.shellEnv` 运行你的登录 shell 并仅导入**缺失的**预期键名：

复制

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

环境变量等效项：

-   `OPENCLAW_LOAD_SHELL_ENV=1`
-   `OPENCLAW_SHELL_ENV_TIMEOUT_MS=15000`

## 

[​

](https://docs.openclaw.ai/zh-CN/help/environment)

配置中的环境变量替换

你可以使用 `${VAR_NAME}` 语法在配置字符串值中直接引用环境变量：

复制

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

完整详情参见[配置：环境变量替换](https://docs.openclaw.ai/gateway/configuration)。

## 

[​

](https://docs.openclaw.ai/zh-CN/help/environment)

相关内容

-   [Gateway 网关配置](https://docs.openclaw.ai/gateway/configuration)
-   [常见问题：环境变量和 .env 加载](https://docs.openclaw.ai/help/faq)
-   [模型概述](https://docs.openclaw.ai/concepts/models)

[OpenClaw 传说](https://docs.openclaw.ai/zh-CN/start/lore)[调试](https://docs.openclaw.ai/zh-CN/help/debugging)

⌘I
