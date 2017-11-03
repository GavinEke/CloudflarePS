Function Get-CFDnsRecord {
    [CmdletBinding()]
    Param()
    
    Begin {
        If (-not ($CFHeaders -and $CFZoneID)) {Import-CFConfig}
    }

    Process {
        If ($ConfigImported) {
            Try {
                $Uri = "$BaseUri/zones/$CFZoneID/dns_records"
                $Response = Invoke-RestMethod -Method Get -Uri $Uri -Headers $CFHeaders

                If ($Response.success) {
                    ForEach ($Item in $Response) {
                        [PSCustomObject]@{
                            Id = $Item.result.id
                            Type = $Item.result.type
                            Name = $Item.result.name
                            TTL = $Item.result.ttl
                            Proxied = $Item.result.proxied
                        }
                    }
                } Else {
                    Write-Error -Message "$($Response.errors)"
                }
            } Catch {
                $_.Exception.Message
            }
        }
    }

    End {}
}
