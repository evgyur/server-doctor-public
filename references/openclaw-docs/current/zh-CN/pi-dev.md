<!-- Source: https://docs.openclaw.ai/zh-CN/pi-dev -->
<!-- Title: Pi 开发工作流程 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/pi-dev)

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

-   [Pi 开发工作流程](https://docs.openclaw.ai/zh-CN/pi-dev)
-   [类型检查和代码检查](https://docs.openclaw.ai/zh-CN/pi-dev)
-   [运行 Pi 测试](https://docs.openclaw.ai/zh-CN/pi-dev)
-   [手动测试](https://docs.openclaw.ai/zh-CN/pi-dev)
-   [完全重置](https://docs.openclaw.ai/zh-CN/pi-dev)
-   [参考资料](https://docs.openclaw.ai/zh-CN/pi-dev)

开发者设置

# Pi 开发工作流程

# 

[​

](https://docs.openclaw.ai/zh-CN/pi-dev)

Pi 开发工作流程

本指南总结了在 OpenClaw 中开发 Pi 集成的合理工作流程。

## 

[​

](https://docs.openclaw.ai/zh-CN/pi-dev)

类型检查和代码检查

-   类型检查和构建：`pnpm build`
-   代码检查：`pnpm lint`
-   格式检查：`pnpm format`
-   推送前完整检查：`pnpm lint && pnpm build && pnpm test`

## 

[​

](https://docs.openclaw.ai/zh-CN/pi-dev)

运行 Pi 测试

使用专用脚本运行 Pi 集成测试集：

复制

```
scripts/pi/run-tests.sh
```

要包含执行真实提供商行为的实时测试：

复制

```
scripts/pi/run-tests.sh --live
```

该脚本通过以下 glob 模式运行所有 Pi 相关的单元测试：

-   `src/agents/pi-*.test.ts`
-   `src/agents/pi-embedded-*.test.ts`
-   `src/agents/pi-tools*.test.ts`
-   `src/agents/pi-settings.test.ts`
-   `src/agents/pi-tool-definition-adapter.test.ts`
-   `src/agents/pi-extensions/*.test.ts`

## 

[​

](https://docs.openclaw.ai/zh-CN/pi-dev)

手动测试

推荐流程：

-   以开发模式运行 Gateway 网关：
    -   `pnpm gateway:dev`
-   直接触发智能体：
    -   `pnpm openclaw agent --message "Hello" --thinking low`
-   使用 TUI 进行交互式调试：
    -   `pnpm tui`

对于工具调用行为，提示执行 `read` 或 `exec` 操作，以便查看工具流式传输和负载处理。

## 

[​

](https://docs.openclaw.ai/zh-CN/pi-dev)

完全重置

状态存储在 OpenClaw 状态目录下。默认为 `~/.openclaw`。如果设置了 `OPENCLAW_STATE_DIR`，则使用该目录。 要重置所有内容：

-   `openclaw.json` 用于配置
-   `credentials/` 用于认证配置文件和 token
-   `agents/<agentId>/sessions/` 用于智能体会话历史
-   `agents/<agentId>/sessions.json` 用于会话索引
-   `sessions/` 如果存在旧版路径
-   `workspace/` 如果你想要一个空白工作区

如果只想重置会话，删除该智能体的 `agents/<agentId>/sessions/` 和 `agents/<agentId>/sessions.json`。如果不想重新认证，保留 `credentials/`。

## 

[​

](https://docs.openclaw.ai/zh-CN/pi-dev)

参考资料

-   [https://docs.openclaw.ai/testing](https://docs.openclaw.ai/testing)
-   [https://docs.openclaw.ai/start/getting-started](https://docs.openclaw.ai/start/getting-started)

[设置](https://docs.openclaw.ai/zh-CN/start/setup)[文档导航中心](https://docs.openclaw.ai/zh-CN/start/hubs)

⌘I
