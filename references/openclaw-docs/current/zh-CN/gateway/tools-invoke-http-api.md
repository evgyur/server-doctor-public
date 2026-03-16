<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api -->
<!-- Title: 工具调用 API - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)

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

-   [工具调用（HTTP）](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)
-   [认证](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)
-   [请求体](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)
-   [策略 + 路由行为](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)
-   [响应](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)
-   [示例](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)

协议与 API

# 工具调用 API

# 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)

工具调用（HTTP）

OpenClaw 的 Gateway 网关暴露了一个简单的 HTTP 端点用于直接调用单个工具。它始终启用，但受 Gateway 网关认证和工具策略限制。

-   `POST /tools/invoke`
-   与 Gateway 网关相同的端口（WS + HTTP 多路复用）：`http://<gateway-host>:<port>/tools/invoke`

默认最大负载大小为 2 MB。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)

认证

使用 Gateway 网关认证配置。发送 bearer 令牌：

-   `Authorization: Bearer <token>`

说明：

-   当 `gateway.auth.mode="token"` 时，使用 `gateway.auth.token`（或 `OPENCLAW_GATEWAY_TOKEN`）。
-   当 `gateway.auth.mode="password"` 时，使用 `gateway.auth.password`（或 `OPENCLAW_GATEWAY_PASSWORD`）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)

请求体

复制

```
{
  "tool": "sessions_list",
  "action": "json",
  "args": {},
  "sessionKey": "main",
  "dryRun": false
}
```

字段：

-   `tool`（string，必需）：要调用的工具名称。
-   `action`（string，可选）：如果工具 schema 支持 `action` 且 args 负载省略了它，则映射到 args。
-   `args`（object，可选）：工具特定的参数。
-   `sessionKey`（string，可选）：目标会话键。如果省略或为 `"main"`，Gateway 网关使用配置的主会话键（遵循 `session.mainKey` 和默认智能体，或在全局范围中使用 `global`）。
-   `dryRun`（boolean，可选）：保留供将来使用；当前忽略。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)

策略 + 路由行为

工具可用性通过 Gateway 网关智能体使用的相同策略链过滤：

-   `tools.profile` / `tools.byProvider.profile`
-   `tools.allow` / `tools.byProvider.allow`
-   `agents.<id>.tools.allow` / `agents.<id>.tools.byProvider.allow`
-   群组策略（如果会话键映射到群组或渠道）
-   子智能体策略（使用子智能体会话键调用时）

如果工具不被策略允许，端点返回 **404**。 为帮助群组策略解析上下文，你可以选择设置：

-   `x-openclaw-message-channel: <channel>`（示例：`slack`、`telegram`）
-   `x-openclaw-account-id: <accountId>`（当存在多个账户时）

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)

响应

-   `200` → `{ ok: true, result }`
-   `400` → `{ ok: false, error: { type, message } }`（无效请求或工具错误）
-   `401` → 未授权
-   `404` → 工具不可用（未找到或未在允许列表中）
-   `405` → 方法不允许

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/tools-invoke-http-api)

示例

复制

```
curl -sS http://127.0.0.1:18789/tools/invoke \
  -H 'Authorization: Bearer YOUR_TOKEN' \
  -H 'Content-Type: application/json' \
  -d '{
    "tool": "sessions_list",
    "action": "json",
    "args": {}
  }'
```

[OpenResponses API](https://docs.openclaw.ai/zh-CN/gateway/openresponses-http-api)[CLI 后端](https://docs.openclaw.ai/zh-CN/gateway/cli-backends)

⌘I
