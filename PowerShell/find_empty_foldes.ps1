# Set the directory path to search in
$directoryPath = "D:\demo"

# Get all empty folders in the directory
$emptyFolders = Get-ChildItem $directoryPath -Directory -Recurse | Where-Object { $_.GetFileSystemInfos().Count -eq 0 }

# Loop through each empty folder and check its last modified date
foreach ($folder in $emptyFolders) {
    $lastModifiedDate = $folder.LastWriteTime
    $daysSinceModified = (Get-Date) - $lastModifiedDate
    Write-Host "Empty folder $($folder.FullName) was last modified on $($lastModifiedDate.ToShortDateString()). It has been $($daysSinceModified.Days) days since it was last modified."
}
