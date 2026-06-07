# LITE vs PRO Comparison

> Bingung pilih versi mana? Berikut perbandingan fitur lengkap.

## TL;DR

- **LITE (gratis):** Cukup untuk single-project sederhana. 3 agents, 6 skills, struktur minimal.
- **PRO ($1–$5):** Untuk yang serius — multi-project workspace, 5 agents, 17 skills, 10 stack presets, knowledge management.

## Feature Matrix

| Feature | 🆓 LITE | 💎 PRO |
|---|:---:|:---:|
| **Agents** | 3 | 5 |
| `@code-reviewer` | ✅ | ✅ |
| `@research-assistant` (Haiku, hemat) | ✅ | ✅ |
| `@architecture-reviewer` | ✅ | ✅ |
| `@planner` (Opus + 32K thinking) | ❌ | ✅ |
| `@security-reviewer` (security audit) | ❌ | ✅ |
| | | |
| **Skills** | 6 | 17 |
| `/git-workflow` | ✅ | ✅ |
| `/experiment-scaffold` | ✅ | ✅ |
| `/test-writer` | ✅ | ✅ |
| `/validate-agent-config` | ✅ | ✅ |
| `/context-handoff` | ✅ | ✅ |
| `/init-project` (preset count) | 1 (generic) | 9 |
| `/research-new` (auto-frontmatter riset) | ❌ | ✅ |
| `/plan-new` (auto-frontmatter plan) | ❌ | ✅ |
| `/task-add` (backlog management) | ❌ | ✅ |
| `/knowledge-extract` (harvest dari session) | ❌ | ✅ |
| `/knowledge-harvest` (cross-project) | ❌ | ✅ |
| `/rules-maintenance` (audit AI rules) | ❌ | ✅ |
| `/log-monitor` (realtime Docker/Laravel/Flutter logs) | ❌ | ✅ |
| `/stack-debug` (health check stack) | ❌ | ✅ |
| `/ui-test` (Chrome MCP smoke test) | ❌ | ✅ |
| `/wiki-lint` (validate wiki) | ❌ | ✅ |
| `/memory-promote` (parent workspace) | ❌ | ✅ |
| | | |
| **Stack Presets (`/init-project`)** | 1 | 10 |
| `generic` | ✅ | ✅ |
| `web-php-laragon` (Windows) | ❌ | ✅ |
| `web-php-linux` (Docker) | ❌ | ✅ |
| `web-node` (Express/Fastify) | ❌ | ✅ |
| `web-nextjs` (Next.js + Vercel) | ❌ | ✅ |
| `web-yii-1` (Yii 1.1.x) | ❌ | ✅ |
| `web-yii-2` (Yii 2.x) | ❌ | ✅ |
| `mobile-rn` (React Native) | ❌ | ✅ |
| `mobile-flutter` | ❌ | ✅ |
| `multi-project-root` (workspace root) | ❌ | ✅ |
| | | |
| **MCP Servers** | 3 | 6 |
| github | ✅ | ✅ |
| filesystem | ✅ | ✅ |
| context7 (docs lookup) | ✅ | ✅ |
| claude-in-chrome (browser automation) | ❌ | ✅ |
| sqlite (experiments DB) | ❌ | ✅ |
| playwright | ❌ | ✅ |
| | | |
| **Hooks (`.claude/hooks/`)** | ❌ | ✅ |
| `env-guard.sh` | ❌ | ✅ |
| `tsc-check.sh` (auto TypeScript check) | ❌ | ✅ |
| | | |
| **Workspace Structure** | Simple (`src/`, `docs/`) | Status-first (`active/`, `staging/`, `archive/`, `shared/`, `ops/`, `artifacts/`) |
| Multi-project orchestration | ❌ | ✅ |
| Project lifecycle workflow | ❌ | ✅ |
| | | |
| **Wiki (`.claude/wiki/`)** | 4 subfolders | 7 subfolders |
| `decisions/` (ADRs) | ✅ | ✅ |
| `patterns/` | ✅ | ✅ |
| `gotchas/` | ✅ | ✅ |
| `learnings/` | ✅ | ✅ |
| `errors/` | ❌ | ✅ |
| `environment/` (cross-OS matrix) | ❌ | ✅ |
| `config/` | ❌ | ✅ |
| | | |
| **Docs Templates** | 2 (plan, research) | 6 (+ adr, report, examples) |
| `BACKLOG.md` task management | ❌ | ✅ |
| | | |
| **License** | MIT + Attribution | Proprietary Commercial |
| Redistribution allowed | ✅ (with attribution) | ❌ |
| Commercial use | ✅ | ✅ |
| Refund | N/A (free) | ❌ |
| Email Q&A | Community / best-effort | Best-effort (no SLA) |
| Updates | Via GitHub | Via [GitHub Sponsors](https://github.com/sponsors/andiupn?frequency=monthly) |

---

## When to Choose Which?

### Choose **LITE** if:
- ✅ Anda baru mulai dengan Claude Code
- ✅ Project Anda single-purpose (1 app, bukan workspace multi-project)
- ✅ Stack Anda generic (atau bukan PHP/Node/Next/Flutter/RN)
- ✅ Anda mau eksplorasi gratis dulu sebelum upgrade
- ✅ Anda mau redistribute / fork sebagai community project

### Choose **PRO** if:
- ✅ Anda mengelola multiple project di satu workspace (freelancer/agency)
- ✅ Anda perlu stack-specific preset (Laravel, Next.js, Flutter, dll)
- ✅ Anda butuh knowledge management (research/plans/ADRs sistematis)
- ✅ Anda kerja project security-sensitive (`@security-reviewer`)
- ✅ Anda butuh hooks otomatis (TypeScript check, env guard)
- ✅ Anda dukung developer dengan beli license murah ($1–5)

---

## Upgrade Path

Sudah pakai LITE dan mau upgrade?

1. Beli PRO di [GitHub Sponsors](https://github.com/sponsors/andiupn?frequency=monthly) (hanya $1–5)
2. Download PRO repo
3. Copy file project Anda yang sudah ada ke struktur PRO
4. Migrasi config CLAUDE.md (placeholder akan match)

Tidak ada lock-in — Anda boleh kembali ke LITE kapan saja (LICENSE PRO tetap valid untuk project lama Anda).

---

## Questions?

- **General questions:** GitHub issue di [github.com/andiupn](https://github.com/andiupn)
- **PRO pre-sales:** andi.upn@gmail.com
- **Bug reports:** GitHub issue (untuk LITE) / email (untuk PRO)

---

👉 **[Get PRO on GitHub Sponsors](https://github.com/sponsors/andiupn?frequency=monthly)**
