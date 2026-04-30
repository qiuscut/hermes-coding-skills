#!/usr/bin/env bash
# Hermes Coding Skills — 一键安装
# 将 omc-omx-orchestrator + autopilot 安装到 Hermes Agent 技能目录

set -e

HERMES_SKILLS="${HERMES_SKILLS_DIR:-$HOME/.hermes/skills}"

echo "=== Hermes Coding Skills Installer ==="
echo "目标目录: $HERMES_SKILLS"
echo ""

# 检测 Hermes
if [ ! -d "$HERMES_SKILLS" ]; then
    echo "❌ 未找到 Hermes 技能目录: $HERMES_SKILLS"
    echo "   请确认 Hermes Agent 已安装，或设置 HERMES_SKILLS_DIR 环境变量"
    exit 1
fi

echo "✅ Hermes 技能目录存在"

# 安装技能
for skill in omc-omx-orchestrator autopilot; do
    if [ ! -d "$skill" ]; then
        echo "❌ 源目录不存在: $skill"
        exit 1
    fi
    
    target="$HERMES_SKILLS/$skill"
    if [ -d "$target" ]; then
        echo "⚠️  已存在 $skill，覆盖..."
        rm -rf "$target"
    fi
    
    cp -r "$skill" "$target"
    echo "✅ $skill → $target"
done

echo ""
echo "=== 安装完成 ==="
echo ""
echo "前置条件:"
echo "  1. claude CLI 已安装 (which claude)"
echo "  2. omx CLI 已安装 (which omx)"  
echo "  3. 设置 ANTHROPIC_API_KEY 环境变量 (claude -p 需要)"
echo ""
echo "使用方法:"
echo "  /omc 修复 bug      → 派发 OMC 后台编码任务"
echo "  /omx 补全测试      → 派发 OMX 后台编码任务"
echo "  /ap 重构模块       → 启动 autopilot 自动循环"
echo "  /tasks             → 查看任务列表"
echo ""
echo "重启 Hermes 或新开会话后生效。"
