Send-MailMessage -To “mail@domain.name” -From “mail@domain.name”  -Subject “Test message subject” -Body “Some important plain text!” -SmtpServer “IP_ADDRESS” -Port 25
#
#
# Attacement:

Send-MailMessage -To “mail@domain.name” -From “mail@domain.name”  -Subject “Test message subject” -Body “Some important plain text!” -Attachments c:\scripts\data.csv -SmtpServer “IP_ADDRESS” -Port 25
Send-MailMessage -To “mail@domain.name” -From “mail@domain.name”  -Subject “Test message subject” -Body “Some important plain text!” -Attachments .\data.csv -SmtpServer “IP_ADDRESS” -Port 25
#.\data.csv = C:\Users\user_name\data.csv

