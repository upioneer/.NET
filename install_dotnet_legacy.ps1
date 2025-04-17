# installs all legacy .net features including v2.0 and v2.5
dism /Online /Enable-Feature /FeatureName:NetFx3 /All

# enable .NET framework 3.5 from windows features
Enable-WindowsOptionalFeature -Online -FeatureName NetFx3 -All -NoRestart

# install from mounted windows install media. use correct drive letter
DISM /Online /Enable-Feature /FeatureName:NetFx3 /All /Source:D:\sources\sxs /LimitAccess
