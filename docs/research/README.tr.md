# Araştırma — Çalışma Belleği

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <strong>Türkçe</strong> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


Klasör açılır **zamana bağlı olarak yükselir**. Tujuannya: basit proses ve hasil yükselişi sebagai artifak repo agar:
- Bisa dirujuk lagi saat keputusan terkait dipertanyakan
- Tidak hilang saat oturumu AI direktifi
- `.claude/wiki/` saat içgörü-nya terbukti evergreen'de bir dipromosikan var

## Kapan Pakai Klasörü Girişi?

✅ **Evet, şunu yapın:**
- Komparasi kütüphanesi / çerçeve / araç
- Eksplorasi API davranışı
- Performans / maliyet araştırması
- Spike Riset Sebelum Ambil Keputusan
- Hasil dari `@research-assistant`

❌ **Bukan di sini:**
- Değişmez final yang suda → `.claude/wiki/decisions/` (ADR)
- Desen yeniden kullanılabilir → `.claude/wiki/patterns/`
- Alınan ders yang evergreen → `.claude/wiki/learnings/`
- Planın uygulanması → `docs/plans/`
- Oturum bağlamı geçici → `.claude/memory/`

## Adlandırma Kuralı

```
RES-YYYYMMDD-<kebab-slug>.md
```

Contoh: `RES-20260507-react-query-vs-swr.md`

## İş Akışı

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## Durum Akışı

| Durum | Arti | Eylem |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | Lanjut isi |
| `active` | Riset jalan | Bulguları güncelle |
| `finalized` | Selesai, tavsiye edilenler | Buat ADR / plan turu |
| `superseded` | Yeniliklerin artması/beklenmesi/beklenmesi | `superseded_by` ayarlayın |
| `archived` | İlgili bilgiler | `_archive/` |

## Ön Madde Vacibi

Bu [belgeler/şablonlar/araştırma.md](../templates/research.md). Saha penaltısı:
- `id` — isim dosyasıyla eşleşir
- `status` — `grep` aracılığıyla filtreyi etkinleştir
- `related` — ADR'ye çapraz başvuru / iptal planı
- `promoted_to` — wiki girişine bağlantı ve içgörü özeti

## Cara Cari Yükselişi

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

## Dizin

[INDEX.md](INDEX.md) berisi tablo yükselişi. Kılavuzu veya `/research-new` (otomatik ekleme) becerisini kullanarak güncelleyin.