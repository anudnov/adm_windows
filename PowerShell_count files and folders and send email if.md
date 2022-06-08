Powershell script for count files in folder and send email
```
$Output = "c:\temp\*"
$Count = (Get-ChildItem $Output | Measure-Object).Count

IF ((Get-ChildItem $Output | Measure-Object).Count -gt 1)
{

    $MailArgs = @{
            'To'          = "mail@my_mail_server com", "mail1@my_mail_server com"
            'From'        = "count_files_alert@my_mail_server com"
            'Subject'     = "Attention! - $Count files exist in folder temp, please check."
            'Body'        = "Number of files is: $Count"
            'SmtpServer' = "my_mail_server"
    }

    Send-MailMessage @MailArgs
    
}
```
