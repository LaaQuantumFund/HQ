週次の事業レビューを実施します。

手順

1. 各事業の数値収集
- Linear MCP で全プロジェクト（TRADE, BOT, HP, SNS, NOTE, TOOLS, CORP）の週間サマリーを取得
  - 完了 issue 数、新規 issue 数、残 issue 数
- dashboard/financial-summary.md から今週の収支データを取得
- dashboard/agent-log.md から今週のエージェント稼働ログを集計

2. Obsidian保管庫との突合
- ~/vault/02_areas/trading/reviews/ から最新の週次トレードレビューを参照
- ~/vault/02_areas/goals/ から月間・四半期目標の進捗を確認
- ~/vault/04_business/active/ のアクティブ事業ノートを参照

3. 事業別パフォーマンス評価
各事業について以下を整理:
- 今週の進捗サマリー（3行以内）
- KPI の現在値と目標値
- ブロッカー・リスク
- 来週の最優先タスク

4. 横断的な分析
- リソース配分の適切さ（どの事業にエージェント稼働が偏っているか）
- 事業間シナジーの機会（例: トレード知見 → note記事 → SNS投稿）
- コスト対効果の確認（API費用、ツール費用 vs 収益）

5. レビューレポート作成
以下の形式で報告:
📈 週次事業レビュー: {{week_start}} 〜 {{week_end}}

■ 全体サマリー
- 総収益:
- 総コスト:
- 純利益:
- 完了タスク: / 計画タスク:

■ 事業別（各3行以内）
[TRADE] 裁量トレード:
[BOT] 自動売買:
[HP] ホームページ:
[SNS] SNS運用:
[NOTE] note発信:
[TOOLS] ツール販売:
[CORP] 法人運営:

■ 要判断事項

■ 来週の重点テーマ

■ リスク・懸念
6. ダッシュボード更新
- dashboard/business-status.md を最新状態に更新
- 重要な判断事項があれば /decision-log の実行を提案

$ARGUMENTS

次は /decision-log を出力します。

/decision-log

意思決定を記録します。

手順

1. 決定内容の確認
- ユーザーの決定事項: $ARGUMENTS
- 決定の背景が不明な場合は1つだけ質問して補足する

2. 決定ログファイルの作成
decisions/YYYY-MM-DD-{{タイトル}}.md を以下の形式で作成:markdown
created: YYYY-MM-DD
tags: [decision, {{関連事業タグ}}]
status: decided
linear-id:
impact: high | medium | low
決定: {{タイトル}}

背景
- なぜこの判断が必要になったか

選択肢
1. 選択肢A: 内容 → メリット / デメリット
2. 選択肢B: 内容 → メリット / デメリット
3. 選択肢C: 内容 → メリット / デメリット

決定
- 採用: 選択肢X
- 理由:
- 却下した選択肢の理由:

影響範囲
- 影響する事業:
- 影響するフォルダ・ファイル:
- 必要なアクション:

レビュー予定
- 効果測定日: YYYY-MM-DD
- 撤回基準:
3. 関連タスクの作成
- 決定に伴うアクションがあれば Linear issue を作成
- tasks/todo.md に反映

4. 関連ノートへのリンク
- Obsidian保管庫の関連ノートがあれば相互リンクを提案
- dashboard/business-status.md に影響がある場合は更新を提案

$ARGUMENTS