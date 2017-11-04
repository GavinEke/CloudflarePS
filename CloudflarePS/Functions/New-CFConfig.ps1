Function New-CFConfig {
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
        [ValidateLength(20, 140)]
        [String]$ApiKey,

        [Parameter(Mandatory = $True, ParameterSetName='DomainName', HelpMessage = 'The domain to use with the API')]
        [Alias('DefaultDomain')]
        [ValidateLength(3, 255)]
        [String]$Domain,

        [Parameter(Mandatory = $True, ParameterSetName='ZoneID', HelpMessage = 'The Zone ID of the domain to use with the API')]
        [ValidateLength(20, 140)]
        [String]$ZoneID,

        [Parameter(HelpMessage = 'Optional non default path to config file')]
        [ValidateNotNullOrEmpty()]
        [String]$Path = "$HOME\.CloudFlarePS\CFConfigurationFile.xml"
    )

    Begin {
        $CFConfDir = Split-Path -Path "$Path"
        If (-not (Test-Path -Path "$CFConfDir")) {
            New-Item "$CFConfDir" -ItemType Directory | Out-Null
            Write-Verbose -Message "Creating folder $CFConfDir"
        }
    }

    Process {
        If ($PSCmdlet.ParameterSetName -eq 'DomainName') {
            Try {
                Write-Verbose -Message "Getting ZoneID of domain $Domain"
                $Headers = @{'X-Auth-Email' = $Email;
                    'X-Auth-Key'            = $ApiKey;
                    'Content-Type'          = 'application/json'
                }
                $Uri = "$BaseUri/zones"
                $Response = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Headers

                If ($Response.success) {
                    $ZoneID = $Response | Where-Object {$_.result.name -eq "$Domain"} | Select-Object -ExpandProperty id
                } Else {
                    Write-Error -Message "$($Response.errors)"
                }
            } Catch {
                $_.Exception.Message
            }
        }

        $CFConfigurationFile = @{ApiKey = $ApiKey; Email = $Email; Domain = $Domain; ZoneID = $ZoneID}
        $CFConfigurationFile | Export-Clixml -Path "$Path" -Force
        Write-Verbose -Message "CFConfigurationFile has been written to $Path"
    }

    End {}
}
