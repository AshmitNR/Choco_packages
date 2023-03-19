$packageName = 'python'
$installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage `
   -PackageName $packageName `
   -FileType exe `
   -SilentArgs '/qn' `
   -Url 'https://www.python.org/ftp/python/3.9.9/python-3.9.9.exe' `
   -Checksum '7c9d3e3e1f07de48f0a63c63dd2b2c7dce622f0847527e9c1d84aef5b5e2a5f8' `
   -ChecksumType 'sha256' `
   -ValidExitCodes @(0)
