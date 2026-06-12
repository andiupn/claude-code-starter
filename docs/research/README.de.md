# Forschung – Arbeitsgedächtnis

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <strong>Deutsch</strong> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


Ordner ini berisi **riset eksplorasi yang time-bound**. Tujuannya: Simpan Proses & Hasil Riset Sebagai Artifak Repo Agar:
- Bisa dirujuk lagi saat keputusan terkait dipertanyakan
- Tidak hilang saat session AI direset
- Bisa dipromosika ke `.claude/wiki/` mit Insight-nya terbukti evergreen

## Kapan Pakai Ordner Ini?

✅ **Ja, simpan di sini:**
- Bibliothek/Framework/Tool vergleichen
- Eksplorasi-API-Verhalten
- Untersuchung von Leistung/Kosten
- Spike-Riset-Sebelum-Ambil-Keputusan
- Hasil von `@research-assistant`

❌ **Mehr als nur:**
- Keputusan final yang sudah unveränderlich → `.claude/wiki/decisions/` (ADR)
- Muster wiederverwendbar → `.claude/wiki/patterns/`
- Lektion gelernt Yang Evergreen → `.claude/wiki/learnings/`
- Umsetzung planen → `docs/plans/`
- Sitzungskontext kurzlebig → `.claude/memory/`

## Namenskonvention

```
RES-YYYYMMDD-<kebab-slug>.md
```

Contoh: `RES-20260507-react-query-vs-swr.md`

## Arbeitsablauf

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## Statusfluss

| Status | Arti | Aktion |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Riset jalan | Ergebnisse aktualisieren |
| `finalized` | Selesai, ada rekomendasi | Buat ADR / Plan Turunan |
| `superseded` | Sudah digantikan riset/keputusan baru | Legen Sie `superseded_by` | fest
| `archived` | Wichtige Informationen | Pindah ke `_archive/` |

## Frontmatter Wajib

Lihat [docs/templates/research.md](../templates/research.md). Feldeinteilung:
- `id` – Nama-Datei abgleichen
- `status` – zum Filtern über `grep`
- `related` – Querverweis auf ADR / Plan Terkait
- `promoted_to` – Verknüpfen Sie den Wiki-Eintrag mit Insight Di-Extract

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

[INDEX.md](INDEX.md) Die Tabelle wurde vor Kurzem aktualisiert. Aktualisieren Sie die manuelle Aktualisierung über den Skill `/research-new` (automatisch anhängen).