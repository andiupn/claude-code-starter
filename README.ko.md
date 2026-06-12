# 스타터 템플릿 Claude — LITE 에디션 🚀

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <strong>한국어</strong> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>

<div align="center">
  <h3><strong>AI 엔지니어에게는 계산 능력뿐만 아니라 규칙도 필요합니다.</strong></h3>
  <p><strong>핵심 상담원 3명, 필수 기술 6개, 사전 구성된 작업 공간 규칙을 갖춘 간단하고 초보자 친화적인 Claude Code 작업 공간 템플릿입니다.</strong></p>

  <p>디렉터리 액세스, 느슨한 컨텍스트, 지저분한 git 커밋을 두고 Claude CLI와 싸우지 마세요. Claude Code를 원래 사용하도록 설계된 방식으로 작업하세요.</p>
</div>

> 📦 **andiupn**([kuncimu.com](https://kuncimu.com))의 무료 템플릿 · [MIT + Attribution](LICENSE.md)에 따라 라이선스가 부여됨  
> ♥ 도움이 되셨다면 [커피 사주세요](https://ko-fi.com/andiupn) · 🚀 고급 모노레포가 필요하신가요? [PRO 버전](https://github.com/sponsors/andiupn?frequency=monthly)을 사용해 보세요.

__배지_0__
__배지_1__
__배지_2__
__배지_3__
__배지_4__
__배지_5__

---

## 💡 문제: Claude CLI의 혼란
기본적으로 Claude Code CLI는 엄청나게 빠릅니다. 그러나 사전 구성된 샌드박스 및 규칙이 없으면 지속적으로 확인을 요청하고 깊게 중첩된 경로에서 길을 잃으며 팀의 끌어오기 요청 워크플로를 망치는 지저분한 git 커밋을 생성합니다.

---

## ⚡ 솔루션: Pristine Claude Sandbox

### 1. 🤖 3명의 전문 오토놈 요원
일반적인 챗봇과 대화하지 않습니다. 사전 구성되고 고도로 전문화된 자율 AI 에이전트 3개로 구성된 팀이 구성됩니다.
- **`@code-reviewer`** — 커밋하기 전에 코드 품질과 구조를 검토합니다.
- **`@research-assistant`** — 비용 효율적인 Claude-3-Haiku에서 API 문서와 라이브러리를 안전하게 연구합니다.
- **`@architecture-reviewer`** — 모듈성과 구조 설계를 검토합니다.

### 2. ⚡ 6가지 필수 기술(자동화)
Claude가 복잡한 개발 작업 흐름을 즉시 실행할 수 있게 해주는 즉시 사용 가능한 작업 흐름(`/skills`):
- `/git-workflow` — 구조화된 커밋 + 자동화된 안전 확인.
- `/context-handoff` — `/compact`을 실행하기 전에 활성 작업 공간 컨텍스트를 저장합니다.
- `/test-writer` 및 `/experiment-scaffold` — 엔지니어링 주기를 가속화합니다.

### 3. 📂 정리된 작업 공간 구조
주요 파일은 `src/`에, AI 규칙은 `.claude/`에, 연구는 `docs/`에 보관하세요. Claude Code는 경계를 즉시 파악하여 토큰 예산을 절약합니다.

---

## 📊 LITE 대 PRO: 프리미엄 업그레이드

LITE 버전은 에이전트 3명, 스킬 6개, 프리셋 1개로 제한됩니다. 전문성 개발 및 대행사 수준 기능의 경우:

| 라이트(무료) | 프로($1-5) |
|---|---|
| 에이전트 3명 | 상담원 5명(+기획자, 보안 검토자) |
| 6가지 스킬 | 17가지 스킬(+ 지식 관리, 스택 디버깅 등) |
| 사전 설정 1개(일반) | 10가지 사전 설정(PHP, Node, Next.js, Flutter, RN, Yii 등) |
| 3개의 MCP 서버 | 6개의 MCP 서버 |
| 자식 후크 없음 | 사전 구성된 Git 후크(env-guard, tsc-check) |
| 간단한 구조 | 상태 우선 다중 프로젝트 모노레포(`active/`, `staging/` 등) |

👉 **[GitHub 스폰서에서 PRO 버전 받기](https://github.com/sponsors/andiupn?frequency=monthly)** · 전체 세부정보: [COMPARISON.md](COMPARISON.md)

---

## 🚀 빠른 시작(3단계)

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

Claude Code에서 이 폴더를 열고 코딩을 시작해 보세요!

---

## 💖 이 프로젝트를 후원하세요(기부)

이 템플릿은 무료이며 오픈 소스입니다. 도움이 되었다면 다음을 지원해 보세요.
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **트랙터:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **사웨리아:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 크레딧 및 저작자 표시

이 템플릿은 **andiupn**에 의해 생성되었습니다.
- 🌐 홈페이지: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ 이메일: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**저작자 표시 요구 사항:** 이 템플릿을 재배포하거나 포크하는 경우 이 크레딧 블록을 `CLAUDE.md` 및 `README.md`([LICENSE.md](LICENSE.md)에 따라)에 유지하세요.