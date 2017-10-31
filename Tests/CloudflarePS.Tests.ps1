# $PSScriptRoot Fix
If (-not ($PSScriptRoot)) {
    $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
}

$ModuleName = 'CloudflarePS'
Import-Module "$PSScriptRoot\..\$ModuleName\$ModuleName" -Verbose -Force -ErrorAction SilentlyContinue

Describe "$ModuleName Module" {
    Context 'Strict mode' {
        Set-StrictMode -Version latest
        It 'should load all functions' {
            $Commands = @( Get-Command -CommandType Function -Module $ModuleName | Select-Object -ExpandProperty Name)
            $Commands.count | Should be 5
            $Commands -contains "Get-CFDevelopmentMode" | Should be $True
            $Commands -contains "Get-CFDnsRecords"      | Should be $True
            $Commands -contains "Import-CFConfig"       | Should be $True
            $Commands -contains "Set-CFConfig"          | Should be $True
            $Commands -contains "Set-CFDevelopmentMode" | Should be $True
		}
		
		It 'Should not have any PSScriptAnalyzer warnings' {
            If (Get-Module -ListAvailable PSScriptAnalyzer) {
                Import-Module PSScriptAnalyzer -Force -ErrorAction SilentlyContinue
                $ScriptWarnings = @(Invoke-ScriptAnalyzer -Path "$PSScriptRoot\..\$ModuleName" -Severity @('Error', 'Warning') -Recurse -Verbose:$false)
            } Else {
                $ScriptWarnings = ""
            }
            $ScriptWarnings.Length | Should be 0
		}
		
        It "has a valid manifest" {
            {
                Test-ModuleManifest -Path "$PSScriptRoot\..\$ModuleName\$ModuleName.psd1" -ErrorAction Stop -WarningAction SilentlyContinue
            } | Should Not Throw
		}
    }
}
