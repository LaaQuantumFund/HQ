# ワークスペース全体ガイド

> 最終更新: 2026-03-31
> Laa の全作業環境の使い分け・役割・運用ルールを定義する

---

## 全体像

```
あなた（CEO）
  │
  ├── 考える ──→ GenSpark（壁打ち・錬成）
  │
  ├── 管理する ──→ Claude Desktop Projects
  │                 ├── Trade Mastery（短期：日報・評価）
  │                 └── Laa Foundation（中長期：法人戦略）
  │
  ├── 記録する ──→ ~/Brain/（Obsidian）
  │
  ├── 指示する ──→ ~/hq/（統括司令塔）
  │
  └── 作る ────→ ~/dev/（開発プロジェクト群）
```

---

## 5つの作業環境

### 1. ~/Brain/（Obsidian vault）

**一言で言うと**: あなたの第二の脳

**役割**: 知識・経験・学びのすべてを蓄積する場所。トレードジャーナル、マインドセットのフレームワーク、習慣ルール、手法のルールブック、事業アイデア、読書メモ、日記。GenSpark で壁打ちして得た洞察の最終保存先。

**何を置くか**:
- 自分が学んだこと、気づいたこと、考えたこと
- トレードの記録と分析
- マインド・習慣・手法のルール（確定版）
- 事業アイデア・調査結果
- デイリーノート

**何を置かないか**:
- エージェントの定義やインフラ設定（→ hq）
- ソースコード（→ dev）
- ダッシュボードやタスク管理（→ hq）

**誰が使うか**:
- あなた自身が毎日読み書きする
- Claude Code エージェント（trade-analyzer, vault-organizer）が読み取る
- Trade Mastery が GitHub MCP 経由で参照する

**同期**: iCloud Drive（iPhone ↔ MacBook）+ GitHub（バックアップ・VPS クローン）

**Git リポジトリ**: `brain`（private、1つ）

### 2. ~/hq/（統括司令塔）

**一言で言うと**: 会社のオフィス

**役割**: Laa の全事業を動かすためのルール・仕組み・計画を置く場所。エージェントの定義、自動化の設定、ダッシュボード、事業計画、意思決定ログ。Claude Code がセッション開始時に CLAUDE.md を読み込み、ここのルールに従って動く。

**何を置くか**:
- CLAUDE.md（全エージェントの行動規範）
- エージェント定義・スキル定義・コマンド定義
- インフラ設計書（VPS、tmux、ツール一覧）
- 事業計画・ロードマップ・ルーティン定義
- ダッシュボード（事業ステータス、収支、エージェントログ）
- 自動化設定（n8n、GitHub Actions、スケジュール）
- 意思決定ログ

**何を置かないか**:
- 個人のナレッジや学び（→ Brain）
- ソースコード（→ dev）
- トレードジャーナル（→ Brain）

**誰が使うか**:
- Claude Code の全エージェントがここを起点に動く
- あなたが計画の更新や意思決定の記録を行う

**同期**: GitHub のみ（iCloud 不要）

**Git リポジトリ**: `hq`（private、1つ）

### 3. ~/dev/（開発プロジェクト群）

**一言で言うと**: 工場群が並ぶ工業団地

**役割**: 実際にコードを書いて動くものを作る場所。~/dev/ 自体は単なる親フォルダであり、Git リポジトリではない。中にあるプロジェクトフォルダがそれぞれ独立した Git リポジトリ。

**何を置くか**:
- 各プロジェクトのソースコード
- プロジェクト固有の CLAUDE.md（hq の CLAUDE.md を継承しつつ上書き）
- テスト、ビルド設定、CI/CD 設定
- STRUCTURE.md（プロジェクト一覧）

**何を置かないか**:
- 事業計画や戦略（→ hq）
- ナレッジや学び（→ Brain）
- 全社共通のエージェント定義（→ hq）

**誰が使うか**:
- developer エージェントがコードを書く
- marketer エージェントが SNS テンプレートを管理する
- GitHub Actions が CI/CD を実行する

**同期**: 各プロジェクトが個別に GitHub リポジトリ

**Git リポジトリ**: プロジェクトごとに1つずつ（後述）

### 4. Claude Desktop「Trade Mastery」

**一言で言うと**: あなたの上司

**役割**: 短期目標（裁量トレード安定化）の進捗管理・評価を行う AI 上司。日報・週報を受け取り、Linear と GitHub のデータを突合して客観的にフィードバックする。

**何をするか**:
- 毎日の日報を受け取り、評価・フィードバックを返す
- 週報を生成し、進捗を可視化する
- Linear MCP でタスク状態をリアルタイム確認する
- GitHub MCP で Brain のジャーナルやノートを参照する

**何をしないか**:
- ファイルの直接編集（Claude Code の役割）
- 壁打ち・錬成（GenSpark の役割）
- 中長期の戦略議論（Laa Foundation の役割）

**ナレッジベース**: Brain から要約をエクスポートして登録（project-knowledge-sync.md 参照）

**使用デバイス**: iPhone（Claude App）/ MacBook（Claude Desktop）

### 5. Claude Desktop「Laa Foundation」

**一言で言うと**: あなたの参謀

**役割**: 中長期の法人戦略・AI組織設計・事業展開について、リサーチ・提案・計画策定を行う AI 参謀。

**何をするか**:
- 法人設立の調査・手順整理
- 事業戦略の議論・提案
- AI 社員システムの設計相談
- 投資戦略の検討
- Linear MCP で BUSINESS チームのタスク管理
- GitHub MCP で Brain の事業関連ノートを参照

**何をしないか**:
- 日々のトレード管理（Trade Mastery の役割）
- ファイルの直接編集（Claude Code の役割）
- マインド・手法の壁打ち（GenSpark の役割）

**ナレッジベース**: hq の計画ファイルと Brain の事業ノートから要約を登録（project-knowledge-sync.md 参照）

**使用デバイス**: iPhone（Claude App）/ MacBook（Claude Desktop）

### 補足: GenSpark

**一言で言うと**: 思考のジム

**役割**: Claude Opus 4.6 無制限の AI チャット。マインドセット・習慣・手法の壁打ち・錬成、リサーチ全般を行うメインの思考ツール。

**何をするか**:
- 4つの柱（マインド・習慣・環境・手法）の深掘り議論
- 新しいルール・フレームワークの共同設計
- トレードの振り返り分析
- 法人設立・事業戦略のリサーチ

**成果物の行き先**: Brain に転記（genspark-vault-flow.md に従う）

**使用デバイス**: iPhone（通勤中メイン）/ MacBook

---

## 情報の流れ

```
GenSpark（壁打ち）
    │
    │ 洞察・ルール・フレームワーク
    │
    ▼
~/Brain/（記録）
    │
    │ エージェントが参照        要約をエクスポート
    │                              │
    ├──→ ~/hq/（指示・管理）       ├──→ Trade Mastery（評価）
    │       │                      └──→ Laa Foundation（戦略）
    │       │ タスク指示
    │       ▼
    │    ~/dev/（開発・実装）
    │       │
    │       │ 成果物
    │       ▼
    │    GitHub → Vercel / MT5 / SNS
    │
    └──→ Linear（タスク管理。全環境から参照）
```

---

## 3つのフォルダの比較

| 観点 | ~/Brain/ | ~/hq/ | ~/dev/ |
|---|---|---|---|
| 例え | 脳 | オフィス | 工場 |
| 中身 | 知識・経験・学び | ルール・仕組み・計画 | ソースコード |
| 更新者 | あなた + vault-organizer | あなた + 全エージェント | developer エージェント |
| 更新頻度 | 毎日 | 週次〜必要時 | タスク発生時 |
| iPhone から | Obsidian で閲覧・簡易編集 | Slack 経由で指示 | 直接触らない |
| MacBook から | Obsidian でメイン編集 | Claude Code で操作 | Cursor / Claude Code |
| Git | 1リポジトリ（brain） | 1リポジトリ（hq） | プロジェクトごとに1リポ |
| iCloud 同期 | あり | なし | なし |

---

## ~/dev/ の開発プロジェクト管理

### 現在のプロジェクト一覧

| フォルダ名 | リポジトリ名 | 内容 | 導入フェーズ |
|---|---|---|---|
| hp/ | hp | 法人公式サイト | Phase 3 |
| trading-bot/ | trading-bot | 自動売買ボット（EA） | Phase 4 |
| tools/ | tools | 業務ツール群 | Phase 4 |
| sns-automation/ | sns-automation | SNS 自動投稿・管理 | Phase 3 |
| note-generator/ | note-generator | note 記事生成 | Phase 3〜4 |

### 新しいプロジェクトの追加方法

新しい開発案件が発生したとき、以下の手順で追加する。

**Step 1: フォルダ作成**

~/dev/ の中に新しいフォルダを作る。フォルダ名はリポジトリ名と一致させる。英小文字・ハイフン区切り。

```
cd ~/dev
mkdir new-project
cd new-project
```

**Step 2: Git 初期化 + GitHub リポジトリ作成**

```
git init
gh repo create new-project --private
```

**Step 3: CLAUDE.md 作成**

最低限の内容で CLAUDE.md を作成する。~/hq/CLAUDE.md のルールを継承しつつ、プロジェクト固有の情報を書く。

```
# New Project

> このプロジェクトのルール。~/hq/CLAUDE.md の全社ポリシーに従う。

## 概要
（何を作るか、1〜2文）

## 技術スタック
（使用する言語・フレームワーク）

## コマンド
（ビルド、テスト、デプロイのコマンド）

## 制約
（このプロジェクト固有の注意事項）
```

**Step 4: 基本構成の作成**

```
mkdir -p src .claude/commands tasks
touch tasks/todo.md
```

**Step 5: 初回コミット + push**

```
git add .
git commit -m "init: プロジェクト初期構成"
git push -u origin main
```

**Step 6: STRUCTURE.md の更新**

~/dev/STRUCTURE.md にプロジェクトを追記する。

**Step 7: Linear にプロジェクト作成**

Linear の DEV チーム内に新しいプロジェクトを作成し、初期イシューを登録する。

**Step 8: hq 側の更新（必要に応じて）**

大きなプロジェクトの場合は以下も行う。
- ~/hq/CLAUDE.md のフォルダ構造セクションに追記
- ~/hq/.claude/agents/developer.md の担当プロジェクトに追加
- ~/hq/dashboard/business-status.md にプロジェクトセクション追加
- ~/hq/automations/github-actions.md に CI/CD 定義追加

### プロジェクトの命名規則

- 英小文字のみ
- 単語の区切りはハイフン（`-`）
- 短く、内容が分かる名前
- 例: `lp-generator`, `email-automation`, `portfolio-tracker`

### プロジェクトの終了・アーカイブ

開発が完了し保守も不要になったプロジェクトは以下の手順でアーカイブする。

1. GitHub リポジトリを Archive 状態にする
2. ~/dev/STRUCTURE.md で該当プロジェクトに「アーカイブ済」と注記する
3. VPS からクローンを削除する（GitHub に残っているので復元可能）
4. Linear のプロジェクトを Complete にする

---

## どこに何を書くか迷ったときの判断フロー

**「これは自分の学びや気づきか？」**
→ はい → ~/Brain/ に書く

**「これはエージェントへの指示やルールか？」**
→ はい → ~/hq/ に書く

**「これはソースコードや設定ファイルか？」**
→ はい → ~/dev/ の該当プロジェクトに書く

**「これは誰かに相談したい・壁打ちしたい内容か？」**
→ トレードのマインド・手法 → GenSpark
→ 短期の進捗・評価 → Trade Mastery
→ 中長期の戦略 → Laa Foundation

**「これは意思決定の記録か？」**
→ はい → ~/hq/decisions/ に書く

**「これはタスクか？」**
→ はい → Linear に登録する
