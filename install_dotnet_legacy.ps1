<#
Notes
  .NET 3.5 installation requires an internet connection unless you use local media.
  DISM will fail on Windows 10/11 if you can’t reach Windows Update and don't provide a source path.
  For offline or secure environments, include the SXS folder from the ISO in your package or reference a network share.
#>

# installs all legacy .net features including v2.0 and v2.5
dism /Online /Enable-Feature /FeatureName:NetFx3 /All

# enable .NET framework 3.5 from windows features
Enable-WindowsOptionalFeature -Online -FeatureName NetFx3 -All -NoRestart

# install from mounted windows install media. use correct drive letter
DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /Source:D:\sources\sxs /LimitAccess
