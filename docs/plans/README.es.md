# Planes – Memoria de trabajo

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <strong>Español</strong> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


Carpeta ini berisi **plan implementasi** sebelum coding dimulai. Tujuannya:
- Catat *bagaimana* sebuah fitur/refactor akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat implementasi (atau saat di-review setelahnya)
- Sendero keputusan: kenapa pendekatan A dipilih, bukan B

## ¿Carpeta Kapan Pakai Ini?

✅ **Ya, simpan di sini:**
- Plan de implementación para un ajuste no trivial (>1 hari kerja)
- Plan de refactorización con archivos banyak terdampak
- Plan de migración (base de datos, versión framework, dsb)
- Salida del modo `Plan` / `architecture-reviewer`

❌ **Bukan di sini:**
- Planifica una tarea trivial (<1 atasco) — completada por TodoWrite
- Experimento / pico — itu masuk `experiments/`
- Riset exploración → `docs/research/`
- Plan Keputusan inmutable yang hasil dari → `.claude/wiki/decisions/`

## Convención de nomenclatura

```
PLAN-YYYYMMDD-<kebab-slug>.md
```

Contoh: `PLAN-20260507-migrasi-laravel-12.md`

## Flujo de trabajo

```
1. Buat file        → /plan-new atau copy dari docs/templates/plan.md
2. Status: draft    → masih dirancang, belum disetujui
3. Status: active   → disetujui & sedang dieksekusi
4. Status: finalized → implementasi selesai, plan jadi historical record
5. Promote ADR      → ke .claude/wiki/decisions/ kalau ada keputusan immutable
6. Archive          → docs/plans/_archive/ jika >6 bulan tidak relevan
```

## Flujo de estado

| Estado | Arte |
|---|---|
| `draft` | Plan masih dirancang, belum disetujui |
| `active` | Plan de diseño y sedan dieksekusi |
| `finalized` | Implementasi selesai, plan = registro |
| `superseded` | Diganti plan baru (establecido `superseded_by`) |
| `archived` | Tidak relevante, masuk `_archive/` |

## Frontmatter Wajib

Leer [docs/templates/plan.md](../templates/plan.md). Pentencia de campo:
- `status` — para filtrar
- `related` — enlace ke riset / ADR / plan lain
- `promoted_to` — enlace ke ADR kalau hasil plan dipromote

## Plan Cara Cari

```bash
# Plan draft/active (frontmatter-only, tidak false-positive ke README)
grep -rl "^status: draft\|^status: active" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Plan terkait tag tertentu
grep -rl "laravel" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Lihat INDEX
cat docs/plans/INDEX.md
```

## Índice

[INDEX.md](INDEX.md) Berisi tabel semua plan.