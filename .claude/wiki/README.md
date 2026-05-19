# Wiki — Workspace Knowledge Base

Knowledge yang di-harvest dari project-project dan session debugging. Di-index via `/knowledge-harvest`, di-extract via `/knowledge-extract`.

> **Note:** Wiki di-exclude dari Claude Code context scan (ada di `.claudeignore`) agar tidak flood context.
> Akses manual via `Read .claude/wiki/<path>` saat butuh entry spesifik.

---

## Struktur & Konten Saat Ini

```
wiki/
  environment/
    cross-os-matrix.md     ← Tabel kompatibilitas OS + detection snippet
  gotchas/
    known-gotchas.md       ← Daftar gotcha yang pernah ditemukan (append-only)
    troubleshooting.md     ← Langkah debug per error kategori
  patterns/                ← (kosong — isi via /knowledge-harvest)
  decisions/               ← ADR-NNNN-*.md (isi via /knowledge-extract)
  learnings/               ← (kosong — isi via /knowledge-harvest)
  config/                  ← (kosong — snippet konfigurasi reusable)
  errors/                  ← (kosong — isi via /knowledge-harvest)
```

---

## Entry Points Penting

| File | Isi |
|------|-----|
| `environment/cross-os-matrix.md` | Setup dev environment Windows/Linux/macOS/WSL — path, tool, detection |
| `gotchas/known-gotchas.md` | Gotcha yang sudah ditemukan: MySQL 8.4, PHP 8.5, Laragon, Docker |
| `gotchas/troubleshooting.md` | Troubleshooting: MCP won't start, Docker port conflict, Caddy 502, dll |

---

## Cara Mengisi

**Otomatis (recommended):**
- `/knowledge-harvest --source <path>` — serap dari project lain
- `/knowledge-extract` — ekstrak dari conversation session ini

**Manual:**
1. Buat file `.md` di subfolder yang sesuai
2. Naming: `YYYY-MM-DD-<topik-kebab>.md` untuk entries, `<topik>.md` untuk reference
3. Setelah tambah entry baru: jalankan `/wiki-lint` untuk cek konsistensi

---

## Maintenance

Jalankan `/wiki-lint` untuk cek:
- Broken `[[refs]]` antar file
- Orphan files (tidak ada yang link ke file ini)
- Missing README di subfolder
