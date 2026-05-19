# init-project Skill

Scaffold AI rules workspace (agents + skills + MCP + permissions) ke folder project baru dari template.

## Quick Start

```
/init-project
```

Skill akan menanyakan nama project, target path, dan preset stack. Proses selesai dalam <5 menit.

## Preset Stacks

| Preset | Stack | Gunakan untuk |
|---|---|---|
| `web-php-laragon` | PHP + Laragon + MySQL/Oracle | Web dev dengan Laragon di Windows |
| `web-node` | Node.js + PM2 + npm/pnpm/bun | REST API atau backend Node.js |
| `web-nextjs` | Next.js + Vercel CLI | Full-stack React dengan Next.js |
| `mobile-rn` | React Native + Metro + adb | Mobile app React Native |
| `mobile-flutter` | Flutter + Dart + pub | Mobile app Flutter |
| `generic` | Tidak ada stack spesifik | Project apapun yang tidak masuk kategori di atas |

**Tidak yakin pilih apa?**
```
PHP + Laragon?    → web-php-laragon
Node backend?     → web-node
Next.js?          → web-nextjs
React Native?     → mobile-rn
Flutter?          → mobile-flutter
Lainnya?          → generic
```

## Apa yang Di-scaffold

**Semua preset mendapat:**
- `.claude/agents/` — 3 agents: `code-reviewer`, `research-assistant`, `architecture-reviewer`
- `.claude/skills/` — 4 generic skills: `git-workflow`, `experiment-scaffold`, `test-writer`, `validate-agent-config`
- `.claude/AGENTS.md`, `SKILLS.md`, `SETTINGS.md` — dokumentasi workspace
- `.mcp.json` — 4 MCP servers: `github`, `claude-in-chrome`, `filesystem`, `sqlite`
- `CLAUDE.md` — workspace rules + project overview template
- `.gitignore`, `.claudeignore`, `.env.example`
- `.claude/scaffold.lock.json` — audit log pilihan scaffold

**Stack presets juga mendapat:**
- `.claude/skills/stack-debug/` — health check khusus stack tersebut
- `.claude/skills/log-monitor/` — streaming log untuk stack tersebut
- `.claude/skills/ui-test/` — smoke test UI via Chrome MCP (web presets)

## Cara Invoke

### Interactive (recommended)

```
/init-project
```

Skill akan tanya satu per satu:
1. Nama project (kebab-case)
2. Target path (absolute)
3. Preset stack
4. Parameter stack-specific (server root, DB, dll)

### Non-interactive

```
/init-project --target D:/Server/laragon/www/myapp --preset web-php-laragon
```

Skill tetap menampilkan konfirmasi ringkasan sebelum eksekusi.

## Syarat

- Claude Code versi terbaru
- Windows: PowerShell 5.1+ (`powershell -Version` untuk cek)
- Linux/macOS: bash 4.0+, `jq` installed (`jq --version` untuk cek)
- Target folder: **parent directory harus ada** (skill tidak buat parent directory)

## Yang Tidak Di-scaffold

- Demo files (`experiments/oracle-query.py`, dll) — mulai bersih
- Credentials Oracle/DB — isi sendiri di `.env` (lihat `.env.example`)
- Hardware benchmark data — khusus workspace asal
- skill `/init-project` itu sendiri (tidak recursive)

## Troubleshooting

**"Target sudah punya .claude/ folder"**
- Tambahkan `--force` jika yakin ingin overwrite
- Atau backup dulu: `mv .claude/ .claude.bak/`

**"PowerShell execution policy error"**
- Jalankan: `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned`

**"jq not found" (Linux/macOS)**
- Ubuntu/Debian: `sudo apt install jq`
- macOS: `brew install jq`

**"Placeholder masih ada setelah scaffold"**
- Jalankan: `grep -r "{{" .claude/ .mcp.json CLAUDE.md`
- Report ke: tambahkan issue di MEMORY.md workspace asal

## Setelah Scaffold

1. `cd <target-path>`
2. Buka Claude Code: `claude`
3. Jalankan `/validate-agent-config` — harus PASS
4. Set `GITHUB_TOKEN` di environment
5. Edit `CLAUDE.md` → bagian "Project Overview" dengan deskripsi project nyata
6. Opsional: edit `.mcp.json` jika butuh MCP server tambahan
