#Удаляем файлы старше трех месяцев
$date = (Get-Date).AddMonths(-3)
Get-ChildItem -Path D:\Files\Common | where {!$_.PSIsContainer} |
foreach {
   if ($_.LastWriteTime -lt $date) {
      # в тестовых целях указываем -whatif
      # когда убедимся что все корректно работает то убираем его
      Remove-Item $_ -whatif
   }
}
