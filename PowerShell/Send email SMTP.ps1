Send-MailMessage -To “mail@domain.name” -From “mail@domain.name”  -Subject “Test message subject” -Body “Some important plain text!” -SmtpServer “IP_ADDRESS” -Port 25
#
#
# Attacement:

Send-MailMessage -To “mail@domain.name” -From “mail@domain.name”  -Subject “Test message subject” -Body “Some important plain text!” -Attachments c:\scripts\data.csv -SmtpServer “IP_ADDRESS” -Port 25
Send-MailMessage -To “mail@domain.name” -From “mail@domain.name”  -Subject “Test message subject” -Body “Some important plain text!” -Attachments .\data.csv -SmtpServer “IP_ADDRESS” -Port 25
#.\data.csv = C:\Users\user_name\data.csv



# Send email SMTP with PowerShell
# test send an email SMTP with an account to authenticate the mail server.
# Original post: https://devopslite.com/how-to-send-mail-smtp-with-powershell/
<#
$username = 'usertest'
$password = 'Passtest123'
$secpasswd = ConvertTo-SecureString $password -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ($username, $secpasswd)
Send-MailMessage -Credential $mycreds -SmtpServer retail.smtp.com -Port 25 -From usertest@devopslite.com -To ghost@gmail.com -Subject test -Body test
#>
<#
$username = 'usertest'
$password = 'Passtest123'
$secpasswd = ConvertTo-SecureString $password -AsPlainText -Force
$mycreds = New-Object System.Management.Automation.PSCredential ($username, $secpasswd)
Send-MailMessage -Credential $mycreds -SmtpServer retail.smtp.com -Port 587 -UseSsl -From usertest@devopslite.com -To ghost@gmail.com -Subject test -Body test
#>
