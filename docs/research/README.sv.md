# Forskning — Arbetsminne

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <strong>Svenska</strong> | <a href="README.ro.md">Română</a>
</div>


Mapp ini berisi **riset explosi yang tidsbestämd**. Tujuannya: simpan process & hasil riset sebagai artifak repo agar:
- Bisa dirujuk lagi saat keputusan terkait dipertanyakan
- Tidak hilang saat session AI direset
- Bisa dipromosikan ke `.claude/wiki/` saat insight-nya terbukti evergreen

## Kapan Pakai Folder Ini?

✅ **Ja, simpan di sini:**
- Komparasi bibliotek / ramverk / verktyg
- Eksplorasi API-beteende
- Undersökningsprestanda / kostnad
- Spike riset sebelum ambil keputusan
- Hasil dari `@research-assistant`

❌ **Bukan di sini:**
- Keputusan final yang sudah oföränderlig → `.claude/wiki/decisions/` (ADR)
- Mönster kan återanvändas → `.claude/wiki/patterns/`
- Lärdom yang vintergrön → `.claude/wiki/learnings/`
- Planera genomförandet → `docs/plans/`
- Sessionskontext tillfällig → `.claude/memory/`

## Namnkonvention

```
RES-YYYYMMDD-<kebab-slug>.md
```

Contoh: `RES-20260507-react-query-vs-swr.md`

## Arbetsflöde

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## Statusflöde

| Status | Arti | Åtgärd |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Riset jalan | Uppdatera resultat |
| `finalized` | Selesai, ada rekomendasi | Buat ADR / plan turunan |
| `superseded` | Sudah digantikan riset/keputusan baru | Ställ in `superseded_by` |
| `archived` | Tidak relevant lagi | Pindah ke `_archive/` |

## Frontmatter Wajib

Lihat [docs/templates/research.md](../templates/research.md). Fält hängande:
- `id` — matcha nama-fil
- `status` — till filter via `grep`
- `related` — cross-ref ke ADR / plan terkait
- `promoted_to` — länk ke wiki-inlägg kalau insikt di-extrakt

## Cara Cari Riset

```bash
# Semua riset draft/active (frontmatter-only, tidak false-positive ke README)
grep -rl "^status: draft\|^status: active" docs/research/ | grep -v README.md | grep -v INDEX.md

# Semua riset finalized
grep -rl "^status: finalized" docs/research/ | grep -v README.md

# Riset dengan tag tertentu
grep -rl "flutter" docs/research/ | grep -v README.md | grep -v INDEX.md

# Lihat INDEX
cat docs/research/INDEX.md
```

## Index

[INDEX.md](INDEX.md) berisi tabell semua riset. Uppdatera manuell atau via färdighet `/research-new` (lägg till automatiskt).