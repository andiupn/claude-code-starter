# 计划——工作记忆

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <strong>简体中文</strong> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <a href="README.ja.md">日本語</a> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a> | <a href="README.sv.md">Svenska</a> | <a href="README.ro.md">Română</a>
</div>
<br>


文件夹 ini berisi **计划实施** sebelum 编码 dimulai。图胡安尼亚：
- Catat *bagaimana* sebuah fitur/重构 akan dikerjakan, sebelum tangan masuk
- Bisa dirujuk saat Implementasi (atau saat di-review setelahnya)
- keputusan路线：kenapa pendekatan A diplih, bukan B

## Kapan Pakai 文件夹 Ini？

✅ **是的，简单地说：**
- 实施计划非常重要（>1 hari kerja）
- 重构计划 dengan banyak 文件 terdampak
- 迁移计划（数据库、框架版本、dsb）
- 输出 dari `Plan` 模式 / `architecture-reviewer`

❌ **不可以：**
- 计划简单的任务 (<1 jam) — cukup di TodoWrite
- Eksperimen / 穗 — itu masuk `experiments/`
- Riset eksplorasi → `docs/research/`
- Keputusan 不变的 yang hasil dari 计划 → `.claude/wiki/decisions/`

## 命名约定

__代码_块_0__

连续：`PLAN-20260507-migrasi-laravel-12.md`

## 工作流程

__代码_块_1__

## 状态流程

|状态 |阿尔蒂 |
|---|---|
| __内联_6__ |规划masih dirancang，belum disetujui |
| __内联_7__ |规划 disetujui 和 sedang dieksekusi |
| __内联_8__ |实施计划，计划=记录|
| __内联_9__ | Digianti 计划新（设置 `superseded_by`） |
| __内联_11__ |相关的，请参考 `_archive/` |

## Frontmatter 瓦吉布

Lihat [docs/templates/plan.md](../templates/plan.md)。现场喷漆：
- `status` — untuk 过滤器
- `related` — 链接 keriset/ADR/plan lain
- `promoted_to` — 链接 ke ADR kalau hasil plan dipromote

## 卡拉卡里计划

__代码_块_2__

## 索引

[INDEX.md](INDEX.md) berisi tabel semua 计划。