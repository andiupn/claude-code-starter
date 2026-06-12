# Modelo inicial Claude - Edição LITE 🚀

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <strong>Português (BR)</strong> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a>
</div>

<br />

<div align="center">
  <h3><strong>Engenheiros de IA precisam de regras, não apenas de poder computacional.</strong></h3>
  <p><strong>Um modelo de espaço de trabalho Claude Code simples e amigável para iniciantes, com 3 agentes principais, 6 habilidades essenciais e regras de espaço de trabalho pré-configuradas.</strong></p>

  <p>Pare de lutar contra Claude CLI por acesso ao diretório, contexto solto e commits confusos do git. Trabalhe com o Claude Code da maneira como ele foi projetado para ser usado.</p>
</div>

> 📦 Modelo gratuito de **andiupn** ([kuncimu.com](https://kuncimu.com)) · Licenciado sob [MIT + Atribuição](LICENSE.md)  
> ☕ Se for útil, [me compre um café](https://ko-fi.com/andiupn) · 🚀 Precisa de monorepos avançados? Experimente a [versão PRO](https://github.com/sponsors/andiupn?frequency=monthly)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
__EMBAIXO_1__
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
__EMBAIXO_3__
__EMBAIXO_4__
__EMBLEMA_5__

---

## 💡 O problema: a desordem de Claude CLI
Por padrão, a CLI do Claude Code é incrivelmente rápida. No entanto, sem regras e sandboxing pré-configurados, ele solicitará confirmação continuamente, se perderá em caminhos profundamente aninhados e criará commits git confusos que arruinarão o fluxo de trabalho de pull request da sua equipe.

---

## ⚡ A solução: Pristine Claude Sandbox

### 1. 🤖 3 Agentes Otonom Especializados
Você não fala com um chatbot genérico. Você obtém uma equipe de 3 agentes de IA pré-configurados, altamente especializados e autônomos:
- **`@code-reviewer`** — Revisa a qualidade e a estrutura do seu código antes de confirmar.
- **`@research-assistant`** — Pesquisa documentos e bibliotecas de API com segurança sobre o econômico Claude-3-Haiku.
- **`@architecture-reviewer`** — Revisa modularidade e projeto estrutural.

### 2. ⚡ 6 habilidades essenciais (automações)
Fluxos de trabalho prontos para uso (`/skills`) que permitem que Claude execute fluxos de trabalho de desenvolvimento complexos instantaneamente:
- `/git-workflow` — Commits estruturados + verificações de segurança automatizadas.
- `/context-handoff` — Salva o contexto do espaço de trabalho ativo antes de executar `/compact`.
- `/test-writer` e `/experiment-scaffold` — Acelere os ciclos de engenharia.

### 3. 📂 Estrutura organizada do espaço de trabalho
Mantenha seus arquivos principais em `src/`, suas regras de IA em `.claude/` e suas pesquisas em `docs/`. Claude Code conhece instantaneamente o limite, economizando seu orçamento de tokens.

---

## 📊 LITE vs PRO: a atualização premium

A versão LITE é limitada a 3 agentes, 6 habilidades e 1 predefinição. Para desenvolvimento profissional e recursos em nível de agência:

| LITE (grátis) | PRÓ (US$ 1-5) |
|---|---|
| 3 agentes | 5 agentes (+ planejador, revisor de segurança) |
| 6 habilidades | 17 habilidades (+ gestão de conhecimento, depuração de pilha, etc.) |
| 1 predefinição (genérica) | 10 predefinições (PHP, Node, Next.js, Flutter, RN, Yii, etc.) |
| 3 servidores MCP | 6 servidores MCP |
| Sem ganchos git | Ganchos Git pré-configurados (env-guard, tsc-check) |
| Estrutura simples | Monorepo multiprojeto de primeiro status (`active/`, `staging/`, etc.) |

👉 **[Obtenha a edição PRO nos patrocinadores do GitHub](https://github.com/sponsors/andiupn?frequency=monthly)** · Detalhes completos: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Início rápido (3 etapas)

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

Abra esta pasta no Claude Code e comece a codificar!

---

## 💖 Apoie este projeto (doações)

Este modelo é gratuito e de código aberto. Se isso ajudou você, considere apoiar:
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Créditos e Atribuição

Este modelo foi criado por **andiupn**.
- 🌐 Site: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ E-mail: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**Requisito de atribuição:** Se você redistribuir ou bifurcar este modelo, mantenha este bloco de crédito em `CLAUDE.md` e `README.md` (conforme [LICENSE.md](LICENSE.md)).