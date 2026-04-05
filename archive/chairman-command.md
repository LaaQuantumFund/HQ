# 短期目標 実行計画書

## 1. Chairman コマンドファイル（.claude/commands/chairman.md に保存）

以下を .claude/commands/chairman.md に貼り付けてください。

---

社長から Slack #chairman に投稿された日報または週報をレビューする。

## 手順

1. 以下のファイルを読み込む
   - chairman（会長）/CLAUDE.md
   - plans/goals.md（短期目標の達成基準を確認）
   - plans/daily-routines.md（短期目標フェーズのルーティンを確認）

2. 社長の投稿内容を以下の観点で評価する

   日報の場合:
   - goals.md の短期目標達成基準との整合性
   - トレード成績: ルール遵守率、損益、判断の質
   - 習慣: daily-routines.md のタイムテーブルとの乖離
   - メンタル状態: 焦り・慢心・無気力の兆候がないか
   - 学習: 当日の壁打ち成果が Brain に記録されたか
   - 出力: 良かった点1つ、改善点1つ、明日への一言

   週報の場合:
   - 週間トレード成績の傾向（勝率推移、RR推移、遵守率推移）
   - 習慣達成率（ジャーナル記入率、ルーティン遵守率）
   - 目標貯蓄額との差分
   - 今週の成長ポイントと来週の重点課題
   - 必要に応じて goals.md の更新を提案

3. レビュー結果を Slack #chairman チャンネルに投稿する

4. dashboards/agent-log.md に作業ログを追記する

## レビューのトーン
- 厳しくも温かく。社長が道を外れそうな時に引き戻す
- 「目標を全て達成した未来の自分」として語る
- 社長の意思決定を否定しない。しかし盲点やリスクは必ず指摘する
- 感情的な状態を検出したら率直に伝える

## モデル
Sonnet

---

## 2. Linear に登録するタスク一覧

### チーム: Trading

**カテゴリ A: 負け分析**

| タイトル | 優先度 | 説明 |
|---|---|---|
| MT5 取引データの詳細分析 | Urgent | GenSpark に CSV を投げて負けパターン TOP5 を特定。時間帯別・通貨ペア別・保有時間別・ロット別の分析 |
| 負けパターンの文書化 | High | 分析結果を Brain/02_areas/trading/rules/forbidden-patterns.md に記載 |
| 連敗時の行動パターン分析 | High | リベンジトレード・ロット増加の傾向を特定し、対策ルールを策定 |

**カテゴリ B: リテール思考分析**

| タイトル | 優先度 | 説明 |
|---|---|---|
| リテールトレーダーの典型的な負けパターン調査 | High | GenSpark で壁打ち。群集心理、損切り集中ゾーン、ブレイクアウトの罠等を整理 |
| 流動性とリテールポジションの関係整理 | Medium | スマートマネーがリテールのストップをどう狩るかの構造を文書化 |

**カテゴリ C: ICT/SMC 概念の取り込み**

| タイトル | 優先度 | 説明 |
|---|---|---|
| ICT コア概念の整理 | Urgent | オーダーブロック、FVG、流動性、市場構造の4概念を Brain に文書化 |
| SMC エントリーモデルの整理 | High | BOS/CHoCH、OB+FVG コンフルエンス、セッション別の動き方を整理 |
| キルゾーンとセッション特性の整理 | High | ロンドン・NY キルゾーンの時間帯と典型パターンを Brain/trading/rules/session-rules.md に記載 |
| ICT/SMC バックテスト（10トレード） | Medium | 過去チャートで ICT/SMC モデルを検証し Brain/trading/backtest/ に記録 |

**カテゴリ D: 自分の手法の作成**

| タイトル | 優先度 | 説明 |
|---|---|---|
| エントリールール v1 策定 | High | A〜C の結果を統合し Brain/trading/rules/entry-rules.md を作成。依存: A,B,C 完了後 |
| エグジットルール v1 策定 | High | 利確・損切りの基準を Brain/trading/rules/exit-rules.md に作成 |
| リスク管理ルール策定 | Urgent | ロットサイズ計算、最大損失額、1日の損失上限を Brain/trading/rules/risk-management.md に作成 |
| ペア選定ルール策定 | Medium | 取引対象の通貨ペアと選定基準を Brain/trading/rules/pair-selection.md に作成 |
| 手法 v1 統合テスト（デモ1週間） | Medium | 全ルールを適用してデモトレード。結果をジャーナルに記録。依存: D の他タスク完了後 |

**カテゴリ E: チャート環境設定**

| タイトル | 優先度 | 説明 |
|---|---|---|
| TradingView レイアウト設定 | High | 時間足の組み合わせ、インジケーター、テンプレート保存。結果を Brain/trading/tradingview-setup.md に記録 |
| TradingView アラート設定 | Medium | キルゾーン開始時刻、重要価格帯のアラート設定 |
| MT5 テンプレート設定 | Medium | チャート表示、EA テンプレート。結果を Brain/trading/mt5-setup.md に記録 |

**カテゴリ F: チャート外の情報処理**

| タイトル | 優先度 | 説明 |
|---|---|---|
| ファンダメンタルズ情報源リスト作成 | High | 経済指標カレンダー、中央銀行発表、ニュースサイトの一覧を Brain に整理 |
| ポジション比率データソース整理 | Medium | MyFxBook、ForexFactory 等からリテールポジション比率を取得する方法を整理 |
| トレード前分析プロンプト作成 | High | GenSpark にファンダ + ポジション比率 + チャート状況を投げて判断材料を得るためのテンプレートプロンプトを作成 |
| 経済指標カレンダーの週次確認ルーティン化 | Medium | 毎週日曜に翌週の重要指標を確認するフローを daily-routines.md に追加 |

**カテゴリ G: 運用ルール制定**

| タイトル | 優先度 | 説明 |
|---|---|---|
| ブローカー比較・選定 | High | Exness / XM / FXGT の比較。スプレッド、レバレッジ、出金条件を Brain/trading/broker-info.md に記載 |
| 入金ルール策定 | High | 入金額の上限、追加入金の条件、生活資金との分離ルールを策定 |
| 資金管理・運用計画書作成 | Urgent | 月別の目標残高、最大許容損失額、出金ルールを Brain/trading/strategy-notes.md に記載 |

### チーム: Business

| タイトル | 優先度 | 説明 |
|---|---|---|
| Chairman 日報提出サイクル開始 | Urgent | 本日から Slack #chairman に日報投稿を開始 |
| goals.md の短期目標達成基準を再確認 | High | 現状の貯蓄額、トレード状況と照合し、達成基準の妥当性を検証 |
| daily-routines.md の「Trade Mastery」参照を「Chairman」に更新 | Medium | ルーティン内の旧 Claude Projects 参照を Chairman に書き換え |
| Obsidian テンプレート動作確認 | Medium | trade-journal, weekly-review, habit-tracker 等のテンプレートが正しく動くか確認 |

## 3. 実行フロー全体図

### Phase 1 タスク依存関係

Week 1（環境構築 + 分析開始）:
- Chairman コマンド設定 → 日報提出サイクル開始
- MT5 データ分析（GenSpark）→ 負けパターン文書化
- リスク管理ルール策定（最優先。これがないとトレード不可）
- TradingView レイアウト設定
- ブローカー比較・選定
- 資金管理・運用計画書作成

Week 2（知識構築）:
- ICT コア概念の整理（GenSpark 壁打ち → Brain 転記）
- SMC エントリーモデルの整理
- キルゾーンとセッション特性の整理
- リテール思考分析
- ファンダメンタルズ情報源リスト作成
- トレード前分析プロンプト作成

Week 3（手法策定）:
- エントリールール v1 策定（Week 1-2 の成果を統合）
- エグジットルール v1 策定
- ペア選定ルール策定
- 入金ルール策定
- ICT/SMC バックテスト（10トレード）

Week 4（実践テスト）:
- 手法 v1 統合テスト（デモ or 小ロット実弾）
- 日次ジャーナルの振り返り → ルール微調整
- 週次レビューで手法 v1 の評価
- Chairman 週報提出 → Phase 1 前半の総括

### 各タスクで使うツール

| 作業内容 | ツール | 補足 |
|---|---|---|
| 手法の壁打ち・概念整理 | GenSpark | メインの思考ツール。通勤中 + 夜に使用 |
| 知見の蓄積・文書化 | Obsidian（Brain） | GenSpark の成果を転記。iPhone でも編集可 |
| タスク管理 | Linear | 全タスクをここで管理。Claude Code から操作可 |
| 日報・週報レビュー | Claude Code（/chairman） | Slack #chairman に投稿 → レビュー取得 |
| 日次ブリーフィング | Claude Code（/daily-briefing） | 毎日実行。Slack #ceo にサマリー送信 |
| チャート分析 | TradingView | スマホで閲覧、MacBook で詳細分析 |
| トレード執行 | MT5（Exness） | MacBook 前でのみ。外出先エントリー厳禁 |
| ファンダ情報収集 | ブラウザ + GenSpark | 経済指標サイトのデータを GenSpark に投げて分析 |
| コード開発（将来） | Claude Code（dev） | Phase 1 では不要。HP 改修等が必要な場合のみ |

### 日報テンプレート（Slack #chairman 用）

日付: YYYY-MM-DD

■ トレード
- 取引: あり / なし（見送り）
- 通貨ペア:
- 方向: Long / Short
- 結果: +○○円 / -○○円
- ルール遵守: ○ / △ / ×（理由:）

■ 学習
- GenSpark 壁打ちテーマ:
- 得た洞察:
- Brain に転記: 済 / 未

■ 習慣
- ジャーナル記入: ○ / ×
- ストレッチ・筋トレ: ○ / ×
- ルーティン遵守率: ○○%

■ メンタル（1-10）:
- 状態メモ:

■ 明日の予定:

### 今すぐやること（本日中）

1. この内容から .claude/commands/chairman.md に該当部分を保存
2. chairman（会長）/CLAUDE.md の Model を Opus → Sonnet に変更
3. .claude/agents/chairman.md の使用モデルを Opus → Sonnet に変更
4. Slack #chairman に本日の日報を投稿
5. Claude Code で /chairman を実行してレビューを受ける
6. 上記タスク一覧を Linear に登録（Claude Code から一括登録可能）
