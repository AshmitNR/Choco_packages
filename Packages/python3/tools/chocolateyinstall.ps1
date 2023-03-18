function Install-ChocolateyPackage {
  param (
    [Parameter(Mandatory, Position=0)]
    [string]$PackageName,

    [string]$Source,

    [alias("Params")]
    [string]$PackageParameters,

    [string]$Version,

    [alias("Pre")]
    [switch]$Prerelease,

    [switch]$UseInstallNotUpgrade
  )

  $chocoExecutionArgs = "choco.exe"
  if ($UseInstallNotUpgrade) {
    $chocoExecutionArgs += " install"
  } else {
    $chocoExecutionArgs += " upgrade"
  }

  $chocoExecutionArgs += " $PackageName -y --source='$Source'"
  if ($Prerelease) { $chocoExecutionArgs += " --prerelease"}
  if ($Version) { $chocoExecutionArgs += " --version='$Version'"}
  if ($PackageParameters -and $PackageParameters -ne '') { $chocoExecutionArgs += " --package-parameters='$PackageParameters'"}

  Invoke-Expression -Command $chocoExecutionArgs
  $exitCode = $LASTEXITCODE
  $validExitCodes = @(0, 1605, 1614, 1641, 3010)
  if ($validExitCodes -notcontains $exitCode) {
    throw "Error with package installation. See above."
  }
}

Install-ChocolateyPackage python -Source https://github.com/AshmitNR/Choco_packages.git -Version 3.11.0