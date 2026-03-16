<!-- Source: https://docs.openclaw.ai/zh-CN/gateway/authentication -->
<!-- Title: 认证 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/gateway/authentication)

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
        
        配置
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/configuration)
    -   [
        
        配置示例
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/configuration-examples)
    -   [
        
        认证
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/authentication)
    -   [
        
        健康检查
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/health)
    -   [
        
        心跳
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/heartbeat)
    -   [
        
        Doctor
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/doctor)
    -   [
        
        日志
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/logging)
    -   [
        
        Gateway 网关锁
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/gateway-lock)
    -   [
        
        后台 Exec 和 Process 工具
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/background-process)
    -   [
        
        多个 Gateway 网关
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/multiple-gateways)
    -   [
        
        故障排除
        
        
        
        ](https://docs.openclaw.ai/zh-CN/gateway/troubleshooting)

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

-   [认证](https://docs.openclaw.ai/zh-CN/gateway/authentication)
-   [推荐设置（API key，任意提供商）](https://docs.openclaw.ai/zh-CN/gateway/authentication)
-   [Anthropic：setup-token（订阅认证）](https://docs.openclaw.ai/zh-CN/gateway/authentication)
-   [检查模型认证状态](https://docs.openclaw.ai/zh-CN/gateway/authentication)
-   [API key 轮换行为（Gateway 网关）](https://docs.openclaw.ai/zh-CN/gateway/authentication)
-   [控制使用哪个凭证](https://docs.openclaw.ai/zh-CN/gateway/authentication)
-   [每个会话（聊天命令）](https://docs.openclaw.ai/zh-CN/gateway/authentication)
-   [每个智能体（CLI 覆盖）](https://docs.openclaw.ai/zh-CN/gateway/authentication)
-   [故障排除](https://docs.openclaw.ai/zh-CN/gateway/authentication)
-   [“No credentials found”](https://docs.openclaw.ai/zh-CN/gateway/authentication)
-   [Token 即将过期/已过期](https://docs.openclaw.ai/zh-CN/gateway/authentication)
-   [要求](https://docs.openclaw.ai/zh-CN/gateway/authentication)

配置与运维

# 认证

# 

[​

](https://docs.openclaw.ai/zh-CN/gateway/authentication)

认证

OpenClaw 支持模型提供商使用 OAuth 和 API key。对于始终在线的 Gateway 网关 主机，API key 通常是最可预测的选项。当它们与你的提供商账号模型匹配时， 也支持订阅/OAuth 流程。 完整的 OAuth 流程和存储布局，请参阅 [/concepts/oauth](https://docs.openclaw.ai/concepts/oauth)。 关于基于 SecretRef 的认证（`env`/`file`/`exec` 提供商），请参阅 [Secrets Management](https://docs.openclaw.ai/gateway/secrets)。 关于 `models status --probe` 使用的凭证资格/原因码规则，请参阅 [Auth Credential Semantics](https://docs.openclaw.ai/auth-credential-semantics)。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/authentication)

推荐设置（API key，任意提供商）

如果你正在运行长期存活的 Gateway 网关，请先为你选择的 提供商配置一个 API key。 对于 Anthropic，API key 认证是更稳妥的方式，推荐优先于 订阅 setup-token 认证。

1.  在你的提供商控制台中创建一个 API key。
2.  将它放在 **Gateway 网关主机** 上（运行 `openclaw gateway` 的机器）。

复制

```
export <PROVIDER>_API_KEY="..."
openclaw models status
```

3.  如果 Gateway 通过 systemd/launchd 运行，建议将 key 放入 `~/.openclaw/.env`，这样守护进程就可以读取它：

复制

```
cat >> ~/.openclaw/.env <<'EOF'
<PROVIDER>_API_KEY=...
EOF
```

然后重启守护进程（或重启你的 Gateway 网关进程）并重新检查：

复制

```
openclaw models status
openclaw doctor
```

如果你不想自己管理环境变量，设置向导可以为守护进程使用场景存储 API key：`openclaw onboard`。 有关环境继承（`env.shellEnv`、 `~/.openclaw/.env`、systemd/launchd）的详细信息，请参阅 [Help](https://docs.openclaw.ai/help)。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/authentication)

Anthropic：setup-token（订阅认证）

如果你使用的是 Claude 订阅，则支持 setup-token 流程。请在 **Gateway 网关主机** 上运行：

复制

```
claude setup-token
```

然后将它粘贴到 OpenClaw 中：

复制

```
openclaw models auth setup-token --provider anthropic
```

如果 token 是在另一台机器上创建的，请手动粘贴：

复制

```
openclaw models auth paste-token --provider anthropic
```

如果你看到类似这样的 Anthropic 错误：

复制

```
This credential is only authorized for use with Claude Code and cannot be used for other API requests.
```

……请改用 Anthropic API key。

Anthropic setup-token 支持仅是技术兼容性。Anthropic 过去曾阻止 Claude Code 之外的某些订阅用法。只有在你认为相关策略风险可接受时才使用它， 并请你自行核实 Anthropic 当前的条款。

手动输入 token（任意提供商；会写入 `auth-profiles.json` + 更新配置）：

复制

```
openclaw models auth paste-token --provider anthropic
openclaw models auth paste-token --provider openrouter
```

静态凭证也支持凭证配置文件引用：

-   `api_key` 凭证可以使用 `keyRef: { source, provider, id }`
-   `token` 凭证可以使用 `tokenRef: { source, provider, id }`

适合自动化的检查（已过期/缺失时退出码为 `1`，即将过期时为 `2`）：

复制

```
openclaw models status --check
```

可选的运维脚本（systemd/Termux）记录在这里： [/automation/auth-monitoring](https://docs.openclaw.ai/automation/auth-monitoring)

> `claude setup-token` 需要交互式 TTY。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/authentication)

检查模型认证状态

复制

```
openclaw models status
openclaw doctor
```

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/authentication)

API key 轮换行为（Gateway 网关）

某些提供商支持在 API 调用触发提供商限流时，使用替代 key 重试请求。

-   优先级顺序：
    -   `OPENCLAW_LIVE_<PROVIDER>_KEY`（单个覆盖值）
    -   `<PROVIDER>_API_KEYS`
    -   `<PROVIDER>_API_KEY`
    -   `<PROVIDER>_API_KEY_*`
-   Google 提供商还将 `GOOGLE_API_KEY` 作为额外回退项。
-   使用前会对同一组 key 列表去重。
-   仅当出现限流错误时，OpenClaw 才会使用下一个 key 重试（例如 `429`、`rate_limit`、`quota`、`resource exhausted`）。
-   非限流错误不会使用替代 key 重试。
-   如果所有 key 都失败，则返回最后一次尝试的最终错误。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/authentication)

控制使用哪个凭证

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/authentication)

每个会话（聊天命令）

使用 `/model <alias-or-id>@<profileId>` 为当前会话固定使用特定的提供商凭证（示例配置文件 id：`anthropic:default`、`anthropic:work`）。 使用 `/model`（或 `/model list`）查看紧凑选择器；使用 `/model status` 查看完整视图（候选项 + 下一个凭证配置文件，以及在已配置时显示提供商端点详情）。

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/authentication)

每个智能体（CLI 覆盖）

为智能体设置显式的凭证配置文件顺序覆盖（存储在该智能体的 `auth-profiles.json` 中）：

复制

```
openclaw models auth order get --provider anthropic
openclaw models auth order set --provider anthropic anthropic:default
openclaw models auth order clear --provider anthropic
```

使用 `--agent <id>` 指定特定智能体；省略它则使用已配置的默认智能体。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/authentication)

故障排除

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/authentication)

“No credentials found”

如果缺少 Anthropic token 配置文件，请在 **Gateway 网关主机** 上运行 `claude setup-token`，然后重新检查：

复制

```
openclaw models status
```

### 

[​

](https://docs.openclaw.ai/zh-CN/gateway/authentication)

Token 即将过期/已过期

运行 `openclaw models status` 以确认哪个配置文件即将过期。如果该配置文件 缺失，请重新运行 `claude setup-token` 并再次粘贴 token。

## 

[​

](https://docs.openclaw.ai/zh-CN/gateway/authentication)

要求

-   Anthropic 订阅账号（用于 `claude setup-token`）
-   已安装 Claude Code CLI（`claude` 命令可用）

[配置示例](https://docs.openclaw.ai/zh-CN/gateway/configuration-examples)[健康检查](https://docs.openclaw.ai/zh-CN/gateway/health)

⌘I
