<!-- Source: https://docs.openclaw.ai/ja-JP/start/getting-started -->
<!-- Title: はじめに - OpenClaw -->

[メインコンテンツへスキップ](https://docs.openclaw.ai/ja-JP/start/getting-started)

[OpenClaw home page![light logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)![dark logo](https://mintcdn.com/clawdhub/dpADRo8IUoiDztzJ/assets/pixel-lobster.svg?fit=max&auto=format&n=dpADRo8IUoiDztzJ&q=85&s=8fdf719fb6d3eaad7c65231385bf28e5)](https://docs.openclaw.ai/ja-JP)

[はじめに

](https://docs.openclaw.ai/ja-JP)

##### 概要

-   [
    
    OpenClaw
    
    
    
    ](https://docs.openclaw.ai/ja-JP)

##### 初回セットアップ

-   [
    
    はじめに
    
    
    
    ](https://docs.openclaw.ai/ja-JP/start/getting-started)
-   [
    
    Wizard (CLI)
    
    
    
    ](https://docs.openclaw.ai/ja-JP/start/wizard)

-   [はじめに](https://docs.openclaw.ai/ja-JP/start/getting-started)
-   [前提条件](https://docs.openclaw.ai/ja-JP/start/getting-started)
-   [クイックセットアップ（CLI）](https://docs.openclaw.ai/ja-JP/start/getting-started)
-   [オプションの確認と追加機能](https://docs.openclaw.ai/ja-JP/start/getting-started)
-   [さらに詳しく](https://docs.openclaw.ai/ja-JP/start/getting-started)
-   [完了後の状態](https://docs.openclaw.ai/ja-JP/start/getting-started)
-   [次のステップ](https://docs.openclaw.ai/ja-JP/start/getting-started)

初回セットアップ

# はじめに

# 

[​

](https://docs.openclaw.ai/ja-JP/start/getting-started)

はじめに

目標：ゼロから最小限のセットアップで最初の動作するチャットを実現する。

最速のチャット方法：Control UIを開く（チャンネル設定は不要）。`openclaw dashboard`を実行してブラウザでチャットするか、で`http://127.0.0.1:18789/`を開きます。 ドキュメント：[Dashboard](https://docs.openclaw.ai/web/dashboard)と[Control UI](https://docs.openclaw.ai/web/control-ui)。

## 

[​

](https://docs.openclaw.ai/ja-JP/start/getting-started)

前提条件

-   Node 22以降

不明な場合は`node --version`でNodeのバージョンを確認してください。

## 

[​

](https://docs.openclaw.ai/ja-JP/start/getting-started)

クイックセットアップ（CLI）

1

[

](https://docs.openclaw.ai/ja-JP/start/getting-started)

OpenClawをインストール（推奨）

-   macOS/Linux
    
-   Windows (PowerShell)
    

コピー

```
curl -fsSL https://openclaw.ai/install.sh | bash
```

コピー

```
iwr -useb https://openclaw.ai/install.ps1 | iex
```

その他のインストール方法と要件：[インストール](https://docs.openclaw.ai/install)。

2

[

](https://docs.openclaw.ai/ja-JP/start/getting-started)

オンボーディングウィザードを実行

コピー

```
openclaw onboard --install-daemon
```

ウィザードは認証、Gateway設定、およびオプションのチャンネルを構成します。 詳細は[オンボーディングウィザード](https://docs.openclaw.ai/start/wizard)を参照してください。

3

[

](https://docs.openclaw.ai/ja-JP/start/getting-started)

Gatewayを確認

サービスをインストールした場合、すでに実行されているはずです：

コピー

```
openclaw gateway status
```

4

[

](https://docs.openclaw.ai/ja-JP/start/getting-started)

Control UIを開く

コピー

```
openclaw dashboard
```

Control UIが読み込まれれば、Gatewayは使用可能な状態です。

## 

[​

](https://docs.openclaw.ai/ja-JP/start/getting-started)

オプションの確認と追加機能

Gatewayをフォアグラウンドで実行

クイックテストやトラブルシューティングに便利です。

コピー

```
openclaw gateway --port 18789
```
テストメッセージを送信

構成済みのチャンネルが必要です。

コピー

```
openclaw message send --target +15555550123 --message "Hello from OpenClaw"
```

## 

[​

](https://docs.openclaw.ai/ja-JP/start/getting-started)

さらに詳しく

[

## オンボーディングウィザード（詳細）

完全なCLIウィザードリファレンスと高度なオプション。





](https://docs.openclaw.ai/start/wizard)[

## macOSアプリのオンボーディング

macOSアプリの初回実行フロー。





](https://docs.openclaw.ai/start/onboarding)

## 

[​

](https://docs.openclaw.ai/ja-JP/start/getting-started)

完了後の状態

-   実行中のGateway
-   構成済みの認証
-   Control UIアクセスまたは接続済みのチャンネル

## 

[​

](https://docs.openclaw.ai/ja-JP/start/getting-started)

次のステップ

-   DMの安全性と承認：[ペアリング](https://docs.openclaw.ai/channels/pairing)
-   さらにチャンネルを接続：[チャンネル](https://docs.openclaw.ai/channels)
-   高度なワークフローとソースからのビルド：[セットアップ](https://docs.openclaw.ai/start/setup)

[OpenClaw](https://docs.openclaw.ai/ja-JP)[Wizard (CLI)](https://docs.openclaw.ai/ja-JP/start/wizard)

⌘I
