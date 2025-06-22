#1. list files on folder: F:\Server_Backup\
#2. find las modified file. 
#3. ZIP the file
#4. Move to remote location.
#5. Skip if dst not exist
#6. Skip if file exist.
#7. Delete on remote location file if older then.



# Define the folder path
$folderPath = "F:\Server_Backup\"

#Define the destination network path
$destinationPath = "\\10.10.10.10\backup"

# Check if the remote location exists
if (-Not (Test-Path -Path $destinationPath)) {
    Write-Output "The remote location $destinationPath does not exist. Skipping the task."
    exit
}

# Get all files in the folder
$files = Get-ChildItem -Path $folderPath

# Find the last modified file
$lastModifiedFile = $files | Sort-Object LastWriteTime -Descending | Select-Object -First 1

# Check if a file was found
if ($lastModifiedFile) {
    # Define the zip file name and path
    $zipFileName = "$($lastModifiedFile.BaseName).zip"
    $zipFilePath = Join-Path -Path $folderPath -ChildPath $zipFileName
    $destinationFilePath = Join-Path -Path $destinationPath -ChildPath $zipFileName

    # Check if the zip file already exists on the destination
    if (Test-Path -Path $destinationFilePath) {
        Write-Output "The zip file $zipFileName already exists in the destination. Skipping task."
    } else {
        # Create a zip of the last modified file
        Write-Output "Zipping the file: $($lastModifiedFile.FullName)"
        Compress-Archive -Path $lastModifiedFile.FullName -DestinationPath $zipFilePath

        # Move the zip file to the destination folder
        Write-Output "Moving the zip file to $destinationPath"
        Move-Item -Path $zipFilePath -Destination $destinationPath

        Write-Output "File successfully moved to $destinationPath"
    }
} else {
    Write-Output "No files found in the folder."
}

# Check remote folder for .zip files older than 3 days and delete them
Write-Output "Checking remote location for .zip files older than 3 days..."

# Get all .zip files in the destination folder
$remoteFiles = Get-ChildItem -Path $destinationPath -Filter "*.zip"

# Define the threshold for file age (3 days)
$thresholdDate = (Get-Date).AddDays(-3)

# Loop through the remote files and delete those older than 3 days
foreach ($remoteFile in $remoteFiles) {
    if ($remoteFile.LastWriteTime -lt $thresholdDate) {
        Write-Output "Deleting file: $($remoteFile.Name), last modified on $($remoteFile.LastWriteTime)"
        Remove-Item -Path $remoteFile.FullName -Force
    }
}

Write-Output "Old .zip files deletion complete."
