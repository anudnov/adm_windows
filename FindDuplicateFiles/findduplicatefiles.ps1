# find duplicate files
cd D:\demo\
Get-ChildItem -Recurse | Get-FileHash | Group-Object -Property Hash | Where-Object Count -GT 1 | foreach {$_.Group | select Path, Hash}
