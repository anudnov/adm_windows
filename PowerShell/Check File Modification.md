#### Check file if no changes 24 hours, alert to email

```
# Variables
$filePath = "C:\test\test_log.log"
$smtpServer = "may_mail_server_address"
$smtpFrom = "my_from@domain.local"
$smtpTo = "my_to@domain.local"
$smtpSubject = "The file name was not modified in the last 24 hours."
$smtpBody = "The file file name has not been modified in the last 24 hours. 

File location: 
File C:\test\test_log.log

Sent from server name (PowerShell script)."

# Check file modification time
$file = Get-Item $filePath
$lastWriteTime = $file.LastWriteTime
$currentTime = Get-Date
$timeDifference = $currentTime - $lastWriteTime

# Check if the file was not modified in the last 24 hours
if ($timeDifference.TotalHours -gt 24) {
    # Send email
    $message = New-Object System.Net.Mail.MailMessage
    $message.From = $smtpFrom
    $message.To.Add($smtpTo)
    $message.Subject = $smtpSubject
    $message.Body = $smtpBody

    $smtp = New-Object Net.Mail.SmtpClient($smtpServer)
    $smtp.Send($message)

    Write-Output "Email sent: The file has not been modified in the last 24 hours."
} else {
    Write-Output "The file has been modified within the last 24 hours."
}

```
