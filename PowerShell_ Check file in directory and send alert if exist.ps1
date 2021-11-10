#################
#################
$file1 = Get-ChildItem -Path D:\temp -Force -Recurse -Include *.txt1
#################
#################
#Email Settings##
$MailFrom = “mail@mail.com”
$Mailto = “mail@mail.com”
$MailSubject = “Please check these folders”
$body =  Get-ChildItem -Path D:\temp -Recurse -Include *.txt | FT | Out-String
$smtp = new-object Net.Mail.SmtpClient($smtpServer)

#################
#################
#Check for Existence of Files####
if (Test-Path $file1)

{
  ####echo “File already exists: $body”;
Send-MailMessage -to $Mailto -from $MailFrom -subject $MailSubject -body $body -smtpServer SMTP_server
}

##################################
##################################
###Else####
#{
#Send Email
#Send-MailMessage -to $Mailto -from $MailFrom -subject $MailSubject -body “$file1 does not exist on the path” -smtpServer SMTP_server
#Send-MailMessage -to $Mailto -from $MailFrom -subject $MailSubject -body does not exist on the path -smtpServer SMTP_server
#}
##################################
##################################
