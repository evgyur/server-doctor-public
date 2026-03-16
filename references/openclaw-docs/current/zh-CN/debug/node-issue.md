<!-- Source: https://docs.openclaw.ai/zh-CN/debug/node-issue -->
<!-- Title: Node + tsx 崩溃 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/debug/node-issue)

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

-   [Node + tsx “\_\_name is not a function” 崩溃](https://docs.openclaw.ai/zh-CN/debug/node-issue)
-   [概述](https://docs.openclaw.ai/zh-CN/debug/node-issue)
-   [环境](https://docs.openclaw.ai/zh-CN/debug/node-issue)
-   [复现步骤（仅 Node）](https://docs.openclaw.ai/zh-CN/debug/node-issue)
-   [仓库内最小复现](https://docs.openclaw.ai/zh-CN/debug/node-issue)
-   [Node 版本检查](https://docs.openclaw.ai/zh-CN/debug/node-issue)
-   [说明 / 假设](https://docs.openclaw.ai/zh-CN/debug/node-issue)
-   [回归历史](https://docs.openclaw.ai/zh-CN/debug/node-issue)
-   [解决方法](https://docs.openclaw.ai/zh-CN/debug/node-issue)
-   [参考资料](https://docs.openclaw.ai/zh-CN/debug/node-issue)
-   [后续步骤](https://docs.openclaw.ai/zh-CN/debug/node-issue)

环境与调试

# Node + tsx 崩溃

# 

[​

](https://docs.openclaw.ai/zh-CN/debug/node-issue)

Node + tsx “\_\_name is not a function” 崩溃

## 

[​

](https://docs.openclaw.ai/zh-CN/debug/node-issue)

概述

通过 Node 使用 `tsx` 运行 OpenClaw 时，启动阶段报错：

复制

```
[openclaw] Failed to start CLI: TypeError: __name is not a function
    at createSubsystemLogger (.../src/logging/subsystem.ts:203:25)
    at .../src/agents/auth-profiles/constants.ts:25:20
```

此问题在开发脚本从 Bun 切换到 `tsx` 后出现（提交 `2871657e`，2026-01-06）。相同的运行路径在 Bun 下正常工作。

## 

[​

](https://docs.openclaw.ai/zh-CN/debug/node-issue)

环境

-   Node: v25.x（在 v25.3.0 上观察到）
-   tsx: 4.21.0
-   操作系统: macOS（其他运行 Node 25 的平台也可能复现）

## 

[​

](https://docs.openclaw.ai/zh-CN/debug/node-issue)

复现步骤（仅 Node）

复制

```
# 在仓库根目录
node --version
pnpm install
node --import tsx src/entry.ts status
```

## 

[​

](https://docs.openclaw.ai/zh-CN/debug/node-issue)

仓库内最小复现

复制

```
node --import tsx scripts/repro/tsx-name-repro.ts
```

## 

[​

](https://docs.openclaw.ai/zh-CN/debug/node-issue)

Node 版本检查

-   Node 25.3.0：失败
-   Node 22.22.0（Homebrew `node@22`）：失败
-   Node 24：尚未安装，需要验证

## 

[​

](https://docs.openclaw.ai/zh-CN/debug/node-issue)

说明 / 假设

-   `tsx` 使用 esbuild 转换 TS/ESM。esbuild 的 `keepNames` 会生成一个 `__name` 辅助函数，并用 `__name(...)` 包裹函数定义。
-   崩溃表明 `__name` 存在但在运行时不是函数，这意味着在 Node 25 的加载器路径中该辅助函数缺失或被覆盖。
-   其他 esbuild 使用者也报告过类似的 `__name` 辅助函数缺失或被重写的问题。

## 

[​

](https://docs.openclaw.ai/zh-CN/debug/node-issue)

回归历史

-   `2871657e`（2026-01-06）：脚本从 Bun 改为 tsx，使 Bun 成为可选项。
-   在此之前（Bun 路径），`openclaw status` 和 `gateway:watch` 均正常工作。

## 

[​

](https://docs.openclaw.ai/zh-CN/debug/node-issue)

解决方法

-   开发脚本使用 Bun（当前临时回退方案）。
-   使用 Node + tsc watch，然后运行编译产物：
    
    复制
    
    ```
    pnpm exec tsc --watch --preserveWatchOutput
    node --watch openclaw.mjs status
    ```
    
-   已在本地确认：`pnpm exec tsc -p tsconfig.json` + `node openclaw.mjs status` 在 Node 25 上可正常运行。
-   如果可能，在 TS 加载器中禁用 esbuild 的 keepNames（防止插入 `__name` 辅助函数）；tsx 目前不提供此配置项。
-   在 Node LTS（22/24）上测试 `tsx`，确认该问题是否为 Node 25 特有。

## 

[​

](https://docs.openclaw.ai/zh-CN/debug/node-issue)

参考资料

-   [https://opennext.js.org/cloudflare/howtos/keep\_names](https://opennext.js.org/cloudflare/howtos/keep_names)
-   [https://esbuild.github.io/api/#keep-names](https://esbuild.github.io/api)
-   [https://github.com/evanw/esbuild/issues/1031](https://github.com/evanw/esbuild/issues/1031)

## 

[​

](https://docs.openclaw.ai/zh-CN/debug/node-issue)

后续步骤

-   在 Node 22/24 上复现，确认是否为 Node 25 回归问题。
-   测试 `tsx` nightly 版本，或在存在已知回归时固定到早期版本。
-   如果在 Node LTS 上也能复现，则向上游提交包含 `__name` 堆栈跟踪的最小复现。

[脚本](https://docs.openclaw.ai/zh-CN/help/scripts)[诊断标志](https://docs.openclaw.ai/zh-CN/diagnostics/flags)

⌘I
