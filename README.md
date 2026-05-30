# Starter Template Claude — LITE Edition 🚀

<div align="center">
  <strong>English</strong> | <a href="README.id.md">Bahasa Indonesia</a>
</div>

<br />

**A simple, beginner-friendly Claude Code workspace template with 3 core agents and 6 essential skills.**

> 📦 Free template by **andiupn** ([kuncimu.com](https://kuncimu.com)) · Licensed under [MIT + Attribution](LICENSE.md)  
> ☕ If useful, [buy me a coffee](https://ko-fi.com/andiupn) · 🚀 Need more features? Try the [PRO version](https://kuncimu.com)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
[![Patreon](https://img.shields.io/badge/Patreon-Support-f96854?logo=patreon)](https://patreon.com/AndiUpn)
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 📦 What's Inside

| Component | Quantity | Description |
|---|---|---|
| Specialized agents | 3 | Specialized roles for review and research |
| Workflow skills | 6 | Reusable command-line automations |
| MCP servers | 3 (minimal) | Core integration protocols |
| Stack preset | 1 (generic) | Clean workspace preset rules |

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

## 🤖 Agents (3)

| Agent | Purpose |
|---|---|
| `@code-reviewer` | Review code changes before committing |
| `@research-assistant` | Research libraries and APIs (runs on cost-effective Haiku) |
| `@architecture-reviewer` | Review modular and architectural design |

---

## ⚡ Skills (6)

```
/git-workflow          # Structured commits + automated safety checks
/experiment-scaffold   # Scaffolds isolated experiment folders
/test-writer           # Generates clean unit tests
/validate-agent-config # Validates agent configurations and indexes
/context-handoff       # Saves active workspace context before running /compact
/init-project          # Scaffolds rules for a new project (Preset: generic)
```

---

## 📂 Folder Structure

```
.claude/         # Claude Code config (agents, skills, wiki, settings)
src/             # Your source code goes here
docs/            # Optional: research/, plans/, and templates/
```

Add your own custom directory structures based on your project requirements (web app, CLI, library, etc.).

---

## 📐 Behavioral Rules (Default)

- Keep diffs small, making targeted changes only
- Document only the "WHY" (never the "WHAT")
- Ask for user confirmation before creating new top-level directories
- Never commit code changes without explicit user confirmation

Full workspace rules can be found in [CLAUDE.md](CLAUDE.md).

---

## 📖 Documentation

| File | Description |
|---|---|
| [CLAUDE.md](CLAUDE.md) | Workspace rules and coding conventions |
| [.claude/AGENTS.md](.claude/AGENTS.md) | Standard guides on how to utilize the 3 specialized agents |
| [.claude/SKILLS.md](.claude/SKILLS.md) | Complete descriptions of the 6 skills and when to use them |
| [COMPARISON.md](COMPARISON.md) | Detailed feature comparison between LITE and PRO |
| [LICENSE.md](LICENSE.md) | MIT License with attribution clause |

---

## 💎 Upgrade to PRO

The LITE version is limited to 3 agents, 6 skills, and 1 preset. For professional development and agency-level features:

| LITE (Free) | PRO ($1-5) |
|---|---|
| 3 agents | 5 agents (+ planner, security-reviewer) |
| 6 skills | 17 skills (+ knowledge management, stack debug, etc.) |
| 1 preset (generic) | 10 presets (PHP, Node, Next.js, Flutter, RN, Yii, etc.) |
| 3 MCP servers | 6 MCP servers |
| No git hooks | Pre-configured Git hooks (env-guard, tsc-check) |
| Simple structure | Status-first multi-project monorepo (`active/`, `staging/`, etc.) |

👉 **[Get the PRO Edition at kuncimu.com](https://kuncimu.com)** · Full details: [COMPARISON.md](COMPARISON.md)

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
