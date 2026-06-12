# 計画 — ワーキングメモリ

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <strong>日本語</strong> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


フォルダは、セベラムコーディングディムライ**実装計画**を開始します。トゥジュアンニャ:
- Catat *bagaimana* sebuah Fitur/リファクタリング アカン ディケルジャカン、セベラム タンガン マスク
- Bisa dirujuk saatimplementasi (atau saat di-review setelahnya)
- トレイル・ケプトゥサン：ケナパ・ペンデカタンAディピリ、ブカンB

## カパンパカイフォルダーイニ?

✅ **そうだ、シンパン・ディ・シニ:**
- 実装計画は重要ではありません (>1 hari kerja)
- リファクタリング計画 dengan banyak ファイル terdampak
- 移行計画 (データベース、フレームワークのバージョン、DSB)
- `Plan` モード / `architecture-reviewer` から出力

❌ **Bukan di sini:**
- 簡単なタスクを計画する (<1 ジャム) — TodoWrite で実行する
- エクスペリメン / スパイク — itu masuk `experiments/`
- エクスプロラシをリセット → `docs/research/`
- ケプトゥサン不変陽ハシルダリ計画 → `.claude/wiki/decisions/`

## 命名規則

```
PLAN-YYYYMMDD-<kebab-slug>.md
```

コントー: `PLAN-20260507-migrasi-laravel-12.md`

## ワークフロー

```
1. Buat file        → /plan-new atau copy dari docs/templates/plan.md
2. Status: draft    → masih dirancang, belum disetujui
3. Status: active   → disetujui & sedang dieksekusi
4. Status: finalized → implementasi selesai, plan jadi historical record
5. Promote ADR      → ke .claude/wiki/decisions/ kalau ada keputusan immutable
6. Archive          → docs/plans/_archive/ jika >6 bulan tidak relevan
```

## ステータスフロー

|ステータス |アルティ |
|---|---|
| __インライン_6__ |計画マシディランチャン、ベラムディセトゥジュイ |
| __インライン_7__ |プランディセトゥジュイ＆セダンディエクセクシ |
| __インライン_8__ |セレサイの実施、計画 = 記録 |
| __インライン_9__ |ディガンティ プラン バル (セット `superseded_by`) |
| `archived` |ティダク関連、マスク `_archive/` |

## フロントマター ワジブ

Lihat [docs/templates/plan.md](../templates/plan.md)。フィールドペンティング:
- `status` — フィルターを解除する
- `related` — リンク ケ リセット / ADR / プラン レイン
- `promoted_to` — リンク ケ ADR カラウ ハシル プラン ディプロモート

## カラカリプラン

```bash
# Plan draft/active (frontmatter-only, tidak false-positive ke README)
grep -rl "^status: draft\|^status: active" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Plan terkait tag tertentu
grep -rl "laravel" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Lihat INDEX
cat docs/plans/INDEX.md
```

## インデックス

[INDEX.md](INDEX.md) ベリシ テーブル セムア プラン。