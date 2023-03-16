$computer = "example.com"
$port = 80
$smtpServer = "SMTP_SERVER"
$fromAddress = "network-monitor@my_domain.xxx"
$toAddress = "my_email@my_domain.xxx"
$subject = "Port $port on $computer is closed"
$message = "The network port $port on $computer is closed or blocked by a firewall."

$connection = Test-NetConnection -ComputerName $computer -Port $port
if ($connection.TcpTestSucceeded) {
    Write-Host "Port $port on $computer is open."
} else {
    Send-MailMessage -SmtpServer $smtpServer -From $fromAddress -To $toAddress -Subject $subject -Body $message
    Write-Host "Port $port on $computer is closed. Email sent to $toAddress."
}
