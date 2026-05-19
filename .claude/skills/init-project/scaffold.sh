#!/usr/bin/env bash
# scaffold.sh - Linux/macOS scaffolder for init-project skill
# Usage: bash scaffold.sh --project-name <name> --project-root <path> --preset <preset> --template-dir <dir> [options]

set -euo pipefail

# ─── Defaults ────────────────────────────────────────────────────────────────
PROJECT_NAME=""
PROJECT_ROOT=""
PRESET=""
TEMPLATE_DIR=""
SERVER_ROOT=""
DB_TYPE="none"
DB_DSN=""
DB_VERSION=""
NODE_PKG_MANAGER="npm"
MOBILE_PLATFORM="android"
PARENT_ROOT=""
NO_INHERIT=false
FORCE=false

# ─── Parse args ──────────────────────────────────────────────────────────────
while [[ $# -gt 0 ]]; do
    case "$1" in
        --project-name)    PROJECT_NAME="$2";    shift 2 ;;
        --project-root)    PROJECT_ROOT="$2";    shift 2 ;;
        --preset)          PRESET="$2";          shift 2 ;;
        --template-dir)    TEMPLATE_DIR="$2";    shift 2 ;;
        --server-root)     SERVER_ROOT="$2";     shift 2 ;;
        --db-type)         DB_TYPE="$2";         shift 2 ;;
        --db-dsn)          DB_DSN="$2";          shift 2 ;;
        --db-version)      DB_VERSION="$2";      shift 2 ;;
        --node-pkg-manager) NODE_PKG_MANAGER="$2"; shift 2 ;;
        --mobile-platform) MOBILE_PLATFORM="$2"; shift 2 ;;
        --parent-root)     PARENT_ROOT="$2";     shift 2 ;;
        --force)           FORCE=true;           shift 1 ;;
        --no-inherit)      NO_INHERIT=true;      shift 1 ;;
        --emit-multi-tool) EMIT_MULTI_TOOL=true;  shift 1 ;;
        --no-multi-tool)   EMIT_MULTI_TOOL=false; shift 1 ;;
        --yii-version)     YII_VERSION="$2";     shift 2 ;;
        --semble-package)  SEMBLE_PACKAGE="$2";  shift 2 ;;
        *) echo "Unknown arg: $1"; exit 1 ;;
    esac
done
EMIT_MULTI_TOOL="${EMIT_MULTI_TOOL:-true}"
YII_VERSION="${YII_VERSION:-}"
SEMBLE_PACKAGE="${SEMBLE_PACKAGE:-semble-mcp}"

# ─── Helpers ─────────────────────────────────────────────────────────────────
step()  { echo "  → $1"; }
ok()    { echo "  ✅ $1"; }
fail()  { echo "  ❌ $1"; exit 1; }

# Expand all {{KEY}} placeholder variables; receives content as $1, writes to stdout
expand_placeholders() {
    local content="$1"
    content="${content//\{\{PROJECT_NAME\}\}/$PROJECT_NAME}"
    content="${content//\{\{PROJECT_ROOT\}\}/$PROJECT_ROOT}"
    content="${content//\{\{PROJECT_TYPE\}\}/$PROJECT_TYPE}"
    content="${content//\{\{STACK_PRESET\}\}/$PRESET}"
    content="${content//\{\{FILESYSTEM_SCOPE\}\}/$FS_SCOPE}"
    content="${content//\{\{SERVER_ROOT\}\}/$SERVER_ROOT}"
    content="${content//\{\{LOG_DIR\}\}/$LOG_DIR}"
    content="${content//\{\{DB_TYPE\}\}/$DB_TYPE}"
    content="${content//\{\{DB_VERSION\}\}/$DB_VERSION}"
    content="${content//\{\{DB_DSN\}\}/$DB_DSN}"
    content="${content//\{\{NODE_PKG_MANAGER\}\}/$NODE_PKG_MANAGER}"
    content="${content//\{\{MOBILE_PLATFORM\}\}/$MOBILE_PLATFORM}"
    content="${content//\{\{DATE_INIT\}\}/$DATE_INIT}"
    content="${content//\{\{USER_HOME\}\}/$USER_HOME}"
    content="${content//\{\{COMPACT_THRESHOLD_PCT\}\}/$COMPACT_THRESHOLD_PCT}"
    content="${content//\{\{DISABLE_1M_CONTEXT\}\}/$DISABLE_1M_CONTEXT}"
    content="${content//\{\{PARENT_ROOT\}\}/$PARENT_ROOT}"
    content="${content//\{\{SEMBLE_PACKAGE\}\}/$SEMBLE_PACKAGE}"
    printf '%s' "$content"
}

# Write $2 to $1 with no BOM; creates parent dirs if needed
write_utf8_nobom() {
    local path="$1" content="$2"
    mkdir -p "$(dirname "$path")"
    printf '%s' "$content" > "$path"
}

# Join two path segments safely
resolve_template_path() {
    echo "${1%/}/${2#/}"
}

# Walk ancestor directories of $1 looking for .claude/scaffold.lock.json; prints path or empty
# Starts from the PARENT of $1 (not $1 itself) so we never find our own lock.
# Works even if $1 does not yet exist on disk.
find_parent_claude_root() {
    local cur
    cur="$(dirname "$1")"
    while [[ -n "$cur" && "$cur" != "/" ]]; do
        if [[ -f "$cur/.claude/scaffold.lock.json" ]]; then
            echo "$cur"
            return
        fi
        cur="$(dirname "$cur")"
    done
    echo ""
}

# Merge permissions from $2 JSON file into $1 JSON file additively; prints merged JSON
merge_json_additive() {
    local base_file="$1" overlay_file="$2"
    jq -s '
        .[0] as $base |
        .[1] as $frag |
        $base |
        .permissions.allow = (
            ($base.permissions.allow // []) + ($frag.permissions.allow // []) | unique
        ) |
        .permissions.additionalDirectories = (
            ($base.permissions.additionalDirectories // []) +
            ($frag.permissions.additionalDirectories // []) | unique
        )
    ' "$base_file" "$overlay_file"
}

# Insert or replace a <!-- BEGIN: key -->...<!-- END: key --> section in a file (Sprint 2+)
add_agents_section() {
    local file_path="$1" key="$2" section_content="$3"
    [[ -f "$file_path" ]] || return 0
    # Sprint 2+: implement anchor-based section replacement via python3
    :
}

# Recompute and rewrite the *Stats: ...* line in an AGENTS.md file (Sprint 2+)
update_agents_stats() {
    local file_path="$1"
    [[ -f "$file_path" ]] || return 0
    # Sprint 2+: implement stats line recomputation via python3
    :
}

# ─── Validate ────────────────────────────────────────────────────────────────
echo ""
echo "═══ scaffold.sh — $PRESET ═══"
echo ""

[[ -z "$PROJECT_NAME" ]]  && fail "Missing --project-name"
[[ -z "$PROJECT_ROOT" ]]  && fail "Missing --project-root"
[[ -z "$PRESET" ]]        && fail "Missing --preset"
[[ -z "$TEMPLATE_DIR" ]]  && fail "Missing --template-dir"

# Validate preset
case "$PRESET" in
    web-php-laragon|web-php-linux|web-node|web-nextjs|mobile-rn|mobile-flutter|generic|multi-project-root|web-yii-1|web-yii-2) ;;
    *) fail "Invalid preset: $PRESET. Valid: web-php-laragon web-php-linux web-node web-nextjs mobile-rn mobile-flutter generic multi-project-root web-yii-1 web-yii-2" ;;
esac

# Validate ServerRoot required for presets that need it
if [[ "$PRESET" == "web-php-linux" && -z "$SERVER_ROOT" ]]; then
    fail "Parameter --server-root wajib diisi untuk preset web-php-linux (contoh: /var/www/myapp)"
fi

# Check parent directory exists
PARENT_DIR="$(dirname "$PROJECT_ROOT")"
[[ -d "$PARENT_DIR" ]] || fail "Parent directory does not exist: $PARENT_DIR"

# Check no existing .claude unless --force
if [[ -d "$PROJECT_ROOT/.claude" ]] && [[ "$FORCE" == "false" ]]; then
    fail ".claude/ already exists at $PROJECT_ROOT. Use --force to overwrite."
fi

COMMON_DIR="$TEMPLATE_DIR/_common"
PRESET_DIR="$TEMPLATE_DIR/$PRESET"

[[ -d "$COMMON_DIR" ]] || fail "_common template not found: $COMMON_DIR"
[[ -d "$TEMPLATE_DIR" ]] || fail "Template directory not found: $TEMPLATE_DIR"

# ─── Check jq ────────────────────────────────────────────────────────────────
if ! command -v jq &>/dev/null; then
    fail "jq is required but not installed. Install: Ubuntu: apt install jq | macOS: brew install jq"
fi

# ─── Build variable map ──────────────────────────────────────────────────────
step "Building variable map..."

USER_HOME="${HOME:-/home/user}"
DATE_INIT="$(date +%Y-%m-%d)"
FS_SCOPE="./"

# Derive PROJECT_TYPE
case "$PRESET" in
    mobile-*)           PROJECT_TYPE="mobile" ;;
    web-*)              PROJECT_TYPE="web"    ;;
    multi-project-root) PROJECT_TYPE="multi-project-root" ;;
    *)                  PROJECT_TYPE="generic" ;;
esac

# Derive LOG_DIR
case "$PRESET" in
    web-php-laragon)    LOG_DIR="${SERVER_ROOT:-/opt/laragon}/logs" ;;
    web-php-linux)      LOG_DIR="/var/log/nginx" ;;
    web-node)           LOG_DIR="~/.pm2/logs" ;;
    web-nextjs)         LOG_DIR="${PROJECT_ROOT}/.next/trace" ;;
    mobile-rn)          LOG_DIR="adb logcat" ;;
    mobile-flutter)     LOG_DIR="flutter logs" ;;
    web-yii-1)          LOG_DIR="${PROJECT_ROOT}/protected/runtime" ;;
    web-yii-2)          LOG_DIR="${PROJECT_ROOT}/runtime/logs" ;;
    *)                  LOG_DIR="./logs" ;;
esac

# Default ServerRoot for Yii presets
if [[ ("$PRESET" == "web-yii-1" || "$PRESET" == "web-yii-2") && -z "$SERVER_ROOT" ]]; then
    SERVER_ROOT="D:/Server/laragon"
fi

COMPACT_THRESHOLD_PCT="50"
DISABLE_1M_CONTEXT="1"

# ─── Hierarchy detection ─────────────────────────────────────────────────────
DETECTED_PARENT=""
if [[ "$NO_INHERIT" == "false" && "$PRESET" != "multi-project-root" ]]; then
    if [[ -n "$PARENT_ROOT" ]]; then
        # Explicit parent provided — validate it
        if [[ -f "$PARENT_ROOT/.claude/scaffold.lock.json" ]]; then
            DETECTED_PARENT="$PARENT_ROOT"
        else
            echo "  WARNING: --parent-root '$PARENT_ROOT' specified but no .claude/scaffold.lock.json found. Ignoring."
        fi
    else
        found_parent="$(find_parent_claude_root "$PROJECT_ROOT")"
        if [[ -n "$found_parent" ]]; then
            DETECTED_PARENT="$found_parent"
        fi
    fi
fi

IS_CHILD=false
if [[ -n "$DETECTED_PARENT" ]]; then
    IS_CHILD=true
fi
PARENT_ROOT="$DETECTED_PARENT"

ok "Variables ready (PROJECT_NAME=$PROJECT_NAME, PRESET=$PRESET, is_child=$IS_CHILD)"

# ─── Create target dir ───────────────────────────────────────────────────────
step "Creating target directory: $PROJECT_ROOT"
mkdir -p "$PROJECT_ROOT"
ok "Target directory ready"

# ─── Helper: Substitute placeholders in file ─────────────────────────────────
substitute_file() {
    local src="$1" dst="$2"
    write_utf8_nobom "$dst" "$(expand_placeholders "$(cat "$src")")"
}

# ─── Helper: Process one template file ───────────────────────────────────────
process_file() {
    local src="$1"
    local dst="$2"

    if [[ "$src" == *.tmpl ]]; then
        # Strip .tmpl extension, substitute vars
        local dst_final="${dst%.tmpl}"
        substitute_file "$src" "$dst_final"
    else
        # Plain copy
        mkdir -p "$(dirname "$dst")"
        cp -f "$src" "$dst"
    fi
}

# ─── Helper: Copy entire directory tree ──────────────────────────────────────
copy_tree() {
    local src_dir="$1"
    local dst_dir="$2"

    find "$src_dir" -type f | while read -r src_file; do
        local basename
        basename="$(basename "$src_file")"
        # Skip internal scaffold files — not part of the project template
        [[ "$basename" == *.fragment ]] && continue
        [[ "$basename" == ".keep" ]] && continue
        # CHILD_NOTICE.md.tmpl is handled explicitly in Step 1.5 — skip in generic copy
        [[ "$basename" == "CHILD_NOTICE.md.tmpl" ]] && continue
        local rel="${src_file#$src_dir/}"
        local dst_file="$dst_dir/$rel"
        process_file "$src_file" "$dst_file"
    done
}

# ─── Step 1: Copy _common ────────────────────────────────────────────────────
step "Copying _common templates..."
copy_tree "$COMMON_DIR" "$PROJECT_ROOT"
ok "_common copied"

# ─── Step 1.5: Create .agent/ dirs + multi-tool stubs + child project handling ─
if [[ "$IS_CHILD" == "true" ]]; then
    step "Child project detected (inherits from: $DETECTED_PARENT)"
    # Remove AGENTS.md and .agent/ copied from _common — child inherits from parent
    if [[ -f "$PROJECT_ROOT/AGENTS.md" ]]; then
        rm -f "$PROJECT_ROOT/AGENTS.md"
        step "AGENTS.md removed (inherited from parent)"
    fi
    if [[ -d "$PROJECT_ROOT/.agent" ]]; then
        rm -rf "$PROJECT_ROOT/.agent"
        step ".agent/ removed (inherited from parent)"
    fi
    # Create CHILD_NOTICE.md from template
    CHILD_NOTICE_TMPL="$COMMON_DIR/.claude/CHILD_NOTICE.md.tmpl"
    if [[ -f "$CHILD_NOTICE_TMPL" ]]; then
        CHILD_NOTICE_CONTENT="$(cat "$CHILD_NOTICE_TMPL")"
        write_utf8_nobom "$PROJECT_ROOT/.claude/CHILD_NOTICE.md" "$(expand_placeholders "$CHILD_NOTICE_CONTENT")"
        ok "CHILD_NOTICE.md created"
    fi
    step ".agent/ creation: skipped (child project)"
    step "Multi-tool stubs: skipped (child project inherits from parent)"
else
    step "Creating .agent/ directory structure..."
    AGENT_BASE="$PROJECT_ROOT/.agent"
    for cat in config context decisions errors gotchas implementation learnings optimization patterns test; do
        mkdir -p "$AGENT_BASE/memory/entries/$cat"
    done
    mkdir -p "$AGENT_BASE/skills" "$AGENT_BASE/workflows"
    ok ".agent/ directory structure ready (10 memory categories)"

    SHOULD_EMIT_MULTI_TOOL=false
    if [[ "$EMIT_MULTI_TOOL" == "true" && "$PRESET" != "generic" ]]; then
        SHOULD_EMIT_MULTI_TOOL=true
    fi

    if [[ "$SHOULD_EMIT_MULTI_TOOL" == "true" ]]; then
        step "Creating multi-tool stub directories..."
        for stub in .ai .aiassistant .kiro .junie .qoder .trae .windsurf .codex; do
            mkdir -p "$PROJECT_ROOT/$stub"
        done
        mkdir -p "$PROJECT_ROOT/.cursor/rules"
        ok "Multi-tool stubs ready (.ai, .aiassistant, .cursor/rules, .kiro, .junie, .qoder, .trae, .windsurf, .codex)"
    else
        step "Multi-tool stubs: skipped (preset=$PRESET, emit_multi_tool=$EMIT_MULTI_TOOL)"
    fi

    AGENTS_MD="$PROJECT_ROOT/AGENTS.md"
    if [[ -f "$AGENTS_MD" ]]; then
        update_agents_stats "$AGENTS_MD"
        ok "AGENTS.md stats updated"
    fi
fi

# ─── Step 1.6: Ensure wiki subdirectories exist ──────────────────────────────
step "Creating .claude/wiki/ subdirectories..."
WIKI_BASE="$PROJECT_ROOT/.claude/wiki"
for wiki_sub in entities patterns gotchas decisions; do
    mkdir -p "$WIKI_BASE/$wiki_sub"
done
ok "wiki/ subdirectories ready (entities, patterns, gotchas, decisions)"
# Ensure .claude/memory/projects/ exists (for project-scoped memory)
mkdir -p "$PROJECT_ROOT/.claude/memory/projects"
ok "memory/projects/ subdir ready"

# ─── Step 2: Overlay preset ──────────────────────────────────────────────────
if [[ -d "$PRESET_DIR" ]] && [[ "$PRESET" != "generic" ]]; then
    step "Overlaying preset: $PRESET"
    copy_tree "$PRESET_DIR" "$PROJECT_ROOT"
    ok "Preset $PRESET overlaid"
else
    step "Preset: generic (no overlay files)"
fi

# ─── Step 2.5: Strip Semble MCP entry for generic and mobile-* presets ──────
MCP_JSON_PATH="$PROJECT_ROOT/.mcp.json"
if [[ -f "$MCP_JSON_PATH" ]]; then
    SHOULD_STRIP_SEMBLE=false
    if [[ "$PRESET" == "generic" ]] || [[ "$PRESET" == mobile-* ]]; then
        SHOULD_STRIP_SEMBLE=true
    fi
    if [[ "$SHOULD_STRIP_SEMBLE" == "true" ]] && command -v jq &>/dev/null; then
        STRIPPED="$(jq 'del(.mcpServers.semble)' "$MCP_JSON_PATH")"
        printf '%s' "$STRIPPED" > "$MCP_JSON_PATH"
        ok ".mcp.json: semble entry stripped for preset=$PRESET"
    fi
fi

# ─── Step 3: Merge settings.local.json fragment ──────────────────────────────
FRAGMENT_PATH="$PRESET_DIR/settings.local.json.fragment"
TARGET_SETTINGS="$PROJECT_ROOT/.claude/settings.local.json"

if [[ -f "$FRAGMENT_PATH" ]] && [[ -f "$TARGET_SETTINGS" ]]; then
    step "Merging settings.local.json fragment..."
    FRAG_TMP="$(mktemp)"
    write_utf8_nobom "$FRAG_TMP" "$(expand_placeholders "$(cat "$FRAGMENT_PATH")")"
    MERGED="$(merge_json_additive "$TARGET_SETTINGS" "$FRAG_TMP")"
    rm -f "$FRAG_TMP"
    printf '%s\n' "$MERGED" > "$TARGET_SETTINGS"
    ok "settings.local.json merged"
fi

# ─── Step 4: Git init ────────────────────────────────────────────────────────
step "Initializing git repository..."
if [[ ! -d "$PROJECT_ROOT/.git" ]]; then
    (
        cd "$PROJECT_ROOT"
        git init --initial-branch=main 2>/dev/null || git init 2>/dev/null
        git add .gitignore 2>/dev/null || true
        git commit -m "chore: initial scaffold via init-project ($PRESET)" 2>/dev/null || true
    )
    ok "Git repository initialized (branch: main)"
else
    step "Git repo already exists — skipping git init"
fi

# ─── Step 5: Write scaffold.lock.json ────────────────────────────────────────
step "Writing scaffold.lock.json..."

LOCK_PATH="$PROJECT_ROOT/.claude/scaffold.lock.json"
IS_MULTI_ROOT="false"
if [[ "$PRESET" == "multi-project-root" ]]; then IS_MULTI_ROOT="true"; fi
IS_CHILD_JSON="false"
if [[ "$IS_CHILD" == "true" ]]; then IS_CHILD_JSON="true"; fi
INHERITS_FROM_JSON="null"
PARENT_ROOT_JSON="null"
if [[ "$IS_CHILD" == "true" ]]; then
    INHERITS_FROM_JSON="\"$DETECTED_PARENT\""
    PARENT_ROOT_JSON="\"$DETECTED_PARENT\""
fi

jq -n \
  --arg scaffold_version "1.1" \
  --arg date "$DATE_INIT" \
  --arg preset "$PRESET" \
  --arg project_name "$PROJECT_NAME" \
  --arg project_root "$PROJECT_ROOT" \
  --argjson is_multi_project_root "$IS_MULTI_ROOT" \
  --argjson is_child "$IS_CHILD_JSON" \
  --argjson inherits_from "$INHERITS_FROM_JSON" \
  --argjson parent_root "$PARENT_ROOT_JSON" \
  --arg PROJECT_TYPE "$PROJECT_TYPE" \
  --arg FILESYSTEM_SCOPE "$FS_SCOPE" \
  --arg SERVER_ROOT "$SERVER_ROOT" \
  --arg LOG_DIR "$LOG_DIR" \
  --arg DB_TYPE "$DB_TYPE" \
  --arg DB_VERSION "$DB_VERSION" \
  --arg DB_DSN "$DB_DSN" \
  --arg NODE_PKG_MANAGER "$NODE_PKG_MANAGER" \
  --arg MOBILE_PLATFORM "$MOBILE_PLATFORM" \
  --arg USER_HOME "$USER_HOME" \
  --arg PARENT_ROOT "$PARENT_ROOT" \
  '{
    scaffold_version: $scaffold_version,
    date: $date,
    preset: $preset,
    project_name: $project_name,
    project_root: $project_root,
    is_multi_project_root: $is_multi_project_root,
    is_child: $is_child,
    inherits_from: $inherits_from,
    parent_root: $parent_root,
    variables: {
      PROJECT_NAME: $project_name,
      PROJECT_ROOT: $project_root,
      PROJECT_TYPE: $PROJECT_TYPE,
      STACK_PRESET: $preset,
      FILESYSTEM_SCOPE: $FILESYSTEM_SCOPE,
      SERVER_ROOT: $SERVER_ROOT,
      LOG_DIR: $LOG_DIR,
      DB_TYPE: $DB_TYPE,
      DB_VERSION: $DB_VERSION,
      DB_DSN: $DB_DSN,
      NODE_PKG_MANAGER: $NODE_PKG_MANAGER,
      MOBILE_PLATFORM: $MOBILE_PLATFORM,
      DATE_INIT: $date,
      USER_HOME: $USER_HOME,
      PARENT_ROOT: $PARENT_ROOT
    }
  }' > "$LOCK_PATH"

ok "scaffold.lock.json written (v1.1)"

# ─── Step 6: Verify no leftover placeholders ─────────────────────────────────
step "Verifying no leftover placeholders..."

LEFTOVER_FILES=$(grep -rl '{{[A-Z_]\+}}' "$PROJECT_ROOT/.claude/" "$PROJECT_ROOT/.mcp.json" "$PROJECT_ROOT/CLAUDE.md" 2>/dev/null || true)

if [[ -n "$LEFTOVER_FILES" ]]; then
    echo "  ⚠️  Leftover placeholders found in:"
    echo "$LEFTOVER_FILES" | while read -r f; do echo "     $f"; done
else
    ok "No leftover placeholders"
fi

# ─── Done ────────────────────────────────────────────────────────────────────
echo ""
echo "═══ Scaffold Complete ✅ ═══"
echo ""
echo "  Project : $PROJECT_NAME"
echo "  Path    : $PROJECT_ROOT"
echo "  Preset  : $PRESET"
echo ""
echo "  Next steps:"
echo "    1. cd $PROJECT_ROOT"
echo "    2. claude"
echo "    3. /validate-agent-config"
echo ""
