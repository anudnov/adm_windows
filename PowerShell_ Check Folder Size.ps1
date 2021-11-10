
"{0:N2} GB" -f ((Get-ChildItem C:\users\ -Recurse | Measure-Object -Property Length -Sum -ErrorAction Stop).Sum / 1GB)

######
#Можно получить размер всех вложенных папок первого уровня в указанном каталоге.
#Например, нам нужно получить размер всех профилей пользователей в папке C:\users.
######

gci -force 'd:\' -ErrorAction SilentlyContinue | ? { $_ -is [io.directoryinfo] } | % {$len = 0gci -recurse -force $_.fullname -ErrorAction SilentlyContinue | % { $len += $_.length }$_.fullname, '{0:N2} GB' -f ($len / 1Gb)}
