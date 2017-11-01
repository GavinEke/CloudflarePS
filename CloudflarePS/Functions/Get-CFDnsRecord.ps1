Function Get-CFDnsRecord {
    [CmdletBinding()]
    Param()
    
    Begin {
        If (-not ($CFHeaders -and $CFZoneID)) {Import-CFConfig}
    }

    Process {
        If ($ConfigImported) {
            $Response = (Invoke-RestMethod -Method Get -Uri "https://api.cloudflare.com/client/v4/zones/$CFZoneID/dns_records" -Headers $CFHeaders).result
            $Response
        }
    }

    End {}
}
