Send-MailMessage -To “mail@domain.name” -From “mail@domain.name”  -Subject “Test message subject” -Body “Some important plain text!” -SmtpServer “outgoing.livedns.co.il” -Port 25
#
#
# Attacement:

Send-MailMessage -To “mail@domain.name” -From “mail@domain.name”  -Subject “Test message subject” -Body “Some important plain text!” -Attachments c:\scripts\data.csv -SmtpServer “outgoing.livedns.co.il” -Port 25
Send-MailMessage -To “mail@domain.name” -From “mail@domain.name”  -Subject “Test message subject” -Body “Some important plain text!” -Attachments .\data.csv -SmtpServer “outgoing.livedns.co.il” -Port 25
#.\data.csv = C:\Users\user_name\data.csv

