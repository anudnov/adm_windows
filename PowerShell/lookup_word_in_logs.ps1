# Set the root folder where the search should start
$RootFolder = "C:\Path\To\Start"

# Define the word to search for
$SearchWord = "blabalbal@mail.com1"

# Search recursively through all .log files and show matching lines with filename and line number
Get-ChildItem -Path $RootFolder -Recurse -Filter *.log -ErrorAction SilentlyContinue | ForEach-Object {
    $FilePath = $_.FullName
    Select-String -Path $FilePath -Pattern $SearchWord | ForEach-Object {
        [PSCustomObject]@{
            File       = $_.Path
            LineNumber = $_.LineNumber
            LineText   = $_.Line.Trim()
        }
    }
} | Format-Table -AutoSize
