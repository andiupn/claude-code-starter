# Mẫu khởi đầu Claude — Phiên bản LITE 🚀

<div align="center">
  <strong>Tiếng Anh</strong> | <a href="README.id.md">Tiếng Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Pháp</a> | <a href="README.pt-br.md">Bồ Đào Nha (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a>
</div>

<br />

<div align="center">
  <h3><strong>Các kỹ sư AI cần các quy tắc, không chỉ là sức mạnh tính toán.</strong></h3>
  <p><strong>Mẫu không gian làm việc Claude Code đơn giản, thân thiện với người mới bắt đầu bao gồm 3 tác nhân cốt lõi, 6 kỹ năng cần thiết và quy tắc không gian làm việc được định cấu hình trước.</strong></p>

  <p>Hãy ngừng đấu tranh với Claude CLI về quyền truy cập thư mục, bối cảnh lỏng lẻo và các cam kết git lộn xộn. Làm việc với Claude Code theo cách nó được thiết kế để sử dụng.</p>
</div>

> 📦 Mẫu miễn phí của **andiupn** ([kuncimu.com](https://kuncimu.com)) · Được cấp phép theo [MIT + Attribution](LICENSE.md)  
> ☕ Nếu hữu ích, [mua cho tôi một ly cà phê](https://ko-fi.com/andiupn) · 🚀 Bạn cần monorepos nâng cao? Hãy thử [phiên bản PRO](https://github.com/sponsors/andiupn?frequency=monthly)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)
[![GitHub release](https://img.shields.io/github/v/release/andiupn/claude-code-starter)](https://github.com/andiupn/claude-code-starter/releases)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-Support-ff5f5f?logo=ko-fi)](https://ko-fi.com/andiupn)
[![Patreon](https://img.shields.io/badge/Patreon-Support-f96854?logo=patreon)](https://patreon.com/AndiUpn)
[![Trakteer](https://img.shields.io/badge/Trakteer-Support-red?logo=trakteer)](https://trakteer.id/andi_upn/gift)
[![Saweria](https://img.shields.io/badge/Saweria-Support-yellow?logo=saweria)](https://saweria.co/andiupn)

---

## 💡 Vấn đề: Sự lộn xộn của Claude CLI
Theo mặc định, Claude Code CLI cực kỳ nhanh. Tuy nhiên, nếu không có quy tắc và hộp cát được định cấu hình trước, nó sẽ liên tục yêu cầu xác nhận, lạc vào các đường dẫn được lồng sâu và tạo ra các cam kết git lộn xộn làm hỏng quy trình yêu cầu kéo của nhóm bạn.

---

## ⚡ Giải pháp: Sandbox Claude nguyên sơ

### 1. 🤖 3 Đại Lý Otonom Chuyên Dụng
Bạn không nói chuyện với một chatbot chung chung. Bạn có một nhóm gồm 3 tác nhân AI tự chủ, có chuyên môn cao và được cấu hình sẵn:
- **`@code-reviewer`** — Xem lại chất lượng và cấu trúc mã của bạn trước khi xác nhận.
- **`@research-assistant`** — Nghiên cứu tài liệu và thư viện API một cách an toàn trên Claude-3-Haiku, tiết kiệm chi phí.
- **`@architecture-reviewer`** — Đánh giá tính mô-đun và thiết kế kết cấu.

### 2. ⚡ 6 Kỹ năng cần thiết (Tự động hóa)
Quy trình công việc sẵn sàng sử dụng (`/skills`) cho phép Claude thực hiện ngay lập tức các quy trình phát triển phức tạp:
- `/git-workflow` — Cam kết có cấu trúc + kiểm tra an toàn tự động.
- `/context-handoff` — Lưu bối cảnh không gian làm việc đang hoạt động trước khi chạy `/compact`.
- `/test-writer` & `/experiment-scaffold` — Đẩy nhanh chu trình kỹ thuật.

### 3. 📂 Cấu trúc không gian làm việc có tổ chức
Lưu giữ các tệp chính của bạn trong `src/`, các quy tắc AI của bạn trong `.claude/` và nghiên cứu của bạn trong `docs/`. Claude Code ngay lập tức biết ranh giới, tiết kiệm ngân sách mã thông báo của bạn.

---

## 📊 LITE vs PRO: Bản nâng cấp cao cấp

Phiên bản LITE được giới hạn ở 3 đặc vụ, 6 kỹ năng và 1 cài đặt trước. Đối với các tính năng phát triển chuyên nghiệp và cấp đại lý:

| LITE (Miễn phí) | CHUYÊN NGHIỆP ($1-5) |
|---|---|
| 3 đại lý | 5 đại lý (+ người lập kế hoạch, người đánh giá bảo mật) |
| 6 kỹ năng | 17 kỹ năng (+ quản lý kiến ​​thức, gỡ lỗi ngăn xếp, v.v.) |
| 1 cài đặt trước (chung) | 10 cài đặt trước (PHP, Node, Next.js, Flutter, RN, Yii, v.v.) |
| 3 máy chủ MCP | 6 máy chủ MCP |
| Không có móc git | Móc Git được cấu hình sẵn (env-guard, tsc-check) |
| Cấu trúc đơn giản | Monorepo đa dự án trạng thái đầu tiên (`active/`, `staging/`, v.v.) |

👉 **[Nhận phiên bản PRO trên Nhà tài trợ GitHub](https://github.com/sponsors/andiupn?frequency=monthly)** · Chi tiết đầy đủ: [COMPARISON.md](COMPARISON.md)

---

## 🚀 Bắt đầu nhanh (3 bước)

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

Mở thư mục này trong Claude Code và bắt đầu viết mã!

---

## 💖 Hỗ trợ dự án này (Quyên góp)

Mẫu này là miễn phí và mã nguồn mở. Nếu nó giúp ích cho bạn, hãy cân nhắc hỗ trợ:
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **Saweria:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 Tín dụng & Ghi công

Bản mẫu này được tạo bởi **andiupn**.
- 🌐 Trang web: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ Email: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**Yêu cầu ghi công:** Nếu bạn phân phối lại hoặc phân nhánh mẫu này, vui lòng giữ khối tín dụng này trong `CLAUDE.md` và `README.md` (theo [LICENSE.md](LICENSE.md)).