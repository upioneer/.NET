$dotnetv3 = (Get-ItemProperty -path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.0').Version
$dotnetv35 = (Get-ItemProperty -path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5').Version
$dotnetv4 = (Get-ItemProperty -path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full').Release

$legacydotnets = @(
"$dotnetv3",
"$dotnetv35"
)

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
    [pscustomobject]@{Version="533320"; FriendlyVersion = "4.8.1"}
    [pscustomobject]@{Version="533325"; FriendlyVersion = "4.8.1"}
)

function Get-FriendlyVersion {
    param ([int]$releaseNumber)
    $versionObj = $versions | Where-Object { $_.Version -eq $releaseNumber }
    if ($versionObj) {
        return $versionObj.FriendlyVersion
    } else {
        return "Unknown"
    }
}

Write-Host "The following .NET versions were detected:" -BackgroundColor Black

<#
if ($dotnetv3.Install -eq '1' -and $dotnetv3.SP -ne $null) {
    $sp = $dotnetv3.SP
    Write-Host ".NET v3.0 SP$sp" -ForegroundColor Cyan
} else {
    Write-Host ".NET v3.0" -ForegroundColor Cyan
}
#>

foreach ($legacydotnet in $legacydotnets) {
    if ($legacydotnet -ne $null) {
        Write-Host v$legacydotnet -ForegroundColor Cyan
    }
}

$friendlyVersion = Get-FriendlyVersion -releaseNumber $dotnetv4
Write-Host "v$friendlyVersion" -ForegroundColor Cyan
