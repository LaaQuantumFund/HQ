---
updated: 2026-03-30
---

# 全体インフラ構成・ワークフロー

本ドキュメントは1人法人の技術基盤の全体像を定義する。
全エージェント・全プロジェクトの前提条件としてセッション開始時に参照すること。

## アーキテクチャ概要図

```
iPhone（指示・確認のみ）
├── Claude App（Dispatch） ─── スマホからタスク投入 → VPS上でセッション自動起動
├── Slack（Channels）   ─── 常時待ち受けBot経由で指示・通知受信
└── Linear App             ─── タスク状態確認・承認・コメント

        │ Dispatch / Channels / API
        ▼

VPS（Ubuntu, 常時起動, 全処理の実行基盤）
├── tmux（セッション永続化）
│   ├── [hq]         ~/hq/              ③ 統括ワークスペース（常時起動）
│   │   └── claude --channels telegram
│   │       → Slack経由の指示受付
│   │       → Scheduled Tasks（定期自動実行）
│   │       → /daily-briefing, /delegate-task 等
│   │
│   ├── [dev-hp]     ~/dev/hp/           ② 開発（必要時起動）
│   ├── [dev-bot]    ~/dev/trading-bot/
│   ├── [dev-tools]  ~/dev/tools/
│   ├── [dev-sns]    ~/dev/sns-automation/
│   ├── [dev-note]   ~/dev/note-generator/
│   └── [vault]      ~/vault/            ① Obsidian保管庫（必要時起動）
│
├── n8n（Docker, セルフホスト）
│   → SNS定期投稿、リマインダー、Webhook受信
│
├── Git（全フォルダがGitHubリポジトリのclone）
└── Tailscale（セキュアなプライベートネットワーク）

        │ push / pull / CI triggers
        ▼

GitHub（クラウド）
├── vault          (Private)  ① Obsidian保管庫
├── hq             (Private)  ③ 統括ワークスペース
├── hp             (Private)  ホームページ
├── trading-bot    (Private)  自動売買Bot
├── tools          (Private)  販売ツール
├── sns-automation (Private)  SNS自動化
└── note-generator (Private)  note記事生成
    └── GitHub Actions → CI/CD（テスト・デプロイ）

Linear（クラウド）
├── TRADE  裁量トレード
├── BOT    自動売買
├── HP     ホームページ
├── SNS    SNS運用
├── NOTE   note発信
├── TOOLS  ツール販売
└── CORP   法人運営
```

## 各レイヤーの責務

### iPhone（スマホ）

スマホは「窓」。処理は一切しない。

| ツール | 用途 |
|--------|------|
| Claude App（Dispatch） | タスク投入。メッセージを送るとVPS上でClaudeセッションが自動起動し作業実行。結果はアプリに返る |
| Slack（Channels） | 常時待ち受け。~/hq/ の tmux セッションで --channels telegram 起動中、Bot に話しかけるだけで指示が届く。通知もここに届く |
| Linear App | タスク一覧の確認、ステータス変更、コメントによる承認・フィードバック |

### MacBook

初期開発とセットアップのみ。VPS移行後は予備端末。

| フェーズ | 用途 |
|----------|------|
| Phase 1（現在） | ローカルで開発・テスト。Git push で GitHub へ。Claude App の Remote Control で接続（Mac 開放時のみ） |
| Phase 2 以降 | SSH で VPS に入る予備手段。Obsidian は iCloud 経由で iPhone と同期 |

### VPS（24時間稼働の本体）

全処理の実行基盤。MacBook を閉じていても動き続ける。

| コンポーネント | 役割 |
|----------------|------|
| Ubuntu 22.04/24.04 LTS | OS |
| tmux | セッション永続化。SSH切断してもプロセス継続 |
| Claude Code CLI | エージェント実行エンジン |
| Slack Channel | claude --channels telegram で常時指示受付 |
| Scheduled Tasks | /loop + cron で定期実行（セッションスコープ） |
| n8n（Docker） | 永続的な自動化（SNS投稿・Webhook・リマインダー） |
| Tailscale | MacBook/iPhone からのセキュアな接続 |
| Git | 全フォルダが GitHub clone。変更は全て Git 経由 |

### GitHub

コードとファイルの永続ストレージ＋CI/CD。

| 機能 | 用途 |
|------|------|
| リポジトリ | 全7リポジトリ（上記参照） |
| GitHub Actions | CI（lint/test/build）、CD（Vercel等へのデプロイ）、Claude PR Review |
| @claude メンション | PR に @claude とコメントすると Claude Code が自動レビュー |

### Linear

全事業のタスク管理。エージェントは Linear issue 経由でタスクを受領・完了報告する。

## スマホからの操作フロー

### パターンA: タスク指示（Slack）

```
[iPhone] Slack で Bot に「HPのお問い合わせフォームを追加して」と送信
    ↓
[VPS] ~/hq/ の Claude セッションが受信
    ↓
[VPS] secretary エージェントが判断 → developer に委任計画を作成
    ↓
[iPhone] Slack に計画サマリーが届く
    ↓
[iPhone] 「OK」と返信
    ↓
[VPS] ~/dev/hp/ で developer が実装 → テスト → PR作成
    ↓
[iPhone] Slack に完了通知 + PR URL
    ↓
[iPhone] Linear App で issue を Done に変更
```

### パターンB: 定期ブリーフィング（Scheduled Tasks）

```
[VPS] 毎朝 9:00 に /loop で /daily-briefing 自動実行
    ↓
[VPS] Linear全プロジェクトのステータス収集 → dashboard更新
    ↓
[iPhone] Slack にブリーフィングレポートが届く
    ↓
[iPhone] 承認待ちがあれば「承認」「却下」と返信
```

### パターンC: 緊急対応（n8n Webhook）

```
[GitHub] CI が失敗
    ↓
[VPS] n8n が Webhook を受信 → Slack に 🔴 アラート送信
    ↓
[iPhone] Slack で通知受信
    ↓
[iPhone] 「調査して」と返信
    ↓
[VPS] developer エージェントがログ確認 → 修正 → PR作成
```

### パターンD: Dispatch（Claude App から直接）

```
[iPhone] Claude App で「trading-bot のバックテスト結果をまとめて」と送信
    ↓
[VPS] Dispatch が新しい Claude セッションを自動起動
    ↓
[VPS] trader エージェントとして分析実行
    ↓
[iPhone] Claude App に結果レポートが届く
```

## リポジトリ一覧と同期方針

| リポジトリ | VPSパス | iCloud同期 | 備考 |
|-----------|---------|-----------|------|
| vault | ~/vault/ | ○（iCloud → iPhone で閲覧） | Obsidian は iCloud 経由。Git は VPS ローカルで管理。iCloud と Git の .git 競合を避けるため VPS 側は Git 専用、iPhone 側は iCloud 専用 |
| hq | ~/hq/ | × | VPS ローカルのみ |
| hp | ~/dev/hp/ | × | VPS ローカルのみ |
| trading-bot | ~/dev/trading-bot/ | × | VPS ローカルのみ |
| tools | ~/dev/tools/ | × | VPS ローカルのみ |
| sns-automation | ~/dev/sns-automation/ | × | VPS ローカルのみ |
| note-generator | ~/dev/note-generator/ | × | VPS ローカルのみ |

### Obsidian保管庫の同期戦略

- VPS: Git リポジトリとして管理。Claude Code が読み書き
- iPhone: iCloud Drive 経由で Obsidian アプリから閲覧・簡易編集
- 同期: VPS で変更 → git push → GitHub。iPhone 側は iCloud 経由で別途同期（Obsidian Git プラグインまたは手動）
- 競合防止: VPS と iCloud を直接接続しない。GitHub を Single Source of Truth とする
