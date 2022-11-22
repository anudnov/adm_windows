#Count files in folder
(Get-ChildItem | Measure-Object).Count
# Delete files in c:\temp, older then 5 days
Get-ChildItem "C:\temp" -Recurse | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-5))}| Remove-Item
