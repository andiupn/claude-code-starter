# Piani: memoria di lavoro

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <strong>Italiano</strong> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


Cartella ini berisi **piano implementasi** sebelum coding dimulai. Tujuannya:
- Catat *bagaimana* sebuah fitur/refactor akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat implementasi (atau saat di-review setelahnya)
- Sentiero keputusan: kenapa pendekatan A dipilih, bukan B

## Kapan Pakai Cartella Ini?

✅ **Ya, simpan di sini:**
- Piano di attuazione untuk fitur non banale (>1 hari kerja)
- Piano di refactoring con il file banyak terdampak
- Piano di migrazione (database, versione framework, dsb)
- Uscita dalla modalità `Plan` / `architecture-reviewer`

❌ **Bukan di sini:**
- Pianifica un compito banale (<1 jam) — cukup di TodoWrite
- Esperimento / picco — questo è `experiments/`
- Esplorazione del risveglio → `docs/research/`
- Piano Keputusan immutabile yang hasil dari → `.claude/wiki/decisions/`

## Convenzione di denominazione

```
PLAN-YYYYMMDD-<kebab-slug>.md
```

Conto: `PLAN-20260507-migrasi-laravel-12.md`

## Flusso di lavoro

```
1. Buat file        → /plan-new atau copy dari docs/templates/plan.md
2. Status: draft    → masih dirancang, belum disetujui
3. Status: active   → disetujui & sedang dieksekusi
4. Status: finalized → implementasi selesai, plan jadi historical record
5. Promote ADR      → ke .claude/wiki/decisions/ kalau ada keputusan immutable
6. Archive          → docs/plans/_archive/ jika >6 bulan tidak relevan
```

## Flusso dello stato

| Stato | Arti |
|---|---|
| `draft` | Plan masih dirancang, belum disetujui |
| `active` | Piano disetujui & sedang dieksekusi |
| `finalized` | Implementasi selesai, plan = record |
| `superseded` | Diganti plan baru (set `superseded_by`) |
| `archived` | Non importa, masuk `_archive/` |

## Frontmatter Wajib

Tutto [docs/templates/plan.md](../templates/plan.md). Pentazione sul campo:
- `status` — attiva il filtro
- `related` — link ke riset / ADR / plan lain
- `promoted_to` — link ke ADR kalau hasil plan dipromote

##Piano Cara Cari

__CODICE_BLOCCO_2__

## Indice

[INDEX.md](INDEX.md) mostra ogni piano della tabella.