# フェーズ別移行ロードマップ

> 最終更新: 2026-03-31
> 全体タイムラインは plans/roadmap.md を参照

---

## 概要

本ロードマップは、インフラ構築の観点から4つのフェーズを定義する。
事業目標との対応は以下の通り。

| フェーズ | 期間 | インフラ状態 | 対応する事業目標 |
|---|---|---|---|
| Phase 1 | 4月 Week 1〜2 | MacBook ローカル | 短期：裁量トレード安定化（環境構築） |
| Phase 2 | 4月 Week 3〜4 | VPS 稼働開始 | 短期：裁量トレード安定化（自動化） |
| Phase 3 | 5月 | VPS 本格運用 | 中期：法人登記 + AI社員システム構築 |
| Phase 4 | 6月〜 | フル自律運用 | 長期：AI自動収益 + 投資拡大 |

---

## Phase 1 – MacBook ローカル構築（4月 Week 1〜2）

### 目的
全ワークスペースの初期構築を完了し、日常ルーティンを回し始める。

### 完了条件
- [ ] ~/hq/ 全ファイル配置完了
- [ ] ~/vault/ の CLAUDE.md + agents + templates 配置完了
- [ ] ~/dev/ の各プロジェクトに CLAUDE.md 配置完了
- [ ] GitHub リポジトリ作成・初回 push 完了（vault, hq, hp, trading-bot, tools, sns-automation, note-generator）
- [ ] Linear プロジェクト作成完了（TRADE, BUSINESS, DEV系, MISC）
- [ ] Google Calendar にデイリー・週次ルーティン登録完了
- [ ] TradingView チャートテンプレート作成完了
- [ ] MT5 テンプレート・アラート設定完了
- [ ] Obsidian トレードジャーナルテンプレート完成
- [ ] Obsidian 週次レビューテンプレート完成
- [ ] Claude Desktop Projects（Trade Mastery / Laa Foundation）のナレッジ更新完了
- [ ] iPhone アプリ整理（Detech ルール設定）完了
- [ ] MacBook の Claude Code で /daily-briefing テスト成功
- [ ] iPhone から Claude App Remote Control で MacBook セッション接続確認

### iPhone での操作
- Claude App の Remote Control で MacBook の Claude Code セッションに接続
- Linear アプリでタスク確認・承認
- Obsidian（iCloud 同期）でジャーナル閲覧
- GenSpark で壁打ち

### 制約
- Claude Code は MacBook 起動中のみ動作
- Slack Bot はまだ未接続（Phase 2 で構築）
- n8n は未構築（リマインダーは Google Calendar + 手動）

---

## Phase 2 – VPS 稼働開始（4月 Week 3〜4）

### 目的
VPS を立ち上げ、iPhone だけで24時間運用できる状態にする。

### 前提
Phase 1 の全完了条件をクリアしていること。

### 完了条件
- [ ] VPS 契約・OS セットアップ完了（vps-setup.md の手順に従う）
- [ ] セキュリティ設定完了（SSH 鍵認証、UFW、Fail2Ban、Tailscale）
- [ ] Node.js / Bun / pnpm / Docker / Docker Compose インストール完了
- [ ] Claude Code CLI インストール・認証完了
- [ ] 全 GitHub リポジトリを VPS にクローン完了
- [ ] tmux セッション構成確認（tmux-sessions.md の通り）
- [ ] start-sessions.sh の動作確認完了
- [ ] Slack Bot 作成・Claude Code Channels プラグイン接続完了
- [ ] iPhone → Slack → Claude Code の双方向通信確認
- [ ] iPhone → Tailscale + Termius → VPS SSH 接続確認
- [ ] Claude Code Scheduled Tasks 設定完了（/daily-briefing, /business-review）
- [ ] n8n Docker インストール・起動完了
- [ ] n8n ワークフロー構築完了（トレードジャーナルリマインダー、月次収支リマインダー）
- [ ] MacBook を閉じた状態で、iPhone のみで一日の運用サイクルを完走できることを確認

### iPhone での操作
- Claude App Dispatch で VPS セッションにタスク投入
- Slack Bot でリマインダー受信・簡易指示送信
- Linear アプリでタスク管理
- Obsidian（iCloud）でジャーナル記入・閲覧
- GenSpark で壁打ち

### この時点での日常運用フロー
1. 07:00 — Slack に /daily-briefing が届く → 確認
2. 日中 — GenSpark で壁打ち → 成果物を vault に転記
3. 日中 — トレード執行（MacBook: TradingView + MT5）
4. 夕方 — Trade Mastery に日報報告 → 評価を受ける
5. 22:00 — Slack にジャーナルリマインダー → Obsidian に記入
6. 日曜 — 週次レビュー + ビジネスレビュー（自動実行 → Slack で結果確認）

---

## Phase 3 – 法人基盤構築（5月）

### 目的
合同会社「Laa」を設立し、AI社員システムの構築・運用を開始する。

### 前提
- Phase 2 の全完了条件をクリアしていること
- 短期目標（貯金200万超）を達成し、退職意向を伝え済みであること

### 完了条件
- [ ] 合同会社「Laa」の法人登記完了
- [ ] 税務署・年金事務所・都道府県への届出完了
- [ ] 法人銀行口座開設
- [ ] freee 会計を法人版に移行
- [ ] .co.jp ドメイン取得
- [ ] HP（ホームページ）の公開（Vercel デプロイ）
- [ ] AI社員エージェント群の本格稼働確認
  - [ ] secretary: 日次ブリーフィング・レポート自動生成
  - [ ] developer: PR 作成・CI/CD パイプライン稼働
  - [ ] marketer: SNS 投稿ドラフト生成（CEO 承認フロー付き）
  - [ ] accountant: 月次 financial-summary.md 自動更新
  - [ ] trader: ジャーナル統計分析・改善提案
- [ ] SNS アカウント再始動（X, Instagram, note のうち1つ以上）
- [ ] Linear チーム構成を法人体制に再編
- [ ] GitHub Actions CI/CD が全リポジトリで稼働

### 新規ツール導入
- Vercel Pro（HP デプロイ）: ¥3,200/月
- Linear Basic（必要に応じて）: ¥1,280/人/月
- .co.jp ドメイン: 年額 ¥3,000〜5,000

---

## Phase 4 – フル自律運用（6月〜）

### 目的
AI エージェント群による自動収益を確立し、CEO はスマホでの意思決定のみに専念する。

### 前提
- Phase 3 の全完了条件をクリアしていること
- 法人として最低1ヶ月の運用実績があること

### 目標状態
- 裁量トレード → EA（自動売買）の移行開始
  - trading-bot の開発・バックテスト・段階的実運用
- SNS・コンテンツ事業が月次売上を生み始める
- AI ツール・EA の販売準備
- 不動産投資など投資先の調査・検討開始
- CEO の日常はスマホのみ
  - 朝: Slack でブリーフィング確認
  - 日中: 承認リクエストへの対応（1〜3件/日）
  - 週末: 週次レビュー確認・戦略判断

### KPI（仮）
- 月間純利益: 目標額は Laa Foundation で策定
- エージェント稼働率: 95% 以上
- CEO の PC 使用時間: 週10時間以下（トレード分析時間を除く）
- 自動化率: 定型業務の 80% 以上をエージェントまたは n8n が処理

### スケールアップ検討項目
- VPS スペック増強（エージェント数増加に伴い）
- Claude Max への移行（Code 使用量増加に伴い）
- 追加エージェント構築（AI法務、AI分析官）
- 受託開発事業の開始判断
- 複数市場・通貨への分散投資

---

## フェーズ間の移行判断基準

### Phase 1 → Phase 2
判断者: CEO
基準: Phase 1 の全チェックリストが完了し、デイリールーティンが3日以上連続で回っていること

### Phase 2 → Phase 3
判断者: CEO
基準: 貯金200万超を達成し、退職意向を伝え済みであること。Phase 2 の全チェックリストが完了していること

### Phase 3 → Phase 4
判断者: CEO（Laa Foundation で戦略議論の上）
基準: 法人登記・届出が完了し、AI社員が最低2週間安定稼働していること。月次の収支が black（黒字）であること

---

## リスクと対策

### Phase 1〜2 共通
- リスク: 4月中に Phase 2 まで完了しない
- 対策: Phase 1 の環境構築タスクを最優先で集中処理。壁打ち・錬成は GenSpark で並行実施（インフラ構築を待たない）

### Phase 2
- リスク: VPS セットアップで詰まる
- 対策: vps-setup.md の手順を事前に MacBook で読み込み、不明点は GenSpark で事前に解決

### Phase 3
- リスク: 法人登記の手続きに想定以上の時間がかかる
- 対策: 4月中に Laa Foundation で登記準備を並行して進める（必要書類リスト、定款案など）

### 全フェーズ共通
- リスク: GenSpark の Opus 4.6 無制限が年内に終了する
- 対策: 終了時期を注視。終了後は Claude Max（¥16,000〜32,000/月）に移行、または代替サービスを調査
