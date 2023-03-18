Create a private for the chocolatey package
Clone the repo into local
Create a new directory "chocolateyinstall.ps1"

choco new package name
choco pack package name
choco source add -n "repo name" -s "repourl"
choco install packagename -s "repourl"

