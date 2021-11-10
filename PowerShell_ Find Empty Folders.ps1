#
$share = Get-ChildItem '\\10.0.0.117\LiveCRM-Demo' -Recurse | Where { $_.PsIsContainer -eq $true }

$share | Where { $_.GetFiles().Count -eq 0 -and $_.GetDirectories().Count -eq 0 }
