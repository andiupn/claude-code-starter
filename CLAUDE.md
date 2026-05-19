# {{PROJECT_NAME}}

> 📦 **Built with [Claude Code Starter Template — LITE](https://github.com/andiupn)** by **andiupn** (free, MIT licensed)
> 🔗 [github.com/andiupn](https://github.com/andiupn) · ✉️ andi.upn@gmail.com
> ☕ If useful, support via [ko-fi.com/andiupn](https://ko-fi.com/andiupn) · 🚀 Need more? Get [PRO version](https://kuncimu.com) (lebih lengkap)

Workspace simple untuk project ini — dirancang ringan dan beginner-friendly. Tambahkan struktur sesuai kebutuhan project Anda.

---

## What's Inside

```
.claude/
  agents/              # 3 core agents (code-reviewer, research-assistant, architecture-reviewer)
  skills/              # 6 essential skills (git, test, validate, scaffold, context-handoff)
  wiki/                # Knowledge base (decisions, patterns, gotchas, learnings)
  memory/              # Session memory (git-ignored, persists across sessions)
  settings.json        # Permissions (shared)
.mcp.json              # MCP servers (minimal: github, filesystem, context7)
src/                   # Your code here
docs/                  # Optional docs (research/, plans/, templates/)
```

## Quick Start

1. **Setup environment:**
   ```bash
   cp .env.example .env
   # Edit .env, isi GITHUB_TOKEN
   ```

2. **Setup permissions:**
   ```bash
   cp .claude/settings.local.example.json .claude/settings.local.json
   # Edit sesuai OS (hapus block OS lain)
   ```

3. **Mulai coding:** Tambahkan code di `src/`, dokumen di `docs/`.

## Agents (3)

| Agent | Gunakan untuk |
|---|---|
| `@code-reviewer` | Review kode sebelum commit, security check |
| `@research-assistant` | Riset library, API, design decisions (pakai Haiku — hemat) |
| `@architecture-reviewer` | Review struktur modul, dependency, refactoring |

Detail: [.claude/AGENTS.md](.claude/AGENTS.md)

## Skills (6)

- `/git-workflow` — Structured git commit + safety checks
- `/experiment-scaffold` — Setup folder experiment baru
- `/test-writer` — Generate unit test dari function signature
- `/validate-agent-config` — Cek parity AGENTS.md vs agent files
- `/context-handoff` — Save context sebelum `/compact`
- `/init-project` — Scaffold rules ke project baru (preset `generic`)

Detail: [.claude/SKILLS.md](.claude/SKILLS.md)

## Behavioral Rules

**DO:**
- Keep diffs small; make targeted changes only
- Use strict typing when writing code
- Ask before creating new top-level directories
- Document only the non-obvious WHY

**NEVER:**
- Add fallbacks or error handling not requested
- Rewrite large sections without explicit instruction
- Add debug logs (console.log, print) unless asked
- Commit ke git tanpa konfirmasi user

## Code Conventions

Customize per language project Anda. Beberapa default umum:

- **JavaScript/TypeScript:** ESM, `const` over `let`, strict mode
- **Python:** stdlib first, type hints always, `pathlib` over `os.path`
- **Shell:** `#!/usr/bin/env bash` + `set -euo pipefail`, LF line endings

## Auto-Memory

`.claude/memory/` (git-ignored) — Claude akan otomatis simpan info penting (preferensi, gotcha, decision) untuk dipakai lintas-session.

## Want More?

LITE version ini sengaja minimal untuk pemula. Untuk fitur lengkap (10 stack presets, security review agent, planner, knowledge harvesting, wiki management), upgrade ke PRO version:

👉 **[Get PRO at kuncimu.com](https://kuncimu.com)** — hanya $1-5

Lihat [COMPARISON.md](COMPARISON.md) untuk detail perbedaan LITE vs PRO.

---

## Updating This File

Update CLAUDE.md ketika project structure berubah atau new convention ditambahkan. Keep concise.
