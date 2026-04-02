---
updated: YYYY-MM-DD
---
---
updated: 2026-03-30
---

# n8n ワークフロー定義

n8n は VPS 上の Docker コンテナで常時稼働する。
Claude Code の Scheduled Tasks と異なり、セッションに依存しない永続的な自動化を担当。

管理画面: http://localhost:5678（VPS ローカル）または Tailscale 経由でアクセス

## 稼働中

（Phase 2 以降で順次構築）

## 構築予定

### SNS自動投稿

- n8n Workflow ID: -
- トリガー: スケジュール（毎日 9:00 / 18:00 JST）
- 処理内容: コンテンツキュー（~/dev/sns-automation/ のファイル or DB）から投稿を取得 → X API / Instagram API で投稿
- 通知先: Slack Bot（投稿完了通知）
- ステータス: 未構築
- 前提: Phase 3（SNS 運用開始後）

### note 記事公開通知

- n8n Workflow ID: -
- トリガー: Webhook（~/dev/note-generator/ からの公開完了通知）
- 処理内容: 公開 URL を取得 → SNS 告知文を生成 → SNS 自動投稿ワークフローに追加
- 通知先: Slack Bot
- ステータス: 未構築
- 前提: Phase 3

### トレードジャーナルリマインダー

- n8n Workflow ID: -
- トリガー: スケジュール（平日 22:00 JST）
- 処理内容: GitHub API で ~/vault/ リポジトリの 02_areas/trading/journal/YYYY-MM-DD.md の存在をチェック → 未記入なら通知
- 通知先: Slack Bot
- ステータス: 未構築
- 前提: Phase 2

### 月次収支集計リマインダー

- n8n Workflow ID: -
- トリガー: スケジュール（毎月1日 10:00 JST）
- 処理内容: Slack に通知 + Linear MCP で CORP プロジェクトに「月次収支集計」issue を自動作成
- 通知先: Slack Bot + Linear
- ステータス: 未構築
- 前提: Phase 3

### エラー・障害アラート

- n8n Workflow ID: -
- トリガー: Webhook（Vercel / 各サービスの監視エンドポイント）
- 処理内容: エラー内容を整形 → 緊急度判定 → 通知
- 通知先: Slack Bot（🔴 緊急度表示付き）
- ステータス: 未構築
- 前提: Phase 3（HP 公開後）

### Bot パフォーマンス日次レポート

- n8n Workflow ID: -
- トリガー: スケジュール（毎日 7:00 JST）
- 処理内容: trading-bot のログ / DB から日次損益を集計 → Slack にレポート送信
- 通知先: Slack Bot
- ステータス: 未構築
- 前提: Phase 4（Bot 稼働後）

### HP アクセス解析週次レポート

- n8n Workflow ID: -
- トリガー: スケジュール（毎週月曜 9:00 JST）
- 処理内容: Google Analytics / Vercel Analytics API でデータ取得 → サマリー生成 → 通知
- 通知先: Slack Bot
- ステータス: 未構築
- 前提: Phase 3（HP 公開後）

## n8n 運用方針

- セルフホスト（Docker on VPS）。月額追加コストなし
- 認証情報は n8n の Credentials 機能で管理。コードに埋め込まない
- ワークフローの変更は社長の承認後に行う
- エラー時は Slack に即時通知
