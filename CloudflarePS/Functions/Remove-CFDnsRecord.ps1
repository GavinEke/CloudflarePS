Function Remove-CFDnsRecord {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, HelpMessage = 'DNS record ID')]
        [ValidateLength(20, 140)]
        [String]$Id
    )
    
    Begin {
        If (-not ($CFHeaders -and $CFZoneID)) {Import-CFConfig}
    }

    Process {
        If ($ConfigImported) {
            Try {
                $Uri = "$BaseUri/zones/$CFZoneID/dns_records/$Id"
                $Response = Invoke-RestMethod -Method Delete -Uri $Uri -Headers $CFHeaders
                
                If ($Response.success) {
                    Write-Output "Removed $($Response.result.id)"
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
