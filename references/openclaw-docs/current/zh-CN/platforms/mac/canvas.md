<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/mac/canvas -->
<!-- Title: Canvas - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)

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

##### 平台概览

-   [
    
    平台
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms)
-   [
    
    macOS 应用
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/macos)
-   [
    
    Linux 应用
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/linux)
-   [
    
    Windows（WSL2）
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/windows)
-   [
    
    Android 应用
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/android)
-   [
    
    iOS 应用
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/ios)
-   [
    
    DigitalOcean
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/digitalocean)
-   [
    
    Oracle Cloud
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/oracle)
-   [
    
    Raspberry Pi
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/raspberry-pi)

##### macOS 配套应用

-   [
    
    macOS 开发设置
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/dev-setup)
-   [
    
    菜单栏
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/menu-bar)
-   [
    
    语音唤醒
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/voicewake)
-   [
    
    语音浮层
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)
-   [
    
    WebChat
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)
-   [
    
    Canvas
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)
-   [
    
    Gateway 网关生命周期
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)
-   [
    
    健康检查
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/health)
-   [
    
    菜单栏图标
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/icon)
-   [
    
    macOS 日志
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)
-   [
    
    macOS 权限
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/permissions)
-   [
    
    远程控制
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/remote)
-   [
    
    macOS 签名
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/signing)
-   [
    
    macOS 上的 Gateway 网关
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/bundled-gateway)
-   [
    
    macOS IPC
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/xpc)
-   [
    
    Skills
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/skills)
-   [
    
    Peekaboo Bridge
    
    
    
    ](https://docs.openclaw.ai/zh-CN/platforms/mac/peekaboo)

-   [Canvas（macOS 应用）](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)
-   [Canvas 存储位置](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)
-   [面板行为](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)
-   [智能体 API 接口](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)
-   [Canvas 中的 A2UI](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)
-   [A2UI 命令（v0.8）](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)
-   [从 Canvas 触发智能体运行](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)
-   [安全注意事项](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)

macOS 配套应用

# Canvas

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)

Canvas（macOS 应用）

macOS 应用使用 `WKWebView` 嵌入一个智能体控制的 **Canvas 面板**。它是一个用于 HTML/CSS/JS、A2UI 和小型交互式界面的轻量级可视化工作区。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)

Canvas 存储位置

Canvas 状态存储在 Application Support 下：

-   `~/Library/Application Support/OpenClaw/canvas/<session>/...`

Canvas 面板通过**自定义 URL 方案**提供这些文件：

-   `openclaw-canvas://<session>/<path>`

示例：

-   `openclaw-canvas://main/` → `<canvasRoot>/main/index.html`
-   `openclaw-canvas://main/assets/app.css` → `<canvasRoot>/main/assets/app.css`
-   `openclaw-canvas://main/widgets/todo/` → `<canvasRoot>/main/widgets/todo/index.html`

如果根目录下没有 `index.html`，应用会显示一个**内置脚手架页面**。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)

面板行为

-   无边框、可调整大小的面板，锚定在菜单栏（或鼠标光标）附近。
-   记住每个会话的大小/位置。
-   当本地 canvas 文件更改时自动重新加载。
-   一次只显示一个 Canvas 面板（根据需要切换会话）。

可以从设置 → **允许 Canvas** 禁用 Canvas。禁用时，canvas 节点命令返回 `CANVAS_DISABLED`。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)

智能体 API 接口

Canvas 通过 **Gateway 网关 WebSocket** 暴露，因此智能体可以：

-   显示/隐藏面板
-   导航到路径或 URL
-   执行 JavaScript
-   捕获快照图像

CLI 示例：

复制

```
openclaw nodes canvas present --node <id>
openclaw nodes canvas navigate --node <id> --url "/"
openclaw nodes canvas eval --node <id> --js "document.title"
openclaw nodes canvas snapshot --node <id>
```

注意事项：

-   `canvas.navigate` 接受**本地 canvas 路径**、`http(s)` URL 和 `file://` URL。
-   如果传递 `"/"`，Canvas 会显示本地脚手架或 `index.html`。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)

Canvas 中的 A2UI

A2UI 由 Gateway 网关 canvas 主机托管并在 Canvas 面板内渲染。 当 Gateway 网关广播 Canvas 主机时，macOS 应用在首次打开时自动导航到 A2UI 主机页面。 默认 A2UI 主机 URL：

复制

```
http://<gateway-host>:18793/__openclaw__/a2ui/
```

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)

A2UI 命令（v0.8）

Canvas 目前接受 **A2UI v0.8** 服务器→客户端消息：

-   `beginRendering`
-   `surfaceUpdate`
-   `dataModelUpdate`
-   `deleteSurface`

`createSurface`（v0.9）不受支持。 CLI 示例：

复制

```
cat > /tmp/a2ui-v0.8.jsonl <<'EOFA2'
{"surfaceUpdate":{"surfaceId":"main","components":[{"id":"root","component":{"Column":{"children":{"explicitList":["title","content"]}}}},{"id":"title","component":{"Text":{"text":{"literalString":"Canvas (A2UI v0.8)"},"usageHint":"h1"}}},{"id":"content","component":{"Text":{"text":{"literalString":"If you can read this, A2UI push works."},"usageHint":"body"}}}]}}
{"beginRendering":{"surfaceId":"main","root":"root"}}
EOFA2

openclaw nodes canvas a2ui push --jsonl /tmp/a2ui-v0.8.jsonl --node <id>
```

快速测试：

复制

```
openclaw nodes canvas a2ui push --node <id> --text "Hello from A2UI"
```

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)

从 Canvas 触发智能体运行

Canvas 可以通过深层链接触发新的智能体运行：

-   `openclaw://agent?...`

示例（在 JS 中）：

复制

```
window.location.href = "openclaw://agent?message=Review%20this%20design";
```

除非提供有效密钥，否则应用会提示确认。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/canvas)

安全注意事项

-   Canvas 方案阻止目录遍历；文件必须位于会话根目录下。
-   本地 Canvas 内容使用自定义方案（不需要 loopback 服务器）。
-   仅在显式导航时允许外部 `http(s)` URL。

[WebChat](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)[Gateway 网关生命周期](https://docs.openclaw.ai/zh-CN/platforms/mac/child-process)

⌘I
