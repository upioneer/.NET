<#
    Detect .NET Version

    v1.3
        Added detection for v3.0, v3.5
    v1.2
        Updated detection list
    v1.1
        Appended detection for .NET v4.8

    v1.0
        Runs against a preset release hexadecimal value

    Author: Jasen Henry
    Ref:
        https://learn.microsoft.com/en-us/dotnet/framework/deployment/deployment-guide-for-developers#detect-net-framework
        https://learn.microsoft.com/en-us/troubleshoot/developer/dotnet/framework/general/determine-dotnet-versions-service-pack-levels
#>

$dotnetv3 = (Get-ItemProperty -path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.0')
$dotnetv35 = (Get-ItemProperty -path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5').Version
$dotnetv4 = (Get-ItemProperty -path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full').Release

Write-Host ""

$versions = @(
    [pscustomobject]@{Version="378389"; FriendlyVersion = "4.5"}
    [pscustomobject]@{Version="378675"; FriendlyVersion = "4.5.1"}
    [pscustomobject]@{Version="378758"; FriendlyVersion = "4.5.1"}
    [pscustomobject]@{Version="379893"; FriendlyVersion = "4.5.2"}
    [pscustomobject]@{Version="393295"; FriendlyVersion = "4.6"}
    [pscustomobject]@{Version="393297"; FriendlyVersion = "4.6"}
    [pscustomobject]@{Version="394254"; FriendlyVersion = "4.6.1"}
    [pscustomobject]@{Version="394271"; FriendlyVersion = "4.6.1"}
    [pscustomobject]@{Version="394802"; FriendlyVersion = "4.6.2"}
    [pscustomobject]@{Version="394806"; FriendlyVersion = "4.6.2"}
    [pscustomobject]@{Version="460798"; FriendlyVersion = "4.7"}
    [pscustomobject]@{Version="460805"; FriendlyVersion = "4.7"}
    [pscustomobject]@{Version="461308"; FriendlyVersion = "4.7.1"}
    [pscustomobject]@{Version="461310"; FriendlyVersion = "4.7.1"}
    [pscustomobject]@{Version="461814"; FriendlyVersion = "4.7.2"}
    [pscustomobject]@{Version="461808"; FriendlyVersion = "4.7.2"}
    [pscustomobject]@{Version="461814"; FriendlyVersion = "4.7.2"}
    [pscustomobject]@{Version="528040"; FriendlyVersion = "4.8"}
    [pscustomobject]@{Version="528049"; FriendlyVersion = "4.8"}
    [pscustomobject]@{Version="528372"; FriendlyVersion = "4.8"}
    [pscustomobject]@{Version="533325"; FriendlyVersion = "4.8.1"}
)


if ($dotnetv3.Install -eq '1' -and $dotnetv3.SP -ne $null) {
    $sp = $dotnetv3.SP
    Write-Host ".NET v3.0 SP$sp" -ForegroundColor Cyan
} else {
    Write-Host ".NET v3.0" -ForegroundColor Cyan
}




switch ($dotnetversion) {
    "378389" {Write-Host ".NET Framework v4.5 detected" -ForegroundColor Cyan}
    "378675" {Write-Host ".NET Framework v4.5.1 detected" -ForegroundColor Cyan} # 8.1 / Server 2012 R2
    "378758" {Write-Host ".NET Framework v4.5.1 detected" -ForegroundColor Cyan} # Vista / 7 SP1 / 8
    "379893" {Write-Host ".NET Framework v4.5.2 detected" -ForegroundColor Cyan}
    "393295" {Write-Host ".NET Framework v4.6 detected" -ForegroundColor Cyan} # 10
    "393297" {Write-Host ".NET Framework v4.6 detected" -ForegroundColor Cyan} # All other OS
    "394254" {Write-Host ".NET Framework v4.6.1 detected" -ForegroundColor Cyan} # 10 v1709
    "394271" {Write-Host ".NET Framework v4.6.1 detected" -ForegroundColor Cyan} # All other OS
    "394802" {Write-Host ".NET Framework v4.6.2 detected" -ForegroundColor Cyan} # 10 v1607 / Server 2016
    "394806" {Write-Host ".NET Framework v4.6.2 detected" -ForegroundColor Cyan} # All other OS
    "460798" {Write-Host ".NET Framework v4.7 detected" -ForegroundColor Cyan} # 10 v1703
    "460805" {Write-Host ".NET Framework v4.7 detected" -ForegroundColor Cyan} # All other OS
    "461308" {Write-Host ".NET Framework v4.7.1 detected" -ForegroundColor Cyan} # 10 v1709
    "461310" {Write-Host ".NET Framework v4.7.1 detected" -ForegroundColor Cyan} # All other OS
    "461814" {Write-Host ".NET Framework v4.7.2 detected" -ForegroundColor Cyan} # 10 v1809
    "461808" {Write-Host ".NET Framework v4.7.2 detected" -ForegroundColor Cyan} # 10 v1803
    "461814" {Write-Host ".NET Framework v4.7.2 detected" -ForegroundColor Cyan} # All other OS
    "528040" {Write-Host ".NET Framework v4.8 detected" -ForegroundColor Cyan} # Windows 10 v1903
    "528049" {Write-Host ".NET Framework v4.8 detected" -ForegroundColor Cyan} # All other OS
    "528372" {Write-Host ".NET Framework v4.8 detected" -ForegroundColor Cyan}
    "533325" {Write-Host ".NET Framework v4.8.1 detected" -ForegroundColor Cyan}
    default {Write-Host ".NET Framework is not installed or in the predetermined list" -ForegroundColor Yellow}
}