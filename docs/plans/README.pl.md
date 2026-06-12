# Plany — pamięć robocza

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <strong>Polski</strong> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


Folder ini berisi **plan implementasi** sebelum kodowanie dimulai. Tujuannya:
- Catat *bagaimana* sebuah fitur/refactor akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat implementasi (atau saat di-review setelahnya)
- Szlak keputusan: kenapa pendekatan A dipilih, bukan B

## Kapan Pakai Folder Ini?

✅ **Tak, proste:**
- Plan wdrożenia nietrywialny (>1 hari kerja)
- Plan refaktoryzacji z plikiem terdampak
- Plan migracji (baza danych, wersja frameworka, dsb)
- Wyjście w trybie `Plan` / `architecture-reviewer`

❌ **Bukan di sini:**
- Zaplanuj banalne zadanie (<1 jam) — cukup di TodoWrite
- Eksperyment / kolec — itu masuk `experiments/`
- Rozpocznij eksplorację → `docs/research/`
- Keputusan niezmienny plan yang hasil dari → `.claude/wiki/decisions/`

## Konwencja nazewnictwa

__KOD_BLOKU_0__

Konto: `PLAN-20260507-migrasi-laravel-12.md`

## Przepływ pracy

__KOD_BLOKU_1__

## Przepływ stanu

| Stan | Arti |
|---|---|
| `draft` | Zaplanuj masih dirancang, belum disetujui |
| `active` | Planuj disetujui i sedang dieksekusi |
| `finalized` | Implementasi selesai, plan = rekord |
| `superseded` | Diganti plan baru (zestaw `superseded_by`) |
| `archived` | Ważne informacje, mask `_archive/` |

## Frontmater Wajib

Otwórz [docs/templates/plan.md](../templates/plan.md). Penting w terenie:
- `status` — filtr
- `related` — link keriset / ADR / plan lain
- `promoted_to` — link do planu ADR kalau hasil dipromote

## Plan Cara Cari

__KOD_BLOKU_2__

## Indeks

[INDEX.md](INDEX.md) zawiera tabelę całego planu.