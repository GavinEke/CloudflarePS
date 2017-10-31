Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module -Name Pester, PSScriptAnalyzer -SkipPublisherCheck -Scope CurrentUser -Force
Invoke-Pester @Verbose -Path './Tests'
# More to after tests created... GH Issue #1
