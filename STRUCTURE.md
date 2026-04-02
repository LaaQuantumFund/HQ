# ~/hq/ 全体構成

> 最終更新: 2026-04-02
> ファイル数: 70+（STRUCTURE.md 含む）

## ルート

- **CLAUDE.md** — ワークスペース全体のルール・CEO エージェント定義
- **CLAUDE.local.md** — 個人設定（gitignore 対象）
- **.mcp.json** — MCP サーバ接続設定（Slack, freee, Obsidian, GitHub）
- **STRUCTURE.md** — 本ファイル。フォルダ構成の一覧

## .claude/

### .claude/settings.json

フック定義・コマンド許可/拒否リスト

### .claude/commands/

- **daily-briefing.md** — 朝のブリーフィング生成手順
- **delegate-task.md** — タスク委譲の実行手順
- **business-review.md** — 週次ビジネスレビュー手順
- **decision-log.md** — 意思決定の記録手順
- **chairman.md** — /chairman: Chairman エージェント起動・対話セッション
- **marketing.md** — /marketing: CMO エージェント起動・マーケティングタスク
- **development.md** — /development: CTO エージェント起動・開発タスク
- **accounting.md** — /accounting: CFO エージェント起動・経理タスク
- **investment-analysis.md** — /investment-analysis: CIO エージェント起動・投資分析
- **qa-review.md** — /qa-review: CQO エージェント起動・品質レビュー
- **legal-review.md** — /legal-review: CLO エージェント起動・法務タスク

### .claude/agents/

- **chairman.md** — Chairman（会長）：社長のメンター。日報・週報レビュー。Opus使用
- **ceo.md** — CEO：計画・ルーティング・統合のみ。タスク実行禁止
- **cos.md** — COS（秘書室長）：リサーチ・Brain管理・スケジュール管理
- **cto.md** — CTO（技術）：開発タスク設計・実装・レビュー・CI/CD
- **cmo.md** — CMO（マーケティング）：SNS運用・コンテンツ企画・ブランド管理
- **cfo.md** — CFO（経理）：仕訳・経費管理・税務準備・トレード損益記録
- **cio.md** — CIO（投資分析）：トレード分析支援・市場データ収集・ファンダメンタル分析
- **cqo.md** — CQO（品質管理）：オンデマンド。ファクトチェック・品質レビュー専任
- **clo.md** — CLO（法務）：オンデマンド。法務リサーチ・契約ドラフト

### .claude/skills/

- **trade-review/SKILL.md** — トレード日報・週報のレビュースキル（Chairman使用）
- **habit-review/SKILL.md** — 習慣達成状況のレビュースキル（Chairman使用）

## chairman/

- **CLAUDE.md** — Chairman部門ルール（社長のメンター・日報週報レビュー定義）
- **daily-report-template.md** — 日報テンプレート
- **weekly-report-template.md** — 週報テンプレート

## 8部門フォルダ

各フォルダに **CLAUDE.md**（部門固有ルール）を配置。

- **ceo/** — CEO部門ルール（統括・意思決定・最終承認）
- **cos/** — COS部門ルール（情報収集・Brain管理・スケジュール）
- **cto/** — CTO部門ルール（開発設計・実装・CI/CD）
- **cmo/** — CMO部門ルール（SNS・コンテンツ・ブランド管理）
- **cfo/** — CFO部門ルール（経理・仕訳・税務・トレード損益）
- **cio/** — CIO部門ルール（トレード分析・市場データ・ファンダメンタル分析）
- **cqo/** — CQO部門ルール（オンデマンド。ファクトチェック・品質レビュー）
- **clo/** — CLO部門ルール（オンデマンド。法務リサーチ・契約ドラフト）

## guidelines/

全エージェント共通の行動規範。

- **company-overview.md** — 法人概要・事業領域・組織構成
- **brand-guidelines.md** — トーン・NG表現・ビジュアルルール
- **output-standards.md** — 文書・コード・コンテンツの品質基準
- **collaboration-protocol.md** — 部門間連携・タスク管理・エスカレーションフロー
- **escalation-rules.md** — Level 1〜3 のエスカレーション判断基準
- **security-policy.md** — 絶対禁止事項・アクセス制御・シークレット管理
- **philosophy.md** — 社長の価値観・Anti-Vision（暫定版）

## infrastructure/

- **architecture.md** — 全体構成図・デバイス役割・同期戦略
- **vps-setup.md** — VPS セットアップ手順書
- **tmux-sessions.md** — tmux セッション構成・起動方法
- **phase-roadmap.md** — Phase 1〜4 移行ロードマップ
- **tools.md** — ツール一覧・料金・用途・MCP連携・コスト最適化
- **workspace-guide.md** — ワークスペース利用ガイド
- **github-actions.md** — リポジトリ別 CI/CD 定義
- **n8n-workflows.md** — n8n ワークフロー定義
- **mobile-ops.md** — モバイル操作ガイド（iPhone からの操作手順）

## plans/

- **goals.md** — 短期・中期・長期目標（KPI・具体的数値）
- **roadmap.md** — 全体タイムライン
- **short-term-trading-mastery.md** — 短期：4月 裁量トレード安定化
- **mid-term-corporate-launch.md** — 中期：5月 法人登記+AI社員構築
- **daily-routines.md** — 全期間の生活ルーティン定義
- **genspark-vault-flow.md** — GenSpark→vault 錬成フロー定義
- **project-knowledge-sync.md** — Claude Desktop Projects ナレッジ更新ルール
- **ai-organization-v3.md** — AI組織設計書v3 統合ステータス（受領待ち）

## content/

- **note/drafts/** — CMO が作成した下書き
- **note/published/** — 公開済みコンテンツ
- **note/calendar.md** — 月次コンテンツカレンダー
- **sns/x-twitter/** — X (Twitter) 投稿案
- **sns/threads/** — Threads 投稿案
- **templates/** — コンテンツテンプレート

## accounting/

- **monthly/** — 月次収支レポート（CFO が作成）
- **quarterly/** — 四半期レポート
- **receipts/** — 領収書保管
- **trade-pnl/** — トレード損益記録
- **tax-prep/** — 税務準備資料

## legal/

- **contracts/** — 契約書ドラフト（CLO が作成）
- **terms-of-service/** — 利用規約
- **privacy-policy/** — プライバシーポリシー

## scripts/

- **start-sessions.sh** — tmux セッション起動スクリプト
- **validate-accountant-commands.sh** — CFO の送金系コマンドブロック
- **daily-routine.sh** — 日次ルーティン自動実行スクリプト

## automations/

- **schedules.md** — 全自動化スケジュール一覧（日次・週次・月次・運用コマンド）
- **agent-orchestration.md** — マルチエージェント連携ルール
- **agent-log.md** — エージェント活動ログ

## dashboards/

- **ceo-dashboard.md** — 事業別ステータス・全体サマリー
- **weekly-report.md** — 週次レポート
- **decision-log.md** — 意思決定ログ

## tasks/

- **todo.md** — Linear 同期 TODO リスト
- **lessons.md** — 学び・失敗ログ
