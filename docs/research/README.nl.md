# Onderzoek — Werkgeheugen

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <strong>Nederlands</strong> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


Folder ini berisi **riset exsplorasi yang tijdgebonden**. Tujuannya: eenvoudige proza's en hasil-riset sebagai artifak repo-agar:
- Als u een probleem heeft met het gebruik ervan
- Tidak hilang saat sessie AI direset
- Je kunt `.claude/wiki/` gebruiken als inzicht-nya terbukti evergreen

## Kapan Pakai-map Ini?

✅ **Ja, eenvoudigweg:**
- Komparasi-bibliotheek / raamwerk / tool
- Eksplorasi API-gedrag
- Onderzoek naar prestaties / kosten
- Spike stijgt sebelum ambil keputusan
- Hasil van `@research-assistant`

❌ **Aanbevolen:**
- Keputusan laatste yang sudah onveranderlijk → `.claude/wiki/decisions/` (ADR)
- Patroon herbruikbaar → `.claude/wiki/patterns/`
- Geleerde les yang groenblijvend → `.claude/wiki/learnings/`
- Implementatieplan → `docs/plans/`
- Sessiecontext kortstondig → `.claude/memory/`

## Naamgevingsconventie

```
RES-YYYYMMDD-<kebab-slug>.md
```

Contoh: `RES-20260507-react-query-vs-swr.md`

## Werkstroom

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## Statusstroom

| Staat | Arti | Actie |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Stijg jalan | Bevindingen bijwerken |
| `finalized` | Selesai, ada rekomendasi | Buat ADR / plan turunan |
| `superseded` | Sudah digantikan riset/keputusan baru | Stel `superseded_by` | in
| `archived` | Relevante informatie | Pinda ke `_archive/` |

## Frontzaak Wajib

Lihat [docs/templates/research.md](../templates/research.md). Veldpenting:
- `id` — match nama-bestand
- `status` — filter via `grep`
- `related` — kruisverwijzing naar ADR / plan terkait
- `promoted_to` — link naar wiki-invoer kalau inzicht di-extract

## Cara Cari stijgt op

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

[INDEX.md](INDEX.md) berisi tabel semua stijgen. Update handleiding atau via vaardigheid `/research-new` (automatisch toevoegen).