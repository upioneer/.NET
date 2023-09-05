<#
    Detect .NET Version

    v1.2
        Updated detection list
    v1.1
        Appended detection for .NET v4.8

    v1.0
        Runs against a preset release hexadecimal value

    Author: Jasen Henry
    Ref: https://learn.microsoft.com/en-us/dotnet/framework/deployment/deployment-guide-for-developers#detect-net-framework
#>

$dotnetversion = (Get-ItemProperty -path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full').Release

Write-Host ""

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