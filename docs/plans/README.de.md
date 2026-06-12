# Pläne – Arbeitsgedächtnis

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <strong>Deutsch</strong> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


Ordner ini berisi **Plan Implementierung** Sebelum Coding Dimulai. Tujuannya:
- Catat *bagaimana* sebuah fitur/refactor akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat implementasi (atau saat di-review setelahnya)
- Trail-Keputusan: Kenapa Pendekatan A Dipilih, Bukan B

## Kapan Pakai Ordner Ini?

✅ **Ja, simpan di sini:**
- Implementierungsplan für nicht-triviale Zwecke (>1 Jahr)
- Refactoring-Plan mit neuer Datei
- Migrationsplan (Datenbank, Framework-Version, DSB)
- Ausgabe im Modus `Plan` / `architecture-reviewer`

❌ **Mehr als nur:**
- Planen Sie eine triviale Aufgabe (<1 Block) – mit TodoWrite
- Eksperimen / Spike – es ist mehr als `experiments/`
- Riset eksplorasi → `docs/research/`
- Keputusan unveränderlicher Yang Hasil Dari Plan → `.claude/wiki/decisions/`

## Namenskonvention

```
PLAN-YYYYMMDD-<kebab-slug>.md
```

Contoh: `PLAN-20260507-migrasi-laravel-12.md`

## Arbeitsablauf

```
1. Buat file        → /plan-new atau copy dari docs/templates/plan.md
2. Status: draft    → masih dirancang, belum disetujui
3. Status: active   → disetujui & sedang dieksekusi
4. Status: finalized → implementasi selesai, plan jadi historical record
5. Promote ADR      → ke .claude/wiki/decisions/ kalau ada keputusan immutable
6. Archive          → docs/plans/_archive/ jika >6 bulan tidak relevan
```

## Statusfluss

| Status | Arti |
|---|---|
| `draft` | Planen Sie noch mehr Maßnahmen und planen Sie |
| `active` | Planen Sie die Bereitstellung und die Bereitstellung dieser Informationen |
| `finalized` | Selesai implementieren, planen = aufzeichnen |
| `superseded` | Diganti plan baru (set `superseded_by`) |
| `archived` | Nicht relevant, mehr `_archive/` |

## Frontmatter Wajib

Lihat [docs/templates/plan.md](../templates/plan.md). Feldeinteilung:
- `status` – für den Filter
- `related` — Link ke Riset / ADR / Plan Lain
- `promoted_to` – Link zum ADR-Plan, der nicht gefördert wird

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

[INDEX.md](INDEX.md) Berisi Tabel Semua Plan.