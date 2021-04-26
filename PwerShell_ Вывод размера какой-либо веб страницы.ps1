#Вывод размера какой-либо веб страницы
$web = New-Object System.Net.WebClient
"{0} bytes" -f ($web.DownloadString("https://elims.org.ua/")).length.toString("###,###,##0")
