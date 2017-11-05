# $PSScriptRoot Fix
If (-not ($PSScriptRoot)) {
    $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
}

$ModuleName = 'CloudflarePS'
Import-Module "$PSScriptRoot\..\$ModuleName\$ModuleName" -Verbose -Force -ErrorAction SilentlyContinue

Describe "$ModuleName Module" {
    Context 'Strict mode' {
        Set-StrictMode -Version latest
		
        It 'should not have any PSScriptAnalyzer warnings' {
            Import-Module PSScriptAnalyzer -Force -ErrorAction SilentlyContinue
            $ScriptWarnings = Invoke-ScriptAnalyzer -Path "$PSScriptRoot\..\$ModuleName" -Recurse -ExcludeRule PSUseShouldProcessForStateChangingFunctions
            $ScriptWarnings | Should BeNullOrEmpty
        }
		
        It "has a valid manifest" {
            { Test-ModuleManifest -Path "$PSScriptRoot\..\$ModuleName\$ModuleName.psd1" -ErrorAction Stop -WarningAction SilentlyContinue } | Should Not Throw
        }
    }
}
