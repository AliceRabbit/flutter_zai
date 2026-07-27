[CmdletBinding()]
param()

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

$projectRoot = Split-Path -Parent $PSScriptRoot
$toolingRoot = Join-Path $projectRoot ".tooling"
$cacheRoot = Join-Path $toolingRoot "cache"
$flutterRoot = Join-Path $toolingRoot "flutter"
$dartCommand = Join-Path $flutterRoot "bin\dart.bat"
$protocVersion = "35.0"
$protocPluginVersion = "25.0.0"
$protocArchiveName = "protoc-$protocVersion-win64.zip"
$protocArchivePath = Join-Path $cacheRoot $protocArchiveName
$protocRoot = Join-Path $toolingRoot "protoc-$protocVersion"
$protocCommand = Join-Path $protocRoot "bin\protoc.exe"
$protocArchiveSha256 = "d1cede9e308cc3eb072392af1c02ccae4bdd3d2f374ec2970dbd8cdfdaa91363"
$downloadUrl = "https://github.com/protocolbuffers/protobuf/releases/download/v$protocVersion/$protocArchiveName"
$env:DART_SUPPRESS_ANALYTICS = "true"

function Get-Sha256 {
    param([Parameter(Mandatory = $true)][string]$Path)

    return (Get-FileHash -LiteralPath $Path -Algorithm SHA256).Hash.ToLowerInvariant()
}

if (-not (Test-Path -LiteralPath $dartCommand)) {
    & (Join-Path $PSScriptRoot "bootstrap.ps1") -SkipPubGet
    if ($LASTEXITCODE -ne 0) {
        throw "Flutter bootstrap failed."
    }
}

New-Item -ItemType Directory -Force -Path $cacheRoot | Out-Null

if (-not (Test-Path -LiteralPath $protocCommand)) {
    $archiveIsValid =
        (Test-Path -LiteralPath $protocArchivePath) -and
        ((Get-Sha256 -Path $protocArchivePath) -eq $protocArchiveSha256)

    if (-not $archiveIsValid) {
        Write-Host "Downloading protoc $protocVersion ..."
        $downloadSucceeded = $false
        $aria2 = Get-Command aria2c.exe -ErrorAction SilentlyContinue
        if ($aria2) {
            & $aria2.Source `
                --continue=true `
                --max-connection-per-server=8 `
                --split=8 `
                --min-split-size=1M `
                --file-allocation=none `
                --auto-file-renaming=false `
                --allow-overwrite=true `
                --check-integrity=true `
                "--checksum=sha-256=$protocArchiveSha256" `
                --dir $cacheRoot `
                --out $protocArchiveName `
                $downloadUrl
            $downloadSucceeded = $LASTEXITCODE -eq 0
        }

        if (-not $downloadSucceeded) {
            $curlArguments = @(
                "--fail",
                "--location",
                "--retry", "3",
                "--ssl-no-revoke"
            )
            if (Test-Path -LiteralPath $protocArchivePath) {
                $curlArguments += @("--continue-at", "-")
            }
            $curlArguments += @(
                "--output", $protocArchivePath,
                $downloadUrl
            )
            & curl.exe @curlArguments
            if ($LASTEXITCODE -ne 0) {
                throw "protoc download failed with curl exit code $LASTEXITCODE."
            }
        }
    }

    $actualSha256 = Get-Sha256 -Path $protocArchivePath
    if ($actualSha256 -ne $protocArchiveSha256) {
        throw "protoc checksum mismatch. Expected $protocArchiveSha256, got $actualSha256."
    }
    if (Test-Path -LiteralPath $protocRoot) {
        throw "A partial protoc installation exists at $protocRoot. Remove it and rerun this script."
    }

    Write-Host "Extracting protoc $protocVersion ..."
    Expand-Archive -LiteralPath $protocArchivePath -DestinationPath $protocRoot
}

$env:PUB_CACHE = Join-Path $toolingRoot "pub-cache"
$env:Path = "$(Join-Path $flutterRoot "bin");$env:Path"

& $dartCommand pub global activate protoc_plugin $protocPluginVersion
if ($LASTEXITCODE -ne 0) {
    throw "Unable to activate protoc_plugin $protocPluginVersion."
}

$pluginCommand = Join-Path $env:PUB_CACHE "bin\protoc-gen-dart.bat"
if (-not (Test-Path -LiteralPath $pluginCommand)) {
    throw "protoc-gen-dart was not installed at $pluginCommand."
}

Push-Location $projectRoot
try {
    $protoFiles = Get-ChildItem -LiteralPath "assets\proto" -Filter "*.proto" |
        Sort-Object Name |
        ForEach-Object { "assets/proto/$($_.Name)" }

    & $protocCommand `
        "--plugin=protoc-gen-dart=$pluginCommand" `
        "--proto_path=assets/proto" `
        "--dart_out=lib/models/proto" `
        @protoFiles
    if ($LASTEXITCODE -ne 0) {
        throw "Protobuf generation failed with exit code $LASTEXITCODE."
    }

    & $dartCommand format "lib\models\proto"
    if ($LASTEXITCODE -ne 0) {
        throw "Formatting generated Protobuf sources failed."
    }
} finally {
    Pop-Location
}

Write-Host "Protobuf sources regenerated with protoc $protocVersion and protoc_plugin $protocPluginVersion."
