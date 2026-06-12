# スターター テンプレート クロード — LITE 版 🚀

<div align="center">
  <a href="README.md">English</a> | <a href="README.id.md">Bahasa Indonesia</a> | <a href="README.zh.md">简体中文</a> | <a href="README.hi.md">हिन्दी</a> | <a href="README.fr-ca.md">Français (CA)</a> | <a href="README.de.md">Deutsch</a> | <a href="README.fr.md">Français</a> | <a href="README.pt-br.md">Português (BR)</a> | <a href="README.vi.md">Tiếng Việt</a> | <a href="README.pl.md">Polski</a> | <strong>日本語</strong> | <a href="README.ko.md">한국어</a> | <a href="README.es.md">Español</a> | <a href="README.tr.md">Türkçe</a> | <a href="README.it.md">Italiano</a> | <a href="README.ru.md">Русский</a> | <a href="README.uk.md">Українська</a> | <a href="README.nl.md">Nederlands</a>
</div>

<br />

<div align="center">
  <h3><strong>AI エンジニアには計算能力だけではなく、ルールが必要です。</strong></h3>
  <p><strong>3 つのコア エージェント、6 つの必須スキル、事前設定されたワークスペース ルールを備えた、シンプルで初心者向けのクロード コード ワークスペース テンプレート。</strong></p>

  <p>ディレクトリ アクセス、曖昧なコンテキスト、厄介な git コミットをめぐって Claude CLI と争うのはやめてください。クロード コードを使用するように設計された方法で操作します。</p>
</div>

> 📦 **andiupn** による無料テンプレート ([kuncimu.com](https://kuncimu.com)) · [MIT + 表示](LICENSE.md) に基づいてライセンスされています  
> ☕ 役に立ったら、[コーヒーを買ってきてください](https://ko-fi.com/andiupn) · 🚀 高度なモノリポジトリが必要ですか? [PRO バージョン](https://github.com/sponsors/andiupn?frequency=monthly) をお試しください

__バッジ_0__
__バッジ_1__
__バッジ_2__
__バッジ_3__
__バッジ_4__
__バッジ_5__

---

## 💡 問題: Claude CLI の乱雑さ
デフォルトでは、Claude Code CLI は信じられないほど高速です。ただし、事前に構成されたサンドボックスとルールがないと、継続的に確認を求められ、深くネストされたパスで迷子になり、チームのプル リクエスト ワークフローを台無しにする乱雑な git コミットが作成されます。

---

## ⚡ 解決策: Pristine Claude サンドボックス

### 1. 🤖 3 つの特化したotonom エージェント
一般的なチャットボットとは会話しません。事前に構成された 3 つの高度に専門化された自律型 AI エージェントのチームが得られます。
- **`@code-reviewer`** — コミットする前にコードの品質と構造をレビューします。
- **`@research-assistant`** — 費用対効果の高い Claude-3-Haiku で API ドキュメントとライブラリを安全に調査します。
- **`@architecture-reviewer`** — モジュール性と構造設計をレビューします。

### 2. ⚡ 6 つの必須スキル (自動化)
クロードが複雑な開発ワークフローを即座に実行できるようにする、すぐに使えるワークフロー (`/skills`):
- `/git-workflow` — 構造化されたコミット + 自動化された安全性チェック。
- `/context-handoff` — `/compact` を実行する前にアクティブなワークスペース コンテキストを保存します。
- `/test-writer` および `/experiment-scaffold` — エンジニアリング サイクルを加速します。

### 3. 📂 整理されたワークスペース構造
メイン ファイルは `src/` に、AI ルールは `.claude/` に、リサーチは `docs/` に保管してください。クロード コードは境界を即座に認識し、トークンの予算を節約します。

---

## 📊 LITE vs PRO: プレミアムアップグレード

LITE バージョンは、エージェント 3 人、スキル 6 つ、プリセット 1 つに制限されています。専門能力開発および代理店レベルの機能:

|ライト（無料） |プロ (1 ～ 5 ドル) |
|---|---|
| 3 エージェント | 5 人のエージェント (+ プランナー、セキュリティレビュー担当者) |
| 6つのスキル | 17 のスキル (+ ナレッジ管理、スタック デバッグなど) |
| 1 プリセット (汎用) | 10 個のプリセット (PHP、Node、Next.js、Flutter、RN、Yii など) |
| 3 MCP サーバー | 6 MCP サーバー |
| git フックなし |事前設定された Git フック (env-guard、tsc-check) |
|シンプルな構造 |ステータス優先のマルチプロジェクト モノリポジトリ (`active/`、`staging/` など) |

👉 **[GitHub スポンサーで PRO エディションを入手](https://github.com/sponsors/andiupn?frequency=monthly)** · 詳細: [COMPARISON.md](COMPARISON.md)

---

## 🚀 クイックスタート (3 ステップ)

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

Claude Code でこのフォルダーを開いてコーディングを開始してください。

---

## 💖 このプロジェクトをサポートする (寄付)

このテンプレートは無料でオープンソースです。それが役に立った場合は、次のサポートを検討してください。
- **Ko-fi:** [ko-fi.com/andiupn](https://ko-fi.com/andiupn)
- **Patreon:** [patreon.com/AndiUpn](https://patreon.com/AndiUpn)
- **Trakteer:** [trakteer.id/andi_upn/gift](https://trakteer.id/andi_upn/gift)
- **サウェリア:** [saweria.co/andiupn](https://saweria.co/andiupn)

---

## 🤝 クレジットと帰属

このテンプレートは **andiupn** によって作成されました。
- 🌐 ウェブサイト: [kuncimu.com](https://kuncimu.com)
- 💻 GitHub: [github.com/andiupn](https://github.com/andiupn)
- ✉️ メール: [andi.upn@gmail.com](mailto:andi.upn@gmail.com)

**帰属要件:** このテンプレートを再配布またはフォークする場合は、このクレジット ブロックを `CLAUDE.md` および `README.md` に保存してください ([LICENSE.md](LICENSE.md) に従って)。