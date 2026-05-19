# Plans — Working Memory

Folder ini berisi **plan implementasi** sebelum coding dimulai. Tujuannya:
- Catat *bagaimana* sebuah fitur/refactor akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat implementasi (atau saat di-review setelahnya)
- Trail keputusan: kenapa pendekatan A dipilih, bukan B

## Kapan Pakai Folder Ini?

✅ **Ya, simpan di sini:**
- Implementation plan untuk fitur non-trivial (>1 hari kerja)
- Refactor plan dengan banyak file terdampak
- Migration plan (database, framework version, dsb)
- Output dari `Plan` mode / `architecture-reviewer`

❌ **Bukan di sini:**
- Plan untuk task trivial (<1 jam) — cukup di TodoWrite
- Eksperimen / spike — itu masuk `experiments/`
- Riset eksplorasi → `docs/research/`
- Keputusan immutable yang hasil dari plan → `.claude/wiki/decisions/`

## Naming Convention

```
PLAN-YYYYMMDD-<kebab-slug>.md
```

Contoh: `PLAN-20260507-migrasi-laravel-12.md`

## Workflow

```
1. Buat file        → /plan-new atau copy dari docs/templates/plan.md
2. Status: draft    → masih dirancang, belum disetujui
3. Status: active   → disetujui & sedang dieksekusi
4. Status: finalized → implementasi selesai, plan jadi historical record
5. Promote ADR      → ke .claude/wiki/decisions/ kalau ada keputusan immutable
6. Archive          → docs/plans/_archive/ jika >6 bulan tidak relevan
```

## Status Flow

| Status | Arti |
|---|---|
| `draft` | Plan masih dirancang, belum disetujui |
| `active` | Plan disetujui & sedang dieksekusi |
| `finalized` | Implementasi selesai, plan = record |
| `superseded` | Diganti plan baru (set `superseded_by`) |
| `archived` | Tidak relevan, masuk `_archive/` |

## Frontmatter Wajib

Lihat [docs/templates/plan.md](../templates/plan.md). Field penting:
- `status` — untuk filter
- `related` — link ke riset / ADR / plan lain
- `promoted_to` — link ke ADR kalau hasil plan dipromote

## Cara Cari Plan

```bash
# Plan draft/active (frontmatter-only, tidak false-positive ke README)
grep -rl "^status: draft\|^status: active" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Plan terkait tag tertentu
grep -rl "laravel" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Lihat INDEX
cat docs/plans/INDEX.md
```

## Index

[INDEX.md](INDEX.md) berisi tabel semua plan.
