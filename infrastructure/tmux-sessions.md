---
updated: 2026-03-30
---

# tmux セッション管理

## セッション構成

| セッション名    | ディレクトリ                | 起動コマンド                     | 常時/都度 |
| --------- | --------------------- | -------------------------- | ----- |
| hq        | ~/hq/                 | claude --channels telegram | 常時起動  |
| dev-hp    | ~/dev/hp/             | claude                     | 都度起動  |
| dev-bot   | ~/dev/trading-bot/    | claude                     | 都度起動  |
| dev-tools | ~/dev/tools/          | claude                     | 都度起動  |
| dev-sns   | ~/dev/sns-automation/ | claude                     | 都度起動  |
| dev-note  | ~/dev/note-generator/ | claude                     | 都度起動  |
| vault     | ~/vault/              | claude                     | 都度起動  |
| n8n-logs  | ~/n8n/                | docker-compose logs -f     | 常時起動  |

## 起動スクリプト

`~/hq/infrastructure/start-sessions.sh` として保存し `chmod +x` する。

```bash
#!/bin/bash

# HQ（常時起動・Slack Channel付き）
tmux new-session -d -s hq -c ~/hq
tmux send-keys -t hq 'claude --channels telegram' Enter

# n8n ログ監視
tmux new-session -d -s n8n-logs -c ~/n8n
tmux send-keys -t n8n-logs 'docker-compose logs -f' Enter

echo "常時セッション起動完了: hq, n8n-logs"
echo "開発セッションは必要時に手動起動:"
echo "  tmux new-session -d -s dev-hp -c ~/dev/hp && tmux send-keys -t dev-hp 'claude' Enter"
```

## 基本操作

```bash
# セッション一覧
tmux ls

# セッションに接続
tmux attach -t hq

# セッションから離脱（プロセスは継続）
# Ctrl+B → D

# 新しい開発セッション起動
tmux new-session -d -s dev-hp -c ~/dev/hp
tmux send-keys -t dev-hp 'claude' Enter
tmux attach -t dev-hp

# セッション終了
tmux kill-session -t dev-hp
```

## スマホからの接続

```bash
# Termius (iOS) または Blink Shell から
# Tailscale IP 経由で SSH 接続
ssh deployer@100.x.x.x

# または mosh（不安定な回線向け）
mosh deployer@100.x.x.x

# 接続後
tmux attach -t hq
```

## 注意事項

- hq セッションは常時起動。VPS再起動時は start-sessions.sh を再実行
- VPS再起動の自動復旧が必要な場合は systemd サービスまたは crontab @reboot を設定
- 各開発セッションは作業完了後に tmux kill-session で終了してリソースを節約
