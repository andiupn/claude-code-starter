# Paket — Memori Kerja

<div align="center">
  <a href="README.md">English</a> | <strong>Bahasa Indonesia</strong> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


Folder ini berisi **rencana implementasi** sebelum pengkodean dimulai. Tujuan:
- Catat *bagaimana* sebuah fitur/refactor akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat implementasi (atau saat di-review setelahnya)
- Jejak keputusan: kenapa pendekatan A dipilih, bukan B

## Kapan Pakai Folder Ini?

✅ **Ya, simpan di sini:**
- Rencana implementasi untuk fitur non-trivial (>1 hari kerja)
- Refactor plan dengan banyak file terdampak
- Rencana migrasi (database, versi framework, dsb)
- Keluaran dari mode `Plan` / `architecture-reviewer`

❌ **Bukan di sini:**
- Rencanakan tugas sepele (<1 jam) — cukup di TodoWrite
- Eksperimen / spike — itu masuk `experiments/`
- Riset eksplorasi → `docs/research/`
- Keputusan tidak dapat diubah yang hasil dari rencana → `.claude/wiki/decisions/`

## Konvensi Penamaan

__KODE_BLOK_0__

Contoh: `PLAN-20260507-migrasi-laravel-12.md`

## Alur Kerja

__KODE_BLOK_1__

## Aliran Status

| Status | Arti |
|---|---|
| `draft` | Rencana masih dirancang, belum disetujui |
| `active` | Rencana disetujui & sedang dilaksanakan |
| `finalized` | Implementasi selesai, rencana = catatan |
| `superseded` | Diganti plan baru (set `superseded_by`) |
| `archived` | Tidak relevan, masuk `_archive/` |

## Materi Depan Wajib

Lihat [docs/templates/plan.md](../templates/plan.md). Bidang penting:
- `status` — untuk memfilter
- `related` — tautan ke penelitian / ADR / rencana lain
- `promoted_to` — tautan ke ADR jika hasil rencana dipromote

## Rencana Cara Cari

__KODE_BLOK_2__

## Indeks

[INDEX.md](INDEX.md) berisi tabel semua rencana.