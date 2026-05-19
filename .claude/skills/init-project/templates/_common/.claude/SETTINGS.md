# Settings & Permissions Configuration

## Architecture Overview

The workspace uses a two-level settings system:

- **`.claude/settings.json`** — Global project configuration (checked into git)
  - Shared across all team members
  - Platform-independent tools (file discovery, workspace access)
  - MCP server configurations

- **`.claude/settings.local.json`** — User-specific configuration (git-ignored)
  - Per-machine development tools (git, npm, python3)
  - Local file write permissions (scoped to .claude/ and experiments/)
  - Safety guardrails (deny destructive commands like `rm -rf`, `sudo`)

This separation ensures consistency across the team while respecting local development environments.

---

## Permissions: Categorized Summary

Permissions are grouped by purpose, not syntax. For the complete raw configuration, see `.claude/settings.json` and `.claude/settings.local.json`.

### **Category: Repository & Version Control**
- `Bash(git *)` — All git operations (clone, add, commit, push, pull, rebase, etc.)
- **Scope:** `.claude/settings.local.json` (platform-specific)
- **Rationale:** Core workflow tool for commits, branches, merges; all operations are safe within git context

### **Category: Shell & Runtime Execution**
- `Bash(python3 *)`, `Bash(node *)`, `Bash(npm *)` — Runtime command execution
- **Scope:** `.claude/settings.local.json` (user-specific tools)
- **Rationale:** Needed for running tests, experiments, build scripts; per-user to account for different setup paths

### **Category: File Discovery & Reading (Read-Only)**
- `Bash(find *)`, `Bash(ls *)`, `Bash(cat *)` — File system exploration
- `Glob(**)`, `Grep(**)` — Code search and pattern matching
- **Scope:** `.claude/settings.json` (safe globally)
- **Rationale:** No state modification; essential for code analysis, codebase understanding; safe to allow globally

### **Category: File System Operations (Limited Scope)**
- `Write(.claude/**)` — Create/modify workspace config and docs
- `Write(experiments/**)` — Create/modify temporary experiment files
- `Edit(.claude/**)` — Edit workspace configuration
- **Scope:** `.claude/settings.local.json` (careful scoping)
- **Rationale:** Write access only in controlled sandbox areas (.claude/ for workspace config, experiments/ for temporary work); prevents accidental modifications to root files

### **Category: System Information (Windows-Specific Diagnostics)**
- `Bash(powershell Get-Service*)`, `Bash(powershell Get-Process*)` — System inspection
- `Bash(powershell Get-Registry*)`, `Bash(wmic *)` — Registry and WMI queries
- `mcp__Windows-MCP__*` — Windows-specific tools (screenshot, snapshot, registry read)
- **Scope:** `.claude/settings.json` (read-only)
- **Rationale:** Read-only system diagnostics for debugging; safe for shared projects

### **Explicit Denies (Blocklist)**
- `Bash(rm -rf *)` — **BLOCKED.** Prevent recursive directory deletion
- `Bash(sudo *)` — **BLOCKED.** Prevent privilege escalation
- **Rationale:** Safety guardrails to prevent accidental destructive operations

### **Tools & MCP Permissions**
- `mcp__Windows-MCP__PowerShell` — PowerShell command execution (diagnostic only)
- `mcp__Windows-MCP__Snapshot`, `mcp__Windows-MCP__Screenshot` — Desktop automation
- `mcp__computer-use__*` — Computer use tools (click, type, scroll)
- **Scope:** `.claude/settings.json` (read-only tools)
- **Rationale:** Desktop automation for specific workflows; limited to safe operations

### **Computer Use Permissions (UI Automation)**

Full list of allowed `mcp__computer-use__*` tools in `.claude/settings.json`:

| Tool | Purpose |
|---|---|
| `screenshot` | Capture current screen state |
| `zoom` | Zoom into screen region |
| `double_click` | Double-click at coordinates |
| `left_click` | Single left-click |
| `right_click` | Context menu click |
| `triple_click` | Triple-click (select all text in field) |
| `type` | Type text into focused element |
| `key` | Send keyboard shortcut (e.g. Ctrl+C) |
| `scroll` | Scroll up/down/left/right |
| `mouse_move` | Move cursor to coordinates |
| `cursor_position` | Get current cursor position |
| `hold_key` | Hold modifier key during action |
| `wait` | Wait N milliseconds |
| `request_access` | Request application access (required before use) |
| `list_granted_applications` | List apps with granted access |
| `open_application` | Open/bring app to foreground |
| `read_clipboard` | Read current clipboard content |

**Access Tier System (Claude Code enforcement):**
- **Browsers** (Chrome, Edge, Firefox, Arc) → tier **"read"**: screenshots allowed, clicks/typing blocked. Use `mcp__claude-in-chrome__*` for browser interaction.
- **Terminals & IDEs** (Terminal, VS Code, JetBrains) → tier **"click"**: left-click allowed, typing/right-click blocked. Use Bash tool for shell commands.
- **All other apps** → tier **"full"**: no restrictions.

**Usage pattern:** Always call `request_access` with the app list BEFORE any interaction. Tier is returned in the response.

**Not included (rarely needed):** `left_click_drag`, `left_mouse_down`, `left_mouse_up`, `middle_click`, `write_clipboard`, `switch_display`, `computer_batch`. Add via `/update-config` if needed.

---

## Environment Variables

### **GITHUB_TOKEN (REQUIRED)**
- **Purpose:** Authenticate with GitHub MCP server for repository operations
- **Where to get:** [GitHub Settings → Developer settings → Personal access tokens](https://github.com/settings/tokens)
- **Scopes needed:** `repo` (full read/write access to repositories)
- **How to set:**
  1. Create `.env` file from `.env.example` template
  2. Fill in `GITHUB_TOKEN=your_token_here`
  3. Reload terminal: `source .env` or open new terminal
  4. Verify: `echo $GITHUB_TOKEN` (should show your token, not empty)
- **Error if missing:** "MCP server 'github' won't start" or "GITHUB_TOKEN not found"

### **OPENAI_API_KEY (Optional)**
- **Purpose:** Use OpenAI models alongside Claude
- **Scope:** Optional; only if integrating OpenAI services
- **Setup:** Uncomment in `.env.example`, fill in your key, reload terminal

### **DEBUG (Optional)**
- **Purpose:** Enable verbose logging for Claude Code CLI
- **Values:** `0` (off, default) or `1` (on)
- **Setup:** Uncomment in `.env.example`, set value, reload terminal

---

## Common Errors & Fixes

### **Error: "Permission denied: Bash(git \*)"**
**Problem:** Trying to run git command but permission not granted
**Cause:** `git` permission not in `.claude/settings.local.json` allow list
**Fix:**
1. Open `.claude/settings.local.json`
2. Check `permissions.allow` array includes `"Bash(git *)"`
3. If missing, add it: `"Bash(git *)"`
4. Reload Claude Code CLI

**Prevention:** Keep git permission once added; it's essential for commits/pushes

---

### **Error: "GITHUB_TOKEN not found" or "MCP server github won't start"**
**Problem:** GitHub MCP server fails to start because token is missing
**Cause:** `.env` file missing or `GITHUB_TOKEN` env var not set
**Fix:**
1. Create `.env` file from `.env.example`: `cp .env.example .env`
2. Edit `.env`, fill in `GITHUB_TOKEN=your_github_personal_access_token_here`
3. Reload terminal: `source .env` or open new terminal window
4. Verify: `echo $GITHUB_TOKEN` (should print your token)

**Prevention:** Use `.env.example` template; follow setup instructions in file

---

### **Error: "Cannot write to file: Permission denied"**
**Problem:** Trying to create/edit file but write permission denied
**Cause:** File path not in `Write()` allow list scope
**Fix:**
1. Check which file you're trying to write: is it in `.claude/` or `experiments/`?
2. If in `.claude/` → check `.claude/settings.local.json` has `"Write(.claude/**)"`
3. If in `experiments/` → check has `"Write(experiments/**)"`
4. If in root or elsewhere → file path not whitelisted for writing
5. To add new write path: use `/update-config` skill to request permission

**Prevention:** Write permissions scoped to `.claude/` and `experiments/` only; root files protected

---

### **Error: "Bash command not allowed" or "Permission denied for Bash(npm install)"**
**Problem:** Trying to run bash command but pattern not in allow list
**Cause:** Specific bash pattern not explicitly allowed in settings
**Fix:**
1. Identify the exact command: `npm install`, `python3 setup.py`, etc.
2. Use `/update-config` skill to request permission addition
3. Provide: command pattern, rationale, intended scope
4. System will add to allow list after approval

**Prevention:** File a note in `.claude/memory/MEMORY.md` for recurring patterns you need

---

### **Error: "Read access denied to .env"**
**Problem:** Trying to read `.env` file but denied
**Cause:** `.env` file contains secrets; explicitly denied by design
**Fix:**
- **Expected behavior** — `.env` is read-only by Claude for security
- Use `/update-config` only if you need `GITHUB_TOKEN` value for debugging
- Better approach: check `echo $GITHUB_TOKEN` in terminal instead

**Prevention:** Never commit `.env` to git; use `.env.example` as template only

---

## Adding New Permissions

When you need a new permission (tool, bash command, or file access):

1. **Identify the scope:**
   - Is it read or write?
   - What files/commands does it affect?
   - Is it local-only or shared?

2. **Use `/update-config` skill** to request permission addition

3. **Provide details:**
   - Command/tool pattern: `Bash(npm test)` or `mcp__Windows-MCP__PowerShell`
   - Rationale: Why you need this permission
   - Scope: `.claude/settings.json` (shared) or `.claude/settings.local.json` (local)

4. **Example request:**
   ```
   Need to run integration tests, so requesting:
   - Bash(npm run test:integration)
   - In: .claude/settings.local.json
   - Rationale: Run integration test suite before commit
   ```

5. **Update this SETTINGS.md** after permission is added (document in "Categorized Summary")

---

## Security Principles

1. **Least Privilege:** Only grant the minimum permissions needed for your task
2. **Scoped Permissions:** File write access limited to `.claude/` and `experiments/`; root files protected
3. **Read-Only by Default:** Reading files allowed broadly; writing restricted to sandboxes
4. **Explicit Allows:** All tools and commands require explicit permission; no implicit trust
5. **No Secrets in Settings:** Environment variables (like `GITHUB_TOKEN`) use `.env` file, not checked into git
6. **Audit Trail:** Permission changes logged; use `/update-config` for transparency

---

## Custom Themes (April 2026)

Claude Code supports custom color themes:

- **Theme files location:** `~/.claude/themes/<name>.json`
- **Switch theme:** `/theme <name>` command in Claude Code session
- **Create theme:** Define color palette in JSON format, save to themes directory
- **Purpose:** Cosmetic only — no effect on model behavior or permissions

---

## Related Documentation

- **Getting Started with Permissions:** See [README.md](../README.md) → Quick Start section
- **Environment Setup:** See [.env.example](../.env.example) for template
- **Permission Examples:** See `.claude/settings.json` and `.claude/settings.local.json` for raw configuration
- **Troubleshooting:** See [CLAUDE.md](../CLAUDE.md) → Troubleshooting section for common issues
