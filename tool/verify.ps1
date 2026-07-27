[CmdletBinding()]
param(
    [ValidateSet("none", "android", "windows")]
    [string]$BuildTarget = "none"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
$flutter = Join-Path $PSScriptRoot "flutter.ps1"

function Invoke-Flutter {
    param([Parameter(ValueFromRemainingArguments = $true)][string[]]$Arguments)

    & $flutter @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "Flutter command failed: flutter $($Arguments -join ' ')"
    }
}

Push-Location $projectRoot
try {
    Invoke-Flutter pub get --enforce-lockfile
    Invoke-Flutter analyze
    Invoke-Flutter test --reporter expanded --test-randomize-ordering-seed random

    if ($BuildTarget -eq "android") {
        Invoke-Flutter build apk --debug
    } elseif ($BuildTarget -eq "windows") {
        Invoke-Flutter config --enable-windows-desktop
        Invoke-Flutter build windows --debug
    }
} finally {
    Pop-Location
}
