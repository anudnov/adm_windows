Delete Files Older Than x Days
```
forfiles /p "D:\Backups\" /s /m *.* /c "cmd /c Del @path" /d -30
```
