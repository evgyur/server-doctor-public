<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/openai-http-api -->
<!-- Title: OpenAI Chat Completions - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)

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

-   [OpenAI Chat Completions（HTTP）](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)
-   [认证](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)
-   [选择智能体](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)
-   [启用端点](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)
-   [禁用端点](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)
-   [会话行为](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)
-   [流式传输（SSE）](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)
-   [示例](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)

协议与 API

# OpenAI Chat Completions

# 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)

OpenAI Chat Completions（HTTP）

OpenClaw 的 Gateway 网关可以提供一个小型的 OpenAI 兼容 Chat Completions 端点。 此端点**默认禁用**。请先在配置中启用它。

-   `POST /v1/chat/completions`
-   与 Gateway 网关相同的端口（WS + HTTP 多路复用）：`http://<gateway-host>:<port>/v1/chat/completions`

底层实现中，请求作为普通的 Gateway 网关智能体运行执行（与 `openclaw agent` 相同的代码路径），因此路由/权限/配置与你的 Gateway 网关一致。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)

认证

使用 Gateway 网关认证配置。发送 bearer 令牌：

-   `Authorization: Bearer <token>`

注意事项：

-   当 `gateway.auth.mode="token"` 时，使用 `gateway.auth.token`（或 `OPENCLAW_GATEWAY_TOKEN`）。
-   当 `gateway.auth.mode="password"` 时，使用 `gateway.auth.password`（或 `OPENCLAW_GATEWAY_PASSWORD`）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)

选择智能体

无需自定义头：在 OpenAI `model` 字段中编码智能体 ID：

-   `model: "openclaw:<agentId>"`（例如：`"openclaw:main"`、`"openclaw:beta"`）
-   `model: "agent:<agentId>"`（别名）

或通过头指定特定的 OpenClaw 智能体：

-   `x-openclaw-agent-id: <agentId>`（默认：`main`）

高级选项：

-   `x-openclaw-session-key: <sessionKey>` 完全控制会话路由。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)

启用端点

将 `gateway.http.endpoints.chatCompletions.enabled` 设置为 `true`：

复制

```
{
  gateway: {
    http: {
      endpoints: {
        chatCompletions: { enabled: true },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)

禁用端点

将 `gateway.http.endpoints.chatCompletions.enabled` 设置为 `false`：

复制

```
{
  gateway: {
    http: {
      endpoints: {
        chatCompletions: { enabled: false },
      },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)

会话行为

默认情况下，端点是**每请求无状态**的（每次调用生成新的会话键）。 如果请求包含 OpenAI `user` 字符串，Gateway 网关会从中派生一个稳定的会话键，因此重复调用可以共享智能体会话。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)

流式传输（SSE）

设置 `stream: true` 以接收 Server-Sent Events（SSE）：

-   `Content-Type: text/event-stream`
-   每个事件行是 `data: <json>`
-   流以 `data: [DONE]` 结束

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/openai-http-api)

示例

非流式：

复制

```
curl -sS http://127.0.0.1:18789/v1/chat/completions \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'x-openclaw-agent-id: main' \
  -d '{
    "model": "openclaw",
    "messages": [{"role":"user","content":"hi"}]
  }'
```

流式：

复制

```
curl -N http://127.0.0.1:18789/v1/chat/completions \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -H 'x-openclaw-agent-id: main' \
  -d '{
    "model": "openclaw",
    "stream": true,
    "messages": [{"role":"user","content":"hi"}]
  }'
```

[Bridge 协议](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)[OpenResponses API](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)

⌘I
