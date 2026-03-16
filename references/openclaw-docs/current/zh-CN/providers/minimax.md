<!-- Source: https://docs.openclaw.ai/zh-CN/providers/minimax -->
<!-- Title: MiniMax - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/providers/minimax)

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

##### 概览

-   [
    
    模型提供商
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers)
-   [
    
    模型提供商快速开始
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/models)

##### 模型概念

-   [
    
    Models CLI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/models)

##### 配置

-   [
    
    模型提供商
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/model-providers)
-   [
    
    模型故障转移
    
    
    
    ](https://docs.openclaw.ai/zh-CN/concepts/model-failover)

##### 提供商

-   [
    
    Anthropic
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/anthropic)
-   [
    
    Amazon Bedrock
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/bedrock)
-   [
    
    Claude Max API 代理
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/claude-max-api-proxy)
-   [
    
    Deepgram
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/deepgram)
-   [
    
    GitHub Copilot
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/github-copilot)
-   [
    
    GLM Models
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/glm)
-   [
    
    Moonshot AI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/moonshot)
-   [
    
    MiniMax
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [
    
    OpenCode
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/opencode)
-   [
    
    Ollama
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/ollama)
-   [
    
    OpenAI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/openai)
-   [
    
    OpenRouter
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/openrouter)
-   [
    
    Qianfan
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/qianfan)
-   [
    
    Qwen
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/qwen)
-   [
    
    Synthetic
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/synthetic)
-   [
    
    Venice AI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/venice)
-   [
    
    Vercel AI Gateway
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/vercel-ai-gateway)
-   [
    
    Xiaomi MiMo
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/xiaomi)
-   [
    
    Z.AI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/providers/zai)

-   [MiniMax](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [模型概览（M2.5）](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [MiniMax M2.5 与 MiniMax M2.5 Highspeed](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [选择一种设置方式](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [MiniMax OAuth（Coding Plan）—— 推荐](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [MiniMax M2.5（API key）](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [将 MiniMax M2.5 作为回退模型（示例）](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [可选：通过 LM Studio 本地运行（手动）](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [通过 openclaw configure 配置](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [配置选项](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [说明](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [故障排除](https://docs.openclaw.ai/zh-CN/providers/minimax)
-   [“Unknown model: minimax/MiniMax-M2.5”](https://docs.openclaw.ai/zh-CN/providers/minimax)

提供商

# MiniMax

# 

[​

](https://docs.openclaw.ai/zh-CN/providers/minimax)

MiniMax

MiniMax 是一家 AI 公司，构建了 **M2/M2.5** 模型家族。当前 面向编码的版本是 **MiniMax M2.5**（2025 年 12 月 23 日），专为 现实世界中的复杂任务打造。 来源：[MiniMax M2.5 发布说明](https://www.minimax.io/news/minimax-m25)

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/minimax)

模型概览（M2.5）

MiniMax 在 M2.5 中重点强调了以下改进：

-   更强的**多语言编码**能力（Rust、Java、Go、C++、Kotlin、Objective-C、TS/JS）。
-   更好的**Web/应用开发**和美学输出质量（包括原生移动端）。
-   在交错思考和集成约束执行的基础上，改进了面向办公类工作流的**复合指令**处理。
-   **更简洁的响应**，token 使用量更低，迭代循环更快。
-   更强的**工具/智能体框架**兼容性和上下文管理能力（Claude Code、 Droid/Factory AI、Cline、Kilo Code、Roo Code、BlackBox）。
-   更高质量的**对话和技术写作**输出。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/minimax)

MiniMax M2.5 与 MiniMax M2.5 Highspeed

-   **速度：** `MiniMax-M2.5-highspeed` 是 MiniMax 文档中的官方高速层级。
-   **成本：** MiniMax 定价显示，高速版的输入成本相同，而输出成本更高。
-   **当前模型 ID：** 使用 `MiniMax-M2.5` 或 `MiniMax-M2.5-highspeed`。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/minimax)

选择一种设置方式

### 

[​

](https://docs.openclaw.ai/zh-CN/providers/minimax)

MiniMax OAuth（Coding Plan）—— 推荐

**最适合：** 通过 OAuth 使用 MiniMax Coding Plan 快速设置，无需 API key。 启用内置 OAuth 插件并完成认证：

复制

```
openclaw plugins enable minimax  # 如果已加载则跳过。
openclaw gateway restart  # 如果 gateway 已在运行，则重启
openclaw onboard --auth-choice minimax-portal
```

系统会提示你选择一个端点：

-   **Global** - 国际用户（`api.minimax.io`）
-   **CN** - 中国用户（`api.minimaxi.com`）

详情请参阅 [MiniMax plugin README](https://github.com/openclaw/openclaw/tree/main/extensions/minimax)。

### 

[​

](https://docs.openclaw.ai/zh-CN/providers/minimax)

MiniMax M2.5（API key）

**最适合：** 使用与 Anthropic 兼容 API 的托管 MiniMax。 通过 CLI 配置：

-   运行 `openclaw configure`
-   选择 **Model/auth**
-   选择 **MiniMax M2.5**

复制

```
{
  env: { MINIMAX_API_KEY: "sk-..." },
  agents: { defaults: { model: { primary: "minimax/MiniMax-M2.5" } } },
  models: {
    mode: "merge",
    providers: {
      minimax: {
        baseUrl: "https://api.minimax.io/anthropic",
        apiKey: "${MINIMAX_API_KEY}",
        api: "anthropic-messages",
        models: [
          {
            id: "MiniMax-M2.5",
            name: "MiniMax M2.5",
            reasoning: true,
            input: ["text"],
            cost: { input: 0.3, output: 1.2, cacheRead: 0.03, cacheWrite: 0.12 },
            contextWindow: 200000,
            maxTokens: 8192,
          },
          {
            id: "MiniMax-M2.5-highspeed",
            name: "MiniMax M2.5 Highspeed",
            reasoning: true,
            input: ["text"],
            cost: { input: 0.3, output: 1.2, cacheRead: 0.03, cacheWrite: 0.12 },
            contextWindow: 200000,
            maxTokens: 8192,
          },
        ],
      },
    },
  },
}
```

### 

[​

](https://docs.openclaw.ai/zh-CN/providers/minimax)

将 MiniMax M2.5 作为回退模型（示例）

**最适合：** 保持你最强的最新一代模型作为主模型，并在失败时回退到 MiniMax M2.5。 下面的示例使用 Opus 作为具体主模型；你可以替换成自己偏好的最新一代主模型。

复制

```
{
  env: { MINIMAX_API_KEY: "sk-..." },
  agents: {
    defaults: {
      models: {
        "anthropic/claude-opus-4-6": { alias: "primary" },
        "minimax/MiniMax-M2.5": { alias: "minimax" },
      },
      model: {
        primary: "anthropic/claude-opus-4-6",
        fallbacks: ["minimax/MiniMax-M2.5"],
      },
    },
  },
}
```

### 

[​

](https://docs.openclaw.ai/zh-CN/providers/minimax)

可选：通过 LM Studio 本地运行（手动）

**最适合：** 通过 LM Studio 进行本地推理。 我们已经看到，在强力硬件上（例如台式机/服务器）使用 LM Studio 的本地服务器运行 MiniMax M2.5 时，效果非常强。 通过 `openclaw.json` 手动配置：

复制

```
{
  agents: {
    defaults: {
      model: { primary: "lmstudio/minimax-m2.5-gs32" },
      models: { "lmstudio/minimax-m2.5-gs32": { alias: "Minimax" } },
    },
  },
  models: {
    mode: "merge",
    providers: {
      lmstudio: {
        baseUrl: "http://127.0.0.1:1234/v1",
        apiKey: "lmstudio",
        api: "openai-responses",
        models: [
          {
            id: "minimax-m2.5-gs32",
            name: "MiniMax M2.5 GS32",
            reasoning: true,
            input: ["text"],
            cost: { input: 0, output: 0, cacheRead: 0, cacheWrite: 0 },
            contextWindow: 196608,
            maxTokens: 8192,
          },
        ],
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/minimax)

通过 `openclaw configure` 配置

使用交互式配置向导设置 MiniMax，而无需编辑 JSON：

1.  运行 `openclaw configure`。
2.  选择 **Model/auth**。
3.  选择 **MiniMax M2.5**。
4.  在提示时选择你的默认模型。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/minimax)

配置选项

-   `models.providers.minimax.baseUrl`：优先使用 `https://api.minimax.io/anthropic`（与 Anthropic 兼容）；`https://api.minimax.io/v1` 可选，用于与 OpenAI 兼容的负载。
-   `models.providers.minimax.api`：优先使用 `anthropic-messages`；`openai-completions` 可选，用于与 OpenAI 兼容的负载。
-   `models.providers.minimax.apiKey`：MiniMax API key（`MINIMAX_API_KEY`）。
-   `models.providers.minimax.models`：定义 `id`、`name`、`reasoning`、`contextWindow`、`maxTokens`、`cost`。
-   `agents.defaults.models`：为你希望放入允许列表的模型设置别名。
-   `models.mode`：如果你希望在内置模型之外添加 MiniMax，请保持为 `merge`。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/minimax)

说明

-   模型引用格式为 `minimax/<model>`。
-   推荐模型 ID：`MiniMax-M2.5` 和 `MiniMax-M2.5-highspeed`。
-   Coding Plan 用量 API：`https://api.minimaxi.com/v1/api/openplatform/coding_plan/remains`（需要 coding plan key）。
-   如果你需要精确成本跟踪，请更新 `models.json` 中的定价值。
-   MiniMax Coding Plan 推荐链接（九折）：[https://platform.minimax.io/subscribe/coding-plan?code=DbXJTRClnb&source=link](https://platform.minimax.io/subscribe/coding-plan)
-   关于提供商规则，请参阅 [/concepts/model-providers](https://docs.openclaw.ai/concepts/model-providers)。
-   使用 `openclaw models list` 和 `openclaw models set minimax/MiniMax-M2.5` 进行切换。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/minimax)

故障排除

### 

[​

](https://docs.openclaw.ai/zh-CN/providers/minimax)

“Unknown model: minimax/MiniMax-M2.5”

这通常意味着 **MiniMax 提供商未配置**（没有提供商条目， 并且也未找到 MiniMax 凭证配置文件/环境变量 key）。对此检测问题的修复已包含在 **2026.1.12** 中（在撰写本文时尚未发布）。修复方法：

-   升级到 **2026.1.12**（或从源码运行 `main`），然后重启 gateway。
-   运行 `openclaw configure` 并选择 **MiniMax M2.5**，或者
-   手动添加 `models.providers.minimax` 配置块，或者
-   设置 `MINIMAX_API_KEY`（或 MiniMax 凭证配置文件），以便注入该提供商。

请确保模型 id **区分大小写**：

-   `minimax/MiniMax-M2.5`
-   `minimax/MiniMax-M2.5-highspeed`

然后使用以下命令重新检查：

复制

```
openclaw models list
```

[Moonshot AI](https://docs.openclaw.ai/zh-CN/providers/moonshot)[OpenCode](https://docs.openclaw.ai/zh-CN/providers/opencode)

⌘I
