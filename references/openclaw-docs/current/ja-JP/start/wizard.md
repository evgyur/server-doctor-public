<!-- Source: https://docs.openclaw.ai/ja-JP/start/wizard -->
<!-- Title: オンボーディングウィザード（CLI） - OpenClaw -->

[メインコンテンツへスキップ](https://docs.openclaw.ai/ja-JP/start/wizard)

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

-   [オンボーディングウィザード（CLI）](https://docs.openclaw.ai/ja-JP/start/wizard)
-   [クイックスタート vs 詳細設定](https://docs.openclaw.ai/ja-JP/start/wizard)
-   [CLIオンボーディングの詳細](https://docs.openclaw.ai/ja-JP/start/wizard)
-   [よく使うフォローアップコマンド](https://docs.openclaw.ai/ja-JP/start/wizard)
-   [関連ドキュメント](https://docs.openclaw.ai/ja-JP/start/wizard)

初回セットアップ

# オンボーディングウィザード（CLI）

# 

[​

](https://docs.openclaw.ai/ja-JP/start/wizard)

オンボーディングウィザード（CLI）

CLIオンボーディングウィザードは、macOS、Linux、Windows（WSL2経由）でOpenClawをセットアップする際の推奨パスです。ローカルGatewayまたはリモートGateway接続に加えて、ワークスペースのデフォルト設定、チャンネル、Skillsを構成します。

コピー

```
openclaw onboard
```

最速で初回チャットを開始する方法：Control UI を開きます（チャンネル設定は不要）。`openclaw dashboard` を実行してブラウザでチャットできます。ドキュメント：[Dashboard](https://docs.openclaw.ai/web/dashboard)。

## 

[​

](https://docs.openclaw.ai/ja-JP/start/wizard)

クイックスタート vs 詳細設定

ウィザードは**クイックスタート**（デフォルト設定）と**詳細設定**（完全な制御）のどちらかを選択して開始します。

-   クイックスタート（デフォルト設定）
    
-   詳細設定（完全な制御）
    

-   loopback上のローカルGateway
-   既存のワークスペースまたはデフォルトワークスペース
-   Gatewayポート `18789`
-   Gateway認証トークンは自動生成（loopback上でも生成されます）
-   Tailscale公開はオフ
-   TelegramとWhatsAppのDMはデフォルトで許可リスト（電話番号の入力を求められる場合があります）

-   モード、ワークスペース、Gateway、チャンネル、デーモン、Skillsの完全なプロンプトフローを表示

## 

[​

](https://docs.openclaw.ai/ja-JP/start/wizard)

CLIオンボーディングの詳細

[

## CLIリファレンス

ローカルおよびリモートフローの完全な説明、認証とモデルマトリックス、設定出力、ウィザードRPC、signal-cliの動作。





](https://docs.openclaw.ai/start/wizard-cli-reference)[

## 自動化とスクリプト

非対話式オンボーディングのレシピと自動化された `agents add` の例。





](https://docs.openclaw.ai/start/wizard-cli-automation)

## 

[​

](https://docs.openclaw.ai/ja-JP/start/wizard)

よく使うフォローアップコマンド

コピー

```
openclaw configure
openclaw agents add <name>
```

`--json` は非対話モードを意味しません。スクリプトでは `--non-interactive` を使用してください。

推奨：エージェントが `web_search` を使用できるように、Brave Search APIキーを設定してください（`web_fetch` はキーなしで動作します）。最も簡単な方法：`openclaw configure --section web` を実行すると `tools.web.search.apiKey` が保存されます。ドキュメント：[Webツール](https://docs.openclaw.ai/tools/web)。

## 

[​

](https://docs.openclaw.ai/ja-JP/start/wizard)

関連ドキュメント

-   CLIコマンドリファレンス：[`openclaw onboard`](https://docs.openclaw.ai/cli/onboard)
-   macOSアプリのオンボーディング：[オンボーディング](https://docs.openclaw.ai/start/onboarding)
-   エージェント初回起動の手順：[エージェントブートストラップ](https://docs.openclaw.ai/start/bootstrapping)

[はじめに](https://docs.openclaw.ai/ja-JP/start/getting-started)

⌘I
