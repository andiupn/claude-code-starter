# Szablon startowy Claude — edycja LITE 🚀

<div align="center">
  <strong>Angielski</strong> | <a href="README.id.md">Bahasa Indonezja</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (Kalifornia)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Francja</a> | <a href="README.pt-br.md">Portugalski (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a>
</div>

<br />

<div align="center">
  <h3><strong>Inżynierowie AI potrzebują reguł, a nie tylko mocy obliczeniowej.</strong></h3>
  <p><strong>Prosty, przyjazny dla początkujących szablon obszaru roboczego Claude Code zawierający 3 głównych agentów, 6 podstawowych umiejętności i wstępnie skonfigurowane reguły obszaru roboczego.</strong></p>

  <p>Przestań walczyć z Claudem CLI o dostęp do katalogów, luźny kontekst i niechlujne zatwierdzenia git. Pracuj z Claude Code w sposób, w jaki został zaprojektowany.</p>
</div>

> 📦 Bezpłatny szablon autorstwa **andiupn** ([kuncimu.com](https://kuncimu.com)) · Licencja na podstawie [MIT + Uznanie autorstwa](LICENSE.md)  
> ☕ Jeśli to przydatne, [kup mi kawę](https://ko-fi.com/andiupn) · 🚀 Potrzebujesz zaawansowanych monorepo? Wypróbuj [wersję PRO](https://github.com/sponsors/andiupn?frequency=monthly)

__ODZNACZKA_0__
__ODZNACZKA_1__
__ODZNACZKA_2__
__ODZNACZKA_3__
__ODZNACZKA_4__
__ODZNACZKA_5__

---

## 💡 Problem: bałagan w Claude CLI
Domyślnie interfejs CLI Claude Code jest niesamowicie szybki. Jednak bez wstępnie skonfigurowanego piaskownicy i reguł będzie stale prosić o potwierdzenie, gubić się w głęboko zagnieżdżonych ścieżkach i tworzyć niechlujne zatwierdzenia git, które psują przepływ pracy Twojego zespołu.

---

## ⚡ Rozwiązanie: nieskazitelna piaskownica Claude'a

### 1. 🤖 3 wyspecjalizowanych agentów Otonom
Nie rozmawiasz z typowym chatbotem. Otrzymujesz zespół 3 wstępnie skonfigurowanych, wysoce wyspecjalizowanych i autonomicznych agentów AI:
- **`@code-reviewer`** — Sprawdza jakość i strukturę kodu przed zatwierdzeniem.
- **`@research-assistant`** — Bezpiecznie przeszukuje dokumenty API i biblioteki w ekonomicznym Claude-3-Haiku.
- **`@architecture-reviewer`** — Ocenia modułowość i konstrukcję konstrukcyjną.

### 2. ⚡ 6 podstawowych umiejętności (automatyzacja)
Gotowe do użycia przepływy pracy (`/skills`), które pozwalają Claude'owi natychmiastowo wykonywać złożone procesy programistyczne:
- `/git-workflow` — Zatwierdzenia strukturalne + automatyczne kontrole bezpieczeństwa.
- `/context-handoff` — zapisuje kontekst aktywnego obszaru roboczego przed uruchomieniem `/compact`.
- `/test-writer` i `/experiment-scaffold` — Przyspiesz cykle inżynieryjne.

### 3. 📂 Zorganizowana struktura przestrzeni roboczej
Trzymaj swoje główne pliki w `src/`, reguły AI w `.claude/`, a swoje badania w `docs/`. Claude Code natychmiast zna granicę, oszczędzając Twój budżet tokenowy.

---

## 📊 LITE kontra PRO: Aktualizacja Premium

Wersja LITE jest ograniczona do 3 agentów, 6 umiejętności i 1 ustawienia wstępnego. W przypadku rozwoju zawodowego i funkcji na poziomie agencji:

| LITE (bezpłatny) | PRO (1-5 USD) |
|---|---|
| 3 agentów | 5 agentów (+ planista, recenzent bezpieczeństwa) |
| 6 umiejętności | 17 umiejętności (+ zarządzanie wiedzą, debugowanie stosu itp.) |
| 1 ustawienie wstępne (ogólne) | 10 presetów (PHP, Node, Next.js, Flutter, RN, Yii itp.) |
| 3 serwery MCP | 6 serwerów MCP |
| Brak haków git | Wstępnie skonfigurowane hooki Git (env-guard, tsc-check) |
| Prosta konstrukcja | Monorepo wieloprojektowe o statusie pierwszym (`active/`, `staging/` itd.) |

👉 **[Pobierz wersję PRO od sponsorów GitHub](https://github.com/sponsors/andiupn?frequency=monthly)** · Pełne informacje: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Szybki start (3 kroki)

__KOD_BLOKU_0__

Otwórz ten folder w Claude Code i zacznij kodować!

---

## 💖 Wesprzyj ten projekt (darowizny)

Ten szablon jest bezpłatny i ma open source. Jeśli Ci to pomogło, rozważ wsparcie:
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
– **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Kredyty i uznanie

Ten szablon został stworzony przez **andiupn**.
- 🌐 Strona internetowa: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ E-mail: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**Wymóg uznania autorstwa:** Jeśli będziesz rozpowszechniać lub rozpowszechniać ten szablon, zachowaj tę blokadę kredytową w `CLAUDE.md` i `README.md` (zgodnie z [LICENSE.md](LICENSE.md)).