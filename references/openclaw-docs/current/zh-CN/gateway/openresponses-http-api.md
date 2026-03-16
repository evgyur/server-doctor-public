<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api -->
<!-- Title: OpenResponses API - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

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

##### 网关

-   [
    
    Gateway 网关运行手册
    
    
    
    ](https://docs.openclaw.ai/zh-CN/gateway)

-   -   [
        
        Gateway 网关协议
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/protocol)
    -   [
        
        Bridge 协议
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)
    -   [
        
        OpenAI Chat Completions
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)
    -   [
        
        OpenResponses API
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
    -   [
        
        工具调用 API
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)
    -   [
        
        CLI 后端
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/cli-backends)
    -   [
        
        本地模型
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/local-models)

##### 远程访问

-   [
    
    远程访问
    
    
    
    ](https://docs.openclaw.ai/zh-CN/gateway/remote)
-   [
    
    远程 Gateway 网关设置
    
    
    
    ](https://docs.openclaw.ai/zh-CN/gateway/remote-gateway-readme)
-   [
    
    Tailscale
    
    
    
    ](https://docs.openclaw.ai/zh-CN/gateway/tailscale)

##### 运维专题

-   [
    
    网络
    
    
    
    ](https://docs.openclaw.ai/zh-CN/network)
-   [
    
    日志
    
    
    
    ](https://docs.openclaw.ai/zh-CN/logging)

##### 安全

-   [
    
    形式化验证（安全模型）
    
    
    
    ](https://docs.openclaw.ai/zh-CN/security/formal-verification)

##### Web 界面

-   [
    
    Web
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web)
-   [
    
    控制 UI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web/control-ui)
-   [
    
    仪表板
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web/dashboard)
-   [
    
    WebChat
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web/webchat)
-   [
    
    TUI
    
    
    
    ](https://docs.openclaw.ai/zh-CN/web/tui)

-   [OpenResponses API（HTTP）](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [认证](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [选择智能体](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [启用端点](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [禁用端点](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [会话行为](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [请求结构（支持的）](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [Item（输入）](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [message](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [function\_call\_output（基于回合的工具）](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [reasoning 和 item\_reference](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [工具（客户端函数工具）](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [图像（input\_image）](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [文件（input\_file）](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [文件 + 图像限制（配置）](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [流式传输（SSE）](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [用量](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [错误](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)
-   [示例](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

协议与 API

# OpenResponses API

# 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

OpenResponses API（HTTP）

OpenClaw 的 Gateway 网关可以提供兼容 OpenResponses 的 `POST /v1/responses` 端点。 此端点**默认禁用**。请先在配置中启用。

-   `POST /v1/responses`
-   与 Gateway 网关相同的端口（WS + HTTP 多路复用）：`http://<gateway-host>:<port>/v1/responses`

底层实现中，请求作为正常的 Gateway 网关智能体运行执行（与 `openclaw agent` 相同的代码路径），因此路由/权限/配置与你的 Gateway 网关一致。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

认证

使用 Gateway 网关认证配置。发送 bearer 令牌：

-   `Authorization: Bearer <token>`

说明：

-   当 `gateway.auth.mode="token"` 时，使用 `gateway.auth.token`（或 `OPENCLAW_GATEWAY_TOKEN`）。
-   当 `gateway.auth.mode="password"` 时，使用 `gateway.auth.password`（或 `OPENCLAW_GATEWAY_PASSWORD`）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

选择智能体

无需自定义头：在 OpenResponses `model` 字段中编码智能体 id：

-   `model: "openclaw:<agentId>"`（示例：`"openclaw:main"`、`"openclaw:beta"`）
-   `model: "agent:<agentId>"`（别名）

或通过头指定特定的 OpenClaw 智能体：

-   `x-openclaw-agent-id: <agentId>`（默认：`main`）

高级：

-   `x-openclaw-session-key: <sessionKey>` 完全控制会话路由。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

启用端点

将 `gateway.http.endpoints.responses.enabled` 设置为 `true`：

复制

```
{
  gateway: {
    http: {
      endpoints: {
        responses: { enabled: true },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

禁用端点

将 `gateway.http.endpoints.responses.enabled` 设置为 `false`：

复制

```
{
  gateway: {
    http: {
      endpoints: {
        responses: { enabled: false },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

会话行为

默认情况下，端点**每个请求都是无状态的**（每次调用生成新的会话键）。 如果请求包含 OpenResponses `user` 字符串，Gateway 网关会从中派生稳定的会话键，这样重复调用可以共享智能体会话。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

请求结构（支持的）

请求遵循 OpenResponses API，使用基于 item 的输入。当前支持：

-   `input`：字符串或 item 对象数组。
-   `instructions`：合并到系统提示中。
-   `tools`：客户端工具定义（函数工具）。
-   `tool_choice`：过滤或要求客户端工具。
-   `stream`：启用 SSE 流式传输。
-   `max_output_tokens`：尽力而为的输出限制（取决于提供商）。
-   `user`：稳定的会话路由。

接受但**当前忽略**：

-   `max_tool_calls`
-   `reasoning`
-   `metadata`
-   `store`
-   `previous_response_id`
-   `truncation`

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

Item（输入）

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

`message`

角色：`system`、`developer`、`user`、`assistant`。

-   `system` 和 `developer` 追加到系统提示。
-   最近的 `user` 或 `function_call_output` item 成为”当前消息”。
-   较早的 user/assistant 消息作为上下文历史包含。

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

`function_call_output`（基于回合的工具）

将工具结果发送回模型：

复制

```
{
  "type": "function_call_output",
  "call_id": "call_123",
  "output": "{\"temperature\": \"72F\"}"
}
```

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

`reasoning` 和 `item_reference`

为了 schema 兼容性而接受，但在构建提示时忽略。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

工具（客户端函数工具）

使用 `tools: [{ type: "function", function: { name, description?, parameters? } }]` 提供工具。 如果智能体决定调用工具，响应返回一个 `function_call` 输出 item。然后你发送带有 `function_call_output` 的后续请求以继续回合。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

图像（`input_image`）

支持 base64 或 URL 来源：

复制

```
{
  "type": "input_image",
  "source": { "type": "url", "url": "https://example.com/image.png" }
}
```

允许的 MIME 类型（当前）：`image/jpeg`、`image/png`、`image/gif`、`image/webp`。 最大大小（当前）：10MB。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

文件（`input_file`）

支持 base64 或 URL 来源：

复制

```
{
  "type": "input_file",
  "source": {
    "type": "base64",
    "media_type": "text/plain",
    "data": "SGVsbG8gV29ybGQh",
    "filename": "hello.txt"
  }
}
```

允许的 MIME 类型（当前）：`text/plain`、`text/markdown`、`text/html`、`text/csv`、`application/json`、`application/pdf`。 最大大小（当前）：5MB。 当前行为：

-   文件内容被解码并添加到**系统提示**，而不是用户消息，所以它保持临时性（不持久化在会话历史中）。
-   PDF 被解析提取文本。如果发现的文本很少，前几页会被栅格化为图像并传递给模型。

PDF 解析使用 Node 友好的 `pdfjs-dist` legacy 构建（无 worker）。现代 PDF.js 构建期望浏览器 worker/DOM 全局变量，因此不在 Gateway 网关中使用。 URL 获取默认值：

-   `files.allowUrl`：`true`
-   `images.allowUrl`：`true`
-   请求受到保护（DNS 解析、私有 IP 阻止、重定向限制、超时）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

文件 + 图像限制（配置）

默认值可在 `gateway.http.endpoints.responses` 下调整：

复制

```
{
  gateway: {
    http: {
      endpoints: {
        responses: {
          enabled: true,
          maxBodyBytes: 20000000,
          files: {
            allowUrl: true,
            allowedMimes: [
              "text/plain",
              "text/markdown",
              "text/html",
              "text/csv",
              "application/json",
              "application/pdf",
            ],
            maxBytes: 5242880,
            maxChars: 200000,
            maxRedirects: 3,
            timeoutMs: 10000,
            pdf: {
              maxPages: 4,
              maxPixels: 4000000,
              minTextChars: 200,
            },
          },
          images: {
            allowUrl: true,
            allowedMimes: ["image/jpeg", "image/png", "image/gif", "image/webp"],
            maxBytes: 10485760,
            maxRedirects: 3,
            timeoutMs: 10000,
          },
        },
      },
    },
  },
}
```

省略时的默认值：

-   `maxBodyBytes`：20MB
-   `files.maxBytes`：5MB
-   `files.maxChars`：200k
-   `files.maxRedirects`：3
-   `files.timeoutMs`：10s
-   `files.pdf.maxPages`：4
-   `files.pdf.maxPixels`：4,000,000
-   `files.pdf.minTextChars`：200
-   `images.maxBytes`：10MB
-   `images.maxRedirects`：3
-   `images.timeoutMs`：10s

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

流式传输（SSE）

设置 `stream: true` 接收 Server-Sent Events（SSE）：

-   `Content-Type: text/event-stream`
-   每个事件行是 `event: <type>` 和 `data: <json>`
-   流以 `data: [DONE]` 结束

当前发出的事件类型：

-   `response.created`
-   `response.in_progress`
-   `response.output_item.added`
-   `response.content_part.added`
-   `response.output_text.delta`
-   `response.output_text.done`
-   `response.content_part.done`
-   `response.output_item.done`
-   `response.completed`
-   `response.failed`（出错时）

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

用量

当底层提供商报告令牌计数时，`usage` 会被填充。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

错误

错误使用如下 JSON 对象：

复制

```
{ "error": { "message": "...", "type": "invalid_request_error" } }
```

常见情况：

-   `401` 缺少/无效认证
-   `400` 无效请求体
-   `405` 错误的方法

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

示例

非流式：

复制

```
curl -sS http://127.0.0.1:18789/v1/responses \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'x-openclaw-agent-id: main' \
  -d '{
    "model": "openclaw",
    "input": "hi"
  }'
```

流式：

复制

```
curl -N http://127.0.0.1:18789/v1/responses \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'x-openclaw-agent-id: main' \
  -d '{
    "model": "openclaw",
    "stream": true,
    "input": "hi"
  }'
```

[OpenAI Chat Completions](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)[工具调用 API](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)

⌘I
