[CmdletBinding()]
param(
    [switch]$Install,
    [switch]$UpdateVisualStudio
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if ($env:OS -ne "Windows_NT") {
    throw "Windows build tools can only be configured on Windows."
}

$installerRoot = Join-Path `
    ${env:ProgramFiles(x86)} `
    "Microsoft Visual Studio\Installer"
$vswhere = Join-Path $installerRoot "vswhere.exe"
$setup = Join-Path $installerRoot "setup.exe"

if (-not (Test-Path -LiteralPath $vswhere) -or
    -not (Test-Path -LiteralPath $setup)) {
    throw (
        "Visual Studio Installer was not found. Install Visual Studio Build " +
        "Tools first, then rerun this script."
    )
}

function Get-BuildToolsInstance {
    $installationPath = & $vswhere `
        -latest `
        -products Microsoft.VisualStudio.Product.BuildTools `
        -property installationPath
    if ($LASTEXITCODE -ne 0) {
        throw "vswhere failed with exit code $LASTEXITCODE."
    }
    if (-not $installationPath) {
        return $null
    }

    $installationVersion = & $vswhere `
        -latest `
        -products Microsoft.VisualStudio.Product.BuildTools `
        -property installationVersion
    $displayName = & $vswhere `
        -latest `
        -products Microsoft.VisualStudio.Product.BuildTools `
        -property displayName

    return [pscustomobject]@{
        installationPath = [string]$installationPath
        installationVersion = [string]$installationVersion
        displayName = [string]$displayName
    }
}

function Test-VisualStudioRequirement {
    param(
        [Parameter(Mandatory = $true)][string]$InstallationPath,
        [Parameter(Mandatory = $true)][string]$Requirement
    )

    $matchingPaths = @(
        & $vswhere `
            -all `
            -products "*" `
            -requires $Requirement `
            -property installationPath
    )
    return $matchingPaths -contains $InstallationPath
}

function Get-MissingRequirements {
    param([Parameter(Mandatory = $true)][string]$InstallationPath)

    $requirements = [ordered]@{
        "Microsoft.VisualStudio.Workload.VCTools" =
            "Desktop development with C++"
        "Microsoft.VisualStudio.Component.VC.Tools.x86.x64" =
            "MSVC C++ x64/x86 build tools"
        "Microsoft.VisualStudio.Component.VC.CMake.Project" =
            "C++ CMake tools for Windows"
    }

    $missing = @()
    foreach ($entry in $requirements.GetEnumerator()) {
        if (-not (Test-VisualStudioRequirement `
            -InstallationPath $InstallationPath `
            -Requirement $entry.Key
        )) {
            $missing += [pscustomobject]@{
                Id = $entry.Key
                Description = $entry.Value
            }
        }
    }
    return $missing
}

function Test-IsAdministrator {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = [Security.Principal.WindowsPrincipal]::new($identity)
    return $principal.IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator
    )
}

function Assert-InstallerExitCode {
    param(
        [Parameter(Mandatory = $true)][int]$ExitCode,
        [Parameter(Mandatory = $true)][string]$Operation
    )

    if ($ExitCode -notin @(0, 3010)) {
        throw "$Operation failed with Visual Studio Installer exit code $ExitCode."
    }
    if ($ExitCode -eq 3010) {
        Write-Warning "$Operation completed, but Windows must be restarted."
    }
}

$instance = Get-BuildToolsInstance
if ($null -eq $instance) {
    throw "Visual Studio Build Tools is not installed."
}

$installationPath = [string]$instance.installationPath
$missingRequirements = @(Get-MissingRequirements `
    -InstallationPath $installationPath)

if (($UpdateVisualStudio -or ($Install -and $missingRequirements.Count -gt 0)) -and
    -not (Test-IsAdministrator)) {
    Write-Host "Requesting administrator approval for Visual Studio Installer ..."
    $elevatedArguments = @(
        "-NoProfile",
        "-ExecutionPolicy", "Bypass",
        "-File", "`"$PSCommandPath`""
    )
    if ($Install) {
        $elevatedArguments += "-Install"
    }
    if ($UpdateVisualStudio) {
        $elevatedArguments += "-UpdateVisualStudio"
    }

    $powerShellHost = (Get-Process -Id $PID).Path
    if (-not $powerShellHost) {
        throw "Unable to resolve the current PowerShell executable."
    }
    $elevatedProcess = Start-Process `
        -FilePath $powerShellHost `
        -Verb RunAs `
        -ArgumentList ($elevatedArguments -join " ") `
        -Wait `
        -PassThru
    exit $elevatedProcess.ExitCode
}

if ($UpdateVisualStudio) {
    Write-Host "Updating Visual Studio Build Tools on its current release channel ..."
    & $setup `
        update `
        --installPath $installationPath `
        --passive `
        --norestart
    Assert-InstallerExitCode `
        -ExitCode $LASTEXITCODE `
        -Operation "Visual Studio update"

    $instance = Get-BuildToolsInstance
    $installationPath = [string]$instance.installationPath
    $missingRequirements = @(Get-MissingRequirements `
        -InstallationPath $installationPath)
}

if ($missingRequirements.Count -gt 0) {
    if (-not $Install) {
        $details = $missingRequirements |
            ForEach-Object { "$($_.Description) [$($_.Id)]" }
        throw (
            "Missing Visual Studio components:`n- " +
            ($details -join "`n- ") +
            "`nRerun from elevated PowerShell with -Install."
        )
    }

    Write-Host "Installing the Visual Studio C++ desktop workload ..."
    & $setup `
        modify `
        --installPath $installationPath `
        --add Microsoft.VisualStudio.Workload.VCTools `
        --add Microsoft.VisualStudio.Component.VC.CMake.Project `
        --includeRecommended `
        --passive `
        --norestart
    Assert-InstallerExitCode `
        -ExitCode $LASTEXITCODE `
        -Operation "Visual Studio workload installation"
}

$instance = Get-BuildToolsInstance
$installationPath = [string]$instance.installationPath
$missingRequirements = @(Get-MissingRequirements `
    -InstallationPath $installationPath)
if ($missingRequirements.Count -gt 0) {
    $missingIds = $missingRequirements | ForEach-Object Id
    throw "Visual Studio validation failed. Missing: $($missingIds -join ', ')"
}

Write-Host ""
Write-Host "Windows build environment is ready."
Write-Host "Visual Studio: $($instance.displayName) $($instance.installationVersion)"
Write-Host "Installation: $installationPath"
Write-Host "Run .\tool\verify.ps1 -BuildTarget windows to validate it."
