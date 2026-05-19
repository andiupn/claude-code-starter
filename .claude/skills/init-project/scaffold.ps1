#!/usr/bin/env pwsh
# scaffold.ps1 - Windows scaffolder for init-project skill (PS5.1 compatible)
# Usage: scaffold.ps1 -ProjectName <name> -ProjectRoot <path> -Preset <preset> -TemplateDir <dir> [options]

param(
    [Parameter(Mandatory=$true)][string]$ProjectName,
    [Parameter(Mandatory=$true)][string]$ProjectRoot,
    [Parameter(Mandatory=$true)][ValidateSet('web-php-laragon','web-php-linux','web-node','web-nextjs','mobile-rn','mobile-flutter','generic','multi-project-root','web-yii-1','web-yii-2')][string]$Preset,
    [Parameter(Mandatory=$true)][string]$TemplateDir,
    [string]$ServerRoot = "",
    [string]$DbType = "none",
    [string]$DbDsn = "",
    [string]$DbVersion = "",
    [string]$NodePkgManager = "npm",
    [string]$MobilePlatform = "android",
    [string]$ParentRoot = "",
    [switch]$Force,
    [switch]$NoInherit,
    [switch]$EmitMultiTool = $true,
    [string]$YiiVersion = "",
    [string]$SemblePackage = "semble-mcp"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# --- Helpers ------------------------------------------------------------------

function Write-Step([string]$msg) { Write-Host "  -> $msg" -ForegroundColor Cyan }
function Write-OK([string]$msg)   { Write-Host "  OK $msg" -ForegroundColor Green }
function Write-Fail([string]$msg) { Write-Host "  FAIL $msg" -ForegroundColor Red; exit 1 }

function Norm([string]$p) { return $p.Replace('\','/') }

# Expand all {{KEY}} placeholders in $content using the $vars map (must be set before call)
function Expand-Placeholders([string]$content) {
    foreach ($key in $vars.Keys) {
        $content = $content.Replace("{{$key}}", $vars[$key])
    }
    return $content
}

# Write $content to $path with UTF-8 NoBOM encoding; creates parent directory if missing
function Write-Utf8NoBom([string]$path, [string]$content) {
    $parent = Split-Path $path -Parent
    if (-not (Test-Path $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }
    [System.IO.File]::WriteAllText($path, $content, [System.Text.UTF8Encoding]::new($false))
}

# Safe 2-arg Join-Path wrapper — PS5.1 does not support 3+ path args in one call
function Resolve-TemplatePath([string]$base, [string]$rel) {
    return Join-Path $base $rel
}

# Walk ancestor directories of $start looking for .claude/scaffold.lock.json
# Starts from the PARENT of $start (not $start itself) so we never find our own lock.
# Works even if $start does not yet exist on disk.
function Find-ParentClaudeRoot([string]$start) {
    # Begin scan from the parent of the target path
    $cur = Split-Path $start -Parent
    if (-not $cur) { return $null }
    while ($cur) {
        $lockFile = Join-Path (Join-Path $cur ".claude") "scaffold.lock.json"
        if (Test-Path $lockFile) { return $cur }
        $parent = Split-Path $cur -Parent
        if ((-not $parent) -or ($parent -eq $cur)) { return $null }
        $cur = $parent
    }
    return $null
}

# Merge $overlay permissions into $base PSObject additively (allow + additionalDirectories)
function Merge-JsonAdditive([PSCustomObject]$base, [PSCustomObject]$overlay) {
    if ($null -eq $overlay.PSObject.Properties["permissions"]) { return $base }
    $overlayPerms = $overlay.permissions
    if ($null -ne $overlayPerms.PSObject.Properties["allow"]) {
        $existing = @($base.permissions.allow)
        $toAdd    = @($overlayPerms.allow | Where-Object { $existing -notcontains $_ })
        $base.permissions.allow = $existing + $toAdd
    }
    if ($null -ne $overlayPerms.PSObject.Properties["additionalDirectories"]) {
        $existDirsRaw = $base.permissions.additionalDirectories
        if ($null -ne $existDirsRaw) { $existDirs = @($existDirsRaw) } else { $existDirs = @() }
        $toAdd = @($overlayPerms.additionalDirectories | Where-Object { $existDirs -notcontains $_ })
        $base.permissions.additionalDirectories = $existDirs + $toAdd
    }
    return $base
}

# Insert or replace a <!-- BEGIN: key -->...<!-- END: key --> section block in a file (Sprint 2+)
function Add-AgentsSection([string]$filePath, [string]$key, [string]$sectionContent) {
    if (-not (Test-Path $filePath)) { return }
    $text     = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::UTF8)
    $beginTag = "<!-- BEGIN: $key -->"
    $endTag   = "<!-- END: $key -->"
    $nl       = [System.Environment]::NewLine
    $block    = $beginTag + $nl + $sectionContent + $nl + $endTag
    if ($text.Contains($beginTag)) {
        $escaped = [regex]::Escape($beginTag) + "[\s\S]*?" + [regex]::Escape($endTag)
        $text = [regex]::Replace($text, $escaped, $block)
    } else {
        $text = $text + $nl + $block
    }
    Write-Utf8NoBom $filePath $text
}

# Recompute and rewrite the *Stats: ...* line in an AGENTS.md file (Sprint 2+)
function Update-AgentsStats([string]$filePath) {
    if (-not (Test-Path $filePath)) { return }
    $lines = [System.IO.File]::ReadAllLines($filePath, [System.Text.Encoding]::UTF8)
    $cats  = @('gotchas','patterns','decisions','context','config','learnings','errors','implementation','optimization','test')
    $counts = @{}
    foreach ($c in $cats) { $counts[$c] = 0 }
    $inSection = ""
    foreach ($line in $lines) {
        foreach ($c in $cats) {
            if ($line -match "^<!-- BEGIN: $c -->") { $inSection = $c }
            if ($line -match "^<!-- END: $c -->")   { $inSection = ""  }
        }
        if ($inSection -ne "" -and ($line -match "^\*\*\d+\.\*\*" -or $line -match "^- ")) {
            $counts[$inSection]++
        }
    }
    $total = 0
    foreach ($c in $cats) { $total += $counts[$c] }
    $parts = $cats | ForEach-Object { "$($counts[$_]) $_" }
    $statsLine = "*Stats: $total entries (" + ($parts -join ", ") + ")*"
    $newLines = [System.Collections.Generic.List[string]]::new()
    $replaced = $false
    foreach ($line in $lines) {
        if ($line -match "^\*Stats:") { $newLines.Add($statsLine); $replaced = $true }
        else                          { $newLines.Add($line) }
    }
    if (-not $replaced) { $newLines.Insert(0, $statsLine) }
    Write-Utf8NoBom $filePath ([string]::Join([System.Environment]::NewLine, $newLines))
}

# --- Validate -----------------------------------------------------------------

Write-Host ""
Write-Host "=== scaffold.ps1 - $Preset ===" -ForegroundColor Yellow
Write-Host ""

$parentDir = Split-Path $ProjectRoot -Parent
if (-not (Test-Path $parentDir)) {
    Write-Fail "Parent directory does not exist: $parentDir"
}

$dotClaudeTarget = Join-Path $ProjectRoot ".claude"
if ((Test-Path $dotClaudeTarget) -and (-not $Force)) {
    Write-Fail ".claude/ already exists at $ProjectRoot. Use -Force to overwrite."
}

# Validate ServerRoot required for presets that need it
if ($Preset -eq "web-php-laragon" -and -not $ServerRoot) {
    Write-Fail "Parameter -ServerRoot wajib diisi untuk preset web-php-laragon (contoh: D:/Server/laragon)"
}
if ($Preset -eq "web-php-linux" -and -not $ServerRoot) {
    Write-Fail "Parameter -ServerRoot wajib diisi untuk preset web-php-linux (contoh: /var/www/myapp)"
}

if (-not (Test-Path $TemplateDir)) {
    Write-Fail "Template directory not found: $TemplateDir"
}

$CommonDir = Join-Path $TemplateDir "_common"
$PresetDir = Join-Path $TemplateDir $Preset

if (-not (Test-Path $CommonDir)) {
    Write-Fail "_common template not found: $CommonDir"
}

# --- Build variable map -------------------------------------------------------

Write-Step "Building variable map..."

if ($env:USERPROFILE) {
    $userHome = Norm($env:USERPROFILE)
} elseif ($env:HOME) {
    $userHome = Norm($env:HOME)
} else {
    $userHome = "C:/Users/user"
}

$dateInit = Get-Date -Format "yyyy-MM-dd"
$fsScope  = "./"

if ($Preset -like "mobile-*") {
    $projectType = "mobile"
} elseif ($Preset -like "web-*") {
    $projectType = "web"
} elseif ($Preset -eq "multi-project-root") {
    $projectType = "multi-project-root"
} else {
    $projectType = "generic"
}

if ($Preset -eq "web-php-laragon") {
    if ($ServerRoot) { $logDir = "$( Norm($ServerRoot) )/logs" } else { $logDir = "D:/Server/laragon/logs" }
} elseif ($Preset -eq "web-php-linux") {
    $logDir = "/var/log/nginx"
} elseif ($Preset -eq "web-node") {
    $logDir = "~/.pm2/logs"
} elseif ($Preset -eq "web-nextjs") {
    $logDir = "$( Norm($ProjectRoot) )/.next/trace"
} elseif ($Preset -eq "mobile-rn") {
    $logDir = "adb logcat"
} elseif ($Preset -eq "mobile-flutter") {
    $logDir = "flutter logs"
} elseif ($Preset -eq "multi-project-root") {
    $logDir = "./logs"
} elseif ($Preset -eq "web-yii-1") {
    # Yii 1.x: runtime log is protected/runtime/application.log
    $logDir = "$( Norm($ProjectRoot) )/protected/runtime"
} elseif ($Preset -eq "web-yii-2") {
    # Yii 2.x: runtime log is runtime/logs/app.log
    $logDir = "$( Norm($ProjectRoot) )/runtime/logs"
} else {
    $logDir = "./logs"
}

# ServerRoot default for Yii presets when not provided
if (($Preset -eq "web-yii-1" -or $Preset -eq "web-yii-2") -and -not $ServerRoot) {
    $ServerRoot = "D:/Server/laragon"
}

# --- Hierarchy detection: find parent Claude root (unless NoInherit or multi-project-root) ---

$detectedParent = ""
if (-not $NoInherit -and $Preset -ne "multi-project-root") {
    if ($ParentRoot -ne "") {
        # Explicit parent provided — validate it has a lock file
        $explicitLock = Join-Path (Join-Path $ParentRoot ".claude") "scaffold.lock.json"
        if (Test-Path $explicitLock) {
            $detectedParent = Norm($ParentRoot)
        } else {
            Write-Host "  WARNING: -ParentRoot '$ParentRoot' specified but no .claude/scaffold.lock.json found there. Ignoring." -ForegroundColor Yellow
        }
    } else {
        $found = Find-ParentClaudeRoot $ProjectRoot
        if ($found) {
            $detectedParent = Norm($found)
        }
    }
}

$isChild = ($detectedParent -ne "")

$vars = @{
    "PROJECT_NAME"          = $ProjectName
    "PROJECT_ROOT"          = Norm($ProjectRoot)
    "PROJECT_TYPE"          = $projectType
    "STACK_PRESET"          = $Preset
    "FILESYSTEM_SCOPE"      = $fsScope
    "SERVER_ROOT"           = Norm($ServerRoot)
    "LOG_DIR"               = $logDir
    "DB_TYPE"               = $DbType
    "DB_VERSION"            = $DbVersion
    "DB_DSN"                = $DbDsn
    "NODE_PKG_MANAGER"      = $NodePkgManager
    "MOBILE_PLATFORM"       = $MobilePlatform
    "DATE_INIT"             = $dateInit
    "USER_HOME"             = $userHome
    "COMPACT_THRESHOLD_PCT" = "50"
    "DISABLE_1M_CONTEXT"    = "1"
    "PARENT_ROOT"           = $detectedParent
    "SEMBLE_PACKAGE"        = $SemblePackage
}

Write-OK "Variables ready"

# --- Create target directory --------------------------------------------------

Write-Step "Creating target directory: $ProjectRoot"
New-Item -ItemType Directory -Path $ProjectRoot -Force | Out-Null
Write-OK "Target directory ready"

# --- Helper: substitute placeholders -----------------------------------------

function Substitute-File([string]$src, [string]$dst) {
    $content = Get-Content -Path $src -Raw -Encoding UTF8
    Write-Utf8NoBom $dst (Expand-Placeholders $content)
}

# --- Helper: process one template file ---------------------------------------

function Process-File([string]$src, [string]$dst) {
    if ($src.EndsWith(".tmpl")) {
        $dstFinal = $dst -replace '\.tmpl$', ''
        Substitute-File $src $dstFinal
    } else {
        $dstParent = Split-Path $dst -Parent
        if (-not (Test-Path $dstParent)) {
            New-Item -ItemType Directory -Path $dstParent -Force | Out-Null
        }
        Copy-Item -Path $src -Destination $dst -Force
    }
}

# --- Helper: copy entire directory tree --------------------------------------

function Copy-Tree([string]$srcDir, [string]$dstDir) {
    $files = Get-ChildItem -Path $srcDir -Recurse -File
    foreach ($file in $files) {
        # Skip internal scaffold files that are not part of the project template
        if ($file.Name -eq "settings.local.json.fragment" -or $file.Extension -eq ".fragment") { continue }
        if ($file.Name -eq ".keep") { continue }
        # CHILD_NOTICE.md.tmpl is handled explicitly in Step 1.5 — skip in generic copy
        if ($file.Name -eq "CHILD_NOTICE.md.tmpl") { continue }
        $rel = $file.FullName.Substring($srcDir.Length).TrimStart('\','/')
        $dst = Join-Path $dstDir $rel
        Process-File $file.FullName $dst
    }
}

# --- Step 1: Copy _common ----------------------------------------------------

Write-Step "Copying _common templates..."
Copy-Tree $CommonDir $ProjectRoot
Write-OK "_common copied"

# --- Step 1.5: Create .agent/ dirs + multi-tool stubs + child project handling ---

if ($isChild) {
    Write-Step "Child project detected (inherits from: $detectedParent)"
    # Remove AGENTS.md and .agent/ copied from _common — child inherits from parent
    $agentsMdCopied = Join-Path $ProjectRoot "AGENTS.md"
    if (Test-Path $agentsMdCopied) {
        Remove-Item $agentsMdCopied -Force
        Write-Step "AGENTS.md removed (inherited from parent)"
    }
    $agentDirCopied = Join-Path $ProjectRoot ".agent"
    if (Test-Path $agentDirCopied) {
        Remove-Item $agentDirCopied -Recurse -Force
        Write-Step ".agent/ removed (inherited from parent)"
    }
    # Create CHILD_NOTICE.md from template
    $childNoticeTmpl = Join-Path (Join-Path $CommonDir ".claude") "CHILD_NOTICE.md.tmpl"
    if (Test-Path $childNoticeTmpl) {
        $childNoticeContent = [System.IO.File]::ReadAllText($childNoticeTmpl, [System.Text.Encoding]::UTF8)
        $childNoticeDst = Join-Path (Join-Path $ProjectRoot ".claude") "CHILD_NOTICE.md"
        Write-Utf8NoBom $childNoticeDst (Expand-Placeholders $childNoticeContent)
        Write-OK "CHILD_NOTICE.md created"
    }
    Write-Step ".agent/ creation: skipped (child project)"
    Write-Step "Multi-tool stubs: skipped (child project inherits from parent)"
} else {
    Write-Step "Creating .agent/ directory structure..."
    $agentBase = Join-Path $ProjectRoot ".agent"
    $agentCats = @('config','context','decisions','errors','gotchas','implementation','learnings','optimization','patterns','test')
    foreach ($cat in $agentCats) {
        $catDir = Join-Path (Join-Path $agentBase "memory") (Join-Path "entries" $cat)
        if (-not (Test-Path $catDir)) {
            New-Item -ItemType Directory -Path $catDir -Force | Out-Null
        }
    }
    foreach ($subDir in @("skills","workflows")) {
        $d = Join-Path $agentBase $subDir
        if (-not (Test-Path $d)) { New-Item -ItemType Directory -Path $d -Force | Out-Null }
    }
    Write-OK ".agent/ directory structure ready (10 memory categories)"

    $shouldEmitMultiTool = $EmitMultiTool -and ($Preset -ne "generic")
    if ($shouldEmitMultiTool) {
        Write-Step "Creating multi-tool stub directories..."
        $stubs = @(".ai",".aiassistant",".kiro",".junie",".qoder",".trae",".windsurf",".codex")
        foreach ($stub in $stubs) {
            $d = Join-Path $ProjectRoot $stub
            if (-not (Test-Path $d)) { New-Item -ItemType Directory -Path $d -Force | Out-Null }
        }
        $cursorRules = Join-Path (Join-Path $ProjectRoot ".cursor") "rules"
        if (-not (Test-Path $cursorRules)) { New-Item -ItemType Directory -Path $cursorRules -Force | Out-Null }
        Write-OK "Multi-tool stubs ready (.ai, .aiassistant, .cursor/rules, .kiro, .junie, .qoder, .trae, .windsurf, .codex)"
    } else {
        Write-Step "Multi-tool stubs: skipped (preset=$Preset, EmitMultiTool=$EmitMultiTool)"
    }

    $agentsMdPath = Join-Path $ProjectRoot "AGENTS.md"
    if (Test-Path $agentsMdPath) {
        Update-AgentsStats $agentsMdPath
        Write-OK "AGENTS.md stats updated"
    }
}

# --- Step 1.6: Ensure wiki subdirectories exist (skipped by Copy-Tree since only .keep) ---

Write-Step "Creating .claude/wiki/ subdirectories..."
$wikiBase = Join-Path (Join-Path $ProjectRoot ".claude") "wiki"
foreach ($wikiSubDir in @("entities","patterns","gotchas","decisions")) {
    $d = Join-Path $wikiBase $wikiSubDir
    if (-not (Test-Path $d)) { New-Item -ItemType Directory -Path $d -Force | Out-Null }
}
Write-OK "wiki/ subdirectories ready (entities, patterns, gotchas, decisions)"

# Ensure .claude/memory/projects/ exists (for project-scoped memory)
$memProjDir = Join-Path (Join-Path (Join-Path $ProjectRoot ".claude") "memory") "projects"
if (-not (Test-Path $memProjDir)) { New-Item -ItemType Directory -Path $memProjDir -Force | Out-Null }
Write-OK "memory/projects/ subdir ready"

# --- Step 2: Overlay preset --------------------------------------------------

if ((Test-Path $PresetDir) -and ($Preset -ne "generic")) {
    Write-Step "Overlaying preset: $Preset"
    Copy-Tree $PresetDir $ProjectRoot
    Write-OK "Preset $Preset overlaid"
} else {
    Write-Step "Preset: generic (no overlay files)"
}

# --- Step 2.5: Strip Semble MCP entry for generic and mobile-* presets ------

$mcpJsonPath = Join-Path $ProjectRoot ".mcp.json"
if (Test-Path $mcpJsonPath) {
    $shouldStripSemble = ($Preset -eq "generic" -or $Preset -like "mobile-*")
    if ($shouldStripSemble) {
        $mcpRaw = [System.IO.File]::ReadAllText($mcpJsonPath, [System.Text.Encoding]::UTF8)
        $mcpObj = $mcpRaw | ConvertFrom-Json
        if ($null -ne $mcpObj.mcpServers -and
            $null -ne $mcpObj.mcpServers.PSObject.Properties["semble"]) {
            $mcpObj.mcpServers.PSObject.Properties.Remove("semble")
            Write-Utf8NoBom $mcpJsonPath ($mcpObj | ConvertTo-Json -Depth 10)
            Write-OK ".mcp.json: semble entry stripped for preset=$Preset"
        }
    }
}

# --- Step 3: Merge settings.local.json fragment ------------------------------

$fragmentPath   = Join-Path $PresetDir "settings.local.json.fragment"
$targetSettings = Join-Path (Join-Path $ProjectRoot ".claude") "settings.local.json"

if ((Test-Path $fragmentPath) -and (Test-Path $targetSettings)) {
    Write-Step "Merging settings.local.json fragment..."
    $base        = Get-Content $targetSettings -Raw | ConvertFrom-Json
    $fragmentRaw = [System.IO.File]::ReadAllText($fragmentPath, [System.Text.Encoding]::UTF8)
    $fragment    = (Expand-Placeholders $fragmentRaw) | ConvertFrom-Json
    $base        = Merge-JsonAdditive $base $fragment
    Write-Utf8NoBom $targetSettings ($base | ConvertTo-Json -Depth 10)
    Write-OK "settings.local.json merged"
}

# --- Step 4: Git init --------------------------------------------------------

Write-Step "Initializing git repository..."
$gitDir = Join-Path $ProjectRoot ".git"
if (-not (Test-Path $gitDir)) {
    Push-Location $ProjectRoot
    $prevPref = $ErrorActionPreference
    $ErrorActionPreference = "SilentlyContinue"
    git init 2>&1 | Out-Null
    git add ".gitignore" 2>&1 | Out-Null
    git commit -m "chore: initial scaffold via init-project ($Preset)" 2>&1 | Out-Null
    $ErrorActionPreference = $prevPref
    Pop-Location
    Write-OK "Git repository initialized"
} else {
    Write-Step "Git repo already exists -- skipping git init"
}

# --- Step 5: Write scaffold.lock.json ----------------------------------------

Write-Step "Writing scaffold.lock.json..."
$lockPath = Join-Path (Join-Path $ProjectRoot ".claude") "scaffold.lock.json"
$lockObj  = [ordered]@{
    scaffold_version    = "1.1"
    date                = $dateInit
    preset              = $Preset
    project_name        = $ProjectName
    project_root        = Norm($ProjectRoot)
    is_multi_project_root = ($Preset -eq "multi-project-root")
    is_child            = $isChild
    inherits_from       = if ($isChild) { $detectedParent } else { $null }
    parent_root         = if ($isChild) { $detectedParent } else { $null }
    variables           = $vars
}
$lockJson = $lockObj | ConvertTo-Json -Depth 5
[System.IO.File]::WriteAllText($lockPath, $lockJson, [System.Text.UTF8Encoding]::new($false))
Write-OK "scaffold.lock.json written (v1.1)"

# --- Step 6: Verify no leftover placeholders ---------------------------------

Write-Step "Verifying no leftover placeholders..."
$leftovers = @()
$checkFiles = Get-ChildItem -Path $ProjectRoot -Recurse -File -Include "*.md","*.json","*.txt","*.sh","*.ps1" -ErrorAction SilentlyContinue
foreach ($f in $checkFiles) {
    $content = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
    if ($content -match "\{\{[A-Z_]+\}\}") {
        $leftovers += $f.FullName
    }
}

if ($leftovers.Count -gt 0) {
    Write-Host "  WARNING: Leftover placeholders found in:" -ForegroundColor Yellow
    foreach ($lf in $leftovers) { Write-Host "     $lf" -ForegroundColor Yellow }
} else {
    Write-OK "No leftover placeholders"
}

# --- Done --------------------------------------------------------------------

Write-Host ""
Write-Host "=== Scaffold Complete ===" -ForegroundColor Green
Write-Host ""
Write-Host "  Project : $ProjectName"
Write-Host "  Path    : $ProjectRoot"
Write-Host "  Preset  : $Preset"
Write-Host ""
Write-Host "  Next steps:"
Write-Host "    1. cd $ProjectRoot"
Write-Host "    2. claude"
Write-Host "    3. /validate-agent-config"
Write-Host ""
