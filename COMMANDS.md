# コマンド・パス クイックリファレンス

最終更新: 2026-04-05
用途: Claude Code 実行時のパス参照・コマンド早見表

---

## 1. フォルダパス一覧

### ワークスペース 3層

| 名称 | パス | 備考 |
|------|------|------|
| HQ | `/Users/laa/Library/Mobile Documents/iCloud~md~obsidian/Documents/HQ` | iCloud (Obsidian) |
| Brain | `/Users/laa/Library/Mobile Documents/iCloud~md~obsidian/Documents/Brain` | iCloud (Obsidian) |
| dev | `/Users/laa/Developer/dev` | MacBook ローカル + GitHub |

### dev 配下プロジェクト

| プロジェクト | パス |
|-------------|------|
| hp（コーポレートサイト） | `/Users/laa/Developer/dev/hp` |
| trade-journal | `/Users/laa/Developer/dev/trade-journal` |
| laa-taskboard | `/Users/laa/Developer/dev/laa-taskboard` |
| trading-bot | `/Users/laa/Developer/dev/trading-bot` |
| tools | `/Users/laa/Developer/dev/tools` |
| sns-automation | `/Users/laa/Developer/dev/sns-automation` |
| note-generator | `/Users/laa/Developer/dev/note-generator` |

### よく使うサブフォルダ

| 名称 | パス |
|------|------|
| HQ plans | `/Users/laa/Library/Mobile Documents/iCloud~md~obsidian/Documents/HQ/plans` |
| HQ agents | `/Users/laa/Library/Mobile Documents/iCloud~md~obsidian/Documents/HQ/.claude/agents` |
| Brain trading rules | `/Users/laa/Library/Mobile Documents/iCloud~md~obsidian/Documents/Brain/02_areas/trading/rules` |
| Brain daily | `/Users/laa/Library/Mobile Documents/iCloud~md~obsidian/Documents/Brain/06_daily` |
| dev docs | `/Users/laa/Developer/dev/docs` |

---

## 2. Claude Code 設定・起動コマンド

### 確認プロンプト（Yes/No）をスキップする

```bash
# 実行時に毎回の承認を省略（Phase 2以降 VPS での常駐運用を想定）
claude --dangerously-skip-permissions
```

```bash
# 特定フォルダで起動しながらスキップ
claude --dangerously-skip-permissions -C "/Users/laa/Developer/dev/hp"
```

> 注意: `--dangerously-skip-permissions` はファイル書き込み・コマンド実行を無確認で行う。
> Phase 1 の MacBook ローカル作業では基本的に使わず、手動承認を推奨。
> VPS 常駐（tmux）での自動化運用時に使用する。

### 作業フォルダを指定して起動

```bash
# HQ フォルダで Claude Code を起動
claude -C "/Users/laa/Library/Mobile Documents/iCloud~md~obsidian/Documents/HQ"

# dev フォルダで起動
claude -C /Users/laa/Developer/dev

# 特定プロジェクトで起動
claude -C /Users/laa/Developer/dev/hp
```

### モデルを指定して起動

```bash
claude --model claude-opus-4-6      # 高度判断・戦略立案
claude --model claude-sonnet-4-6    # 通常タスク（デフォルト）
claude --model claude-haiku-4-5     # 定型・軽量タスク（コスト最小）
```

### 1回限りのプロンプト実行（非インタラクティブ）

```bash
# 結果だけ返して終了（スクリプト組み込み用）
claude -p "Brain/06_daily の今日のファイルを確認して要約して"
```

---

## 3. Claude Code セッション内コマンド

| コマンド | 内容 |
|---------|------|
| `/help` | 使用可能なコマンド一覧を表示 |
| `/clear` | 会話履歴をリセット（コンテキストを初期化） |
| `/compact` | 長い会話を要約して圧縮（コンテキスト節約） |
| `/cost` | 現セッションのトークン使用量・コストを表示 |
| `/model` | 使用モデルを切り替え |
| `/status` | 現在の設定・モデル・作業ディレクトリを確認 |

---

## 4. Git 関連（dev 作業時）

```bash
# 現在の状態確認
git status
git log --oneline -10

# ステージ・コミット
git add -p                          # 変更を対話的に選択してステージ
git commit -m "feat: ○○を追加"

# ブランチ操作
git checkout -b feature/○○         # 新ブランチ作成・切り替え
git checkout main                   # main に戻る

# リモート
git pull origin main
git push origin feature/○○

# GitHub CLI（gh）
gh pr create --title "タイトル" --body "説明"
gh pr list
gh issue list
```

---

## 5. よく使う Bash ショートカット

```bash
# HQ に素早く移動（パスが長いため alias 推奨）
cd "/Users/laa/Library/Mobile Documents/iCloud~md~obsidian/Documents/HQ"

# alias をシェルに追加する場合（~/.zshrc に追記）
alias hq='cd "/Users/laa/Library/Mobile Documents/iCloud~md~obsidian/Documents/HQ"'
alias brain='cd "/Users/laa/Library/Mobile Documents/iCloud~md~obsidian/Documents/Brain"'
alias dev='cd /Users/laa/Developer/dev'

# ファイル検索（Markdown のみ）
find . -name "*.md" -not -path "*/node_modules/*" | sort

# フォルダ構造を確認（3階層まで）
find . -maxdepth 3 -not -path "*/\.*" -not -path "*/node_modules/*" | sort
```

---

## 6. tmux（Phase 2 以降・VPS 常駐用）

```bash
# セッション作成・アタッチ
tmux new -s hq          # hq という名前でセッション作成
tmux attach -t hq       # 既存セッションに接続
tmux ls                 # セッション一覧

# ペイン操作（prefix = Ctrl+b）
Ctrl+b %               # 縦に分割
Ctrl+b "               # 横に分割
Ctrl+b 方向キー         # ペイン移動
Ctrl+b d               # デタッチ（セッションを維持したまま離脱）
```

---

## 7. 参照先

- エージェント定義: `HQ/.claude/agents/`
- カスタムコマンド定義: `HQ/.claude/commands/`
- インフラ手順: `HQ/infrastructure/vps-setup.md`
- tmux 構成: `HQ/infrastructure/tmux-sessions.md`
- ツール一覧・料金: `HQ/infrastructure/tools.md`
