<#
Количество файлов в папках и размер папок
PowerShell скрипт выводит на экран и в файл D:\CountFiles.csv информацию о том, 
сколько содержит файлов каждая папка и подпапки в директории D:\Photos, 
а также размер этих папок и подпапок. csv файл можно импортировать в exel или гугл-таблицы и отсортировать столбцы по возрастанию или спаданию. 
Скрипт может пригодиться при оптимизации файлового хранилища.
#>
$source="d:\Install"
Get-ChildItem $source -recurse -force | where {$_.psIscontainer} | foreach {
   $count = Get-ChildItem $_.fullname -recurse | where {$_.length} | Measure-Object -property length -Sum
   Write-Host($_.FullName)
   $FilesSize = '{0:F}' -f ((($count.Sum)/1024)/1024)
   Write-Host("Files: " + $count.count )
   Write-Host("Size: " + $FilesSize + " MB")
   '"' + $_.FullName + '","' + $count.count + '","' + $FilesSize + '"' | Out-File D:\CountFiles.csv -Append
}
