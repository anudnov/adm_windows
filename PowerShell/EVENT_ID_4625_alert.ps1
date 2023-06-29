$endTime = Get-Date
$startTime = $endTime.AddHours(-6)
$eventFound = $false

$events = Get-WinEvent -LogName Security -FilterXPath "*[System[EventID=4625]]" | Where-Object { $_.TimeCreated -gt $startTime -and $_.TimeCreated -lt $endTime }

$computerName = hostname
$ipAddress = (Get-NetIPAddress | Where-Object { $_.AddressFamily -eq "IPv4" -and $_.InterfaceAlias -ne "Loopback" }).IPAddress

foreach ($event in $events) {
    $properties = $event.Properties

    $timeCreated = $event.TimeCreated.ToString()
    $accountName = $properties[5].Value
    $sourceNetworkAddress = $properties[19].Value

    Write-Output $timeCreated
    Write-Output $accountName
    Write-Output $sourceNetworkAddress
    Write-Output "--------------------------"

    # Send an email if a matching event is found
    $eventFound = $true

    $smtpServer = "X.X.X.X"
    $fromEmail = "4625_alert@_mail.com"
    $toEmail = "your_email@_mail.com"
    $subject = "Security Event Alert - Hostname: $computerName"
    $body = @"
A security event with Event ID 4625 has been detected.

Time Created: $timeCreated
Account Name: $accountName
Source Network Address: $sourceNetworkAddress

Hostname: $computerName
IP Address: $ipAddress
"@

    Send-MailMessage -SmtpServer $smtpServer -From $fromEmail -To $toEmail -Subject $subject -Body $body
}

if (-not $eventFound) {
    Write-Output "No matching events found in the specified time range."
}
