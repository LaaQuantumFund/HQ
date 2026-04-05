組織の動かし方を定義する場所。
エージェント・ルール・計画・インフラなど、"どう動くか"はすべてここに書く。

---

## 全体構成

~/hq/
├── CLAUDE.md                          # ワークスペース全体のルール・CEOエージェント定義
├── CONTEXT.md                         # 統合コンテキスト（AIチャット冒頭に読み込ませる）
├── .mcp.json                          # MCP サーバ接続設定（Slack, freee, Obsidian, GitHub）
├── STRUCTURE.md                       # 本ファイル
├── ETHOS.md                           # ワークフロー哲学・価値基準ドキュメント（第一原理・Solo-CEO・DPGE等）
├── COMMANDS.md                        # コマンド・パス クイックリファレンス（起動コマンド・パス一覧）
│
├── .claude/
│   ├── settings.json                  # フック定義・コマンド許可/拒否リスト
│   ├── settings.local.json            # ローカル設定（個人環境用）
│   │
│   ├── commands/                      # --- スラッシュコマンド定義 ---
│   │   ├── daily-briefing.md          #   朝のブリーフィング生成手順
│   │   ├── delegate-task.md           #   タスク委譲の実行手順
│   │   ├── business-review.md         #   週次ビジネスレビュー手順
│   │   ├── decision-log.md            #   意思決定の記録手順
│   │   ├── chairman.md               #   /chairman: 会長セッション起動
│   │   ├── marketing.md              #   /marketing: CMO タスク起動
│   │   ├── development.md            #   /development: CTO タスク起動
│   │   ├── accounting.md             #   /accounting: CFO タスク起動
│   │   ├── investment-analysis.md    #   /investment-analysis: CIO タスク起動
│   │   ├── qa-review.md              #   /qa-review: CQO タスク起動
│   │   └── legal-review.md           #   /legal-review: CLO タスク起動
│   │
│   ├── agents/                        # --- エージェント定義 ---
│   │   ├── chairman.md               #   会長: 社長のメンター・日報週報レビュー（Opus）
│   │   ├── ceo.md                    #   CEO: 計画・ルーティング・統合（タスク実行禁止）
│   │   ├── cos.md                    #   COS: リサーチ・Brain管理・スケジュール管理
│   │   ├── cto.md                    #   CTO: 開発設計・実装・レビュー・CI/CD
│   │   ├── cmo.md                    #   CMO: SNS運用・コンテンツ企画・ブランド管理
│   │   ├── cfo.md                    #   CFO: 仕訳・経費管理・税務準備・損益記録
│   │   ├── cio.md                    #   CIO: 市場データ収集・ファンダメンタル分析
│   │   ├── cqo.md                    #   CQO: ファクトチェック・品質レビュー（オンデマンド）
│   │   └── clo.md                    #   CLO: 法務リサーチ・契約ドラフト（オンデマンド）
│   │
│   └── skills/                        # --- 再利用可能スキル ---
│       ├── trade-review/SKILL.md     #   トレード日報・週報レビュー（Chairman使用）
│       └── habit-review/SKILL.md     #   習慣達成状況レビュー（Chairman使用）
│
├── chairman/                          # --- 会長部門 ---
│   ├── CLAUDE.md                     #   部門ルール: 社長メンター・レビュー定義
│   ├── daily-report-template.md      #   日報テンプレート
│   └── weekly-report-template.md     #   週報テンプレート
│
├── ceo/                               # --- CEO部門: 計画・ルーティング・統合 ---
│   └── CLAUDE.md                     #   部門ルール: 自ら実行せず各部門へ委任
├── cos/                               # --- COS部門: リサーチ・Brain管理・優先度管理 ---
│   └── CLAUDE.md
├── cto/                               # --- CTO部門: 開発設計・実装・CI/CD ---
│   └── CLAUDE.md
├── cmo/                               # --- CMO部門: SNS・コンテンツ・ブランド ---
│   └── CLAUDE.md
├── cfo/                               # --- CFO部門: 仕訳・経費・税務・損益記録 ---
│   └── CLAUDE.md
├── cio/                               # --- CIO部門: 市場データ・投資分析・統計 ---
│   └── CLAUDE.md
├── cqo/                               # --- CQO部門: 品質管理・ファクトチェック ---
│   └── CLAUDE.md
├── clo/                               # --- CLO部門: 法務・コンプライアンス ---
│   └── CLAUDE.md
│
├── guidelines/                        # --- 全エージェント共通の行動規範 ---
│   ├── company-overview.md           #   法人概要・事業領域・組織構成
│   ├── brand-guidelines.md           #   トーン・NG表現・ビジュアルルール
│   ├── output-standards.md           #   文書・コード・コンテンツの品質基準
│   ├── collaboration-protocol.md     #   部門間連携・タスク管理・エスカレーション
│   ├── escalation-rules.md           #   Level 1-3 エスカレーション判断基準
│   ├── security-policy.md            #   禁止事項・アクセス制御・シークレット管理
│   └── philosophy.md                 #   社長の価値観・Anti-Vision
│
├── infrastructure/                    # --- インフラ・環境・ツール定義 ---
│   ├── architecture.md               #   全体構成図・デバイス役割・同期戦略
│   ├── vps-setup.md                  #   VPS セットアップ手順書
│   ├── tmux-sessions.md              #   tmux セッション構成・起動方法
│   ├── tools.md                      #   ツール一覧・料金・用途・MCP連携
│   ├── github-actions.md             #   リポジトリ別 CI/CD 定義
│   ├── n8n-workflows.md              #   n8n ワークフロー定義
│   └── mobile-ops.md                 #   iPhone からの操作手順
│
├── plans/                             # --- 目標・ワークフロー ---
│   ├── goals.md                      #   短期・中期・長期目標（KPI・数値）
│   └── workflow.md                   #   全体ワークフロー（組織・タイムライン・フェーズ詳細・ツール・タスク管理・リスク）
│
├── archive/                           # --- アーカイブ（過去の計画・統合済みファイル） ---
│   ├── daily-routines.md             #   旧: 全期間の生活ルーティン定義
│   ├── short-term-trading-mastery.md #   旧: 4月の裁量トレード安定化詳細プラン
│   ├── genspark-vault-flow.md        #   旧: GenSpark → Brain 錬成フロー
│   ├── project-knowledge-sync.md     #   旧: Claude Desktop ナレッジ更新ルール
│   ├── mid-term-corporate-launch.md  #   旧: 5月法人登記計画（workflow.md に統合済み）
│   ├── phase-roadmap.md              #   旧: Phase 1-4 インフラ移行計画（workflow.md に統合済み）
│   └── workspace-guide.md            #   旧: ワークスペース利用ガイド（CONTEXT.md と重複）
│
├── content/                           # --- コンテンツ管理（Phase 3以降） ---
│   ├── note/
│   │   ├── drafts/                   #   CMO作成の下書き
│   │   ├── published/                #   公開済みコンテンツ
│   │   └── calendar.md              #   月次コンテンツカレンダー
│   ├── sns/
│   │   ├── x-twitter/                #   X (Twitter) 投稿案
│   │   └── threads/                  #   Threads 投稿案
│   └── templates/                    #   コンテンツテンプレート
│
├── accounting/                        # --- 会計・経理（Phase 2以降） ---
│   ├── monthly/                      #   月次収支レポート（CFO作成）
│   ├── quarterly/                    #   四半期レポート
│   ├── receipts/                     #   領収書保管
│   ├── trade-pnl/                    #   トレード損益記録
│   └── tax-prep/                     #   税務準備資料
│
├── legal/                             # --- 法務（Phase 2以降） ---
│   ├── contracts/                    #   契約書ドラフト（CLO作成）
│   ├── terms-of-service/             #   利用規約
│   └── privacy-policy/               #   プライバシーポリシー
│
├── scripts/                           # --- 運用スクリプト ---
│   ├── start-sessions.sh            #   tmux セッション起動
│   ├── validate-accountant-commands.sh #  CFO 送金系コマンドブロック
│   └── daily-routine.sh             #   日次ルーティン自動実行
│
├── automations/                       # --- 自動化定義 ---
│   ├── schedules.md                  #   全自動化スケジュール（日次・週次・月次）
│   ├── agent-orchestration.md        #   マルチエージェント連携ルール
│   └── agent-log.md                  #   エージェント活動ログ
│
├── dashboards/                        # --- ダッシュボード ---
│   ├── ceo-dashboard.md              #   事業別ステータス・全体サマリー
│   ├── weekly-report.md              #   週次レポート
│   └── decision-log.md              #   意思決定ログ
│
└── tasks/                             # --- タスク管理 ---
    ├── todo.md                       #   Linear 同期 TODO リスト
    └── lessons.md                    #   学び・失敗ログ
