Function Set-CFDevelopmentMode {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, HelpMessage = 'Do you want to Enable or Disable development mode?')]
        [ValidateSet('Enable','Disable')]
        [String]$Request
    )
    
    Begin {
        If (-not ($CFHeaders -and $CFZoneID)) {Import-CFConfig}
    }

    Process {
        If ($ConfigImported) {
            Try {
                $Uri = "$BaseUri/zones/$CFZoneID/settings/development_mode"

                If ($Request -eq 'Enable') {
                    $Response = Invoke-RestMethod -Method Patch -Uri $Uri -Headers $CFHeaders -Body '{"value":"on"}'
                    If ($Response.success) {
                        Write-Output 'Enabled'
                    } Else {
                        Write-Error -Message "$($Response.errors)"
                    }
                } Else {
                    $Response = Invoke-RestMethod -Method Patch -Uri $Uri -Headers $CFHeaders -Body '{"value":"off"}'
                    If ($Response.success) {
                        Write-Output 'Disabled'
                    } Else {
                        Write-Error -Message "$($Response.errors)"
                    }
                }
            } Catch {
                $_.Exception.Message
            }
        }
    }
    
    End {}
}
