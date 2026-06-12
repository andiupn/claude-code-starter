# Başlangıç Şablonu Claude — LITE Sürümü 🚀

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <strong>Türkçe</strong> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a>
</div>

<br />

<div align="center">
  <h3><strong>AI Mühendislerin yalnızca hesaplama gücüne değil, kurallara da ihtiyacı var.</strong></h3>
  <p><strong>3 temel aracı, 6 temel beceri ve önceden yapılandırılmış çalışma alanı kuralları içeren basit, başlangıç seviyesi dostu bir Claude Code çalışma alanı şablonu.</strong></p>

  <p>Dizin erişimi, gevşek bağlam ve karmaşık git işlemleri nedeniyle Claude CLI ile kavga etmeyi bırakın. Claude Code ile kullanılmak üzere tasarlandığı şekilde çalışın.</p>
</div>

> 📦 **andiupn** ([kuncimu.com](https://kuncimu.com)) tarafından hazırlanan ücretsiz şablon · [MIT + Atıf](LICENSE.md) kapsamında lisanslıdır  
> ☕ Yararlıysa, [bana bir kahve al](https://ko-fi.com/andiupn) · 🚀 Gelişmiş monorepolara mı ihtiyacınız var? [PRO sürümünü] deneyin(https://github.com/sponsors/andiupn?frequency=monthly)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
[![Patreon](https://img.shields.io/badge/Patreon-Support-f96854?logo=patreon)](https://patreon.com/AndiUpn)
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 💡 Sorun: Claude CLI'nin Dağınıklığı
Varsayılan olarak Claude Code CLI inanılmaz derecede hızlıdır. Ancak, önceden yapılandırılmış sanal alan oluşturma ve kurallar olmadan, sürekli olarak onay isteyecek, derinlemesine iç içe geçmiş yollarda kaybolacak ve ekibinizin çekme isteği iş akışını bozan karmaşık git taahhütleri oluşturacaktır.

---

## ⚡ Çözüm: Bozulmamış Claude Sandbox

### 1. 🤖 3 Uzman Otonom Temsilcisi
Sıradan bir chatbotla konuşmazsınız. Önceden yapılandırılmış, son derece uzmanlaşmış ve otonom yapay zeka aracılarından oluşan 3 ekibe sahip olursunuz:
- **`@code-reviewer`** — Kaydetmeden önce kod kalitenizi ve yapınızı inceler.
- **`@research-assistant`** — Uygun maliyetli Claude-3-Haiku üzerinde API belgelerini ve kitaplıklarını güvenli bir şekilde araştırır.
- **`@architecture-reviewer`** — Modülerliği ve yapısal tasarımı inceler.

### 2. ⚡ 6 Temel Beceri (Otomasyonlar)
Claude'un karmaşık geliştirme iş akışlarını anında yürütmesine olanak tanıyan kullanıma hazır iş akışları (`/skills`):
- `/git-workflow` — Yapılandırılmış taahhütler + otomatik güvenlik kontrolleri.
- `/context-handoff` — `/compact` çalıştırmadan önce etkin çalışma alanı içeriğini kaydeder.
- `/test-writer` & `/experiment-scaffold` — Mühendislik döngülerini hızlandırın.

### 3. 📂 Organize Çalışma Alanı Yapısı
Ana dosyalarınızı `src/`'de, AI kurallarınızı `.claude/`'de ve araştırmanızı `docs/`'de tutun. Claude Code sınırı anında bilir ve token bütçenizden tasarruf sağlar.

---

## 📊 LITE ve PRO: Premium Yükseltmesi

LITE sürümü 3 temsilci, 6 beceri ve 1 ön ayar ile sınırlıdır. Mesleki gelişim ve ajans düzeyindeki özellikler için:

| LITE (Ücretsiz) | PRO (1-5$) |
|---|---|
| 3 temsilci | 5 temsilci (+ planlayıcı, güvenlik incelemecisi) |
| 6 beceri | 17 beceri (+ bilgi yönetimi, yığın hata ayıklama vb.) |
| 1 ön ayar (genel) | 10 ön ayar (PHP, Node, Next.js, Flutter, RN, Yii, vb.) |
| 3 MCP sunucusu | 6 MCP sunucusu |
| Git kancası yok | Önceden yapılandırılmış Git kancaları (env-guard, tsc-check) |
| Basit yapı | Durum öncelikli çok projeli monorepo (`active/`, `staging/`, vb.) |

👉 **[GitHub Sponsorlarından PRO Sürümünü Alın](https://github.com/sponsors/andiupn?frequency=monthly)** · Tüm ayrıntılar: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Hızlı Başlangıç (3 Adım)

```bash
# 1. Setup environment
cp .env.example .env
# Edit .env and fill in your GITHUB_TOKEN

# 2. Setup permissions
cp .claude/settings.local.example.json .claude/settings.local.json
# Edit according to your OS (Linux/macOS/Windows)

# 3. Customize CLAUDE.md
# Replace {{PROJECT_NAME}} with your project's name
```

Bu klasörü Claude Code'da açın ve kodlamaya başlayın!

---

## 💖 Bu Projeyi Destekleyin (Bağışlar)

Bu şablon ücretsiz ve açık kaynaklıdır. Size yardımcı olduysa aşağıdakileri desteklemeyi düşünün:
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Kredi ve Atıf

Bu şablon **andiupn** tarafından oluşturulmuştur.
- 🌐 Web sitesi: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ E-posta: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**İlişkilendirme gereksinimi:** Bu şablonu yeniden dağıtırsanız veya çatallarsanız, lütfen bu kredi bloğunu `CLAUDE.md` ve `README.md` ([LICENSE.md](LICENSE.md) uyarınca) olarak saklayın.