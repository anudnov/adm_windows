Delete Files Older Than x Days
```
forfiles /p "D:\Backups\" /s /m *.* /c "cmd /c Del @path" /d -30
```
Server 2008
```
forfiles.exe /P "C:\inetpub\mailroot\Badmail" /S /M *.BAD  /D -60 /C "cmd /c del @PATH"
```
