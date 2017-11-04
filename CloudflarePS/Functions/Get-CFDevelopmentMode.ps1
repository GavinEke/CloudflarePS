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

                If ($Response.success) {
                    If ($Response.result.value -eq 'off') {
                        Write-Output 'Disabled'
                    } ElseIf ($Response.result.value -eq 'on') {
                        Write-Output 'Enabled'
                    } Else {
                        Write-Error -Message 'Cloudflare API returned invalid or unrecognized response'
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
