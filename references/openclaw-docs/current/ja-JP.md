<!-- Source: https://docs.openclaw.ai/ja-JP -->
<!-- Title: OpenClaw - OpenClaw -->

[メインコンテンツへスキップ](https://docs.openclaw.ai/ja-JP)

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

-   [OpenClaw 🦞](https://docs.openclaw.ai/ja-JP)
-   [仕組み](https://docs.openclaw.ai/ja-JP)
-   [主な機能](https://docs.openclaw.ai/ja-JP)
-   [クイックスタート](https://docs.openclaw.ai/ja-JP)
-   [ダッシュボード](https://docs.openclaw.ai/ja-JP)
-   [設定（オプション）](https://docs.openclaw.ai/ja-JP)
-   [ここから始める](https://docs.openclaw.ai/ja-JP)
-   [詳細](https://docs.openclaw.ai/ja-JP)

概要

# OpenClaw

# 

[​

](https://docs.openclaw.ai/ja-JP)

OpenClaw 🦞

![OpenClaw](https://mintcdn.com/clawdhub/-t5HSeZ3Y_0_wH4i/assets/openclaw-logo-text-dark.png?fit=max&auto=format&n=-t5HSeZ3Y_0_wH4i&q=85&s=61797dcb0c37d6e9279b8c5ad2e850e4)![OpenClaw](https://mintcdn.com/clawdhub/FaXdIfo7gPK_jSWb/assets/openclaw-logo-text.png?fit=max&auto=format&n=FaXdIfo7gPK_jSWb&q=85&s=d799bea41acb92d4c9fd1075c575879f)

> _「EXFOLIATE! EXFOLIATE!」_ — たぶん宇宙ロブスター

**WhatsApp、Telegram、Discord、iMessageなどに対応した、あらゆるOS向けのAIエージェントgateway。**  
メッセージを送信すれば、ポケットからエージェントの応答を受け取れます。プラグインでMattermostなどを追加できます。

[

## はじめに

OpenClawをインストールし、数分でGatewayを起動できます。





](https://docs.openclaw.ai/start/getting-started)[

## ウィザードを実行

`openclaw onboard`とペアリングフローによるガイド付きセットアップ。





](https://docs.openclaw.ai/start/wizard)[

## Control UIを開く

チャット、設定、セッション用のブラウザダッシュボードを起動します。





](https://docs.openclaw.ai/web/control-ui)

OpenClawは、単一のGatewayプロセスを通じてチャットアプリをPiのようなコーディングエージェントに接続します。OpenClawアシスタントを駆動し、ローカルまたはリモートのセットアップをサポートします。

## 

[​

](https://docs.openclaw.ai/ja-JP)

仕組み

Gatewayは、セッション、ルーティング、チャネル接続の信頼できる唯一の情報源です。

## 

[​

](https://docs.openclaw.ai/ja-JP)

主な機能

## マルチチャネルgateway

単一のGatewayプロセスでWhatsApp、Telegram、Discord、iMessageに対応。

## プラグインチャネル

拡張パッケージでMattermostなどを追加。

## マルチエージェントルーティング

エージェント、ワークスペース、送信者ごとに分離されたセッション。

## メディアサポート

画像、音声、ドキュメントの送受信。

## Web Control UI

チャット、設定、セッション、ノード用のブラウザダッシュボード。

## モバイルノード

Canvas対応のiOSおよびAndroidノードをペアリング。

## 

[​

](https://docs.openclaw.ai/ja-JP)

クイックスタート

1

[

](https://docs.openclaw.ai/ja-JP)

OpenClawをインストール

コピー

```
npm install -g openclaw@latest
```

2

[

](https://docs.openclaw.ai/ja-JP)

オンボーディングとサービスのインストール

コピー

```
openclaw onboard --install-daemon
```

3

[

](https://docs.openclaw.ai/ja-JP)

WhatsAppをペアリングしてGatewayを起動

コピー

```
openclaw channels login
openclaw gateway --port 18789
```

完全なインストールと開発セットアップが必要ですか？[クイックスタート](https://docs.openclaw.ai/start/quickstart)をご覧ください。

## 

[​

](https://docs.openclaw.ai/ja-JP)

ダッシュボード

Gatewayの起動後、ブラウザでControl UIを開きます。

-   ローカルデフォルト: [http://127.0.0.1:18789/](http://127.0.0.1:18789/)
-   リモートアクセス: [Webサーフェス](https://docs.openclaw.ai/web)および[Tailscale](https://docs.openclaw.ai/gateway/tailscale)

![OpenClaw](https://mintcdn.com/clawdhub/FaXdIfo7gPK_jSWb/whatsapp-openclaw.jpg?fit=max&auto=format&n=FaXdIfo7gPK_jSWb&q=85&s=b74a3630b0e971f466eff15fbdc642cb)

## 

[​

](https://docs.openclaw.ai/ja-JP)

設定（オプション）

設定は`~/.openclaw/openclaw.json`にあります。

-   **何もしなければ**、OpenClawはバンドルされたPiバイナリをRPCモードで使用し、送信者ごとのセッションを作成します。
-   制限を設けたい場合は、`channels.whatsapp.allowFrom`と（グループの場合）メンションルールから始めてください。

例：

コピー

```
{
  channels: {
    whatsapp: {
      allowFrom: ["+15555550123"],
      groups: { "*": { requireMention: true } },
    },
  },
  messages: { groupChat: { mentionPatterns: ["@openclaw"] } },
}
```

## 

[​

](https://docs.openclaw.ai/ja-JP)

ここから始める

[

## ドキュメントハブ

ユースケース別に整理されたすべてのドキュメントとガイド。





](https://docs.openclaw.ai/start/hubs)[

## 設定

Gatewayのコア設定、トークン、プロバイダー設定。





](https://docs.openclaw.ai/gateway/configuration)[

## リモートアクセス

SSHおよびtailnetアクセスパターン。





](https://docs.openclaw.ai/gateway/remote)[

## チャネル

WhatsApp、Telegram、Discordなどのチャネル固有のセットアップ。





](https://docs.openclaw.ai/channels/telegram)[

## ノード

ペアリングとCanvas対応のiOSおよびAndroidノード。





](https://docs.openclaw.ai/nodes)[

## ヘルプ

一般的な修正とトラブルシューティングのエントリーポイント。





](https://docs.openclaw.ai/help)

## 

[​

](https://docs.openclaw.ai/ja-JP)

詳細

[

## 全機能リスト

チャネル、ルーティング、メディア機能の完全な一覧。





](https://docs.openclaw.ai/concepts/features)[

## マルチエージェントルーティング

ワークスペースの分離とエージェントごとのセッション。





](https://docs.openclaw.ai/concepts/multi-agent)[

## セキュリティ

トークン、許可リスト、安全制御。





](https://docs.openclaw.ai/gateway/security)[

## トラブルシューティング

Gatewayの診断と一般的なエラー。





](https://docs.openclaw.ai/gateway/troubleshooting)[

## 概要とクレジット

プロジェクトの起源、貢献者、ライセンス。





](https://docs.openclaw.ai/reference/credits)

[はじめに](https://docs.openclaw.ai/ja-JP/start/getting-started)

⌘I
