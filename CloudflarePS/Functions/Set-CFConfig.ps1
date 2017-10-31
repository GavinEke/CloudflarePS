Function Set-CFConfig {
    [CmdletBinding(
        DefaultParameterSetName='DomainName',
        SupportsShouldProcess=$True
    )]
    Param(
        [Parameter(Mandatory = $True, HelpMessage = 'The email address used to logon to Cloudflare')]
        [Alias('XAuthEmail')]
        [ValidateNotNullOrEmpty()]
        [MailAddress]$Email,

        [Parameter(Mandatory = $True, HelpMessage = 'Global API Key on https://www.cloudflare.com/a/profile')]
        [Alias('XAuthKey')]
        [ValidateLength(35, 40)]
        [String]$ApiKey,

        [Parameter(Mandatory = $True, ParameterSetName='DomainName', HelpMessage = 'The domain to use with the API')]
        [Alias('DefaultDomain')]
        [ValidateLength(3, 255)]
        [String]$Domain,

        [Parameter(Mandatory = $True, ParameterSetName='ZoneID', HelpMessage = 'The Zone ID of the domain to use with the API')]
        [ValidateLength(20, 160)]
        [String]$ZoneID,

        [Parameter(HelpMessage = 'Optional non default path to config file')]
        [ValidateNotNullOrEmpty()]
        [String]$Path = "$HOME\.CloudFlarePS\CFConfigurationFile.xml"
    )

    Begin {
        $CFConfDir = Split-Path -Path "$Path"
        $CFConfFile = Split-Path -Path "$Path" -Leaf
        If (!(Test-Path -Path "$CFConfDir")) {
            New-Item "$CFConfDir" -ItemType Directory | Out-Null
            Write-Verbose "Creating folder $CFConfDir"
        }
    }

    Process {
        If ($PSCmdlet.ParameterSetName -eq "DomainName") {
            $Headers = @{'X-Auth-Email' = $Email;
                'X-Auth-Key' = $ApiKey;
                'Content-Type' = "application/json"
            }

            Write-Verbose "Getting ZoneID of domain $Domain"
            $Response = (Invoke-RestMethod -Method Get -Uri "https://api.cloudflare.com/client/v4/zones" -Headers $Headers).result
            $ZoneID = $Response | Where-Object {$_.name -eq "$Domain"} | Select-Object -ExpandProperty id
        }

        $CFConfigurationFile = @{ApiKey = $ApiKey; Email = $Email; Domain = $Domain; ZoneID = $ZoneID}
        $CFConfigurationFile | Export-Clixml -Path "$CFConfDir\$CFConfFile" -Force
        Write-Verbose "CFConfigurationFile has been written to $CFConfDir\$CFConfFile"
    }

    End {}
}
