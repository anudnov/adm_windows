## How to count the files in a folder: 
```
cd D:\temp
(Get-ChildItem | Measure-Object).Count
```

## How to delete files in folder:
1.Open a new PowerShell window.
2.Type the following command:

```
Get-ChildItem “%userprofile%\Downloads” -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-30))}| Remove-Item
```
_If the Get-ChildItem cmdlet finds any files that are older than a month, then the Remove-Item cmdlet will be called for each file to remove it._


## Delete Files Older Than X Days:
_Open a new PowerShell window, type the following command:_
```
Get-ChildItem “%userprofile%\Downloads” -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-30))}| Remove-Item
```
_If the Get-ChildItem cmdlet finds any files that are older than a month, then the Remove-Item cmdlet will be called for each file to remove it._
