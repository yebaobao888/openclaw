#!/bin/bash
# 快速测试脚本 - 手动触发一次主控循环，看看效果

echo "🧪 手动触发主控循环（测试）..."

# 获取主控循环的任务 ID
JOB_ID=$(openclaw cron list --json 2>/dev/null | jq -r '.[] | select(.name == "AI变现主控循环") | .id' | head -1)

if [ -z "$JOB_ID" ]; then
  echo "❌ 找不到主控循环任务"
  echo "请先运行: ./setup-autonomous-agent.sh"
  exit 1
fi

echo "📋 任务 ID: $JOB_ID"
echo "🚀 开始执行..."
echo ""

openclaw cron run "$JOB_ID" --force

echo ""
echo "✅ 执行完成"
echo "📱 请查看 Discord 是否收到进度报告"
echo ""
echo "📁 查看执行日志:"
echo "  cat ~/.openclaw/workspace/ai-monetization/STRATEGY.md"
