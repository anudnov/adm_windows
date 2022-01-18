## How to count the files in a folder: 
```
cd D:\temp
(Get-ChildItem | Measure-Object).Count
```

## Delete Files Older Than X Days:
_Open a new PowerShell window, type the following command:_
```
Get-ChildItem “%userprofile%\Downloads” -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-30))}| Remove-Item
```
_If the Get-ChildItem cmdlet finds any files that are older than a month, then the Remove-Item cmdlet will be called for each file to remove it._
