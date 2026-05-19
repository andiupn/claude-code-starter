---
name: init-project
description: |
  Scaffold workspace AI rules (agents, skills, MCP, permissions) ke project baru dari template.
  Juga bisa setup settings.local.json saja (--local-only) untuk project yang sudah ada.
  Trigger when: user minta "init project baru", "scaffold project", "setup ai rules", "buat project baru dengan template",
    "init project ini", "setup local config", "buat settings.local.json", "setup env di sini", "init lokal".
  Do NOT trigger when: user hanya ingin menambah agent/skill ke project yang sudah ada (edit langsung), atau setup MCP manual.
tools: [Bash, Read, Write, Glob]
model: sonnet
color: teal
agent: true
---

# Init Project Skill

**Bahasa output:** Indonesia. Gunakan English untuk technical terms (path, preset, placeholder, token, script).

## Tujuan

Scaffold AI rules workspace (agents, skills, MCP config, permissions) ke folder project baru. Satu command → project siap pakai dengan 3 agents + stack-appropriate skills + MCP config.

## Preset yang Tersedia

| Preset | Stack | Skills Stack-Specific |
|---|---|---|
| `web-php-laragon` | PHP + Laragon + MySQL/Oracle (Windows) | stack-debug (Laragon), log-monitor (Laragon), ui-test |
| `web-php-linux` | PHP + Nginx + MariaDB/Oracle (Linux/Fedora) | stack-debug (systemd), log-monitor (/var/log), ui-test |
| `web-node` | Node.js + Express/Fastify + PM2 | stack-debug (PM2/Node), log-monitor (PM2 logs), ui-test |
| `web-nextjs` | Next.js + Vercel CLI | stack-debug (Next dev), log-monitor (Vercel/Next), ui-test |
| `mobile-rn` | React Native + Metro + adb | stack-debug (Metro/adb), log-monitor (adb logcat) |
| `mobile-flutter` | Flutter + Dart + pub | stack-debug (flutter doctor), log-monitor (flutter logs) |
| `generic` | Any / No stack-specific tools | (only generic skills) |
| `multi-project-root` | Workspace root (e.g. laragon/www) | list-subprojects, inherit-rules |
| `web-yii-1` | PHP + Yii 1.1.x + MySQL | stack-debug (Yii 1 config check), log-monitor (protected/runtime/), yii-migrate (yiic) |
| `web-yii-2` | PHP + Yii 2.x + MySQL | stack-debug (Yii 2 config check), log-monitor (runtime/logs/), yii-migrate (yii console) |

### Hierarchy Detection (Auto-Inherit)

Saat scaffold project baru (bukan `multi-project-root`), script otomatis walk parent directories mencari `.claude/scaffold.lock.json`. Jika ditemukan:
- Project dianggap **child** dari workspace root yang ditemukan
- `AGENTS.md` dan `.agent/` **tidak** digenerate (inherited dari parent)
- `.claude/CHILD_NOTICE.md` dibuat dengan pointer ke parent root
- `scaffold.lock.json` berisi `is_child: true`, `inherits_from: <parent_path>`

**Override behavior:**
- `--no-inherit` / `-NoInherit` — force standalone (AGENTS.md + .agent/ digenerate meski ada parent)
- `--parent-root <path>` / `-ParentRoot <path>` — explicit parent path (skip auto-walk)

## Proses

### Step 0: Cek Flag --local-only

Jika flag `--local-only` ada (atau trigger phrase "init project ini", "setup local config", "init lokal", "buat settings.local.json"):
- Set `TARGET` = `.` (project saat ini) kecuali `--target <path>` diberikan eksplisit
- **Jalankan HANYA Step 1 + Step 1b, lalu STOP** — skip Steps 2–6
- Output singkat setelah selesai (lihat contoh di Step 1b)

---

### Step 1: Deteksi Platform

Jalankan platform detection dengan WSL check:
```bash
if uname -r 2>/dev/null | grep -qi microsoft; then
  echo "wsl"
elif [ -f /proc/version ]; then
  echo "linux"
elif [ -d /System/Library ]; then
  echo "macos"
else
  echo "windows"
fi
```

- **Windows** → pakai `scaffold.ps1`; OS key = `permissions_WINDOWS`
- **Linux** → pakai `scaffold.sh`; OS key = `permissions_LINUX`
- **macOS** → pakai `scaffold.sh`; OS key = `permissions_MACOS`
- **WSL** → pakai `scaffold.sh`; OS key = `permissions_WSL`

---

### Step 1b: Generate settings.local.json

Setelah OS terdeteksi, auto-generate `{TARGET}/.claude/settings.local.json`:

**1. Cek existing:**
- Ada `settings.local.json` + **tidak ada** `--force` → tampilkan `⏭️ settings.local.json sudah ada, skip` → selesai step ini
- Ada `settings.local.json` + **ada** `--force` → lanjut (akan di-overwrite)
- Tidak ada → lanjut

**2. Cari template:**
- Cek `{TARGET}/.claude/settings.local.example.json` → jika ada, gunakan ini
- Jika tidak ada, cek `.claude/settings.local.example.json` di CWD (repo test.Claude) → gunakan sebagai fallback
- Jika keduanya tidak ada → skip step ini dengan pesan warning

**3. Extract & transform:**
- Read file template
- Extract block sesuai OS yang terdeteksi: `permissions_WINDOWS` / `permissions_LINUX` / `permissions_MACOS` / `permissions_WSL`
- Rename key menjadi `"permissions"`
- Hapus semua key lain (`_readme`, `_security_notes`, `_choose_your_os`, `_note`, blok OS lainnya)
- Tulis hasil ke `{TARGET}/.claude/settings.local.json`

**4. Output:**
```
✅ settings.local.json dibuat
   OS terdeteksi : Linux
   Template dari : .claude/settings.local.example.json
   Target        : {TARGET}/.claude/settings.local.json
   Permissions   : 28 entries (allow: 26, deny: 3)
```

Jika `--local-only` aktif, tambahkan:
```
Next steps:
1. Review .claude/settings.local.json — sesuaikan path jika perlu
2. Jalankan /validate-agent-config untuk cek konfigurasi agent
```

---

### Step 2: Kumpulkan Parameter

Jika tidak diberikan via flag `--target` dan `--preset`, tanya user satu per satu:

**Untuk semua preset:**
1. `PROJECT_NAME` — nama project (kebab-case, contoh: `my-webapp`)
2. `PROJECT_ROOT` — absolute path target folder (contoh: `D:/Server/laragon/www/my-webapp`)
3. `STACK_PRESET` — pilih dari daftar preset di atas

**Tambahan untuk `web-php-laragon`:**
4. `SERVER_ROOT` — Laragon root dir (default: `D:/Server/laragon`)

**Tambahan untuk `web-php-linux`:**
4. `SERVER_ROOT` — Web root dir (contoh: `/var/www/html`, `/var/www/myapp`)
5. `DB_TYPE` — `mysql` / `mariadb` / `oracle` / `both` / `none`
5. `DB_TYPE` — `mysql` / `oracle` / `both` / `none`
6. `DB_VERSION` — versi DB, contoh: `mysql-8.0` atau `oracle-11g` (opsional, tekan Enter untuk skip)
7. `DB_DSN` — DSN tanpa password, contoh: `localhost:3306/dbname` (opsional, tekan Enter untuk skip)

**Tambahan untuk `web-node`:**
4. `SERVER_ROOT` — project root sama dengan PROJECT_ROOT (biasanya)
5. `NODE_PKG_MANAGER` — `npm` / `pnpm` / `bun` / `yarn` (default: `npm`)
6. `DB_TYPE` — `postgres` / `mongo` / `mysql` / `none`

**Tambahan untuk `web-nextjs`:**
4. `NODE_PKG_MANAGER` — `npm` / `pnpm` / `bun` / `yarn` (default: `npm`)

**Tambahan untuk `mobile-rn`:**
4. `MOBILE_PLATFORM` — `android` / `ios` / `both` (default: `android`)
5. `NODE_PKG_MANAGER` — `npm` / `pnpm` / `bun` / `yarn` (default: `npm`)

**Tambahan untuk `mobile-flutter`:**
4. `MOBILE_PLATFORM` — `android` / `ios` / `both` (default: `android`)

**Tambahan untuk `web-yii-1`:**
4. `SERVER_ROOT` — Laragon/server root dir (default: `D:/Server/laragon`)
5. `DB_TYPE` — `mysql` / `oracle` / `both` / `none`

**Tambahan untuk `web-yii-2`:**
4. `SERVER_ROOT` — Laragon/server root dir (default: `D:/Server/laragon`)
5. `DB_TYPE` — `mysql` / `none`

**Auto-detected (tidak perlu tanya):**
- `DATE_INIT` — tanggal hari ini (`date +%Y-%m-%d` atau PowerShell equivalent)
- `USER_HOME` — home directory user
- `FILESYSTEM_SCOPE` — `./` untuk semua preset (default scope MCP filesystem)
- `LOG_DIR` — derived dari SERVER_ROOT atau preset defaults

### Step 3: Konfirmasi Ringkasan

Sebelum eksekusi, tampilkan ringkasan:

```
## Scaffold Plan
- Project: {{PROJECT_NAME}}
- Target: {{PROJECT_ROOT}}
- Preset: {{STACK_PRESET}}
- Agents: code-reviewer, research-assistant, architecture-reviewer
- Skills: git-workflow, experiment-scaffold, test-writer, validate-agent-config
         + [stack-specific skills]
- MCP: github, claude-in-chrome, filesystem ({{FILESYSTEM_SCOPE}}), sqlite

Lanjutkan? (y/n)
```

Hanya lanjutkan setelah konfirmasi **y**.

### Step 4: Eksekusi Script

Tentukan path script berdasarkan platform:
```
SKILL_DIR = .claude/skills/init-project/
SCAFFOLD_PS1 = {SKILL_DIR}/scaffold.ps1
SCAFFOLD_SH  = {SKILL_DIR}/scaffold.sh
```

**Windows:**
```powershell
powershell -ExecutionPolicy Bypass -File "{SCAFFOLD_PS1}" `
  -ProjectName "{{PROJECT_NAME}}" `
  -ProjectRoot "{{PROJECT_ROOT}}" `
  -Preset "{{STACK_PRESET}}" `
  -TemplateDir "{SKILL_DIR}/templates" `
  -ServerRoot "{{SERVER_ROOT}}" `
  -DbType "{{DB_TYPE}}" `
  -NodePkgManager "{{NODE_PKG_MANAGER}}" `
  -MobilePlatform "{{MOBILE_PLATFORM}}"
```

**Linux/macOS:**
```bash
bash "{SCAFFOLD_SH}" \
  --project-name "{{PROJECT_NAME}}" \
  --project-root "{{PROJECT_ROOT}}" \
  --preset "{{STACK_PRESET}}" \
  --template-dir "{SKILL_DIR}/templates" \
  --server-root "{{SERVER_ROOT}}" \
  --db-type "{{DB_TYPE}}" \
  --node-pkg-manager "{{NODE_PKG_MANAGER}}" \
  --mobile-platform "{{MOBILE_PLATFORM}}"
```

### Step 5: Post-Scaffold Verification

Setelah script selesai, verifikasi:

1. **File count check:**
   ```
   Agents: ls {PROJECT_ROOT}/.claude/agents/      → harus ada 3 file
   Skills: ls {PROJECT_ROOT}/.claude/skills/      → harus ada ≥4 dir (generic) atau ≥7 (stack presets)
   MCP:    cat {PROJECT_ROOT}/.mcp.json            → harus ada 4 mcpServers
   ```

2. **Placeholder check (zero expected):**
   ```
   grep -r "{{" {PROJECT_ROOT}/.claude/ → harus zero match
   grep -r "{{" {PROJECT_ROOT}/.mcp.json → harus zero match
   grep -r "{{" {PROJECT_ROOT}/CLAUDE.md → harus zero match
   ```

3. **Credentials check (zero expected):**
   ```
   grep -ri "password\|secret\|token" {PROJECT_ROOT}/.claude/ → harus zero (kecuali ${GITHUB_TOKEN} yang intentional)
   ```

4. **scaffold.lock.json exists:**
   ```
   cat {PROJECT_ROOT}/.claude/scaffold.lock.json
   ```

### Step 6: Output Report

```
## Scaffold Complete ✅

Project: {{PROJECT_NAME}}
Path: {{PROJECT_ROOT}}
Preset: {{STACK_PRESET}}
Date: {{DATE_INIT}}

### Files Created
- .claude/agents/ (3 files)
- .claude/skills/ (N skills)
- .claude/AGENTS.md, SKILLS.md, SETTINGS.md
- .mcp.json
- CLAUDE.md
- .gitignore, .claudeignore, .env.example
- .claude/scaffold.lock.json

### Next Steps
1. cd {{PROJECT_ROOT}}
2. Buka Claude Code: `claude`
3. Jalankan `/validate-agent-config` untuk verify
4. Set GITHUB_TOKEN di environment jika butuh GitHub MCP
5. Edit CLAUDE.md → bagian "Project Overview" dengan deskripsi project nyata
```

## Flag Tambahan (Opsional)

| Flag | Default | Keterangan |
|---|---|---|
| `--local-only` | off | **Hanya generate settings.local.json** berdasarkan OS terdeteksi, skip semua scaffolding. Target default: `.` (project saat ini). Trigger phrase: "init project ini", "setup local config", "init lokal", "buat settings.local.json". |
| `--force` / `-Force` | off | Overwrite `.claude/` yang sudah ada (termasuk settings.local.json jika `--local-only`) |
| `--no-multi-tool` / `-EmitMultiTool:$false` | on (web/mobile) | Skip generate multi-tool stubs (`.cursor/`, `.kiro/`, dll). Auto-off untuk `generic`. |
| `--no-inherit` / `-NoInherit` | off | Force standalone — jangan inherit dari parent (AGENTS.md + .agent/ digenerate penuh) |
| `--parent-root <path>` / `-ParentRoot <path>` | "" | Explicit parent path — skip auto-walk hierarchy detection |
| `--yii-version <ver>` / `-YiiVersion <ver>` | "" | Yii version tag untuk dokumentasi (contoh: `1.1.29`, `2.0.50`). Opsional. |
| `--semble-package <pkg>` / `-SemblePackage <pkg>` | `semble-mcp` | Package name Semble MCP untuk `uvx`. Override jika package name berubah. |

## Aturan

- **Tidak boleh overwrite** folder `.claude/` yang sudah ada — kecuali flag `--force` diberikan
- **Tidak simpan credentials** — jika user input mengandung `password=`, `secret=`, `token=` di field non-secret: tolak dan arahkan ke `.env.example`
- **Maksimum 1 scaffold per invokasi** — jika user minta multiple targets, scaffold satu per satu
- **Tidak create account atau login** — hanya file operations dan git init
- Bahasa output: Indonesia, technical terms English
