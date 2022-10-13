############# Find Duplicate Files based on Hash Value ###############
#############https://sid-500.com/2020/04/26/find-duplicate-files-with-powershell/###############
''
$filepath = Read-Host 'Enter file path for searching duplicate files (e.g. C:\demo)'

If (Test-Path $filepath) {
''
Write-Warning 'Searching for duplicates ... Please wait ...'

$duplicates = Get-ChildItem $filepath -File -Recurse `
-ErrorAction SilentlyContinue | 
Get-FileHash | 
Group-Object -Property Hash |
Where-Object Count -GT 1

If ($duplicates.count -lt 1)

{
    Write-Warning 'No duplicates found.'
    Break  ''
}

else {
    Write-Warning "Duplicates found."
    $result = foreach ($d in $duplicates) 
    { 
    $d.Group | Select-Object -Property Path, Hash   
    } 

$date = Get-Date -Format "MM/dd/yyy"
$itemstomove = $result | 
Out-GridView -Title `
"Select files (CTRL for multiple) and press OK. Selected files will be moved to C:\Duplicates_$date" `
-PassThru 

If ($itemstomove)

{
New-Item -ItemType Directory `
-Path $env:SystemDrive\Duplicates_$date -Force
Move-Item $itemstomove.Path `
-Destination $env:SystemDrive\Duplicates_$date -Force
''
Write-Warning `
"Mission accomplished. Selected files moved to C:\Duplicates_$date"

Start-Process "C:\demo2\Duplicates_$date"
}

else 
{
Write-Warning "Operation aborted. No files selected."
}
}
}
else 
{
    Write-Warning `
    "Folder not found. Use full path to directory e.g. C:\demo2\photos\patrick"
}
