#!/bin/bash
cd "$(dirname "$0")"

echo "=== 推上 GitHub ==="

# 清除可能的 lock 檔
rm -f .git/index.lock

# 加入所有變更
git add -A

# 確認有沒有東西要推
if git diff --cached --quiet; then
  echo "✅ 沒有變更，不需要推送"
  read -p "按 Enter 關閉..."
  exit 0
fi

# Commit + Push
TIMESTAMP=$(date '+%Y-%m-%d %H:%M')
git commit -m "Update: ${TIMESTAMP}"
git push origin main

echo ""
echo "✅ 已成功推上 GitHub！"
echo "🌐 網址：https://mastalk1024.github.io/tpe-bats-info"
echo ""
read -p "按 Enter 關閉..."
