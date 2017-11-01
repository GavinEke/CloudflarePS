Function Remove-CFDnsRecord {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, HelpMessage = 'DNS record ID')]
        [ValidateLength(20, 140)]
        [String]$ID
    )
    
    Begin {
        If (-not ($CFHeaders -and $CFZoneID)) {Import-CFConfig}
    }

    Process {
        If ($ConfigImported) {
            $Response = (Invoke-RestMethod -Method Delete -Uri "https://api.cloudflare.com/client/v4/zones/$CFZoneID/dns_records/$ID" -Headers $CFHeaders).result
            $Response
        }
    }

    End {}
}
