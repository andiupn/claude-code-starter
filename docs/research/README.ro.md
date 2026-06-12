# Cercetare — Memoria de lucru

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <strong>Română</strong>
</div>


Folder ini berisi **riset eksplorasi yang time-bound**. Tujuannya: simpan proses și hasil riset sebagai artifak repo agar:
- Bisa dirujuk lagi saat keputusan terkait dipertanyakan
- Tidak hilang saat session AI direset
- Bisa dipromosikan ke `.claude/wiki/` saat insight-nya terbukti evergreen

## Kapan Pakai Folder Ini?

✅ **Ya, simpan di sini:**
- Biblioteca / framework / instrument Komparasi
- Comportamentul API-ului Eksplorasi
- Investigati performanta/cost
- Spike riset sebelum ambil keputusan
- Hasil dari `@research-assistant`

❌ **Bukan di sini:**
- Keputusan final yang sudah imuabil → `.claude/wiki/decisions/` (ADR)
- Model reutilizabil → `.claude/wiki/patterns/`
- Lecția învățată yang evergreen → `.claude/wiki/learnings/`
- Plan de implementare → `docs/plans/`
- Contextul sesiunii efemer → `.claude/memory/`

## Convenția de denumire

```
RES-YYYYMMDD-<kebab-slug>.md
```

Contoh: `RES-20260507-react-query-vs-swr.md`

## Flux de lucru

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## Flux de stare

| Stare | Arti | Acțiune |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Riset jalan | Actualizați constatările |
| `finalized` | Selesai, ada rekomendasi | Buat ADR / plan turunan |
| `superseded` | Sudah digantikan riset/keputusan baru | Setați `superseded_by` |
| `archived` | Tidak relevan lagi | Pindah ke `_archive/` |

## Frontmatter Wajib

Lihat [docs/templates/research.md](../templates/research.md). Câmp petent:
- `id` — potriviți fișierul cu numele
- `status` — untuk filter via `grep`
- `related` — cross-ref ke ADR / plan terkait
- `promoted_to` — link la intrarea pe wiki kalau insight di-extract

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

[INDEX.md](INDEX.md) berisi tabel semua riset. Actualizați manualul atau prin abilitate `/research-new` (adăugați automat).