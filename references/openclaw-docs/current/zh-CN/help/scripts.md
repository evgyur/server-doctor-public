<!-- Source: https://docs.openclaw.ai/zh-CN/help/scripts -->
<!-- Title: 脚本 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/help/scripts)

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

-   [脚本](https://docs.openclaw.ai/zh-CN/help/scripts)
-   [约定](https://docs.openclaw.ai/zh-CN/help/scripts)
-   [认证监控脚本](https://docs.openclaw.ai/zh-CN/help/scripts)
-   [添加脚本时](https://docs.openclaw.ai/zh-CN/help/scripts)

环境与调试

# 脚本

# 

[​

](https://docs.openclaw.ai/zh-CN/help/scripts)

脚本

`scripts/` 目录包含用于本地工作流和运维任务的辅助脚本。 当任务明确与某个脚本相关时使用这些脚本；否则优先使用 CLI。

## 

[​

](https://docs.openclaw.ai/zh-CN/help/scripts)

约定

-   除非在文档或发布检查清单中引用，否则脚本为**可选**。
-   当 CLI 接口存在时优先使用（例如：认证监控使用 `openclaw models status --check`）。
-   假定脚本与特定主机相关；在新机器上运行前请先阅读脚本内容。

## 

[​

](https://docs.openclaw.ai/zh-CN/help/scripts)

认证监控脚本

认证监控脚本的文档请参阅： [/automation/auth-monitoring](https://docs.openclaw.ai/automation/auth-monitoring)

## 

[​

](https://docs.openclaw.ai/zh-CN/help/scripts)

添加脚本时

-   保持脚本专注且有文档说明。
-   在相关文档中添加简短条目（如果缺少则创建一个）。

[测试](https://docs.openclaw.ai/zh-CN/help/testing)[Node + tsx 崩溃](https://docs.openclaw.ai/zh-CN/debug/node-issue)

⌘I
