<!-- Source: https://docs.openclaw.ai/zh-CN/platforms/mac/logging -->
<!-- Title: macOS 日志 - OpenClaw -->

[跳转到主要内容](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)

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

-   [日志（macOS）](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)
-   [滚动诊断文件日志（Debug 面板）](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)
-   [macOS 上统一日志的隐私数据](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)
-   [为 OpenClaw 启用（bot.molt）](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)
-   [调试后禁用](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)

macOS 配套应用

# macOS 日志

# 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)

日志（macOS）

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)

滚动诊断文件日志（Debug 面板）

OpenClaw 通过 swift-log（默认使用统一日志）路由 macOS 应用日志，并且在需要持久化捕获时可以将本地轮转文件日志写入磁盘。

-   详细级别：**Debug 面板 → Logs → App logging → Verbosity**
-   启用：**Debug 面板 → Logs → App logging → “Write rolling diagnostics log (JSONL)”**
-   位置：`~/Library/Logs/OpenClaw/diagnostics.jsonl`（自动轮转；旧文件以 `.1`、`.2`、… 为后缀）
-   清除：**Debug 面板 → Logs → App logging → “Clear”**

注意事项：

-   此功能**默认关闭**。仅在主动调试时启用。
-   该文件包含敏感信息；分享前请先审查内容。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)

macOS 上统一日志的隐私数据

统一日志会屏蔽大部分负载内容，除非子系统选择启用 `privacy -off`。根据 Peter 关于 macOS [日志隐私机制](https://steipete.me/posts/2025/logging-privacy-shenanigans)（2025）的文章，这通过 `/Library/Preferences/Logging/Subsystems/` 中以子系统名称为键的 plist 文件来控制。只有新的日志条目才会应用该标志，因此请在复现问题之前启用它。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)

为 OpenClaw 启用（`bot.molt`）

-   先将 plist 写入临时文件，然后以 root 身份原子性地安装：

复制

```
cat <<'EOF' >/tmp/bot.molt.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>DEFAULT-OPTIONS</key>
    <dict>
        <key>Enable-Private-Data</key>
        <true/>
    </dict>
</dict>
</plist>
EOF
sudo install -m 644 -o root -g wheel /tmp/bot.molt.plist /Library/Preferences/Logging/Subsystems/bot.molt.plist
```

-   无需重启；logd 会很快检测到该文件，但只有新的日志行才会包含隐私负载。
-   使用现有的辅助脚本查看更丰富的输出，例如 `./scripts/clawlog.sh --category WebChat --last 5m`。

## 

[​

](https://docs.openclaw.ai/zh-CN/platforms/mac/logging)

调试后禁用

-   移除覆盖配置：`sudo rm /Library/Preferences/Logging/Subsystems/bot.molt.plist`。
-   可选择运行 `sudo log config --reload` 强制 logd 立即丢弃覆盖配置。
-   请注意此数据可能包含电话号码和消息正文；仅在确实需要额外详细信息时才保留该 plist 文件。

[菜单栏图标](https://docs.openclaw.ai/zh-CN/platforms/mac/icon)[macOS 权限](https://docs.openclaw.ai/zh-CN/platforms/mac/permissions)

⌘I
