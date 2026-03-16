<!-- Source: https://docs.openclaw.ai/install/kubernetes -->
<!-- Title: Kubernetes - OpenClaw -->

[Skip to main content](https://docs.openclaw.ai/install/kubernetes)

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

##### Install overview

-   [
    
    Install
    
    
    
    ](https://docs.openclaw.ai/install)
-   [
    
    Installer Internals
    
    
    
    ](https://docs.openclaw.ai/install/installer)

##### Other install methods

-   [
    
    Docker
    
    
    
    ](https://docs.openclaw.ai/install/docker)
-   [
    
    Podman
    
    
    
    ](https://docs.openclaw.ai/install/podman)
-   [
    
    Nix
    
    
    
    ](https://docs.openclaw.ai/install/nix)
-   [
    
    Ansible
    
    
    
    ](https://docs.openclaw.ai/install/ansible)
-   [
    
    Bun (Experimental)
    
    
    
    ](https://docs.openclaw.ai/install/bun)

##### Maintenance

-   [
    
    Updating
    
    
    
    ](https://docs.openclaw.ai/install/updating)
-   [
    
    Migration Guide
    
    
    
    ](https://docs.openclaw.ai/install/migrating)
-   [
    
    Uninstall
    
    
    
    ](https://docs.openclaw.ai/install/uninstall)

##### Hosting and deployment

-   [
    
    VPS Hosting
    
    
    
    ](https://docs.openclaw.ai/vps)
-   [
    
    Kubernetes
    
    
    
    ](https://docs.openclaw.ai/install/kubernetes)
-   [
    
    Fly.io
    
    
    
    ](https://docs.openclaw.ai/install/fly)
-   [
    
    Hetzner
    
    
    
    ](https://docs.openclaw.ai/install/hetzner)
-   [
    
    GCP
    
    
    
    ](https://docs.openclaw.ai/install/gcp)
-   [
    
    macOS VMs
    
    
    
    ](https://docs.openclaw.ai/install/macos-vm)
-   [
    
    exe.dev
    
    
    
    ](https://docs.openclaw.ai/install/exe-dev)
-   [
    
    Deploy on Railway
    
    
    
    ](https://docs.openclaw.ai/install/railway)
-   [
    
    Deploy on Render
    
    
    
    ](https://docs.openclaw.ai/install/render)
-   [
    
    Deploy on Northflank
    
    
    
    ](https://docs.openclaw.ai/install/northflank)

##### Advanced

-   [
    
    Development Channels
    
    
    
    ](https://docs.openclaw.ai/install/development-channels)

-   [OpenClaw on Kubernetes](https://docs.openclaw.ai/install/kubernetes)
-   [Why not Helm?](https://docs.openclaw.ai/install/kubernetes)
-   [What you need](https://docs.openclaw.ai/install/kubernetes)
-   [Quick start](https://docs.openclaw.ai/install/kubernetes)
-   [Local testing with Kind](https://docs.openclaw.ai/install/kubernetes)
-   [Step by step](https://docs.openclaw.ai/install/kubernetes)
-   [1) Deploy](https://docs.openclaw.ai/install/kubernetes)
-   [2) Access the gateway](https://docs.openclaw.ai/install/kubernetes)
-   [What gets deployed](https://docs.openclaw.ai/install/kubernetes)
-   [Customization](https://docs.openclaw.ai/install/kubernetes)
-   [Agent instructions](https://docs.openclaw.ai/install/kubernetes)
-   [Gateway config](https://docs.openclaw.ai/install/kubernetes)
-   [Add providers](https://docs.openclaw.ai/install/kubernetes)
-   [Custom namespace](https://docs.openclaw.ai/install/kubernetes)
-   [Custom image](https://docs.openclaw.ai/install/kubernetes)
-   [Expose beyond port-forward](https://docs.openclaw.ai/install/kubernetes)
-   [Re-deploy](https://docs.openclaw.ai/install/kubernetes)
-   [Teardown](https://docs.openclaw.ai/install/kubernetes)
-   [Architecture notes](https://docs.openclaw.ai/install/kubernetes)
-   [File structure](https://docs.openclaw.ai/install/kubernetes)

Hosting and deployment

# Kubernetes

# 

[​

](https://docs.openclaw.ai/install/kubernetes)

OpenClaw on Kubernetes

A minimal starting point for running OpenClaw on Kubernetes — not a production-ready deployment. It covers the core resources and is meant to be adapted to your environment.

## 

[​

](https://docs.openclaw.ai/install/kubernetes)

Why not Helm?

OpenClaw is a single container with some config files. The interesting customization is in agent content (markdown files, skills, config overrides), not infrastructure templating. Kustomize handles overlays without the overhead of a Helm chart. If your deployment grows more complex, a Helm chart can be layered on top of these manifests.

## 

[​

](https://docs.openclaw.ai/install/kubernetes)

What you need

-   A running Kubernetes cluster (AKS, EKS, GKE, k3s, kind, OpenShift, etc.)
-   `kubectl` connected to your cluster
-   An API key for at least one model provider

## 

[​

](https://docs.openclaw.ai/install/kubernetes)

Quick start

Copy

```
# Replace with your provider: ANTHROPIC, GEMINI, OPENAI, or OPENROUTER
export <PROVIDER>_API_KEY="..."
./scripts/k8s/deploy.sh

kubectl port-forward svc/openclaw 18789:18789 -n openclaw
open http://localhost:18789
```

Retrieve the gateway token and paste it into the Control UI:

Copy

```
kubectl get secret openclaw-secrets -n openclaw -o jsonpath='{.data.OPENCLAW_GATEWAY_TOKEN}' | base64 -d
```

For local debugging, `./scripts/k8s/deploy.sh --show-token` prints the token after deploy.

## 

[​

](https://docs.openclaw.ai/install/kubernetes)

Local testing with Kind

If you don’t have a cluster, create one locally with [Kind](https://kind.sigs.k8s.io/):

Copy

```
./scripts/k8s/create-kind.sh           # auto-detects docker or podman
./scripts/k8s/create-kind.sh --delete  # tear down
```

Then deploy as usual with `./scripts/k8s/deploy.sh`.

## 

[​

](https://docs.openclaw.ai/install/kubernetes)

Step by step

### 

[​

](https://docs.openclaw.ai/install/kubernetes)

1) Deploy

**Option A** — API key in environment (one step):

Copy

```
# Replace with your provider: ANTHROPIC, GEMINI, OPENAI, or OPENROUTER
export <PROVIDER>_API_KEY="..."
./scripts/k8s/deploy.sh
```

The script creates a Kubernetes Secret with the API key and an auto-generated gateway token, then deploys. If the Secret already exists, it preserves the current gateway token and any provider keys not being changed. **Option B** — create the secret separately:

Copy

```
export <PROVIDER>_API_KEY="..."
./scripts/k8s/deploy.sh --create-secret
./scripts/k8s/deploy.sh
```

Use `--show-token` with either command if you want the token printed to stdout for local testing.

### 

[​

](https://docs.openclaw.ai/install/kubernetes)

2) Access the gateway

Copy

```
kubectl port-forward svc/openclaw 18789:18789 -n openclaw
open http://localhost:18789
```

## 

[​

](https://docs.openclaw.ai/install/kubernetes)

What gets deployed

Copy

```
Namespace: openclaw (configurable via OPENCLAW_NAMESPACE)
├── Deployment/openclaw        # Single pod, init container + gateway
├── Service/openclaw           # ClusterIP on port 18789
├── PersistentVolumeClaim      # 10Gi for agent state and config
├── ConfigMap/openclaw-config  # openclaw.json + AGENTS.md
└── Secret/openclaw-secrets    # Gateway token + API keys
```

## 

[​

](https://docs.openclaw.ai/install/kubernetes)

Customization

### 

[​

](https://docs.openclaw.ai/install/kubernetes)

Agent instructions

Edit the `AGENTS.md` in `scripts/k8s/manifests/configmap.yaml` and redeploy:

Copy

```
./scripts/k8s/deploy.sh
```

### 

[​

](https://docs.openclaw.ai/install/kubernetes)

Gateway config

Edit `openclaw.json` in `scripts/k8s/manifests/configmap.yaml`. See [Gateway configuration](https://docs.openclaw.ai/gateway/configuration) for the full reference.

### 

[​

](https://docs.openclaw.ai/install/kubernetes)

Add providers

Re-run with additional keys exported:

Copy

```
export ANTHROPIC_API_KEY="..."
export OPENAI_API_KEY="..."
./scripts/k8s/deploy.sh --create-secret
./scripts/k8s/deploy.sh
```

Existing provider keys stay in the Secret unless you overwrite them. Or patch the Secret directly:

Copy

```
kubectl patch secret openclaw-secrets -n openclaw \
  -p '{"stringData":{"<PROVIDER>_API_KEY":"..."}}'
kubectl rollout restart deployment/openclaw -n openclaw
```

### 

[​

](https://docs.openclaw.ai/install/kubernetes)

Custom namespace

Copy

```
OPENCLAW_NAMESPACE=my-namespace ./scripts/k8s/deploy.sh
```

### 

[​

](https://docs.openclaw.ai/install/kubernetes)

Custom image

Edit the `image` field in `scripts/k8s/manifests/deployment.yaml`:

Copy

```
image: ghcr.io/openclaw/openclaw:2026.3.1
```

### 

[​

](https://docs.openclaw.ai/install/kubernetes)

Expose beyond port-forward

The default manifests bind the gateway to loopback inside the pod. That works with `kubectl port-forward`, but it does not work with a Kubernetes `Service` or Ingress path that needs to reach the pod IP. If you want to expose the gateway through an Ingress or load balancer:

-   Change the gateway bind in `scripts/k8s/manifests/configmap.yaml` from `loopback` to a non-loopback bind that matches your deployment model
-   Keep gateway auth enabled and use a proper TLS-terminated entrypoint
-   Configure the Control UI for remote access using the supported web security model (for example HTTPS/Tailscale Serve and explicit allowed origins when needed)

## 

[​

](https://docs.openclaw.ai/install/kubernetes)

Re-deploy

Copy

```
./scripts/k8s/deploy.sh
```

This applies all manifests and restarts the pod to pick up any config or secret changes.

## 

[​

](https://docs.openclaw.ai/install/kubernetes)

Teardown

Copy

```
./scripts/k8s/deploy.sh --delete
```

This deletes the namespace and all resources in it, including the PVC.

## 

[​

](https://docs.openclaw.ai/install/kubernetes)

Architecture notes

-   The gateway binds to loopback inside the pod by default, so the included setup is for `kubectl port-forward`
-   No cluster-scoped resources — everything lives in a single namespace
-   Security: `readOnlyRootFilesystem`, `drop: ALL` capabilities, non-root user (UID 1000)
-   The default config keeps the Control UI on the safer local-access path: loopback bind plus `kubectl port-forward` to `http://127.0.0.1:18789`
-   If you move beyond localhost access, use the supported remote model: HTTPS/Tailscale plus the appropriate gateway bind and Control UI origin settings
-   Secrets are generated in a temp directory and applied directly to the cluster — no secret material is written to the repo checkout

## 

[​

](https://docs.openclaw.ai/install/kubernetes)

File structure

Copy

```
scripts/k8s/
├── deploy.sh                   # Creates namespace + secret, deploys via kustomize
├── create-kind.sh              # Local Kind cluster (auto-detects docker/podman)
└── manifests/
    ├── kustomization.yaml      # Kustomize base
    ├── configmap.yaml          # openclaw.json + AGENTS.md
    ├── deployment.yaml         # Pod spec with security hardening
    ├── pvc.yaml                # 10Gi persistent storage
    └── service.yaml            # ClusterIP on 18789
```

[VPS Hosting](https://docs.openclaw.ai/vps)[Fly.io](https://docs.openclaw.ai/install/fly)

⌘I
