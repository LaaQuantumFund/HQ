全自動化スケジュール一覧

最終更新: 2026-03-31
自動化は3つのプラットフォームで実行する

プラットフォーム概要

| プラットフォーム | 実行場所 | 特性 | 導入フェーズ |
|---|---|---|---|
| Claude Code Scheduled Tasks | VPS（tmux セッション内） | セッション中のみ有効。/loop コマンドで設定。3日で自動期限切れ | Phase 2 |
| n8n | VPS（Docker） | 永続的。外部サービス連携に強い。GUI でワークフロー構築 | Phase 2 |
| GitHub Actions | GitHub クラウド | リポジトリイベント駆動。CI/CD に特化。無料枠 2,000分/月 | Phase 1（設定のみ）〜 Phase 3（本格稼働） |

使い分けの原則
- Claude Code Scheduled Tasks: Claude Code 自身が実行するタスク（ブリーフィング生成、レビュー実行、vault 分析）
- n8n: 外部サービスへの通知・リマインダー（Slack 送信、freee 連携、時刻トリガーのワークフロー）
- GitHub Actions: コードに紐づく自動化（CI、デプロイ、PR レビュー）

日次スケジュール

07:00 – 朝のブリーフィング

| 項目 | 内容 |
|---|---|
| プラットフォーム | Claude Code Scheduled Tasks |
| コマンド | /loop 24h /daily-briefing |
| 実行セッション | hq（tmux） |
| 内容 | Linear 未完了タスク確認、dashboard 更新状況、当日の推奨アクション |
| 出力先 | Slack（CEO 宛）+ dashboard/agent-log.md |
| 導入 | Phase 2 |

09:00 / 18:00 – SNS 投稿（Phase 3〜）

| 項目 | 内容 |
|---|---|
| プラットフォーム | n8n |
| トリガー | cron（09:00, 18:00） |
| 内容 | marketer エージェントが生成した承認済み投稿を各 SNS に配信 |
| 前提 | CEO 承認済みの投稿が queue に存在すること |
| 出力先 | 各 SNS プラットフォーム + dashboard/agent-log.md |
| 導入 | Phase 3 |

22:00 – トレードジャーナルリマインダー

| 項目 | 内容 |
|---|---|
| プラットフォーム | n8n |
| トリガー | cron（22:00 JST） |
| 内容 | 「ジャーナルを書きましたか？」のリマインダーを Slack に送信 |
| 出力先 | Slack（CEO 宛） |
| 導入 | Phase 2 |
| Phase 1 代替 | Google Calendar のリマインダーで手動対応 |

週次スケジュール

日曜 20:00 – 週次レビュー

| 項目 | 内容 |
|---|---|
| プラットフォーム | Claude Code Scheduled Tasks |
| コマンド | /loop 7d /weekly-review |
| 実行セッション | hq（tmux） |
| 内容 | vault のジャーナル・習慣トラッカーを集計、今週の成果と課題を要約 |
| 出力先 | vault（週次レビューノート）+ Slack（要約） |
| 導入 | Phase 2 |
| Phase 1 代替 | MacBook で手動実行 claude /weekly-review |

日曜 21:00 – ビジネスレビュー

| 項目 | 内容 |
|---|---|
| プラットフォーム | Claude Code Scheduled Tasks |
| コマンド | /loop 7d /business-review |
| 実行セッション | hq（tmux） |
| 内容 | 全事業のステータス更新、Linear のイシュー棚卸し、dashboard/business-status.md 更新 |
| 出力先 | dashboard/business-status.md + Slack（要約） |
| 導入 | Phase 2 |
| Phase 1 代替 | MacBook で手動実行 claude /business-review |

月曜 09:00 – HP アクセス解析（Phase 3〜）

| 項目 | 内容 |
|---|---|
| プラットフォーム | n8n |
| トリガー | cron（月曜 09:00） |
| 内容 | Vercel Analytics / Google Analytics からアクセスデータを取得し要約 |
| 出力先 | Slack（CEO 宛）+ dashboard/business-status.md |
| 導入 | Phase 3（HP 公開後） |

月次スケジュール

毎月1日 10:00 – 月次収支リマインダー

| 項目 | 内容 |
|---|---|
| プラットフォーム | n8n |
| トリガー | cron（毎月1日 10:00） |
| 内容 | 「月次収支を確認してください」のリマインダー + accountant エージェントに financial-summary.md 更新を指示 |
| 出力先 | Slack（CEO 宛） |
| 導入 | Phase 2 |
| Phase 1 代替 | Google Calendar リマインダー |

毎月1日 10:30 – 貯金残高確認リマインダー（4月限定）

| 項目 | 内容 |
|---|---|
| プラットフォーム | n8n |
| トリガー | cron（毎月1日 10:30） |
| 内容 | 「貯金残高を確認してください。目標: 200万円超」のリマインダー |
| 出力先 | Slack（CEO 宛） |
| 導入 | Phase 2 |
| 備考 | 短期目標達成後は廃止 |

毎月5日 10:00 – 月次トレード統計

| 項目 | 内容 |
|---|---|
| プラットフォーム | Claude Code Scheduled Tasks |
| コマンド | trader エージェントに分析依頼（手動トリガーまたは secretary 経由） |
| 内容 | 前月のジャーナルデータを統計分析（勝率、RR比、DD、遵守率） |
| 出力先 | dashboard/business-status.md + Slack（要約） |
| 導入 | Phase 2 |

毎月15日 10:00 – 税務期限チェック

| 項目 | 内容 |
|---|---|
| プラットフォーム | n8n |
| トリガー | cron（毎月15日 10:00） |
| 内容 | 当月・翌月の税務期限を確認し通知。accountant エージェントが freee の状況を確認 |
| 出力先 | Slack（CEO 宛） |
| 導入 | Phase 2（個人）→ Phase 3（法人に切替） |

毎月1日 – ナレッジ更新リマインダー

| 項目 | 内容 |
|---|---|
| プラットフォーム | n8n |
| トリガー | cron（毎月1日 11:00） |
| 内容 | 「Trade Mastery / Laa Foundation のナレッジベースを更新してください」のリマインダー。plans/project-knowledge-sync.md のチェックリストへのリンク付き |
| 出力先 | Slack（CEO 宛） |
| 導入 | Phase 2 |

イベント駆動スケジュール

PR 作成時 – CI + Claude Code レビュー

| 項目 | 内容 |
|---|---|
| プラットフォーム | GitHub Actions |
| トリガー | pull_request（opened, synchronize） |
| 対象リポジトリ | hp, trading-bot, tools, sns-automation, note-generator |
| 内容 | lint → typecheck → test → build → Claude Code PR レビュー |
| 導入 | Phase 3 |

main マージ時 – デプロイ

| 項目 | 内容 |
|---|---|
| プラットフォーム | GitHub Actions |
| トリガー | push to main |
| 対象リポジトリ | hp（Vercel）、trading-bot（VPS）、その他必要に応じて |
| 内容 | 自動デプロイ（CEO 承認後の PR マージがトリガー） |
| 導入 | Phase 3 |

note 記事公開時 – SNS 告知（Phase 3〜）

| 項目 | 内容 |
|---|---|
| プラットフォーム | n8n |
| トリガー | Webhook（note 公開イベント）または手動トリガー |
| 内容 | marketer エージェントが告知文を生成 → CEO 承認 → X / Instagram に投稿 |
| 導入 | Phase 3 |

エラー・障害発生時 – 緊急アラート

| 項目 | 内容 |
|---|---|
| プラットフォーム | n8n + Claude Code |
| トリガー | VPS 上のプロセス監視、GitHub Actions の失敗通知、EA の異常検知（Phase 4） |
| 内容 | 🔴 緊急アラートを Slack に即時送信。secretary エージェントが状況をまとめて報告 |
| 出力先 | Slack（CEO 宛）+ dashboard/agent-log.md |
| 導入 | Phase 2（基本監視）→ Phase 4（EA 監視追加） |

Phase 別の自動化状態

Phase 1（4月 Week 1〜2）：手動中心

| 自動化 | 状態 | 代替手段 |
|---|---|---|
| 朝のブリーフィング | 未稼働 | MacBook で手動実行 |
| ジャーナルリマインダー | 未稼働 | Google Calendar |
| 週次レビュー | 未稼働 | MacBook で手動実行 |
| ビジネスレビュー | 未稼働 | MacBook で手動実行 |
| 月次収支リマインダー | 未稼働 | Google Calendar |
| CI/CD | 設定のみ | 手動テスト |

Phase 2（4月 Week 3〜4）：基本自動化

| 自動化 | 状態 |
|---|---|
| 朝のブリーフィング | ✅ Scheduled Tasks |
| ジャーナルリマインダー | ✅ n8n → Slack |
| 週次レビュー | ✅ Scheduled Tasks |
| ビジネスレビュー | ✅ Scheduled Tasks |
| 月次収支リマインダー | ✅ n8n → Slack |
| 貯金残高リマインダー | ✅ n8n → Slack |
| 税務期限チェック | ✅ n8n → Slack |
| ナレッジ更新リマインダー | ✅ n8n → Slack |
| エラーアラート | ✅ n8n → Slack（基本） |
| CI/CD | 設定済（本格稼働は Phase 3） |

Phase 3（5月）：事業自動化

| 自動化 | 状態 |
|---|---|
| Phase 2 の全項目 | ✅ 継続 |
| SNS 投稿 | ✅ n8n（承認済み queue から配信） |
| HP アクセス解析 | ✅ n8n → Slack |
| CI + Claude Code レビュー | ✅ GitHub Actions |
| 自動デプロイ | ✅ GitHub Actions |
| note 公開告知 | ✅ n8n |

Phase 4（6月〜）：フル自動化

| 自動化 | 状態 |
|---|---|
| Phase 3 の全項目 | ✅ 継続 |
| EA パフォーマンス日次レポート | ✅ Scheduled Tasks + Slack |
| EA 異常検知アラート | ✅ n8n → Slack（🔴即時） |
| Bot パフォーマンス日次集計 | ✅ Scheduled Tasks |
| 月次統合レポート | ✅ secretary が自動生成 |

Scheduled Tasks の運用上の注意

セッション依存
- Claude Code Scheduled Tasks はセッションが生きている間のみ有効
- VPS の tmux セッションが落ちるとタスクも消える
- /loop で設定したタスクは3日で自動期限切れするため、hq セッション起動時に再設定が必要

再設定の自動化
hq セッションを開始するたびに、以下を実行する（start-sessions.sh に組み込み済み）。
/loop 24h /daily-briefing
/loop 7d /business-review
週次レビューは日曜にのみ必要だが、/loop 7d で設定すれば週1回実行される。

永続化が必要なタスク
時刻厳守が必要なリマインダー（22:00 ジャーナル、毎月1日 収支確認等）は n8n で管理する。Claude Code Scheduled Tasks は「実行内容が複雑で Claude の思考が必要なもの」に限定する。

日次サマリー（18:00）

| 項目 | 内容 |
|---|---|
| プラットフォーム | Claude Code Scheduled Tasks |
| 実行セッション | hq（tmux） |
| 内容 | CEO が全部門の活動をまとめ Slack #ceo に送信 |
| 含まれる情報 | 完了タスク、進行中タスク、ブロッカー、明日の予定 |
| 導入 | Phase 2 |

週次レポート（金曜 17:00）

| 項目 | 内容 |
|---|---|
| プラットフォーム | Claude Code Scheduled Tasks |
| 実行セッション | hq（tmux） |
| 内容 | CEO が週次レポートを Slack #ceo に送信 |
| 含まれる情報 | 週間実績、KPI 進捗、来週の計画、課題・リスク |
| 導入 | Phase 2 |

社長指示の受信・振り分けフロー

1. 社長が Slack で指示 → CEO が受信
2. CEO が担当 CxO に振り分け
3. CxO がタスクを実行
4. CEO が結果を社長に報告（Slack #ceo）

運用コマンド

| コマンド | 用途 | 実行タイミング |
|---|---|---|
| `/compact` | 会話が長くなった時にコンテキスト圧縮 | 目安: 20ターン以上 |
| `/clear` | 新しいタスク開始時にキャッシュリセット | タスク切り替え時 |

両コマンドは日次ルーティンの終了時に実行推奨。

タイムライン一覧（全フェーズ）
          Phase 1          Phase 2          Phase 3          Phase 4
          (4月前半)         (4月後半)         (5月)            (6月〜)
──────────────────────────────────────────────────────────────────────
07:00     (手動)           ブリーフィング    ブリーフィング    ブリーフィング
                           [Scheduled]      [Scheduled]      [Scheduled]
                                                             + EA レポート
09:00     ---              ---              SNS投稿[n8n]     SNS投稿[n8n]
09:00月   ---              ---              HP解析[n8n]      HP解析[n8n]
10:00/1日 (Calendar)       収支確認[n8n]    収支確認[n8n]    収支確認[n8n]
10:00/5日 ---              統計分析[手動]    統計分析[agent]  統計分析[agent]
10:00/15日(Calendar)       税務[n8n]        税務[n8n]        税務[n8n]
11:00/1日 ---              ナレッジ更新[n8n] ナレッジ更新[n8n] ナレッジ更新[n8n]
18:00     ---              ---              SNS投稿[n8n]     SNS投稿[n8n]
20:00日   (手動)           週次レビュー      週次レビュー      週次レビュー
                           [Scheduled]      [Scheduled]      [Scheduled]
21:00日   (手動)           Bizレビュー       Bizレビュー       Bizレビュー
                           [Scheduled]      [Scheduled]      [Scheduled]
22:00     (Calendar)       ジャーナル[n8n]   ジャーナル[n8n]   ジャーナル[n8n]
随時      ---              エラー[n8n]       エラー[n8n]       エラー+EA[n8n]
PR時      ---              ---              CI+Review[GHA]   CI+Review[GHA]
マージ時  ---              ---              デプロイ[GHA]     デプロイ[GHA]