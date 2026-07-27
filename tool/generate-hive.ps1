[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$projectRoot = Split-Path -Parent $PSScriptRoot
$dart = Join-Path $PSScriptRoot "dart.ps1"

Push-Location $projectRoot
try {
    & $dart run build_runner build
    if ($LASTEXITCODE -ne 0) {
        throw "Hive CE code generation failed with exit code $LASTEXITCODE."
    }
} finally {
    Pop-Location
}
