Get file - LastWriteTime, File Name, CreationTime, FullName(location):
```
Get-ChildItem -Path D:\demo\*.bat -Recurse | select LastWriteTime,Name,CreationTime,LastWriteTime,FullName
```
