<!-- Source: https://docs.openclaw.ai/zh-CN/network -->
<!-- Title: 网络 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/network)

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

-   [网络中心](https://docs.openclaw.ai/zh-CN/network)
-   [核心模型](https://docs.openclaw.ai/zh-CN/network)
-   [配对 + 身份](https://docs.openclaw.ai/zh-CN/network)
-   [设备发现 + 传输协议](https://docs.openclaw.ai/zh-CN/network)
-   [节点 + 传输协议](https://docs.openclaw.ai/zh-CN/network)
-   [安全](https://docs.openclaw.ai/zh-CN/network)

运维专题

# 网络

# 

[​

](https://docs.openclaw.ai/zh-CN/network)

网络中心

本中心汇集了 OpenClaw 如何在 localhost、局域网和 tailnet 之间连接、配对和保护设备的核心文档。

## 

[​

](https://docs.openclaw.ai/zh-CN/network)

核心模型

-   [Gateway 网关架构](https://docs.openclaw.ai/concepts/architecture)
-   [Gateway 网关协议](https://docs.openclaw.ai/gateway/protocol)
-   [Gateway 网关运维手册](https://docs.openclaw.ai/gateway)
-   [Web 接口 + 绑定模式](https://docs.openclaw.ai/web)

## 

[​

](https://docs.openclaw.ai/zh-CN/network)

配对 + 身份

-   [配对概述（私信 + 节点）](https://docs.openclaw.ai/channels/pairing)
-   [Gateway 网关拥有的节点配对](https://docs.openclaw.ai/gateway/pairing)
-   [Devices CLI（配对 + token 轮换）](https://docs.openclaw.ai/cli/devices)
-   [Pairing CLI（私信审批）](https://docs.openclaw.ai/cli/pairing)

本地信任：

-   本地连接（loopback 或 Gateway 网关主机自身的 tailnet 地址）可以自动批准配对，以保持同主机用户体验的流畅性。
-   非本地的 tailnet/局域网客户端仍需要显式的配对批准。

## 

[​

](https://docs.openclaw.ai/zh-CN/network)

设备发现 + 传输协议

-   [设备发现与传输协议](https://docs.openclaw.ai/gateway/discovery)
-   [Bonjour / mDNS](https://docs.openclaw.ai/gateway/bonjour)
-   [远程访问（SSH）](https://docs.openclaw.ai/gateway/remote)
-   [Tailscale](https://docs.openclaw.ai/gateway/tailscale)

## 

[​

](https://docs.openclaw.ai/zh-CN/network)

节点 + 传输协议

-   [节点概述](https://docs.openclaw.ai/nodes)
-   [桥接协议（旧版节点）](https://docs.openclaw.ai/gateway/bridge-protocol)
-   [节点运维手册：iOS](https://docs.openclaw.ai/platforms/ios)
-   [节点运维手册：Android](https://docs.openclaw.ai/platforms/android)

## 

[​

](https://docs.openclaw.ai/zh-CN/network)

安全

-   [安全概述](https://docs.openclaw.ai/gateway/security)
-   [Gateway 网关配置参考](https://docs.openclaw.ai/gateway/configuration)
-   [故障排除](https://docs.openclaw.ai/gateway/troubleshooting)
-   [Doctor](https://docs.openclaw.ai/gateway/doctor)

[Tailscale](https://docs.openclaw.ai/zh-CN/gateway/tailscale)[日志](https://docs.openclaw.ai/zh-CN/logging)

⌘I
