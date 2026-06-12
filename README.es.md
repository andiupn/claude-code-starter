# Plantilla inicial Claude - Edición LITE 🚀

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <strong>Español</strong> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>

<br />

<div align="center">
  <h3><strong>Los ingenieros de IA necesitan reglas, no solo potencia computacional.</strong></h3>
  <p><strong>Una plantilla de espacio de trabajo de Claude Code sencilla y fácil de usar para principiantes que incluye 3 agentes principales, 6 habilidades esenciales y reglas de espacio de trabajo preconfiguradas.</strong></p>

  <p>Deja de luchar contra Claude CLI por el acceso al directorio, el contexto suelto y las confirmaciones de git desordenadas. Trabaje con Claude Code de la forma en que fue diseñado para ser utilizado.</p>
</div>

> 📦 Plantilla gratuita de **andiupn** ([kuncimu.com](https://kuncimu.com)) · Con licencia [MIT + Atribución](LICENSE.md)  
> ☕ Si es útil, [cómprame un café](https://ko-fi.com/andiupn) · 🚀 ¿Necesitas monorepos avanzados? Pruebe la [versión PRO](https://github.com/sponsors/andiupn?frequency=monthly)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
[![Patreon](https://img.shields.io/badge/Patreon-Support-f96854?logo=patreon)](https://patreon.com/AndiUpn)
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 💡 El problema: el desorden de Claude CLI
De forma predeterminada, la CLI de Claude Code es increíblemente rápida. Sin embargo, sin reglas y zonas de pruebas preconfiguradas, solicitará confirmación continuamente, se perderá en rutas profundamente anidadas y creará confirmaciones de git desordenadas que arruinarán el flujo de trabajo de solicitud de extracción de su equipo.

---

## ⚡ La solución: Pristine Claude Sandbox

### 1. 🤖 3 Agentes Otonom especializados
No hablas con un chatbot genérico. Obtienes un equipo de 3 agentes de IA autónomos, altamente especializados y preconfigurados:
- **`@code-reviewer`**: revisa la calidad y la estructura de su código antes de las confirmaciones.
- **`@research-assistant`**: investiga bibliotecas y documentos API de forma segura en el rentable Claude-3-Haiku.
- **`@architecture-reviewer`** — Revisa la modularidad y el diseño estructural.

### 2. ⚡ 6 Habilidades Esenciales (Automatizaciones)
Flujos de trabajo listos para usar (`/skills`) que permiten a Claude ejecutar flujos de trabajo de desarrollo complejos al instante:
- `/git-workflow` — Confirmaciones estructuradas + controles de seguridad automatizados.
- `/context-handoff`: guarda el contexto del espacio de trabajo activo antes de ejecutar `/compact`.
- `/test-writer` y `/experiment-scaffold`: acelerar los ciclos de ingeniería.

### 3. 📂 Estructura del espacio de trabajo organizado
Mantenga sus archivos principales en `src/`, sus reglas de IA en `.claude/` y su investigación en `docs/`. Claude Code conoce instantáneamente los límites, lo que le permite ahorrar su presupuesto simbólico.

---

## 📊 LITE vs PRO: La actualización Premium

La versión LITE está limitada a 3 agentes, 6 habilidades y 1 preestablecido. Para desarrollo profesional y funciones a nivel de agencia:

| LITE (Gratis) | PRO ($1-5) |
|---|---|
| 3 agentes | 5 agentes (+ planificador, revisor de seguridad) |
| 6 habilidades | 17 habilidades (+ gestión del conocimiento, depuración de pila, etc.) |
| 1 preestablecido (genérico) | 10 ajustes preestablecidos (PHP, Node, Next.js, Flutter, RN, Yii, etc.) |
| 3 servidores MCP | 6 servidores MCP |
| Sin ganchos de git | Ganchos Git preconfigurados (env-guard, tsc-check) |
| Estructura sencilla | Monorepo multiproyecto con primer estado (`active/`, `staging/`, etc.) |

👉 **[Obtenga la edición PRO con patrocinadores de GitHub](https://github.com/sponsors/andiupn?frequency=monthly)** · Detalles completos: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Inicio rápido (3 pasos)

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

¡Abre esta carpeta en Claude Code y comienza a codificar!

---

## 💖 Apoye este proyecto (Donaciones)

Esta plantilla es gratuita y de código abierto. Si te ayudó, considera apoyar:
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Créditos y atribución

Esta plantilla es creada por **andiupn**.
- 🌐 Sitio web: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ Correo electrónico: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**Requisito de atribución:** Si redistribuye o bifurca esta plantilla, mantenga este bloque de crédito en `CLAUDE.md` y `README.md` (según [LICENSE.md](LICENSE.md)).