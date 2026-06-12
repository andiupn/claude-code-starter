# Recherche — Mémoire de travail

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <strong>Français</strong> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


Dossier ini berisi **riset eksplorasi yang limité dans le temps**. Tujuannya : proses simpan et hasil Riset sebagai artifak repo agar :
- Bisa dirujuk lagi saat keputusan terkait dipertanyakan
- Tidak hilang saat session AI direset
- Bisa dipromosikan ke `.claude/wiki/` saat insight-nya terbukti evergreen

## Dossier Kapan Pakai Ini ?

✅ **Ouais, simpan di sini :**
- Bibliothèque / framework / outil Komparasi
- Comportement de l'API Eksplorasi
- Performance/coût de l'enquête
- Spike Riset Sebelum Ambil Keputusan
- Hasil dari `@research-assistant`

❌ **Bukan di sini :**
- Keputusan final yang sudah immuable → `.claude/wiki/decisions/` (ADR)
- Motif réutilisable → `.claude/wiki/patterns/`
- Leçon apprise yang à feuilles persistantes → `.claude/wiki/learnings/`
- Plan de mise en œuvre → `docs/plans/`
- Contexte de session éphémère → `.claude/memory/`

## Convention de dénomination

```
RES-YYYYMMDD-<kebab-slug>.md
```

Contoh : `RES-20260507-react-query-vs-swr.md`

## Flux de travail

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## Flux d'état

| Statut | Arti | Actions |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Riset Jalan | Mettre à jour les résultats |
| `finalized` | Selesai, ada recomendasi | Buat ADR / plan turunan |
| `superseded` | Sudah digantikan Riset/keputusan baru | Définir `superseded_by` |
| `archived` | Tidak pertinent lagi | Pindah ke `_archive/` |

## Frontmatter Wajib

Lihat [docs/templates/research.md](../templates/research.md). Penting sur le terrain :
- `id` — correspond au fichier nom
- `status` — pour filtrer via `grep`
- `related` — réf. croisée ke ADR / plan terkait
- `promoted_to` — lien vers l'entrée wiki kalau insight di-extract

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

## Indice

[INDEX.md](INDEX.md) voici un tableau qui se lit. Mettre à jour le manuel via la compétence `/research-new` (ajout automatique).