Function Import-CFConfig {
    [CmdletBinding()]
    Param(
        [Parameter(HelpMessage = 'Optional non default path to config file')]
        [ValidateScript({$_ | Test-Path -PathType Leaf})]
        [System.IO.FileInfo]$Path = "$HOME\.CloudFlarePS\CFConfigurationFile.xml"
    )
    
    Begin {}

    Process {
        If (Test-Path -Path "$Path") {
            $CFConfigurationFile = Import-Clixml -Path "$Path"
            Write-Verbose -Message "CFConfigurationFile has been loaded from $Path"
            
            $Script:CFHeaders = @{'X-Auth-Email' = $CFConfigurationFile.Email;
                'X-Auth-Key'              = $CFConfigurationFile.ApiKey;
                'Content-Type'            = 'application/json'
            }
            $Script:Email = $CFConfigurationFile.Email
            $Script:ApiKey = $CFConfigurationFile.ApiKey
            $Script:Domain = $CFConfigurationFile.Domain
            $Script:CFZoneID = $CFConfigurationFile.ZoneID
            $Script:ConfigImported = $True
        }
        Else {
            Write-Warning -Message 'No Configuration File Found. Please run Set-CFConfig to create a Configuration File.'
            $Script:ConfigImported = $False
        }
    }

    End {}
}
