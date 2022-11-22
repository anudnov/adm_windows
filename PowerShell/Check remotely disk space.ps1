## Change the following values accordingly to your server farm
$smtp = "smtp_serer"
$from = "script@domain.com"
$to = "user@mail.cocom"
$subject = "WARNING: Low disk space detected on your pc"
$body = ""
$send = $false
## This is the list of servers to check for free disk space
$servers = @('name-pc','name-pc','name-pc',  $env:COMPUTERNAME)
## Loop through all servers
 
foreach ($server in $servers){
 
    ## Check for free disk space
 
    Get-WmiObject win32_logicaldisk -Filter "Drivetype=3" -ComputerName $server | % {
 
         ## if free space is less then 50 GB create a mail message.
         ## the script creates a row for each drive with low free disk space.
 
         if ($_.FreeSpace/1GB -lt 50){
 
            $body += "<p style='font-family: Calibri, Arial; line-height: 18px;'>SERVER: <b>" + $server + "</b><br/>"
            $body += "DRIVE: <b>" + $_.DeviceID + "</b><br/>"
            $body += "FREE SPACE: <b>" + [math]::truncate($_.FreeSpace/1GB) + " GB</b></p>"
 
            $send = $true
 
         }
    
    }
 
}
 
## Send the mail message if low free disk space is detected
 
if ($send -eq $true){
 
    Send-MailMessage -To $to -Subject $subject -BodyAsHtml $body -SmtpServer $smtp -From $from
 
}
