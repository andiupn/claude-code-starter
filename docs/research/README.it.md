# Ricerca: memoria di lavoro

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <strong>Italiano</strong> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


La cartella ini berisi **riset eksplorasi yang con limiti di tempo**. Tujuannya: prose simpan e hasil riset sebagai artifak repo agar:
- Bisa dirujuk lagi saat keputusan terkait dipertanyakan
- Non è possibile impostare la sessione AI direttamente
- Bisa promuove ke `.claude/wiki/` saat insight-nya terbukti evergreen

## Kapan Pakai Cartella Ini?

✅ **Ya, simpan di sini:**
- Libreria/framework/strumento Komparasi
- Comportamento dell'API esplorativa
- Investigasi prestazioni/costi
- Spike riset sebelum ambil keputusan
-Hasil dari `@research-assistant`

❌ **Bukan di sini:**
- Keputusan finale yang sudah immutabile → `.claude/wiki/decisions/` (ADR)
- Modello riutilizzabile → `.claude/wiki/patterns/`
- Lezione appresa yang sempreverde → `.claude/wiki/learnings/`
- Piano di implementazione → `docs/plans/`
- Contesto della sessione effimero → `.claude/memory/`

## Convenzione di denominazione

```
RES-YYYYMMDD-<kebab-slug>.md
```

Conto: `RES-20260507-react-query-vs-swr.md`

## Flusso di lavoro

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## Flusso dello stato

| Stato | Arti | Azione |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Riset jalan | Risultati dell'aggiornamento |
| `finalized` | Selesai, ada rekomendasi | Buat ADR / piano turunan |
| `superseded` | Sudah digantikan riset/keputusan baru | Imposta `superseded_by` |
| `archived` | Non importa cosa | Pindah ke `_archive/` |

## Frontmatter Wajib

Lihat [docs/templates/research.md](../templates/research.md). Pentazione sul campo:
- `id`: corrisponde al file nome
- `status` — seleziona il filtro tramite `grep`
- `related` — riferimento incrociato all'ADR/piano terkait
- `promoted_to` — link ke voce wiki kalau insight di-estrarre

##Cara Cari Risorgimento

__CODICE_BLOCCO_2__

## Indice

[INDEX.md](INDEX.md) berisi tabel semua riset. Aggiorna atau manuale tramite la competenza `/research-new` (aggiunta automatica).