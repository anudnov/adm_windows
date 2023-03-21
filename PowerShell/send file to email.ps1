$EmailFrom = "your_email_address@your_domain.com"
$EmailTo = "recipient_email_address@their_domain.com"
$Subject = "Email Subject"
$Body = "Email Body"
$SMTPServer = "smtp.your_domain.com"
$SMTPPort = "587"
# $Username = "your_email_address@your_domain.com"
# $Password = "your_email_password"
$Attachment = "C:\temp\file.txt"

$Message = New-Object System.Net.Mail.MailMessage($EmailFrom, $EmailTo, $Subject, $Body)
$Attachment = New-Object System.Net.Mail.Attachment($Attachment)
$Message.Attachments.Add($Attachment)

$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, $SMTPPort)
# $SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($Username, $Password)

$SMTPClient.Send($Message)
