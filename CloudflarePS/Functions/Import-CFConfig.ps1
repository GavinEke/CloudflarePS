Function Import-CFConfig {
    [CmdletBinding()]
    Param(
        [Parameter(HelpMessage = 'Optional non default path to config file')]
        [ValidateScript({$_ | Test-Path -PathType Leaf})]
        [System.IO.FileInfo]$Path = "$HOME\.CloudFlarePS\CFConfigurationFile.xml"
    )
    
    Begin {
        $CFConfDir = Split-Path -Path "$Path"
        $CFConfFile = Split-Path -Path "$Path" -Leaf
    }

    Process {
        If (Test-Path -Path "$CFConfDir\$CFConfFile") {
            $CFConfigurationFile = Import-Clixml -Path "$CFConfDir\$CFConfFile"
            Write-Verbose "CFConfigurationFile has been loaded from $CFConfDir\$CFConfFile"
            
            $Script:CFHeaders = @{'X-Auth-Email' = $CFConfigurationFile.Email;
                'X-Auth-Key'              = $CFConfigurationFile.ApiKey;
                'Content-Type'            = "application/json"
            }
            $Script:Email = $CFConfigurationFile.Email
            $Script:ApiKey = $CFConfigurationFile.ApiKey
            $Script:Domain = $CFConfigurationFile.Domain
            $Script:CFZoneID = $CFConfigurationFile.ZoneID
            $Script:ConfigImported = $True
        }
        Else {
            Write-Warning "No Configuration File Found. Please run Set-CFConfig to create a Configuration File."
            $Script:ConfigImported = $False
        }
    }

    End {}
}
