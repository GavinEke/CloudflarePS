Function Get-CFDevelopmentMode {
    [CmdletBinding()]
    Param()
    
    Begin {
        If (-not ($CFHeaders -and $CFZoneID)) {Import-CFConfig}
    }

    Process {
        If ($ConfigImported) {
            Try {
                $Uri = "$BaseUri/zones/$CFZoneID/settings/development_mode"
                $Response = Invoke-RestMethod -Method Get -Uri $Uri -Headers $CFHeaders

                If ($Response.success -and $Response.result.value -eq 'off') {
                    Write-Output 'Disabled'
                } ElseIf ($Response.success -and $Response.result.value -eq 'on') {
                    Write-Output 'Enabled'
                } ElseIf (-not ($Response.success)) {
                    Write-Error -Message "$($Response.errors)"
                } Else {
                    Write-Error -Message 'Cloudflare API returned invalid or unrecognized response'
                }
            } Catch {
                $_.Exception.Message
            }
        }
    }

    End {}
}
