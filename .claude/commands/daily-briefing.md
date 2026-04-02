# /daily-briefing

毎朝の定例ブリーフィングを実行します。Scheduled Tasks (/loop 24h) で自動実行される想定。

## 手順

### 1. Linear プロジェクト状況

- Linear MCP で全プロジェクト（TRADE, BOT, HP, SNS, NOTE, TOOLS, CORP）の未完了 issue 数、承認待ち、ブロック中を取得

### 2. ダッシュボード更新

- dashboard/business-status.md を最新情報で更新
- 昨日変更があった場合は dashboard/financial-summary.md にも反映

### 3. エージェント作業ログ

- dashboard/agent-log.md から前回ブリーフィング以降のエントリーを抽出

### 4. Obsidian 保管庫チェック

- ~/vault/02_areas/trading/rules/ で本日注力すべきルールを確認
- ~/vault/02_areas/habits/ で本日のルーティンを確認

### 5. 自動化ステータス

- automations/schedules.md から本日の予定ジョブを一覧表示

### 6. 現在のフェーズ確認

- infrastructure/phase-roadmap.md で現フェーズの完了基準と進捗を確認

### 7. ブリーフィングレポート作成

Slack 向けに簡潔にまとめる（mobile-ops スキルの応答ルールに従う）:

```
📊 デイリーブリーフィング

■ 事業ステータス（各1行）
■ ⏳ 承認待ち（判断が必要なもの）
■ ✅ 昨日の完了
■ 🔴 ブロック中・要対応
■ 📅 本日の予定
■ 📍 フェーズ進捗
■ 💡 提案（あれば）
```

詳細は「詳しく」と返信されたら展開する。

$ARGUMENTS
