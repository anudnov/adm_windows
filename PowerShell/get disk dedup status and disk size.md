#### get disk dedup status and disk size
```
# Get partition information with size, free space, and free space percentage
$partitions = Get-Volume | Select-Object @{Name='Partition';Expression={$_.DriveLetter}},
                                  @{Name='Size (TB)';Expression={[math]::Round($_.Size/1TB, 2)}},
                                  @{Name='Free Space (TB)';Expression={[math]::Round($_.SizeRemaining/1TB, 2)}},
                                  @{Name='Free Space (%)';Expression={[math]::Round(($_.SizeRemaining/$_.Size)*100, 2)}}

# Get deduplication job information
$dedupJobs = Get-DedupJob | Select-Object Volume, Type, Status, Progress, StartTime, EndTime

# Print partition information
$partitions | Format-Table -AutoSize

# Print deduplication job information
$dedupJobs | Format-Table -AutoSize

```
#### get disk dedup status and disk size to email
```
# Define the SMTP server and email details
$smtpServer = "X.X.X.X"
$to = "my_email@domain.local"
$from = "my_email_from@domain.local"
$subject = "Deduplication Status and Disk Information"
$body = @"

The following is the disk information report:

"@

# Get disk information
$diskInfo = Get-WmiObject -Class win32_logicaldisk | 
Format-Table DeviceId, MediaType, 
@{Name="Size (TB)"; Expression={[math]::Round($_.Size/1TB, 2)}}, 
@{Name="Free Space (GB)"; Expression={[math]::Round($_.FreeSpace/1GB, 2)}}, 
@{Name="Free Space (%)"; Expression={[math]::Round(($_.FreeSpace/$_.Size)*100, 2)}} | Out-String

# Append disk information to the email body
$body += $diskInfo

# Add a separator for clarity
$body += "`n`nDeduplication Jobs Report:`n`n"

# Get deduplication job information
$dedupJobs = Get-DedupJob | Format-Table Volume, Status, Type, Progress, StartTime, EndTime | Out-String

# Append deduplication job information to the email body
$body += $dedupJobs

# Send the email
Send-MailMessage -SmtpServer $smtpServer -To $to -From $from -Subject $subject -Body $body
```
