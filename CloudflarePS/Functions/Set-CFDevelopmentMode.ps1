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
            If ($Request -eq 'Enable') {
                $Response = (Invoke-RestMethod -Method Patch -Uri "https://api.cloudflare.com/client/v4/zones/$CFZoneID/settings/development_mode" -Headers $CFHeaders -Body '{"value":"on"}').result
                Write-Output 'Enabled'
            } Else {
                $Response = (Invoke-RestMethod -Method Patch -Uri "https://api.cloudflare.com/client/v4/zones/$CFZoneID/settings/development_mode" -Headers $CFHeaders -Body '{"value":"off"}').result
                Write-Output 'Disabled'
            }
        }
    }
    
    End {}
}
