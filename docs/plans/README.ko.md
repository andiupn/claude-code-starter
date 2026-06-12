# 계획 — 작업 기억

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <strong>한국어</strong> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>


폴더 초기화 **계획 구현** sebelum 코딩 디뮬라이. 투후안냐:
- Catat *bagaimana* sebuah fitur/리팩터링 akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat Implementasi(atau saat di-review setelahnya)
- 트레일 케푸투산: kenapa pendekatan A dipilih, bukan B

## Kapan Pakai 폴더 이니?

✅ **야, 심판 디 시니:**
- 사소한 구현 계획(>1 hari kerja)
- 리팩터링 계획 dengan banyak 파일 terdampak
- 마이그레이션 계획(데이터베이스, 프레임워크 버전, dsb)
- `Plan` 모드 / `architecture-reviewer` 출력

❌ **부칸 디 시니:**
- 사소한 작업 계획(잼 1개 미만) — cukup di TodoWrite
- Eksperimen / 스파이크 — itu masuk `experiments/`
- Riset eksplorasi → `docs/research/`
- 케푸투산 불변의 양하시일다리 계획 → `.claude/wiki/decisions/`

## 명명 규칙

```
PLAN-YYYYMMDD-<kebab-slug>.md
```

콘토: `PLAN-20260507-migrasi-laravel-12.md`

## 작업 흐름

```
1. Buat file        → /plan-new atau copy dari docs/templates/plan.md
2. Status: draft    → masih dirancang, belum disetujui
3. Status: active   → disetujui & sedang dieksekusi
4. Status: finalized → implementasi selesai, plan jadi historical record
5. Promote ADR      → ke .claude/wiki/decisions/ kalau ada keputusan immutable
6. Archive          → docs/plans/_archive/ jika >6 bulan tidak relevan
```

## 상태 흐름

| 상태 | 아르티 |
|---|---|
| `draft` | Masih dirancang, belum disetujui 계획 |
| `active` | 디세투주이 & 세단 디크세쿠시 계획 |
| `finalized` | Implementasi selesai, 계획 = 기록 |
| `superseded` | 디간티 플랜 바르(`superseded_by` 세트) |
| `archived` | 관련된 정보, 마숙 `_archive/` |

## 서문 Wajib

[docs/templates/plan.md](../templates/plan.md)를 참조하세요. 필드 펜팅:
- `status` — 필터 해제
- `related` — 링크 케 상승 / ADR / 계획 lain
- `promoted_to` — 링크 ke ADR kalau hasil plan dipromote

## 카라카리 플랜

```bash
# Plan draft/active (frontmatter-only, tidak false-positive ke README)
grep -rl "^status: draft\|^status: active" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Plan terkait tag tertentu
grep -rl "laravel" docs/plans/ | grep -v README.md | grep -v INDEX.md

# Lihat INDEX
cat docs/plans/INDEX.md
```

## 색인

[INDEX.md](INDEX.md) 다양한 계획을 세우세요.