# 研究 — ワーキングメモリ

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <strong>日本語</strong> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


フォルダー ini berisi **時間制限のあるエクスプロラシを設定**。 Tujuannya: シンパン散文とハシル リセット セバガイ アーティファク リポ寒天:
- ビサ ディルジュク ラギ サアト ケプトゥサン テルカイト ディペルタニヤカン
- Tidak hilang saat セッション AI ディリセット
- ビザ ディプロモシカン ケ `.claude/wiki/` 洞察力ニャ テルブクティ エバーグリーン

## カパンパカイフォルダーイニ?

✅ **そうだ、シンパン・ディ・シニ:**
- Komparasi ライブラリ/フレームワーク/ツール
- Eksplorasi API の動作
- 性能・コストを調査
- スパイクリセットセベラムアンビルケプトゥサン
- ハシル ダリ `@research-assistant`

❌ **Bukan di sini:**
- ケプトゥサン最終ヤン・スダ不変 → `.claude/wiki/decisions/` (ADR)
- 再利用可能なパターン → `.claude/wiki/patterns/`
- 陽常緑の教訓 → `.claude/wiki/learnings/`
- 計画の実行 → `docs/plans/`
- セッションコンテキストエフェメラル → `.claude/memory/`

## 命名規則

```
RES-YYYYMMDD-<kebab-slug>.md
```

コントー: `RES-20260507-react-query-vs-swr.md`

## ワークフロー

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## ステータスフロー

|ステータス |アルティ |アクション |
|---|---|---|
| __インライン_8__ |バル ディブアト、マシ コソン/セテンガ |ランジュット・イシ |
| __インライン_9__ |ライズじゃらん |調査結果を更新 |
| `finalized` |セレサイ、あなたの推薦 |ブアト ADR / トゥルナン計画 |
| `superseded` |スダ ディガンティカン リセット/ケプトゥサン バル | `superseded_by` を設定 |
| `archived` |ティダック関連のラギ |ピンダケ `_archive/` |

## フロントマター ワジブ

リハット [docs/templates/research.md](../templates/research.md)。フィールドペンティング:
- `id` — nama ファイルと一致する
- `status` — `grep` 経由でフィルターを解除する
- `related` — 相互参照 ADR / プランターカイト
- `promoted_to` — Wiki エントリのカラウ洞察を抜粋にリンクします

## カラカリライズト

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

## インデックス

[INDEX.md](INDEX.md) ベリシタベルセムアライズト。スキル `/research-new` (自動追加) を介して手動 atau を更新します。