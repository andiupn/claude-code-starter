# Plannen — Werkgeheugen

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <strong>Nederlands</strong> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


Folder ini berisi **plan implementasi** sebelum coding dimulai. Tujuannia:
- Catat *bagaimana* sebuah fitur/refactor akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat implementasi (atau saat di-review setelahnya)
- Trail keputusan: kenapa pendekatan A dipilih, bukan B

## Kapan Pakai-map Ini?

✅ **Ja, eenvoudigweg:**
- Implementatieplan voor niet-triviaal (>1 deel)
- Refactor-plan met het banyak-bestand terdampak
- Migratieplan (database, frameworkversie, dsb)
- Uitgang in `Plan` modus / `architecture-reviewer`

❌ **Aanbevolen:**
- Plan voor een triviale taak (<1 jam) — onderdeel van TodoWrite
- Experimen / spike — itu masuk `experiments/`
- Stijg eksplorasi → `docs/research/`
- Keputusan onveranderlijk yang hasil dari plan → `.claude/wiki/decisions/`

## Naamgevingsconventie

```
PLAN-YYYYMMDD-<kebab-slug>.md
```

Contoh: `PLAN-20260507-migrasi-laravel-12.md`

## Werkstroom

```
1. Buat file        → /plan-new atau copy dari docs/templates/plan.md
2. Status: draft    → masih dirancang, belum disetujui
3. Status: active   → disetujui & sedang dieksekusi
4. Status: finalized → implementasi selesai, plan jadi historical record
5. Promote ADR      → ke .claude/wiki/decisions/ kalau ada keputusan immutable
6. Archive          → docs/plans/_archive/ jika >6 bulan tidak relevan
```

## Statusstroom

| Staat | Arti |
|---|---|
| `draft` | Plan masih dirancang, belum disetujui |
| `active` | Plan disetujui & draag dieksekusi |
| `finalized` | Implementeer selesai, plan = record |
| `superseded` | Diganti-plan baru (set `superseded_by`) |
| `archived` | Relevante informatie, masuk `_archive/` |

## Frontzaak Wajib

Lihat [docs/templates/plan.md](../templates/plan.md). Veldpenting:
- `status` — voor filter
- `related` — link ke riset / ADR / plan lag
- `promoted_to` — link naar het ADR kalau hasil-plan dipromote

## Cara Cari-plan

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