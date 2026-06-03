Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not $IsWindows) {
    Write-Error "This script is only for Windows."
}

$repoRoot = Split-Path -Parent $PSScriptRoot
$wingetFile = Join-Path $repoRoot "packages\winget.json"

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error "winget is not installed."
}

if ($env:RUN_WINGET_IMPORT -eq "1" -and (Test-Path $wingetFile)) {
    winget import -i $wingetFile --accept-package-agreements --accept-source-agreements --ignore-unavailable
} else {
    Write-Host "Skipping winget import. Set RUN_WINGET_IMPORT=1 after pruning packages\winget.json to OS-owned packages."
}

Write-Host "Windows bootstrap complete. Manage development tools inside WSL with make bootstrap-wsl."
