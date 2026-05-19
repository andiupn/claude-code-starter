---
name: knowledge-harvest
description: |
  Serap knowledge dari project AI agent lain (AGENTS.md, CLAUDE.md, .cursor, .kiro, git log)
  ke wiki dan memory repo ini, agar repo ini makin pintar dan template-nya makin kaya knowledge.
  Trigger when: user minta "harvest knowledge dari <path>", "serap knowledge dari project",
    "knowledge-harvest", "ambil pelajaran dari project lain", dll.
  Do NOT trigger when: user hanya mau lihat isi wiki (baca .claude/wiki/ langsung).
tools: [Read, Write, Glob, Grep, Bash]
agent: true
model: sonnet
color: purple
---

# Knowledge Harvest Skill

**Bahasa output:** Indonesia. Gunakan English untuk technical terms (path, flag, slug, frontmatter).

## Tujuan

Baca knowledge dari project AI agent eksternal dan serap ke dalam `.claude/wiki/` repo ini. Arah: **source (project luar) → destination (repo ini)**. Format dan struktur repo ini **tidak berubah** — hanya konten wiki bertambah.

---

## Flag yang Tersedia

| Flag | Default | Keterangan |
|---|---|---|
| `--source <path>` | (required) | Source dir yang akan di-harvest |
| `--categories <list>` | semua 10 | Filter kategori: `gotchas,patterns` untuk harvest sebagian |
| `--git-log` | on | Include harvest dari git log |
| `--git-log-limit N` | 100 | Max commits yang di-scan |
| `--enrich-templates` | off | Inject high-severity entries ke templates AGENTS.md.tmpl |
| `--dry-run` | off | Preview saja, tidak tulis file |
| `--force` | off | Override dedup — overwrite existing wiki entries |

---

## Kategori yang Didukung

| Kategori | Kata Kunci Deteksi |
|---|---|
| `gotchas` | gotcha, pitfall, warning, jangan, hati-hati, trap |
| `patterns` | pattern, reusable, template, cara yang benar, best practice |
| `decisions` | decision, pilih, kenapa, rationale, ADR, trade-off |
| `context` | context, background, sejarah, history, FYI, tentang |
| `config` | config, setting, env, setup, install, konfigurasi |
| `learnings` | learn, pelajari, insight, discovery, baru tahu, lesson |
| `errors` | error, bug, fix, regression, crash, exception, ORA-, fatal |
| `implementation` | implementation, cara kerja, how it works, step, flow |
| `optimization` | performance, optimize, cache, speed, efisiensi, tune |
| `test` | test, spec, assertion, coverage, TDD, unittest |

---

## Proses

### Step 0: Validate & Bootstrap

**0a. Resolve source:**
- Ambil dari flag `--source <path>`, args pertama, atau tanya user jika tidak ada
- Validasi: minimal harus ada 1 file yang dikenali (AGENTS.md, CLAUDE.md, `.cursor/`, `.kiro/`, `.agent/`)

**0b. Bootstrap destination:**
Cek `.claude/wiki/` di root repo ini. Jika belum ada, buat struktur lengkap:
```
.claude/wiki/
  README.md, log.md
  gotchas/, patterns/, decisions/, context/, config/
  learnings/, errors/, implementation/, optimization/, test/
```

---

### Step 1: Discovery

Scan source dir, tampilkan daftar sources yang ditemukan beserta estimasi ukuran dan jumlah entries.

**Source formats yang didukung:** AGENTS.md, CLAUDE.md, `.cursor/rules.md`, `.cursor/rules/*.mdc`, `.kiro/steering/*.md`, `.agent/memory/entries/<cat>/*.md`, `.claude/wiki/<cat>/*.md`, `git log`.

---

### Step 2: Extract & Kategorisasi

Baca setiap source, ekstrak knowledge units, assign kategori berdasarkan kata kunci (lihat tabel di atas).

**Git log:** `git -C <source> log --oneline -N` → filter keyword → 1 entry per commit match.

---

### Step 3: Dedup Check

- Exact title match vs existing `.claude/wiki/<cat>/*.md` → SKIP
- Partial match (>80% overlap kata) → FLAG di preview

---

### Step 4: Preview Table

Tampilkan tabel ringkasan (per kategori: new | skip | sample titles). Tunggu konfirmasi:
- `y` → write
- `n` → batal
- `preview N` → lihat entry N
- `skip N,M` → exclude entries
- `--dry-run` aktif → hanya preview, tidak ada prompt

---

### Step 5: Write Entries

Tulis ke `.claude/wiki/<cat>/YYYY-MM-DD-<slug>.md`.

**Format gotchas:** Problem / Root Cause / Solution / Prevention
**Format patterns:** Context / Implementation / Validation
**Format decisions:** Context & Problem / Decision / Rationale / Consequences
**Format lainnya:** Summary / Detail

---

### Step 6: Update wiki/log.md

Append harvest summary (tanggal, source, jumlah extracted, breakdown per kategori).

---

### Step 7 (Opsional): Enrich Templates

Hanya jika `--enrich-templates` aktif: backup `.tmpl`, inject max 5 high-severity entries per kategori ke `AGENTS.md.tmpl`.

---

### Step 8: Output Report

Tampilkan ringkasan: entries written per kategori, skipped, dan log.md updated.

---

## Aturan

- **Read-only dari source** — tidak pernah menulis atau memodifikasi source project
- **Preview sebelum write** — selalu tampilkan Step 4 preview, tunggu konfirmasi user
- **Dedup by title** — tidak overwrite kecuali `--force`
- **Satu source per invokasi** — harvest dari beberapa source harus dijalankan terpisah
- **Bahasa output:** Indonesia, technical terms English
