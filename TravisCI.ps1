Install-PackageProvider -Name NuGet -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module -Name Pester, platyPS, PSScriptAnalyzer -SkipPublisherCheck -Force
# More to after tests created... GH Issue #1
