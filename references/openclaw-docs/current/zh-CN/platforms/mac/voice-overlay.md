<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay -->
<!-- Title: 语音浮层 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)

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

-   [语音浮层生命周期（macOS）](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)
-   [当前意图](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)
-   [已实现（2025 年 12 月 9 日）](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)
-   [后续步骤](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)
-   [调试清单](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)
-   [迁移步骤（建议）](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)

macOS 配套应用

# 语音浮层

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)

语音浮层生命周期（macOS）

受众：macOS 应用贡献者。目标：在唤醒词与按键说话重叠时保持语音浮层行为可预测。

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)

当前意图

-   如果浮层已因唤醒词显示，此时用户按下热键，热键会话会_接管_现有文本而非重置。浮层在热键按住期间保持显示。用户松开时：如果有去除空白后的文本则发送，否则关闭。
-   单独使用唤醒词时仍在静音后自动发送；按键说话在松开时立即发送。

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)

已实现（2025 年 12 月 9 日）

-   浮层会话现在为每次捕获（唤醒词或按键说话）携带一个令牌。当令牌不匹配时，部分/最终/发送/关闭/音量更新会被丢弃，避免过时回调。
-   按键说话会接管任何可见的浮层文本作为前缀（因此在唤醒浮层显示时按下热键会保留文本并追加新语音）。它最多等待 1.5 秒获取最终转录结果，然后回退到当前文本。
-   提示音/浮层日志以 `info` 级别输出，分类为 `voicewake.overlay`、`voicewake.ptt` 和 `voicewake.chime`（会话开始、部分、最终、发送、关闭、提示音原因）。

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)

后续步骤

1.  **VoiceSessionCoordinator（actor）**
    -   同一时间只拥有一个 `VoiceSession`。
    -   API（基于令牌）：`beginWakeCapture`、`beginPushToTalk`、`updatePartial`、`endCapture`、`cancel`、`applyCooldown`。
    -   丢弃携带过时令牌的回调（防止旧识别器重新打开浮层）。
2.  **VoiceSession（模型）**
    -   字段：`token`、`source`（wakeWord|pushToTalk）、已提交/临时文本、提示音标志、计时器（自动发送、空闲）、`overlayMode`（display|editing|sending）、冷却截止时间。
3.  **浮层绑定**
    -   `VoiceSessionPublisher`（`ObservableObject`）将活跃会话镜像到 SwiftUI。
    -   `VoiceWakeOverlayView` 仅通过 publisher 渲染；绝不直接修改全局单例。
    -   浮层用户操作（`sendNow`、`dismiss`、`edit`）携带会话令牌回调到 coordinator。
4.  **统一发送路径**
    -   `endCapture` 时：如果去除空白后文本为空 → 关闭；否则 `performSend(session:)`（播放一次发送提示音、转发、关闭）。
    -   按键说话：无延迟；唤醒词：可选自动发送延迟。
    -   按键说话结束后对唤醒运行时施加短暂冷却，防止唤醒词立即重新触发。
5.  **日志**
    -   Coordinator 在子系统 `bot.molt`、分类 `voicewake.overlay` 和 `voicewake.chime` 下输出 `.info` 级别日志。
    -   关键事件：`session_started`、`adopted_by_push_to_talk`、`partial`、`finalized`、`send`、`dismiss`、`cancel`、`cooldown`。

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)

调试清单

-   复现浮层粘滞问题时流式查看日志：
    
    复制
    
    ```
    sudo log stream --predicate 'subsystem == "bot.molt" AND category CONTAINS "voicewake"' --level info --style compact
    ```
    
-   验证只有一个活跃会话令牌；过时回调应被 coordinator 丢弃。
-   确保按键说话松开时始终使用活跃令牌调用 `endCapture`；如果文本为空，预期 `dismiss` 且不播放提示音或发送。

### 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/voice-overlay)

迁移步骤（建议）

1.  添加 `VoiceSessionCoordinator`、`VoiceSession` 和 `VoiceSessionPublisher`。
2.  重构 `VoiceWakeRuntime`，使其创建/更新/结束会话，而非直接操作 `VoiceWakeOverlayController`。
3.  重构 `VoicePushToTalk`，使其接管现有会话并在松开时调用 `endCapture`；施加运行时冷却。
4.  将 `VoiceWakeOverlayController` 连接到 publisher；移除来自 runtime/PTT 的直接调用。
5.  添加会话接管、冷却和空文本关闭的集成测试。

[语音唤醒](https://docs.openclaw.ai/zh-CN/platforms/mac/voicewake)[WebChat](https://docs.openclaw.ai/zh-CN/platforms/mac/webchat)

⌘I
