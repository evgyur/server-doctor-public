<!-- Source: https://docs.openclaw.ai/zh-CN/providers/bedrock -->
<!-- Title: Amazon Bedrock - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/providers/bedrock)

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

-   [Amazon Bedrock](https://docs.openclaw.ai/zh-CN/providers/bedrock)
-   [pi‑ai 支持的功能](https://docs.openclaw.ai/zh-CN/providers/bedrock)
-   [自动模型发现](https://docs.openclaw.ai/zh-CN/providers/bedrock)
-   [设置（手动）](https://docs.openclaw.ai/zh-CN/providers/bedrock)
-   [EC2 实例角色](https://docs.openclaw.ai/zh-CN/providers/bedrock)
-   [注意事项](https://docs.openclaw.ai/zh-CN/providers/bedrock)

提供商

# Amazon Bedrock

# 

[​

](https://docs.openclaw.ai/zh-CN/providers/bedrock)

Amazon Bedrock

OpenClaw 可以通过 pi‑ai 的 **Bedrock Converse** 流式提供商使用 **Amazon Bedrock** 模型。Bedrock 认证使用 **AWS SDK 默认凭证链**，而非 API 密钥。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/bedrock)

pi‑ai 支持的功能

-   提供商：`amazon-bedrock`
-   API：`bedrock-converse-stream`
-   认证：AWS 凭证（环境变量、共享配置或实例角色）
-   区域：`AWS_REGION` 或 `AWS_DEFAULT_REGION`（默认：`us-east-1`）

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/bedrock)

自动模型发现

如果检测到 AWS 凭证，OpenClaw 可以自动发现支持**流式传输**和**文本输出**的 Bedrock 模型。发现功能使用 `bedrock:ListFoundationModels`，并会被缓存（默认：1 小时）。 配置选项位于 `models.bedrockDiscovery` 下：

复制

```
{
  models: {
    bedrockDiscovery: {
      enabled: true,
      region: "us-east-1",
      providerFilter: ["anthropic", "amazon"],
      refreshInterval: 3600,
      defaultContextWindow: 32000,
      defaultMaxTokens: 4096,
    },
  },
}
```

注意事项：

-   `enabled` 在存在 AWS 凭证时默认为 `true`。
-   `region` 默认为 `AWS_REGION` 或 `AWS_DEFAULT_REGION`，然后是 `us-east-1`。
-   `providerFilter` 匹配 Bedrock 提供商名称（例如 `anthropic`）。
-   `refreshInterval` 单位为秒；设置为 `0` 可禁用缓存。
-   `defaultContextWindow`（默认：`32000`）和 `defaultMaxTokens`（默认：`4096`）用于已发现的模型（如果你知道模型限制，可以覆盖这些值）。

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/bedrock)

设置（手动）

1.  确保 AWS 凭证在 **Gateway 网关主机**上可用：

复制

```
export AWS_ACCESS_KEY_ID="AKIA..."
export AWS_SECRET_ACCESS_KEY="..."
export AWS_REGION="us-east-1"
# 可选：
export AWS_SESSION_TOKEN="..."
export AWS_PROFILE="your-profile"
# 可选（Bedrock API 密钥/Bearer 令牌）：
export AWS_BEARER_TOKEN_BEDROCK="..."
```

2.  在配置中添加 Bedrock 提供商和模型（无需 `apiKey`）：

复制

```
{
  models: {
    providers: {
      "amazon-bedrock": {
        baseUrl: "https://bedrock-runtime.us-east-1.amazonaws.com",
        api: "bedrock-converse-stream",
        auth: "aws-sdk",
        models: [
          {
            id: "anthropic.claude-opus-4-5-20251101-v1:0",
            name: "Claude Opus 4.5 (Bedrock)",
            reasoning: true,
            input: ["text", "image"],
            cost: { input: 0, output: 0, cacheRead: 0, cacheWrite: 0 },
            contextWindow: 200000,
            maxTokens: 8192,
          },
        ],
      },
    },
  },
  agents: {
    defaults: {
      model: { primary: "amazon-bedrock/anthropic.claude-opus-4-5-20251101-v1:0" },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/bedrock)

EC2 实例角色

当在附加了 IAM 角色的 EC2 实例上运行 OpenClaw 时，AWS SDK 会自动使用实例元数据服务（IMDS）进行认证。但是，OpenClaw 的凭证检测目前只检查环境变量，不检查 IMDS 凭证。 **解决方法：** 设置 `AWS_PROFILE=default` 以表明 AWS 凭证可用。实际认证仍然通过 IMDS 使用实例角色。

复制

```
# 添加到 ~/.bashrc 或你的 shell 配置文件
export AWS_PROFILE=default
export AWS_REGION=us-east-1
```

EC2 实例角色**所需的 IAM 权限**：

-   `bedrock:InvokeModel`
-   `bedrock:InvokeModelWithResponseStream`
-   `bedrock:ListFoundationModels`（用于自动发现）

或者附加托管策略 `AmazonBedrockFullAccess`。 **快速设置：**

复制

```
# 1. 创建 IAM 角色和实例配置文件
aws iam create-role --role-name EC2-Bedrock-Access \
  --assume-role-policy-document '{
    "Version": "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Principal": {"Service": "ec2.amazonaws.com"},
      "Action": "sts:AssumeRole"
    }]
  }'

aws iam attach-role-policy --role-name EC2-Bedrock-Access \
  --policy-arn arn:aws:iam::aws:policy/AmazonBedrockFullAccess

aws iam create-instance-profile --instance-profile-name EC2-Bedrock-Access
aws iam add-role-to-instance-profile \
  --instance-profile-name EC2-Bedrock-Access \
  --role-name EC2-Bedrock-Access

# 2. 附加到你的 EC2 实例
aws ec2 associate-iam-instance-profile \
  --instance-id i-xxxxx \
  --iam-instance-profile Name=EC2-Bedrock-Access

# 3. 在 EC2 实例上启用发现功能
openclaw config set models.bedrockDiscovery.enabled true
openclaw config set models.bedrockDiscovery.region us-east-1

# 4. 设置解决方法所需的环境变量
echo 'export AWS_PROFILE=default' >> ~/.bashrc
echo 'export AWS_REGION=us-east-1' >> ~/.bashrc
source ~/.bashrc

# 5. 验证模型已被发现
openclaw models list
```

## 

[​

](https://docs.openclaw.ai/zh-CN/providers/bedrock)

注意事项

-   Bedrock 需要在你的 AWS 账户/区域中启用**模型访问**。
-   自动发现需要 `bedrock:ListFoundationModels` 权限。
-   如果你使用配置文件，请在 Gateway 网关主机上设置 `AWS_PROFILE`。
-   OpenClaw 按以下顺序获取凭证来源：`AWS_BEARER_TOKEN_BEDROCK`，然后是 `AWS_ACCESS_KEY_ID` + `AWS_SECRET_ACCESS_KEY`，然后是 `AWS_PROFILE`，最后是默认的 AWS SDK 链。
-   推理支持取决于模型；请查看 Bedrock 模型卡了解当前功能。
-   如果你更喜欢托管密钥流程，也可以在 Bedrock 前面放置一个 OpenAI 兼容的代理，并将其配置为 OpenAI 提供商。

[Anthropic](https://docs.openclaw.ai/zh-CN/providers/anthropic)[Claude Max API 代理](https://docs.openclaw.ai/zh-CN/providers/claude-max-api-proxy)

⌘I
