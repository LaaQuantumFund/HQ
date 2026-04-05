ツール一覧

最終更新: 2026-03-31
全料金は日本円表示（1 USD ≈ ¥160 で換算）

ツール構成の全体像
┌─────────────────────────────────────────────────────┐
│                  CEO（あなた）                        │
│                                                     │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐          │
│  │ iPhone   │  │ MacBook  │  │ VPS      │          │
│  │ 📱       │  │ 💻       │  │ 🖥️       │          │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘          │
│       │              │              │               │
│       ▼              ▼              ▼               │
│  指示・確認      分析・執行      24時間稼働          │
│  壁打ち          開発            自動化              │
└─────────────────────────────────────────────────────┘
AI・思考ツール

GenSpark

| 項目 | 内容 |
|---|---|
| 用途 | メイン AI チャット。マインドセット・習慣・手法の壁打ち・錬成、リサーチ全般 |
| 使用モデル | Claude Opus 4.6（無制限） |
| デバイス | 📱 iPhone / 💻 MacBook |
| 料金 | 有料プラン契約中（Opus 4.6 無制限は2026年内終了予定） |
| 位置づけ | 4層構成の「思考レイヤー」。最も使用頻度の高いツール |
| 備考 | 無制限終了後は Claude Max（¥16,000〜32,000/月）への移行を検討 |

Claude Pro

| 項目 | 内容 |
|---|---|
| 用途 | Claude Code 実行専用。壁打ちには使用しない（枠を温存） |
| デバイス | 📱 iPhone（Claude App）/ 💻 MacBook / 🖥️ VPS |
| 料金 | ¥3,200/月 |
| 含まれる機能 | Claude Code CLI、Claude App（Dispatch / Remote Control）、Claude Desktop Projects |
| 位置づけ | 4層構成の「実行レイヤー」の基盤 |
| 備考 | エージェント使用量が増加した場合は Max（¥16,000〜32,000/月）に移行 |

Claude Desktop Projects

| 項目 | 内容 |
|---|---|
| 用途 | Trade Mastery（短期：進捗管理・日報・評価）、Laa Foundation（中長期：法人戦略・AI組織設計） |
| デバイス | 📱 iPhone（Claude App）/ 💻 MacBook（Claude Desktop） |
| 料金 | Claude Pro に含まれる |
| 位置づけ | 4層構成の「管理・戦略レイヤー」 |
| 連携 | Linear MCP、GitHub MCP、Google Calendar MCP |
| 備考 | ナレッジベースの更新ルールは plans/project-knowledge-sync.md 参照 |

Claude Code CLI

| 項目 | 内容 |
|---|---|
| 用途 | エージェント実行基盤。ファイル操作、Linear 更新、定期タスク、コード生成 |
| デバイス | 💻 MacBook（Phase 1）/ 🖥️ VPS（Phase 2〜） |
| 料金 | Claude Pro に含まれる |
| 機能 | Scheduled Tasks（/loop）、Channels（Slack）、Dispatch、Remote Control、MCP |
| 備考 | VPS では tmux 内で常時稼働。start-sessions.sh で起動 |

トレードツール

TradingView

| 項目 | 内容 |
|---|---|
| 用途 | チャート分析、アラート設定、ウォッチリスト管理、バックテスト（チャート上） |
| デバイス | 💻 MacBook（Chrome）/ 📱 iPhone（アプリ・確認用） |
| 料金 | 無料〜有料プラン（使用中のプランに準拠） |
| 位置づけ | 裁量トレードの分析基盤 |

MetaTrader 5

| 項目 | 内容 |
|---|---|
| 用途 | トレード注文執行、ポジション管理、EA 実行（Phase 4〜） |
| デバイス | 💻 MacBook / 📱 iPhone（確認用） |
| 料金 | 無料 |
| ブローカー | Exness、XM、FXGT（用途に応じて使い分け） |
| 位置づけ | トレード執行の基盤。Phase 4 で EA も稼働 |

ナレッジ・タスク管理

Obsidian

| 項目 | 内容 |
|---|---|
| 用途 | ナレッジベース（vault）。トレードジャーナル、ルールブック、学習ノート、事業計画、習慣トラッカー |
| デバイス | 📱 iPhone（iCloud 同期で閲覧・簡易編集）/ 💻 MacBook（メイン編集） |
| 料金 | 無料 |
| 同期 | iCloud Drive（iPhone ↔ MacBook）+ GitHub（バックアップ・VPS クローン） |
| 位置づけ | 4層構成の「記録レイヤー」。全ナレッジの単一ソース |

iCloud Drive

| 項目 | 内容 |
|---|---|
| 用途 | Obsidian vault の iPhone ↔ MacBook 同期 |
| デバイス | 📱 iPhone / 💻 MacBook |
| 料金 | 5GB 無料 / 50GB ¥130/月 |
| 備考 | vault のサイズが大きくなった場合は 200GB（¥400/月）に変更 |

Linear

| 項目 | 内容 |
|---|---|
| 用途 | 全プロジェクトのタスク管理。Claude Code + Trade Mastery + Laa Foundation から MCP 経由で参照・更新 |
| デバイス | 📱 iPhone（アプリ）/ 💻 MacBook（Web）/ 🖥️ VPS（MCP 経由） |
| 料金 | Free: ¥0（250 issue まで）/ Basic: ¥1,280/人/月 |
| チーム構成 | TRADE、BUSINESS、DEV（HP, BOT, TOOLS, SNS, NOTE）、MISC |
| 備考 | Phase 1〜2 は Free で十分。issue 数が増えたら Basic へ |

Google Calendar

| 項目 | 内容 |
|---|---|
| 用途 | ルーティンのスケジュール登録。Phase 1 でのリマインダー代替 |
| デバイス | 📱 iPhone / 💻 MacBook |
| 料金 | 無料 |
| 備考 | Phase 2 以降はリマインダーが n8n + Slack に移行。カレンダーは予定管理のみ |

通信・通知

Slack

| 項目 | 内容 |
|---|---|
| 用途 | Claude Code との双方向通信。リマインダー受信、ブリーフィング受信、簡易指示送信 |
| デバイス | 📱 iPhone / 💻 MacBook |
| 料金 | 無料プラン（90日メッセージ制限）→ 将来 Pro ¥1,050/月 |
| 構成 | Slack Bot（MCP 経由）+ n8n からの通知 |
| チャンネル | #ceo, #cos, #cto, #cmo, #cfo, #cio, #general |
| 通信フロー | 社長 → Slack → Claude Code（指示受信） / Claude Code → Slack → 社長（報告送信） |
| 導入 | Phase 2 |

MCP 連携

| MCP サーバ | 用途 | 状態 |
|---|---|---|
| Slack | 社長との双方向通信 | Phase 2 |
| freee | 仕訳・経費管理（CFO 使用） | Phase 2 |
| GitHub | リポジトリ操作（CTO 使用） | Phase 1 |
| Obsidian | Brain 読み書き（COS 使用） | Phase 2 |
| Google Calendar | スケジュール管理（COS 使用） | 将来 |
| Playwright | Web スクレイピング（CIO 使用） | 将来 |

インフラ・サーバー

VPS（Ubuntu）

| 項目 | 内容 |
|---|---|
| 用途 | Claude Code CLI 24時間稼働、n8n ホスティング、GitHub リポジトリクローン |
| デバイス | 🖥️ VPS（リモートアクセス: 📱 iPhone / 💻 MacBook） |
| 料金 | ¥800〜3,200/月（Hetzner, DigitalOcean, Vultr 等） |
| スペック | 2+ vCPU、4+ GB RAM、40+ GB NVMe、Ubuntu 22.04/24.04 LTS |
| 導入 | Phase 2 |
| 詳細 | infrastructure/vps-setup.md 参照 |

Tailscale

| 項目 | 内容 |
|---|---|
| 用途 | VPS へのプライベートネットワーク接続。iPhone / MacBook から安全に SSH |
| デバイス | 📱 iPhone / 💻 MacBook / 🖥️ VPS |
| 料金 | Personal: 無料（3ユーザーまで） |

Termius

| 項目 | 内容 |
|---|---|
| 用途 | iPhone から VPS への SSH クライアント。tmux セッションにアタッチ |
| デバイス | 📱 iPhone |
| 料金 | 無料（基本機能）/ Premium ¥1,600/月（任意） |
| 備考 | 無料版で十分。Premium は複数デバイス同期が必要な場合のみ |

tmux

| 項目 | 内容 |
|---|---|
| 用途 | VPS 上で Claude Code セッションを永続化 |
| デバイス | 🖥️ VPS |
| 料金 | 無料 |

mosh

| 項目 | 内容 |
|---|---|
| 用途 | 不安定なネットワークでの SSH 代替。モバイル接続時に有用 |
| デバイス | 📱 iPhone / 💻 MacBook → 🖥️ VPS |
| 料金 | 無料 |

Docker / Docker Compose

| 項目 | 内容 |
|---|---|
| 用途 | n8n のホスティング、将来的なサービスのコンテナ化 |
| デバイス | 🖥️ VPS |
| 料金 | 無料 |

バージョン管理・CI/CD

GitHub

| 項目 | 内容 |
|---|---|
| 用途 | 全リポジトリの管理（vault, hq, hp, trading-bot, tools, sns-automation, note-generator） |
| デバイス | 💻 MacBook / 🖥️ VPS / ☁️ クラウド |
| 料金 | 無料（private リポジトリ無制限） |

GitHub Actions

| 項目 | 内容 |
|---|---|
| 用途 | CI/CD（lint, typecheck, test, build, deploy, Claude Code PR レビュー） |
| デバイス | ☁️ クラウド |
| 料金 | 無料枠: 2,000分/月 |
| 導入 | Phase 1（設定のみ）→ Phase 3（本格稼働） |

GitHub CLI（gh）

| 項目 | 内容 |
|---|---|
| 用途 | ターミナルからの GitHub 操作。Claude Code が PR 作成・issue 操作に使用 |
| デバイス | 💻 MacBook / 🖥️ VPS |
| 料金 | 無料 |

Git

| 項目 | 内容 |
|---|---|
| 用途 | バージョン管理 |
| デバイス | 💻 MacBook / 🖥️ VPS |
| 料金 | 無料 |

Sourcetree

| 項目 | 内容 |
|---|---|
| 用途 | Git GUI クライアント。視覚的な差分確認、ブランチ管理 |
| デバイス | 💻 MacBook |
| 料金 | 無料 |

開発ツール

Cursor IDE

| 項目 | 内容 |
|---|---|
| 用途 | コード開発の IDE。AI 補完機能付き |
| デバイス | 💻 MacBook |
| 料金 | 無料（Hobby）/ Pro ¥3,200/月（任意） |
| 備考 | Claude Code CLI と併用。Phase 3 以降の開発作業で使用 |

Node.js（nvm 経由）

| 項目 | 内容 |
|---|---|
| 用途 | JavaScript/TypeScript ランタイム |
| デバイス | 💻 MacBook / 🖥️ VPS |
| 料金 | 無料 |

pnpm

| 項目 | 内容 |
|---|---|
| 用途 | パッケージマネージャ |
| デバイス | 💻 MacBook / 🖥️ VPS |
| 料金 | 無料 |

Bun

| 項目 | 内容 |
|---|---|
| 用途 | JavaScript ランタイム・パッケージマネージャ。Claude Code Channels プラグインに必要 |
| デバイス | 💻 MacBook / 🖥️ VPS |
| 料金 | 無料 |

自動化

n8n（セルフホスト）

| 項目 | 内容 |
|---|---|
| 用途 | ワークフロー自動化。リマインダー送信、外部サービス連携、エラーアラート |
| デバイス | 🖥️ VPS（Docker） |
| 料金 | Community Edition: 無料 |
| UI | http://localhost:5678（Tailscale 経由でアクセス可） |
| 導入 | Phase 2 |
| 詳細 | automations/n8n-workflows.md 参照 |

デプロイ・ホスティング

Vercel

| 項目 | 内容 |
|---|---|
| 用途 | HP（ホームページ）のデプロイ・ホスティング |
| デバイス | ☁️ クラウド |
| 料金 | Hobby: 無料 / Pro: ¥3,200/月 |
| 導入 | Phase 3 |

翻訳・音声

DeepL

| 項目 | 内容 |
|---|---|
| 用途 | 海外トレード教材・論文の翻訳 |
| デバイス | 📱 iPhone / 💻 MacBook |
| 料金 | 無料枠あり / Pro ¥1,500/月（任意） |

Notta Pro

| 項目 | 内容 |
|---|---|
| 用途 | 音声メモのテキスト変換。トレード中の気づきを音声で記録 → テキスト化 |
| デバイス | 📱 iPhone / 💻 MacBook |
| 料金 | 有料プラン契約中 |

デザイン

Canva

| 項目 | 内容 |
|---|---|
| 用途 | SNS 画像、バナー、簡易デザイン |
| デバイス | 📱 iPhone / 💻 MacBook |
| 料金 | 無料 / Pro ¥1,500/月（任意） |
| 導入 | Phase 3（SNS 再始動時） |

金融・会計

freee 会計

| 項目 | 内容 |
|---|---|
| 用途 | 会計・経理・確定申告。accountant エージェントが参照 |
| デバイス | 📱 iPhone / 💻 MacBook |
| 料金 | 個人: ¥1,000〜2,000/月 → 法人版: ¥2,000〜4,000/月（Phase 3 で移行） |

Wise

| 項目 | 内容 |
|---|---|
| 用途 | 海外サブスクリプション決済、海外送金 |
| デバイス | 📱 iPhone / 💻 MacBook |
| 料金 | 口座維持: 無料 / 送金手数料: 都度 |

Resona Bank（りそな銀行）

| 項目 | 内容 |
|---|---|
| 用途 | 個人のメインバンク。給与受取、貯金管理 |
| デバイス | 📱 iPhone（アプリ） |
| 料金 | 無料 |

Exness / XM / FXGT

| 項目 | 内容 |
|---|---|
| 用途 | FX ブローカー。トレード口座 |
| デバイス | 💻 MacBook（MT5 経由）/ 📱 iPhone（MT5 アプリ） |
| 料金 | 口座維持: 無料 / 取引手数料: スプレッド・コミッション |

セキュリティ

1Password

| 項目 | 内容 |
|---|---|
| 用途 | 全サービスの認証情報管理。API キー、パスワード、2FA |
| デバイス | 📱 iPhone / 💻 MacBook |
| 料金 | ¥500/月 程度 |

iPhone 専用アプリ

Detech

| 項目 | 内容 |
|---|---|
| 用途 | アプリロック。トレード時間中の SNS・ゲームアプリブロック |
| デバイス | 📱 iPhone |
| 料金 | 無料 / Premium あり |

Pokémon GO / Pokémon HOME

| 項目 | 内容 |
|---|---|
| 用途 | 趣味 + サイドインカム（アカウント販売） |
| デバイス | 📱 iPhone |
| 料金 | 無料（アプリ内課金あり） |
| 位置づけ | 本業に影響しない範囲で継続。収益は freee に計上 |

ブラウザ

Google Chrome

| 項目 | 内容 |
|---|---|
| 用途 | メインブラウザ。TradingView、各種 Web サービス |
| デバイス | 💻 MacBook / 📱 iPhone |
| 料金 | 無料 |

SNS プラットフォーム（Phase 3〜）

| プラットフォーム | 状態 | 用途 | 料金 |
|---|---|---|---|
| X (Twitter) | 休止中 | トレード知見・AI活用の発信 | 無料 |
| Instagram | 休止中 | ライフスタイル・ブランディング | 無料 |
| note | 休止中 | 長文コンテンツ（有料記事販売も検討） | 無料（プレミアム ¥500/月 任意） |
| YouTube | 休止中 | 動画コンテンツ（Phase 4 以降） | 無料 |
| TikTok | 未開設 | ショート動画（Phase 4 以降） | 無料 |

月額コスト概算

Phase 1（4月前半：MacBook ローカル）

| 項目 | 金額 |
|---|---|
| Claude Pro | ¥3,200 |
| GenSpark | 契約中 |
| iCloud 50GB | ¥130 |
| 1Password | ¥500 |
| freee（個人） | ¥1,000〜2,000 |
| Notta Pro | 契約中 |
| 固定合計 | ¥4,830〜5,830 + GenSpark + Notta |

Phase 2（4月後半：VPS 追加）

| 項目 | 金額 |
|---|---|
| Phase 1 の全項目 | ¥4,830〜5,830 |
| VPS | ¥800〜3,200 |
| 固定合計 | ¥5,630〜9,030 + GenSpark + Notta |

Phase 3（5月：事業拡大）

| 項目 | 金額 |
|---|---|
| Claude Pro（→ Max 検討） | ¥3,200〜32,000 |
| GenSpark | 契約中 |
| VPS | ¥800〜3,200 |
| iCloud 50GB | ¥130 |
| 1Password | ¥500 |
| freee（法人） | ¥2,000〜4,000 |
| Vercel Pro | ¥3,200 |
| Linear Basic（必要時） | ¥0〜1,280 |
| Notta Pro | 契約中 |
| 固定合計 | ¥9,830〜44,310 + GenSpark + Notta |
| 初月のみ追加 | 法人設立費 約¥60,000 |

Phase 4（6月〜：フル自律）

| 項目 | 金額 |
|---|---|
| Phase 3 と同等 | ¥9,830〜44,310 |
| VPS スペック増強（必要時） | +¥1,600〜3,200 |
| GenSpark 終了後の移行 | Claude Max ¥16,000〜32,000 に含む |
| 固定合計 | ¥11,430〜47,510 + Notta |

備考
- GenSpark と Notta Pro の具体的な月額は既存契約に依存するため別途加算
- ブローカーの取引手数料（スプレッド・コミッション）は変動費のため上記に含まない
- Wise の送金手数料は都度発生
- Cursor Pro（¥3,200/月）は任意。無料版で不足を感じたら導入
- Slack Pro（¥1,050/月）は Phase 2 移行時に必要に応じて検討
- X API Basic（$200/月）は Phase 3 の SNS 自動投稿（CMO 用）に必要

コスト最適化

| モデル | 用途 | コスト比 |
|---|---|---|
| Haiku | 定型タスク（データ収集、フォーマット変換、単純検索） | 1x |
| Sonnet | 通常タスク（文書作成、コード生成、分析） | 3x |
| Opus | 高度判断（戦略立案、複雑な意思決定、メンタリング） | 15x |

- Haiku を最大活用することでコストを 1/3〜1/5 に削減可能
- エージェント設計時は「Haiku で完結できるか？」を最初に検討する
- CIO（データ収集）・COS（単純リサーチ）の定型部分は Haiku を指定する