# Define the path
$Path = "D:\temp"

# Delete files older than 300 days
Get-ChildItem -Path $Path -Recurse -File | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } | Remove-Item -Force

# Delete empty folders
Get-ChildItem -Path $Path -Recurse -Directory | Where-Object { (Get-ChildItem -Path $_.FullName -Recurse | Measure-Object).Count -eq 0 } | Remove-Item -Force -Recurse
