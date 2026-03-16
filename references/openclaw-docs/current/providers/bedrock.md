<!-- Source: https://docs.openclaw.ai/providers/bedrock -->
<!-- Title: Amazon Bedrock - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/providers/bedrock)

[OpenClaw home page![light logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)![dark logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)](https://docs.openclaw.ai/)

[Get started

](https://docs.openclaw.ai/)[Install

](https://docs.openclaw.ai/install)[Channels

](https://docs.openclaw.ai/channels)[Agents

](https://docs.openclaw.ai/pi)[Tools

](https://docs.openclaw.ai/tools)[Models

](https://docs.openclaw.ai/providers)[Platforms

](https://docs.openclaw.ai/platforms)[Gateway & Ops

](https://docs.openclaw.ai/gateway)[Reference

](https://docs.openclaw.ai/cli)[Help

](https://docs.openclaw.ai/help)

##### Overview

-   [
    
    Model Providers
    
    
    
    ](https://docs.openclaw.ai/providers)
-   [
    
    Model Provider Quickstart
    
    
    
    ](https://docs.openclaw.ai/providers/models)

##### Model concepts

-   [
    
    Models CLI
    
    
    
    ](https://docs.openclaw.ai/concepts/models)

##### Configuration

-   [
    
    Model Providers
    
    
    
    ](https://docs.openclaw.ai/concepts/model-providers)
-   [
    
    Model Failover
    
    
    
    ](https://docs.openclaw.ai/concepts/model-failover)

##### Providers

-   [
    
    Anthropic
    
    
    
    ](https://docs.openclaw.ai/providers/anthropic)
-   [
    
    Amazon Bedrock
    
    
    
    ](https://docs.openclaw.ai/providers/bedrock)
-   [
    
    Cloudflare AI Gateway
    
    
    
    ](https://docs.openclaw.ai/providers/cloudflare-ai-gateway)
-   [
    
    Claude Max API Proxy
    
    
    
    ](https://docs.openclaw.ai/providers/claude-max-api-proxy)
-   [
    
    Deepgram
    
    
    
    ](https://docs.openclaw.ai/providers/deepgram)
-   [
    
    GitHub Copilot
    
    
    
    ](https://docs.openclaw.ai/providers/github-copilot)
-   [
    
    Hugging Face (Inference)
    
    
    
    ](https://docs.openclaw.ai/providers/huggingface)
-   [
    
    Kilocode
    
    
    
    ](https://docs.openclaw.ai/providers/kilocode)
-   [
    
    Litellm
    
    
    
    ](https://docs.openclaw.ai/providers/litellm)
-   [
    
    GLM Models
    
    
    
    ](https://docs.openclaw.ai/providers/glm)
-   [
    
    MiniMax
    
    
    
    ](https://docs.openclaw.ai/providers/minimax)
-   [
    
    Moonshot AI
    
    
    
    ](https://docs.openclaw.ai/providers/moonshot)
-   [
    
    Mistral
    
    
    
    ](https://docs.openclaw.ai/providers/mistral)
-   [
    
    NVIDIA
    
    
    
    ](https://docs.openclaw.ai/providers/nvidia)
-   [
    
    Ollama
    
    
    
    ](https://docs.openclaw.ai/providers/ollama)
-   [
    
    OpenAI
    
    
    
    ](https://docs.openclaw.ai/providers/openai)
-   [
    
    OpenCode Go
    
    
    
    ](https://docs.openclaw.ai/providers/opencode-go)
-   [
    
    OpenCode
    
    
    
    ](https://docs.openclaw.ai/providers/opencode)
-   [
    
    OpenRouter
    
    
    
    ](https://docs.openclaw.ai/providers/openrouter)
-   [
    
    Qianfan
    
    
    
    ](https://docs.openclaw.ai/providers/qianfan)
-   [
    
    Qwen
    
    
    
    ](https://docs.openclaw.ai/providers/qwen)
-   [
    
    Synthetic
    
    
    
    ](https://docs.openclaw.ai/providers/synthetic)
-   [
    
    Together
    
    
    
    ](https://docs.openclaw.ai/providers/together)
-   [
    
    Vercel AI Gateway
    
    
    
    ](https://docs.openclaw.ai/providers/vercel-ai-gateway)
-   [
    
    Venice AI
    
    
    
    ](https://docs.openclaw.ai/providers/venice)
-   [
    
    vLLM
    
    
    
    ](https://docs.openclaw.ai/providers/vllm)
-   [
    
    Xiaomi MiMo
    
    
    
    ](https://docs.openclaw.ai/providers/xiaomi)
-   [
    
    Z.AI
    
    
    
    ](https://docs.openclaw.ai/providers/zai)

-   [Amazon Bedrock](https://docs.openclaw.ai/providers/bedrock)
-   [What pi‑ai supports](https://docs.openclaw.ai/providers/bedrock)
-   [Automatic model discovery](https://docs.openclaw.ai/providers/bedrock)
-   [Onboarding](https://docs.openclaw.ai/providers/bedrock)
-   [EC2 Instance Roles](https://docs.openclaw.ai/providers/bedrock)
-   [Quick setup (AWS path)](https://docs.openclaw.ai/providers/bedrock)
-   [Notes](https://docs.openclaw.ai/providers/bedrock)

Providers

# Amazon Bedrock

# 

[​

](https://docs.openclaw.ai/providers/bedrock)

Amazon Bedrock

OpenClaw can use **Amazon Bedrock** models via pi‑ai’s **Bedrock Converse** streaming provider. Bedrock auth uses the **AWS SDK default credential chain**, not an API key.

## 

[​

](https://docs.openclaw.ai/providers/bedrock)

What pi‑ai supports

-   Provider: `amazon-bedrock`
-   API: `bedrock-converse-stream`
-   Auth: AWS credentials (env vars, shared config, or instance role)
-   Region: `AWS_REGION` or `AWS_DEFAULT_REGION` (default: `us-east-1`)

## 

[​

](https://docs.openclaw.ai/providers/bedrock)

Automatic model discovery

If AWS credentials are detected, OpenClaw can automatically discover Bedrock models that support **streaming** and **text output**. Discovery uses `bedrock:ListFoundationModels` and is cached (default: 1 hour). Config options live under `models.bedrockDiscovery`:

Copy

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

Notes:

-   `enabled` defaults to `true` when AWS credentials are present.
-   `region` defaults to `AWS_REGION` or `AWS_DEFAULT_REGION`, then `us-east-1`.
-   `providerFilter` matches Bedrock provider names (for example `anthropic`).
-   `refreshInterval` is seconds; set to `0` to disable caching.
-   `defaultContextWindow` (default: `32000`) and `defaultMaxTokens` (default: `4096`) are used for discovered models (override if you know your model limits).

## 

[​

](https://docs.openclaw.ai/providers/bedrock)

Onboarding

1.  Ensure AWS credentials are available on the **gateway host**:

Copy

```
export AWS_ACCESS_KEY_ID="AKIA..."
export AWS_SECRET_ACCESS_KEY="..."
export AWS_REGION="us-east-1"
# Optional:
export AWS_SESSION_TOKEN="..."
export AWS_PROFILE="your-profile"
# Optional (Bedrock API key/bearer token):
export AWS_BEARER_TOKEN_BEDROCK="..."
```

2.  Add a Bedrock provider and model to your config (no `apiKey` required):

Copy

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
            id: "us.anthropic.claude-opus-4-6-v1:0",
            name: "Claude Opus 4.6 (Bedrock)",
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
      model: { primary: "amazon-bedrock/us.anthropic.claude-opus-4-6-v1:0" },
    },
  },
}
```

## 

[​

](https://docs.openclaw.ai/providers/bedrock)

EC2 Instance Roles

When running OpenClaw on an EC2 instance with an IAM role attached, the AWS SDK will automatically use the instance metadata service (IMDS) for authentication. However, OpenClaw’s credential detection currently only checks for environment variables, not IMDS credentials. **Workaround:** Set `AWS_PROFILE=default` to signal that AWS credentials are available. The actual authentication still uses the instance role via IMDS.

Copy

```
# Add to ~/.bashrc or your shell profile
export AWS_PROFILE=default
export AWS_REGION=us-east-1
```

**Required IAM permissions** for the EC2 instance role:

-   `bedrock:InvokeModel`
-   `bedrock:InvokeModelWithResponseStream`
-   `bedrock:ListFoundationModels` (for automatic discovery)

Or attach the managed policy `AmazonBedrockFullAccess`.

## 

[​

](https://docs.openclaw.ai/providers/bedrock)

Quick setup (AWS path)

Copy

```
# 1. Create IAM role and instance profile
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

# 2. Attach to your EC2 instance
aws ec2 associate-iam-instance-profile \
  --instance-id i-xxxxx \
  --iam-instance-profile Name=EC2-Bedrock-Access

# 3. On the EC2 instance, enable discovery
openclaw config set models.bedrockDiscovery.enabled true
openclaw config set models.bedrockDiscovery.region us-east-1

# 4. Set the workaround env vars
echo 'export AWS_PROFILE=default' >> ~/.bashrc
echo 'export AWS_REGION=us-east-1' >> ~/.bashrc
source ~/.bashrc

# 5. Verify models are discovered
openclaw models list
```

## 

[​

](https://docs.openclaw.ai/providers/bedrock)

Notes

-   Bedrock requires **model access** enabled in your AWS account/region.
-   Automatic discovery needs the `bedrock:ListFoundationModels` permission.
-   If you use profiles, set `AWS_PROFILE` on the gateway host.
-   OpenClaw surfaces the credential source in this order: `AWS_BEARER_TOKEN_BEDROCK`, then `AWS_ACCESS_KEY_ID` + `AWS_SECRET_ACCESS_KEY`, then `AWS_PROFILE`, then the default AWS SDK chain.
-   Reasoning support depends on the model; check the Bedrock model card for current capabilities.
-   If you prefer a managed key flow, you can also place an OpenAI‑compatible proxy in front of Bedrock and configure it as an OpenAI provider instead.

[Anthropic](https://docs.openclaw.ai/providers/anthropic)[Cloudflare AI Gateway](https://docs.openclaw.ai/providers/cloudflare-ai-gateway)

⌘I
