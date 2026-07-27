[CmdletBinding()]
param(
    [ValidateSet("none", "android", "windows")]
    [string]$BuildTarget = "none"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
$flutter = Join-Path $PSScriptRoot "flutter.ps1"
$dart = Join-Path $PSScriptRoot "dart.ps1"

function Invoke-Flutter {
    param([Parameter(ValueFromRemainingArguments = $true)][string[]]$Arguments)

    & $flutter @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "Flutter command failed: flutter $($Arguments -join ' ')"
    }
}

function Invoke-Dart {
    param([Parameter(ValueFromRemainingArguments = $true)][string[]]$Arguments)

    & $dart @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "Dart command failed: dart $($Arguments -join ' ')"
    }
}

Push-Location $projectRoot
try {
    Invoke-Flutter pub get --enforce-lockfile
    Invoke-Dart format --output=none --set-exit-if-changed lib test
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
