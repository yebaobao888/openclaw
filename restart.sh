#!/bin/bash
# OpenClaw 快速重启脚本

set -e

cd "$(dirname "$0")"

echo "🦞 正在重启 OpenClaw..."

# 重启 Gateway
echo "📡 重启 Gateway..."
pnpm openclaw gateway restart

# 等待 Gateway 启动
sleep 3

# 检查状态
echo ""
echo "✅ 状态检查："
pnpm openclaw gateway status

echo ""
echo "🎉 重启完成！"
echo ""
echo "📊 查看日志："
echo "  tail -f /tmp/openclaw/openclaw-$(date +%Y-%m-%d).log"
echo ""
echo "🌐 访问控制台："
echo "  http://127.0.0.1:18789/?token=$(pnpm openclaw config get gateway.auth.token 2>/dev/null | tail -1)"
