```
(Get-ChildItem d:\demo\ -Recurse FILE_NAME*) | Format-Table FullName
```
```
Get-ChildItem  -Path D:\demo *.txt -Recurse
```
```
Get-ChildItem  -Path D:\demo "NewDocument.txt" -Recurse
```
```
Get-ChildItem  -Path D:\demo "NewDocument*" -Recurse
```
