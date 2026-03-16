<!-- Source: https://docs.openclaw.ai/zh-CN/AGENTS -->
<!-- Title: AGENTS - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/AGENTS)

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

-   [AGENTS.md - zh-CN 文档翻译工作区](https://docs.openclaw.ai/zh-CN/AGENTS)
-   [Read When](https://docs.openclaw.ai/zh-CN/AGENTS)
-   [Pipeline（docs-i18n）](https://docs.openclaw.ai/zh-CN/AGENTS)
-   [zh-CN 样式规则](https://docs.openclaw.ai/zh-CN/AGENTS)
-   [关键术语（#6995 修复）](https://docs.openclaw.ai/zh-CN/AGENTS)
-   [反馈与变更记录](https://docs.openclaw.ai/zh-CN/AGENTS)

文档元信息

# AGENTS

# 

[​

](https://docs.openclaw.ai/zh-CN/AGENTS)

AGENTS.md - zh-CN 文档翻译工作区

## 

[​

](https://docs.openclaw.ai/zh-CN/AGENTS)

Read When

-   维护 `docs/zh-CN/**`
-   更新中文翻译流水线（glossary/TM/prompt）
-   处理中文翻译反馈或回归

## 

[​

](https://docs.openclaw.ai/zh-CN/AGENTS)

Pipeline（docs-i18n）

-   源文档：`docs/**/*.md`
-   目标文档：`docs/zh-CN/**/*.md`
-   术语表：`docs/.i18n/glossary.zh-CN.json`
-   翻译记忆库：`docs/.i18n/zh-CN.tm.jsonl`
-   提示词规则：`scripts/docs-i18n/prompt.go`

常用运行方式：

复制

```
# 批量（doc 模式，可并行）
go run scripts/docs-i18n/main.go -mode doc -parallel 6 docs/**/*.md

# 单文件

go run scripts/docs-i18n/main.go -mode doc docs/channels/matrix.md

# 小范围补丁（segment 模式，使用 TM；不支持并行）
go run scripts/docs-i18n/main.go -mode segment docs/channels/matrix.md
```

注意事项：

-   doc 模式用于整页翻译；segment 模式用于小范围修补（依赖 TM）。
-   新增技术术语、页面标题或短导航标签时，先更新 `docs/.i18n/glossary.zh-CN.json`，再跑 `doc` 模式；不要指望模型自行保留英文术语或固定译名。
-   `pnpm docs:check-i18n-glossary` 会检查变更过的英文文档标题和短内部链接标签是否已写入 glossary。
-   超大文件若超时，优先做**定点替换**或拆分后再跑。
-   翻译后检查中文引号、CJK-Latin 间距和术语一致性。

## 

[​

](https://docs.openclaw.ai/zh-CN/AGENTS)

zh-CN 样式规则

-   CJK-Latin 间距：遵循 W3C CLREQ（如 `Gateway 网关`、`Skills 配置`）。
-   中文引号：正文/标题使用 `“”`；代码/CLI/键名保持 ASCII 引号。
-   术语保留英文：`Skills`、`local loopback`、`Tailscale`。
-   代码块/内联代码：保持原样，不在代码内插入空格或引号替换。

## 

[​

](https://docs.openclaw.ai/zh-CN/AGENTS)

关键术语（#6995 修复）

-   `Gateway 网关`
-   `Skills 配置`
-   `沙箱`
-   `预期键名`
-   `配套应用`
-   `分块流式传输`
-   `设备发现`

## 

[​

](https://docs.openclaw.ai/zh-CN/AGENTS)

反馈与变更记录

-   反馈来源：GitHub issue #6995
-   反馈用户：@AaronWander、@taiyi747、@Explorer1092、@rendaoyuan
-   变更要点：更新 prompt 规则、扩充 glossary、清理 TM、批量再生成 + 定点修复
-   参考链接：[https://github.com/openclaw/openclaw/issues/6995](https://github.com/openclaw/openclaw/issues/6995)

[文档目录](https://docs.openclaw.ai/zh-CN/start/docs-directory)

⌘I
