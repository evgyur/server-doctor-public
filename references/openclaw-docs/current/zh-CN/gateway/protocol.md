<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/protocol -->
<!-- Title: Gateway 网关协议 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/protocol)

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

-   [Gateway 网关协议（WebSocket）](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [传输](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [握手（connect）](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [节点示例](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [帧格式](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [角色 + 作用域](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [角色](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [作用域（operator）](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [能力/命令/权限（node）](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [在线状态](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [节点辅助方法](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [Exec 审批](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [版本控制](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [认证](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [设备身份 + 配对](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [TLS + 固定](https://docs.openclaw.ai/zh-CN/gateway/protocol)
-   [范围](https://docs.openclaw.ai/zh-CN/gateway/protocol)

协议与 API

# Gateway 网关协议

# 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

Gateway 网关协议（WebSocket）

Gateway 网关 WS 协议是 OpenClaw 的**单一控制平面 + 节点传输**。所有客户端（CLI、Web UI、macOS 应用、iOS/Android 节点、无头节点）都通过 WebSocket 连接，并在握手时声明其**角色** + **作用域**。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

传输

-   WebSocket，带有 JSON 负载的文本帧。
-   第一帧**必须**是 `connect` 请求。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

握手（connect）

Gateway 网关 → 客户端（连接前质询）：

复制

```
{
  "type": "event",
  "event": "connect.challenge",
  "payload": { "nonce": "…", "ts": 1737264000000 }
}
```

客户端 → Gateway 网关：

复制

```
{
  "type": "req",
  "id": "…",
  "method": "connect",
  "params": {
    "minProtocol": 3,
    "maxProtocol": 3,
    "client": {
      "id": "cli",
      "version": "1.2.3",
      "platform": "macos",
      "mode": "operator"
    },
    "role": "operator",
    "scopes": ["operator.read", "operator.write"],
    "caps": [],
    "commands": [],
    "permissions": {},
    "auth": { "token": "…" },
    "locale": "en-US",
    "userAgent": "openclaw-cli/1.2.3",
    "device": {
      "id": "device_fingerprint",
      "publicKey": "…",
      "signature": "…",
      "signedAt": 1737264000000,
      "nonce": "…"
    }
  }
}
```

Gateway 网关 → 客户端：

复制

```
{
  "type": "res",
  "id": "…",
  "ok": true,
  "payload": { "type": "hello-ok", "protocol": 3, "policy": { "tickIntervalMs": 15000 } }
}
```

当颁发设备令牌时，`hello-ok` 还包含：

复制

```
{
  "auth": {
    "deviceToken": "…",
    "role": "operator",
    "scopes": ["operator.read", "operator.write"]
  }
}
```

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

节点示例

复制

```
{
  "type": "req",
  "id": "…",
  "method": "connect",
  "params": {
    "minProtocol": 3,
    "maxProtocol": 3,
    "client": {
      "id": "ios-node",
      "version": "1.2.3",
      "platform": "ios",
      "mode": "node"
    },
    "role": "node",
    "scopes": [],
    "caps": ["camera", "canvas", "screen", "location", "voice"],
    "commands": ["camera.snap", "canvas.navigate", "screen.record", "location.get"],
    "permissions": { "camera.capture": true, "screen.record": false },
    "auth": { "token": "…" },
    "locale": "en-US",
    "userAgent": "openclaw-ios/1.2.3",
    "device": {
      "id": "device_fingerprint",
      "publicKey": "…",
      "signature": "…",
      "signedAt": 1737264000000,
      "nonce": "…"
    }
  }
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

帧格式

-   **Request**：`{type:"req", id, method, params}`
-   **Response**：`{type:"res", id, ok, payload|error}`
-   **Event**：`{type:"event", event, payload, seq?, stateVersion?}`

有副作用的方法需要**幂等键**（见模式）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

角色 + 作用域

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

角色

-   `operator` = 控制平面客户端（CLI/UI/自动化）。
-   `node` = 能力宿主（camera/screen/canvas/system.run）。

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

作用域（operator）

常用作用域：

-   `operator.read`
-   `operator.write`
-   `operator.admin`
-   `operator.approvals`
-   `operator.pairing`

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

能力/命令/权限（node）

节点在连接时声明能力声明：

-   `caps`：高级能力类别。
-   `commands`：invoke 的命令允许列表。
-   `permissions`：细粒度开关（例如 `screen.record`、`camera.capture`）。

Gateway 网关将这些视为**声明**并强制执行服务器端允许列表。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

在线状态

-   `system-presence` 返回以设备身份为键的条目。
-   在线状态条目包含 `deviceId`、`roles` 和 `scopes`，以便 UI 可以为每个设备显示单行， 即使它同时以 **operator** 和 **node** 身份连接。

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

节点辅助方法

-   节点可以调用 `skills.bins` 来获取当前的 skill 可执行文件列表， 用于自动允许检查。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

Exec 审批

-   当 exec 请求需要审批时，Gateway 网关广播 `exec.approval.requested`。
-   操作者客户端通过调用 `exec.approval.resolve` 来解决（需要 `operator.approvals` 作用域）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

版本控制

-   `PROTOCOL_VERSION` 在 `src/gateway/protocol/schema.ts` 中。
-   客户端发送 `minProtocol` + `maxProtocol`；服务器拒绝不匹配的。
-   模式 + 模型从 TypeBox 定义生成：
    -   `pnpm protocol:gen`
    -   `pnpm protocol:gen:swift`
    -   `pnpm protocol:check`

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

认证

-   如果设置了 `OPENCLAW_GATEWAY_TOKEN`（或 `--token`），`connect.params.auth.token` 必须匹配，否则套接字将被关闭。
-   配对后，Gateway 网关会颁发一个作用于连接角色 + 作用域的**设备令牌**。它在 `hello-ok.auth.deviceToken` 中返回， 客户端应将其持久化以供将来连接使用。
-   设备令牌可以通过 `device.token.rotate` 和 `device.token.revoke` 轮换/撤销（需要 `operator.pairing` 作用域）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

设备身份 + 配对

-   节点应包含从密钥对指纹派生的稳定设备身份（`device.id`）。
-   Gateway 网关为每个设备 + 角色颁发令牌。
-   新设备 ID 需要配对批准，除非启用了本地自动批准。
-   **本地**连接包括 loopback 和 Gateway 网关主机自身的 tailnet 地址 （因此同主机 tailnet 绑定仍可自动批准）。
-   所有 WS 客户端在 `connect` 期间必须包含 `device` 身份（operator + node）。 控制 UI **仅**在启用 `gateway.controlUi.allowInsecureAuth` 时可以省略它 （或使用 `gateway.controlUi.dangerouslyDisableDeviceAuth` 用于紧急情况）。
-   非本地连接必须签署服务器提供的 `connect.challenge` nonce。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

TLS + 固定

-   WS 连接支持 TLS。
-   客户端可以选择性地固定 Gateway 网关证书指纹（见 `gateway.tls` 配置加上 `gateway.remote.tlsFingerprint` 或 CLI `--tls-fingerprint`）。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/protocol)

范围

此协议暴露**完整的 Gateway 网关 API**（status、channels、models、chat、 agent、sessions、nodes、approvals 等）。确切的接口由 `src/gateway/protocol/schema.ts` 中的 TypeBox 模式定义。

[沙箱 vs 工具策略 vs 提权](https://docs.openclaw.ai/zh-CN/gateway/sandbox-vs-tool-policy-vs-elevated)[Bridge 协议](https://docs.openclaw.ai/zh-CN/gateway/bridge-protocol)

⌘I
