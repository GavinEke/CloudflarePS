Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module -Name Pester, PSScriptAnalyzer -SkipPublisherCheck -Scope CurrentUser -Force
# More to after tests created... GH Issue #1
