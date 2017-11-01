Function Get-CFDevelopmentMode {
    [CmdletBinding()]
    Param()
    
    Begin {
        If (-not ($CFHeaders -and $CFZoneID)) {Import-CFConfig}
    }

    Process {
        If ($ConfigImported) {
            $Response = (Invoke-RestMethod -Method Get -Uri "https://api.cloudflare.com/client/v4/zones/$CFZoneID/settings/development_mode" -Headers $CFHeaders).result
            If ($Response.value -eq 'off') {
                Write-Output 'Disabled'
            } ElseIf ($Response.value -eq 'on') {
                Write-Output 'Enabled'
            } Else {
                Write-Error -Message 'Cloudflare API returned invalid or unrecognized response'
            }
        }
    }

    End {}
}
