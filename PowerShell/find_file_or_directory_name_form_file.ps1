# Set the directory path to search in
$directoryPath = "D:\demo"

# Set the path to the file containing the search words
$wordsFilePath = "C:\SCRIPT\search_words.txt"

# Read the search words from the file into an array
$searchWords = Get-Content $wordsFilePath

# Get all files and folders in the directory
$filesAndFolders = Get-ChildItem $directoryPath -Recurse

# Loop through each file/folder and check if it matches any of the search words
foreach ($item in $filesAndFolders) {
    foreach ($word in $searchWords) {
        if ($item.Name -like "*$word*") {
            Write-Host "$($item.FullName) matches search word '$word'"
        }
    }
}
