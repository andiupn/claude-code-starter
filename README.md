# Starter Template Claude — LITE Edition 🚀

<div align="center">
  <strong>English</strong> | <a href="README.id.md">Bahasa Indonesia</a>
</div>

<br />

<div align="center">
  <h3><strong>AI Engineers need rules, not just computational power.</strong></h3>
  <p><strong>A simple, beginner-friendly Claude Code workspace template featuring 3 core agents, 6 essential skills, and pre-configured workspace rules.</strong></p>

  <p>Stop fighting Claude CLI over directory access, loose context, and messy git commits. Work with Claude Code the way it was designed to be used.</p>
</div>

> 📦 Free template by **andiupn** ([kuncimu.com](https://kuncimu.com)) · Licensed under [MIT + Attribution](LICENSE.md)  
> ☕ If useful, [buy me a coffee](https://ko-fi.com/andiupn) · 🚀 Need advanced monorepos? Try the [PRO version](https://github.com/sponsors/andiupn?frequency=monthly)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
[![Patreon](https://img.shields.io/badge/Patreon-Support-f96854?logo=patreon)](https://patreon.com/AndiUpn)
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 💡 The Problem: The Clutter of Claude CLI
By default, the Claude Code CLI is incredibly fast. However, without pre-configured sandboxing and rules, it will continuously ask for confirmation, get lost in deeply nested paths, and create messy git commits that ruin your team's pull request workflow.

---

## ⚡ The Solution: Pristine Claude Sandbox

### 1. 🤖 3 Specialized Otonom Agents
You don't talk to a generic chatbot. You get a team of 3 pre-configured, highly specialized, and autonomous AI agents:
- **`@code-reviewer`** — Reviews your code quality and structure before commits.
- **`@research-assistant`** — Researches API docs and libraries safely on cost-effective Claude-3-Haiku.
- **`@architecture-reviewer`** — Reviews modularity and structural design.

### 2. ⚡ 6 Essential Skills (Automations)
Ready-to-use workflows (`/skills`) that let Claude execute complex development workflows instantly:
- `/git-workflow` — Structured commits + automated safety checks.
- `/context-handoff` — Saves active workspace context before running `/compact`.
- `/test-writer` & `/experiment-scaffold` — Accelerate engineering cycles.

### 3. 📂 Organized Workspace Structure
Keep your main files in `src/`, your AI rules in `.claude/`, and your research in `docs/`. Claude Code instantly knows the boundary, saving your token budget.

---

## 📊 LITE vs PRO: The Premium Upgrade

The LITE version is limited to 3 agents, 6 skills, and 1 preset. For professional development and agency-level features:

| LITE (Free) | PRO ($1-5) |
|---|---|
| 3 agents | 5 agents (+ planner, security-reviewer) |
| 6 skills | 17 skills (+ knowledge management, stack debug, etc.) |
| 1 preset (generic) | 10 presets (PHP, Node, Next.js, Flutter, RN, Yii, etc.) |
| 3 MCP servers | 6 MCP servers |
| No git hooks | Pre-configured Git hooks (env-guard, tsc-check) |
| Simple structure | Status-first multi-project monorepo (`active/`, `staging/`, etc.) |

👉 **[Get the PRO Edition on GitHub Sponsors](https://github.com/sponsors/andiupn?frequency=monthly)** · Full details: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Quick Start (3 Steps)

```bash
# 1. Setup environment
cp .env.example .env
# Edit .env and fill in your GITHUB_TOKEN

# 2. Setup permissions
cp .claude/settings.local.example.json .claude/settings.local.json
# Edit according to your OS (Linux/macOS/Windows)

# 3. Customize CLAUDE.md
# Replace {{PROJECT_NAME}} with your project's name
```

Open this folder in Claude Code, and start coding!

---

## 💖 Support This Project (Donations)

This template is free and open-source. If it helped you, consider supporting:
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Credits & Attribution

This template is created by **andiupn**.
- 🌐 Website: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ Email: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**Attribution requirement:** If you redistribute or fork this template, please keep this credit block in `CLAUDE.md` and `README.md` (as per [LICENSE.md](LICENSE.md)).
