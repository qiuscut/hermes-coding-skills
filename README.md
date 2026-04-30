# Hermes Coding Skills

OMC/OMX 编码任务编排 + Autopilot 自动循环引擎 — Hermes Agent 技能集合。

## 快速安装

```bash
git clone https://github.com/qiuscut/hermes-coding-skills.git
cd hermes-coding-skills
bash install.sh
```

或一行：

```bash
git clone https://github.com/qiuscut/hermes-coding-skills.git && cd hermes-coding-skills && bash install.sh
```

## 前置条件

| 依赖 | 检查命令 | 说明 |
|------|---------|------|
| Hermes Agent | `hermes --version` | 技能宿主平台 |
| Claude Code CLI | `which claude` | OMC 引擎，需要 `ANTHROPIC_API_KEY` |
| Codex CLI | `which omx` | OMX 引擎，走 OpenAI 月卡 |

## 包含技能

### omc-omx-orchestrator（v4.3.0）

异步派发编码任务到 OMC 或 OMX，后台执行，完成自动通知。

```
/omc 修复 auth 模块的 token 过期 bug
/omx 给 UserService 补全单元测试
/omc 重构 API 层 -d ~/projects/myapp
/tasks           # 查看任务列表
/tasks fix-auth  # 查看任务详情
```

### autopilot（v2.2.0）

Plan(OMC opus) → Build(OMX) → Verify 自动循环，最多 5 轮收敛。

```
/ap 重构用户认证模块
/ap 升级依赖并修复兼容性问题 -d ~/projects/myapp
/ap-status <task_id>   # 查看进度
/ap-resume <task_id>   # 恢复中断
```

## 环境变量

```bash
# Claude Code -p 管道模式必需
export ANTHROPIC_API_KEY="sk-ant-..."

# 可选：覆盖技能安装目录
export HERMES_SKILLS_DIR="/custom/path/to/skills"
```

## 目录结构

```
~/.hermes/skills/
├── omc-omx-orchestrator/
│   ├── SKILL.md
│   ├── references/
│   │   ├── recovery-guide.md
│   │   ├── spec-template.md
│   │   └── task-schema.md
│   └── scripts/
│       └── task-recovery.py
├── autopilot/
│   ├── SKILL.md
│   └── references/
│       ├── plan-format.md
│       └── verify-guide.md
```

## 卸载

```bash
rm -rf ~/.hermes/skills/omc-omx-orchestrator ~/.hermes/skills/autopilot
```
