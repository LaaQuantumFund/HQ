#!/bin/bash
# CFO の送金系コマンドをブロックするバリデーション
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('tool_input',{}).get('command',''))" 2>/dev/null || echo "")

# 危険なコマンドをブロック
if echo "$COMMAND" | grep -iE '(curl.*\|.*sh|wget.*\|.*sh|rm -rf|sudo)' > /dev/null 2>&1; then
  echo "Blocked: CFO エージェントには許可されていない操作です" >&2
  exit 2
fi

# 送金・決済系コマンドをブロック
if echo "$COMMAND" | grep -iE '(transfer|payment|send_money|振込|送金)' > /dev/null 2>&1; then
  echo "Blocked: 送金・決済操作は禁止されています" >&2
  exit 2
fi

exit 0
