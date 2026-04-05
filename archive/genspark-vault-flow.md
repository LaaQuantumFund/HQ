GenSpark → vault 錬成フロー

最終更新: 2026-03-31
GenSpark（Opus 4.6 無制限）での壁打ち成果物を Obsidian vault に転記・蓄積するためのルール

概要

GenSpark は「考える場」、vault は「記録する場」である。
GenSpark での対話は一時的なものであり、セッションが終われば消える。
価値ある洞察・ルール・フレームワークは必ず vault に転記し、永続的なナレッジとして蓄積する。
GenSpark での壁打ち
    │
    │ 洞察・ルール・フレームワークが生まれる
    │
    ▼
vault に転記（iPhone Obsidian or MacBook Obsidian）
    │
    │ 正式なナレッジとして蓄積
    │
    ▼
Claude Code エージェント・Trade Mastery が参照・活用
転記の判断基準

必ず転記するもの
- 新しいトレードルール・条件の定義
- マインドセットに関する具体的なフレームワーク・原則
- 習慣・ルーティンの新規定義または変更
- バックテストの方針・結果の解釈
- 「やってはいけないパターン」の発見
- 認知バイアスの具体的な対策
- 連敗時・大勝時のメンタルプロトコル
- 法人設立に関する調査結果・意思決定
- 事業戦略に関する具体的な方針

転記しなくてよいもの
- 思考途中の散漫な議論（結論が出ていないもの）
- 一般的な知識の確認（調べれば分かること）
- 感情の吐き出し（ただし、そこから得た洞察は転記する）
- 既に vault に存在する内容の再確認

迷ったときの判断基準
「1週間後にこの内容を思い出せるか？思い出せないなら転記する。」

転記先マッピング

マインドセット関連

| 壁打ちテーマ | 転記先 | ファイル例 |
|---|---|---|
| 認知バイアスと対策 | vault/02_areas/mindset/ | cognitive-biases.md |
| 感情管理フレームワーク | vault/02_areas/mindset/ | emotion-management.md |
| メンタルプロトコル | vault/02_areas/mindset/ | mental-protocols.md |
| トレーダーとしての信念・原則 | vault/02_areas/mindset/ | core-beliefs.md |
| 失敗からの学び（メンタル面） | vault/02_areas/mindset/ | lessons-mental.md |

習慣関連

| 壁打ちテーマ | 転記先 | ファイル例 |
|---|---|---|
| デイリールーティンの設計・改訂 | vault/02_areas/habits/ | daily-routine.md |
| 週次ルーティンの設計・改訂 | vault/02_areas/habits/ | weekly-routine.md |
| 習慣定着の仕組み・工夫 | vault/02_areas/habits/ | habit-systems.md |
| ルーティンが途切れた原因分析 | vault/02_areas/habits/ | routine-breakdowns.md |

手法関連

| 壁打ちテーマ | 転記先 | ファイル例 |
|---|---|---|
| エントリー条件の議論 | vault/02_areas/trading/rules/ | entry-rules.md |
| エグジット条件の議論 | vault/02_areas/trading/rules/ | exit-rules.md |
| リスク管理ルール | vault/02_areas/trading/rules/ | risk-management.md |
| セッション・時間帯ルール | vault/02_areas/trading/rules/ | session-rules.md |
| 通貨ペア選定 | vault/02_areas/trading/rules/ | pair-selection.md |
| 禁止パターン | vault/02_areas/trading/rules/ | forbidden-patterns.md |
| バックテスト方針・結果 | vault/02_areas/trading/backtest/ | YYYY-MM-DD-対象.md |
| 手法の統計的考察 | vault/02_areas/trading/ | strategy-notes.md |

環境関連

| 壁打ちテーマ | 転記先 | ファイル例 |
|---|---|---|
| TradingView 設定の最適化 | vault/02_areas/trading/ | tradingview-setup.md |
| MT5 設定の最適化 | vault/02_areas/trading/ | mt5-setup.md |
| ワークスペースの改善案 | vault/03_resources/ | workspace-improvements.md |

事業・法人関連

| 壁打ちテーマ | 転記先 | ファイル例 |
|---|---|---|
| 法人設立の調査結果 | vault/04_business/planning/ | corporate-research.md |
| 事業アイデア | vault/04_business/ideas/ | YYYY-MM-DD-アイデア名.md |
| 事業戦略の議論結果 | vault/04_business/planning/ | strategy-notes.md |
| AI組織設計の考察 | vault/04_business/planning/ | ai-organization.md |

転記フォーマット

基本構造

vault に転記する際は、以下の構造を守る。
created: YYYY-MM-DD
source: GenSpark
status: draft | confirmed
tags:
  - mindset | habit | method | environment | business
タイトル

背景
（なぜこのテーマを議論したか。1〜2文）

洞察・結論
（GenSpark での議論から得られた具体的な結論）

具体的なルール・アクション
（実際に適用するルールや行動。箇条書き可）

根拠・理由
（なぜそのルールが有効か。簡潔に）

次のステップ
（このノートに基づいて次にやること）
status の使い方
- draft: GenSpark から転記した直後。まだ実トレードで検証していない
- confirmed: 実トレードで検証し、有効性を確認した。正式なルールとして採用

転記のタイミング

リアルタイム転記（推奨）
GenSpark での壁打ち中に重要な洞察が出たら、その場で iPhone の Obsidian に簡易メモを作成する。
完璧なフォーマットでなくてよい。キーワードと結論だけでも記録する。

セッション後転記
壁打ちセッション終了後に、内容を整理して vault に正式な形で保存する。
デイリールーティンの「22:30 GenSpark で振り返り壁打ち」の直後に転記するのが自然なタイミング。

週次整理
日曜の週次レビュー時に、その週の GenSpark セッションで生まれたノートを確認し、以下を行う。
- draft のままのノートを確認 → 実トレードで検証済みなら confirmed に昇格
- 重複するノートの統合
- ルールブック（rules/ 配下）への反映漏れがないか確認

Trade Mastery / Laa Foundation との連携

GenSpark → vault → Trade Mastery の流れ
GenSpark: マインドセットの壁打ち
    │
    ▼
vault: vault/02_areas/mindset/emotion-management.md に転記（status: draft）
    │
    ▼
Trade Mastery: 日報で「GenSpark で感情管理のフレームワークを作成し、vault に保存した」と報告
    │
    ▼
Trade Mastery: AI上司が「良い。今週のトレードで実践して、週次レビューで検証しましょう」と評価
    │
    ▼
実トレードで検証 → ジャーナルに記録
    │
    ▼
週次レビュー: 有効であれば status を confirmed に昇格
GenSpark → vault → Laa Foundation の流れ
GenSpark: 法人設立の事前リサーチ壁打ち
    │
    ▼
vault: vault/04_business/planning/corporate-research.md に転記
    │
    ▼
Laa Foundation: 次回のセッションで「vault の corporate-research.md を参照して、資本金額を検討したい」と指示
    │
    ▼
Laa Foundation: GitHub MCP で vault を参照し、具体的な提案を行う
    │
    ▼
意思決定 → ~/hq/decisions/ に決定記録を保存
注意事項

情報の単一ソース原則
- vault がマスターデータ。GenSpark は一時的な思考の場であり、保存場所ではない
- GenSpark のチャット履歴に依存しない。重要な内容は必ず vault に転記する
- Trade Mastery / Laa Foundation のナレッジベースに入れる資料も vault のコピーであり、マスターは常に vault

転記しすぎない
- vault をゴミ箱にしない。転記判断基準に従い、価値ある内容だけを保存する
- 1つのセッションから転記するのは通常1〜3ノート程度
- 大量のメモより、少数の質の高いノートを目指す

GenSpark の活用を最大化する
- 壁打ちの前に vault の関連ノートを読み返しておくと、議論の質が上がる
- 「前回の壁打ちで ○○ という結論を出したが、実践してみたら △△ だった」と伝えると、GenSpark が改善案を出しやすい
- vault のノートを GenSpark に貼り付けて「これを改善してほしい」と依頼するのも有効