---
updated: 2026-03-30
status: Phase 1 では未実行。Phase 2 で使用
---

# VPS セットアップ手順

## 推奨スペック

- OS: Ubuntu 22.04 or 24.04 LTS
- CPU: 2 vCPU（4 推奨）
- RAM: 4GB（8GB 推奨）
- ストレージ: NVMe SSD 40GB+
- 費用: 月額 $5〜20
- 推奨プロバイダ: Hetzner, DigitalOcean, Hostinger, Vultr

## セットアップ順序

### 1. セキュリティ基盤

```bash
# 非rootユーザー作成
adduser deployer
usermod -aG sudo deployer

# SSH鍵認証（ローカルから）
ssh-keygen -t ed25519
ssh-copy-id deployer@VPS_IP

# パスワード認証を無効化（VPS側 /etc/ssh/sshd_config）
# PasswordAuthentication no
# PermitRootLogin no
sudo systemctl restart sshd

# ファイアウォール
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable

# Fail2Ban
sudo apt install fail2ban -y
sudo systemctl enable fail2ban
```

### 2. Tailscale（プライベートネットワーク）

```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
# → MacBook, iPhone にも Tailscale をインストールし同じアカウントで接続
# → 以降の SSH は Tailscale IP 経由で接続
```

### 3. 基本ツール

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y tmux mosh ripgrep git jq

# mosh用ポート開放
sudo ufw allow 60000:61000/udp

# Node.js
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install --lts

# Bun（Channels プラグイン用）
curl -fsSL https://bun.sh/install | bash

# pnpm
npm install -g pnpm
```

### 4. Claude Code

```bash
npm install -g @anthropic-ai/claude-code
claude --no-browser
# → 表示されたURLをブラウザで開いて認証
```

### 5. Slack Channel セットアップ

```bash
# 1. Slack で @BotFather に /newbot → Bot 作成 → Token 取得
# 2. プラグインインストール
claude /install telegram claude-plugins-official
# 3. Token 設定（Claude Code セッション内で案内に従う）
# 4. 起動
claude --channels telegram
# 5. Slack で Bot にメッセージを送信 → ペアリングコード承認
```

### 6. リポジトリ clone

```bash
mkdir -p ~/dev
cd ~
git clone git@github.com:USERNAME/vault.git
git clone git@github.com:USERNAME/hq.git
cd ~/dev
git clone git@github.com:USERNAME/hp.git
git clone git@github.com:USERNAME/trading-bot.git
git clone git@github.com:USERNAME/tools.git
git clone git@github.com:USERNAME/sns-automation.git
git clone git@github.com:USERNAME/note-generator.git
```

### 7. n8n（Docker）

```bash
sudo apt install docker.io docker-compose -y
sudo usermod -aG docker deployer
# ログアウト→再ログイン

mkdir ~/n8n && cd ~/n8n
cat > docker-compose.yml << 'EOF'
version: "3"
services:
  n8n:
    image: n8nio/n8n
    restart: always
    ports:
      - "5678:5678"
    volumes:
      - ./data:/home/node/.n8n
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=CHANGE_ME
      - GENERIC_TIMEZONE=Asia/Tokyo
      - TZ=Asia/Tokyo
EOF
docker-compose up -d
```

### 8. tmux セッション起動

```bash
# infrastructure/tmux-sessions.md の起動スクリプトを実行
~/hq/infrastructure/start-sessions.sh
```
