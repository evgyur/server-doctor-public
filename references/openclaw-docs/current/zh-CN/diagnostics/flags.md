<!-- Source: https://docs.openclaw.ai/zh-CN/diagnostics/flags -->
<!-- Title: 诊断标志 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/diagnostics/flags)

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

-   [诊断标志](https://docs.openclaw.ai/zh-CN/diagnostics/flags)
-   [工作原理](https://docs.openclaw.ai/zh-CN/diagnostics/flags)
-   [通过配置启用](https://docs.openclaw.ai/zh-CN/diagnostics/flags)
-   [环境变量覆盖（一次性）](https://docs.openclaw.ai/zh-CN/diagnostics/flags)
-   [日志存储位置](https://docs.openclaw.ai/zh-CN/diagnostics/flags)
-   [提取日志](https://docs.openclaw.ai/zh-CN/diagnostics/flags)
-   [注意事项](https://docs.openclaw.ai/zh-CN/diagnostics/flags)

环境与调试

# 诊断标志

# 

[​

](https://docs.openclaw.ai/zh-CN/diagnostics/flags)

诊断标志

诊断标志让你可以启用定向调试日志，而无需在所有地方开启详细日志。标志是可选启用的，除非子系统检查它们，否则不会生效。

## 

[​

](https://docs.openclaw.ai/zh-CN/diagnostics/flags)

工作原理

-   标志是字符串（不区分大小写）。
-   你可以在配置中或通过环境变量覆盖来启用标志。
-   支持通配符：
    -   `telegram.*` 匹配 `telegram.http`
    -   `*` 启用所有标志

## 

[​

](https://docs.openclaw.ai/zh-CN/diagnostics/flags)

通过配置启用

复制

```
{
  "diagnostics": {
    "flags": ["telegram.http"]
  }
}
```

多个标志：

复制

```
{
  "diagnostics": {
    "flags": ["telegram.http", "gateway.*"]
  }
}
```

更改标志后重启 Gateway 网关。

## 

[​

](https://docs.openclaw.ai/zh-CN/diagnostics/flags)

环境变量覆盖（一次性）

复制

```
OPENCLAW_DIAGNOSTICS=telegram.http,telegram.payload
```

禁用所有标志：

复制

```
OPENCLAW_DIAGNOSTICS=0
```

## 

[​

](https://docs.openclaw.ai/zh-CN/diagnostics/flags)

日志存储位置

标志将日志输出到标准诊断日志文件。默认位置：

复制

```
/tmp/openclaw/openclaw-YYYY-MM-DD.log
```

如果你设置了 `logging.file`，则使用该路径。日志为 JSONL 格式（每行一个 JSON 对象）。脱敏仍然根据 `logging.redactSensitive` 应用。

## 

[​

](https://docs.openclaw.ai/zh-CN/diagnostics/flags)

提取日志

选择最新的日志文件：

复制

```
ls -t /tmp/openclaw/openclaw-*.log | head -n 1
```

过滤 Telegram HTTP 诊断：

复制

```
rg "telegram http error" /tmp/openclaw/openclaw-*.log
```

或在复现时使用 tail：

复制

```
tail -f /tmp/openclaw/openclaw-$(date +%F).log | rg "telegram http error"
```

对于远程 Gateway 网关，你也可以使用 `openclaw logs --follow`（参见 [/cli/logs](https://docs.openclaw.ai/cli/logs)）。

## 

[​

](https://docs.openclaw.ai/zh-CN/diagnostics/flags)

注意事项

-   如果 `logging.level` 设置为高于 `warn`，这些日志可能会被抑制。默认的 `info` 级别即可。
-   标志可以安全地保持启用状态；它们只影响特定子系统的日志量。
-   使用 [/logging](https://docs.openclaw.ai/logging) 更改日志目标、级别和脱敏设置。

[Node + tsx 崩溃](https://docs.openclaw.ai/zh-CN/debug/node-issue)[Node.js](https://docs.openclaw.ai/zh-CN/install/node)

⌘I
