# 연구 — 작업 기억

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <strong>한국어</strong> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


폴더 ini berisi **riset eksplorasi yang time-bound**. Tujuannya: simpan proses & hasilriset sebagai artifak repo agar:
- Bisa dirujuk lagi saat keputusan terkait dipertanyakan
- Tidak hilang saat 세션 AI 다이렉트
- Bisa dipromosikan ke `.claude/wiki/` saat Insight-nya terbukti Evergreen

## Kapan Pakai 폴더 이니?

✅ **야, 심판 디 시니:**
- Komparasi 라이브러리/프레임워크/도구
- Eksplorasi API 동작
- 성능/비용 조사
- 스파이크 라이즈 세벨룸 암빌 케푸투산
- 하실 다리 `@research-assistant`

❌ **부칸 디 시니:**
- Keputusan 최종 양 수다 불변 → `.claude/wiki/decisions/` (ADR)
- 재사용 가능한 패턴 → `.claude/wiki/patterns/`
- 양상록수에서 배운 교훈 → `.claude/wiki/learnings/`
- 계획 구현하기 → `docs/plans/`
- 세션 컨텍스트 임시 → `.claude/memory/`

## 명명 규칙

```
RES-YYYYMMDD-<kebab-slug>.md
```

콘토: `RES-20260507-react-query-vs-swr.md`

## 작업 흐름

```
1. Buat file        → /research-new atau copy dari docs/templates/research.md
2. Status: draft    → masih dikerjakan
3. Status: active   → riset jalan, belum disimpulkan
4. Status: finalized → ada rekomendasi, siap diturunkan ke plan/ADR
5. Promote insight  → ke .claude/wiki/ jika evergreen
6. Archive          → docs/research/_archive/ jika >6 bulan tidak dirujuk
```

## 상태 흐름

| 상태 | 아르티 | 액션 |
|---|---|---|
| `draft` | Baru dibuat, masih kosong/setengah | 란주트 이시 |
| `active` | 리셋 잘란 | 결과 업데이트 |
| `finalized` | Selesai, ada rekomendasi | Buat ADR / 계획 투루난 |
| `superseded` | 수다 디간티칸 라이즈/케푸투산 바루 | `superseded_by` 설정 |
| `archived` | Tidak 관련 라기 | 핀다 님 `_archive/` |

## 서문 Wajib

[docs/templates/research.md](../templates/research.md)에 문의하세요. 필드 펜팅:
- `id` — 이름 파일 일치
- `status` — `grep`을 통해 필터 해제
- `related` — 상호 참조 ADR / 계획 terkait
- `promoted_to` — 링크 ke wiki 항목 kalau 통찰력 di-extract

## 카라카리 리세트

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

## 색인

[INDEX.md](INDEX.md) berisi tabel semuariset. `/research-new` 기술을 통해 수동 atau를 업데이트합니다(자동 추가).