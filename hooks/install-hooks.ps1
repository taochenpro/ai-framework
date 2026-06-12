param(
  [string]$RepoRoot = (git rev-parse --show-toplevel)
)

$ErrorActionPreference = "Stop"

if (-not $RepoRoot) {
  throw "Could not determine repository root."
}

$hooksDir = Join-Path $RepoRoot ".git/hooks"
if (-not (Test-Path $hooksDir)) {
  throw "Git hooks directory not found: $hooksDir"
}

$hookNames = @("pre-commit", "post-commit")
foreach ($hookName in $hookNames) {
  $source = Join-Path $RepoRoot "hooks/$hookName"
  $target = Join-Path $hooksDir $hookName
  Copy-Item -Force $source $target
  Write-Host "Installed $hookName"
}

Write-Host "Git hooks installed. Configure commands by copying config/automation.env.example to config/automation.env."

