# Plans – Mémoire de travail

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <strong>Français</strong> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


Dossier initial **plan de mise en œuvre** sebelum coding dimulai. Tujuannya :
- Catat *bagaimana* sebuah fitur/refactor akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat Implementasi (atau saat di-review setelahnya)
- Trail keputusan : kenapa pendekatan A dipilih, bukan B

## Dossier Kapan Pakai Ini ?

✅ **Ouais, simpan di sini :**
- Plan de mise en œuvre pour un ajustement non trivial (> 1 mois)
- Plan de refactorisation avec fichier banyak terdampak
- Plan de migration (base de données, version framework, dsb)
- Sortie en mode `Plan` / `architecture-reviewer`

❌ **Bukan di sini :**
- Planifier une tâche triviale (<1 jam) - récupération de TodoWrite
- Experimen / Spike — itu masuk `experiments/`
- Riset eksplorasi → `docs/research/`
- Keputusan immuable yang hasil dari plan → `.claude/wiki/decisions/`

## Convention de dénomination

```
PLAN-YYYYMMDD-<kebab-slug>.md
```

Contoh : `PLAN-20260507-migrasi-laravel-12.md`

## Flux de travail

```
1. Buat file        → /plan-new atau copy dari docs/templates/plan.md
2. Status: draft    → masih dirancang, belum disetujui
3. Status: active   → disetujui & sedang dieksekusi
4. Status: finalized → implementasi selesai, plan jadi historical record
5. Promote ADR      → ke .claude/wiki/decisions/ kalau ada keputusan immutable
6. Archive          → docs/plans/_archive/ jika >6 bulan tidak relevan
```

## Flux d'état

| Statut | Arti |
|---|---|
| `draft` | Plan masih dirancang, belum disetujui |
| `active` | Plan d'aménagement et de planification |
| `finalized` | Implémentation automatique, plan = enregistrement |
| `superseded` | Diganti plan baru (set `superseded_by`) |
| `archived` | Tidak pertinent, masuk `_archive/` |

## Frontmatter Wajib

Lihat [docs/templates/plan.md](../templates/plan.md). Penting sur le terrain :
- `status` — pour prendre le filtre
- `related` — lien ke Riset / ADR / plan lain
- `promoted_to` — lien ke ADR kalau hasil plan dipromote

## Plan Cara Cari

```bash
# Plan draft/active (frontmatter-only, tidak false-positive ke README)
grep -rl "^status: draft\|^status: active" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Plan terkait tag tertentu
grep -rl "laravel" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Lihat INDEX
cat docs/plans/INDEX.md
```

## Indice

[INDEX.md](INDEX.md) plan de travail du tableau de base.