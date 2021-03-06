Function New-CFDnsRecord {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, HelpMessage = 'DNS record type')]
        [ValidateSet('A','AAAA','CNAME')]
        [String]$Type,

        [Parameter(Mandatory = $True, HelpMessage = 'DNS record name')]
        [ValidateLength(1, 255)]
        [String]$Name,

        [Parameter(Mandatory = $True, HelpMessage = 'DNS record content')]
        [Alias('IPAddress','DomainName')]
        [ValidateLength(3, 255)]
        [String]$Content,

        [Parameter(HelpMessage = 'Time to live for DNS record')]
        [ValidateRange(120,2147483647)]
        [Int]$TTL = 120,

        [Parameter(HelpMessage = 'Whether the record is receiving the performance and security benefits of Cloudflare')]
        [ValidateSet('true','false')]
        [String]$Proxied = 'true'
    )
    
    Begin {
        If (-not ($CFHeaders -and $CFZoneID)) {Import-CFConfig}
    }

    Process {
        If ($ConfigImported) {
            Try {
                $Uri = "$BaseUri/zones/$CFZoneID/dns_records"
                $Body = '{"type":"{0}","name":"{1}","content":"{2}","ttl":"{3}","proxied":"{4}"}' -f $Type, $Name, $Content, $TTL, $Proxied
                $Response = Invoke-RestMethod -Method Post -Uri $Uri -Headers $CFHeaders -Body $Body

                If ($Response.success) {
                    [PSCustomObject]@{
                        Id = $Response.result.id
                        Type = $Response.result.type
                        Name = $Response.result.name
                        TTL = $Response.result.ttl
                        Proxied = $Response.result.proxied
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
