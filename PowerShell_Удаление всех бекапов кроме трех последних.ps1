<#
Удаление всех бекапов кроме трех последних
На сервере локально сохраняются бекапы, где папки именуются таким образом: "klbackup2014-01-22#23-00-00". PowerShell скрипт переносит эти папки на сетевой диск и хранить не более 3-х последних бекапов.
#>
Copy-Item "C:\backups\klbackup*\" "\\Server\Backups\klBackup\" -force -recurse -ErrorAction stop
Remove-Item "C:\backups\klbackup*" -force -recurse
$folders = Get-ChildItem "\\Server\Backups\klBackup\klbackup*"
$i = 0
While ($i -lt $folders.count-3) {
   Remove-Item $folders[$i] -force -recurse
   $i++
}
