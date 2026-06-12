# Planlar — Çalışma Belleği

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <strong>Türkçe</strong> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


Klasörün başındaki **uygulama planı** kodlayıcı kodlamayı içerir. Tujuannya:
- Catat *bagaimana* sebuah fitur/refactor akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat uygulaması (atau saat di-review setelahnya)
- Trail keputusan: kenapa pendekatan A dipilih, bukan B

## Kapan Pakai Klasörü Girişi?

✅ **Evet, şunu yapın:**
- Önemsiz olmayan bir uygulama planı (>1 gün)
- Dosyayı yeniden düzenleme planı
- Geçiş planı (veritabanı, çerçeve sürümü, dsb)
- `Plan` modunda / `architecture-reviewer` çıktısı

❌ **Bukan di sini:**
- Önemsiz bir görev planlayın (<1 sıkışıklık) — TodoWrite'ı çalıştırın
- Eksperimen / spike — itu masuk `experiments/`
- Riset eksplorasi → `docs/research/`
- Değiştirilemez yang hasil dari planı → `.claude/wiki/decisions/`

## Adlandırma Kuralı

```
PLAN-YYYYMMDD-<kebab-slug>.md
```

Contoh: `PLAN-20260507-migrasi-laravel-12.md`

## İş Akışı

```
1. Buat file        → /plan-new atau copy dari docs/templates/plan.md
2. Status: draft    → masih dirancang, belum disetujui
3. Status: active   → disetujui & sedang dieksekusi
4. Status: finalized → implementasi selesai, plan jadi historical record
5. Promote ADR      → ke .claude/wiki/decisions/ kalau ada keputusan immutable
6. Archive          → docs/plans/_archive/ jika >6 bulan tidak relevan
```

## Durum Akışı

| Durum | Arti |
|---|---|
| `draft` | Plan masih dirancang, belum disetujui |
| `active` | Yemekleri ve yiyecekleri planlayın |
| `finalized` | Uygulama seçimi, plan = kayıt |
| `superseded` | Diganti planı baru (set `superseded_by`) |
| `archived` | İlgili bilgiler, masuk `_archive/` |

## Ön Madde Vacibi

Bu [belgeler/şablonlar/plan.md](../templates/plan.md). Saha penaltısı:
- `status` — filtreye göre
- `related` — yükseliş / ADR / plan bağlantısı
- `promoted_to` — ADR'nin iki aşamalı planına bağlantı

## Cara Cari Planı

```bash
# Plan draft/active (frontmatter-only, tidak false-positive ke README)
grep -rl "^status: draft\|^status: active" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Plan terkait tag tertentu
grep -rl "laravel" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Lihat INDEX
cat docs/plans/INDEX.md
```

## Dizin

[INDEX.md](INDEX.md) berisi tablo planı.