# Collaboration Protocol

## コミュニケーション
- 部門間連携は CEO を経由（原則）
- 緊急時は直接連携可（事後に CEO へ報告）
- Slack チャンネル: #chairman, #ceo, #cos, #cto, #cmo, #cfo, #cio, #general

## タスク管理
- Linear でチケット管理
- ステータス: Backlog → Todo → In Progress → Review → Done
- 完了定義: CEO または依頼元が承認した時点

## エスカレーション
- Level 1: 担当 CxO が判断
- Level 2: CEO に相談（判断に迷う場合）
- Level 3: 社長に報告（外部影響・金銭・法務・緊急）

## 承認フロー
- 外部公開: CxO → CQO → CEO → 社長
- 金銭関連: CFO → CEO → 社長（社長が手動実行）
- コード merge: CTO → PR レビュー → merge

## 社長指示の受信・振り分けフロー
1. 社長が Slack で指示 → CEO が受信
2. CEO が担当 CxO に振り分け
3. CxO がタスクを実行
4. CEO が結果を社長に報告（Slack #ceo）
