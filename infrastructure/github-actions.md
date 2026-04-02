---
updated: YYYY-MM-DD
---

# GitHub Actions 定義

<!-- 各リポジトリの CI/CD と自動化ワークフローを管理する -->

## リポジトリ別

### ~/dev/hp/
| ワークフロー | トリガー | 内容 | ステータス |
|------------|----------|------|-----------|
| CI | push, PR | lint → typecheck → test → build | 未構築 |
| Deploy | main マージ | Vercel へ自動デプロイ | 未構築 |
| Claude PR Review | PR に @claude メンション | Claude Code がコードレビュー | 未構築 |

### ~/dev/trading-bot/
| ワークフロー | トリガー | 内容 | ステータス |
|------------|----------|------|-----------|
| CI | push, PR | lint → typecheck → test | 未構築 |
| Backtest | 手動 / スケジュール | バックテスト実行 → 結果を artifacts に保存 | 未構築 |

### ~/dev/tools/
| ワークフロー | トリガー | 内容 | ステータス |
|------------|----------|------|-----------|
| CI | push, PR | lint → typecheck → test → build | 未構築 |
| Release | tag push | ビルド → リリースノート生成 → 配布 | 未構築 |

### ~/dev/sns-automation/
| ワークフロー | トリガー | 内容 | ステータス |
|------------|----------|------|-----------|
| CI | push, PR | lint → test | 未構築 |

### ~/dev/note-generator/
| ワークフロー | トリガー | 内容 | ステータス |
|------------|----------|------|-----------|
| CI | push, PR | lint → typecheck → test | 未構築 |
| Generate & Notify | 手動 / スケジュール | 記事生成 → n8n Webhook で公開通知 | 未構築 |

## 共通方針
- 全リポジトリで CI 必須（lint, typecheck, test, build）
- main ブランチへの直接 push 禁止（PR 経由のみ）
- Claude Code GitHub Action を PR レビューに活用
- Secrets は GitHub Secrets で管理。コードに埋め込まない
