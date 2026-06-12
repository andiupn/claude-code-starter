# Starter Template Claude — LITE Edition 🚀

<div align="center">
  <a href="README.md">English</a> | <strong>Bahasa Indonesia</strong> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>

<br />

<div align="center">
  <h3><strong>AI Engineer butuh aturan (rules), bukan sekadar daya komputasi.</strong></h3>
  <p><strong>Starter template Claude Code yang sederhana dan ramah pemula, dilengkapi 3 agen spesialis, 6 keterampilan esensial, dan aturan workspace siap pakai.</strong></p>

  <p>Hentikan pertengkaran dengan Claude CLI tentang akses folder, kehilangan konteks, dan komit git yang berantakan. Bekerjalah bersama Claude Code dengan cara kerja yang dirancang untuknya.</p>
</div>

> 📦 Free template by **andiupn** ([kuncimu.com](https://kuncimu.com)) · Licensed under [MIT + Attribution](LICENSE.md)  
> ☕ Jika bermanfaat, [beli saya kopi](https://ko-fi.com/andiupn) · 🚀 Butuh monorepo canggih? Coba [versi PRO](https://github.com/sponsors/andiupn?frequency=monthly)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
[![Patreon](https://img.shields.io/badge/Patreon-Support-f96854?logo=patreon)](https://patreon.com/AndiUpn)
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 💡 Masalahnya: Kekacauan Claude CLI Standar
Secara bawaan, Claude Code CLI sangatlah cepat. Namun tanpa adanya sandboxing dan aturan terkonfigurasi, Claude akan terus-menerus meminta konfirmasi akses, tersesat di jalur folder yang dalam, dan membuat komit git berantakan yang merusak alur kerja Pull Request tim Anda.

---

## ⚡ Solusinya: Sandbox Claude yang Bersih dan Teratur

### 1. 🤖 3 Agen Otonom Spesialis
Anda tidak berbicara dengan chatbot generik yang serba tahu tapi kurang mendalam. Anda mendapatkan 3 agen spesialis terkonfigurasi secara otonom:
- **`@code-reviewer`** — Meninjau kualitas kode dan struktur Anda sebelum komit.
- **`@research-assistant`** — Melakukan riset dokumen API dan pustaka secara aman menggunakan model Claude-3-Haiku yang sangat hemat biaya.
- **`@architecture-reviewer`** — Meninjau modularitas dan desain arsitektur kode.

### 2. ⚡ 6 Keterampilan Esensial (Otomasi)
Alur kerja siap pakai (`/skills`) yang memungkinkan Claude mengeksekusi otomatisasi rumit secara instan:
- `/git-workflow` — Komit terstruktur + pemeriksaan keamanan otomatis.
- `/context-handoff` — Menyimpan konteks kerja yang aktif sebelum menjalankan perintah `/compact` (pembersihan memori).
- `/test-writer` & `/experiment-scaffold` — Mempercepat siklus rekayasa kode.

### 3. 📂 Struktur Workspace Terstandar
Simpan file utama di `src/`, aturan AI di `.claude/`, dan riset di `docs/`. Claude Code akan langsung mengetahui batas cakupan kerjanya, menghemat token Anda.

---

## 📊 LITE vs PRO: Upgrade Premium

Edisi LITE dibatasi untuk 3 agen, 6 skills, dan 1 preset. Untuk pengembangan skala profesional dan fitur tingkat agensi:

| LITE (Gratis) | PRO ($1-5) |
|---|---|
| 3 agen | 5 agen (+ planner, security-reviewer) |
| 6 skills | 17 skills (+ manajemen pengetahuan, debug stack, dll.) |
| 1 preset (generic) | 10 presets (PHP, Node, Next.js, Flutter, RN, Yii, dll) |
| 3 MCP server | 6 MCP server |
| Tanpa git hooks | Git hooks terintegrasi (env-guard, tsc-check) |
| Struktur sederhana | Monorepo multi-proyek status-first (`active/`, `staging/`, dll.) |

👉 **[Dapatkan Edisi PRO di GitHub Sponsors](https://github.com/sponsors/andiupn?frequency=monthly)** · Detail lengkap: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Memulai Cepat (3 Langkah)

```bash
# 1. Setup environment
cp .env.example .env
# Edit .env, isi GITHUB_TOKEN

# 2. Setup permissions
cp .claude/settings.local.example.json .claude/settings.local.json
# Edit sesuai OS (Linux/macOS/Windows)

# 3. Customize CLAUDE.md
# Replace {{PROJECT_NAME}} dengan nama project Anda
```

Buka folder ini di Claude Code, dan langsung mulai coding!

---

## 💖 Dukung Proyek Ini (Donasi)

Template ini gratis dan open-source. Jika bermanfaat, pertimbangkan untuk mendukung:
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer (Indonesia):** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria (Indonesia):** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Credits & Attribution

Template ini dibuat oleh **andiupn**.
- 🌐 Website: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ Email: andi.upn@gmail.com

**Persyaratan Atribusi:** Jika Anda mendistribusikan ulang atau melakukan fork pada template ini, harap pertahankan credit block ini di `CLAUDE.md` & `README.md` (sesuai [LICENSE.md](LICENSE.md)).
