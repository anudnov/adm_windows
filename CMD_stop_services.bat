ECHO OFF
ECHO Step 1 - Stopping services.
net stop IISADMIN /y
net stop named /y
net stop MEMTAS /y
net stop MELCS /y
net stop MEPOPS /y
net stop MEPOCS /y
net stop MESMTPCS /y
net stop SMTPSVC /y
net stop W3SVC /y
net stop "Zabbix Agent" /y
pause 

ECHO Step 2 - Disable the services.
sc config IISADMIN start=disabled
sc config named start=disabled
sc config MEMTAS start=disabled
sc config MELCS start=disabled
sc config MEPOPS start=disabled
sc config MEPOCS start=disabled
sc config MESMTPCS start=disabled
sc config SMTPSVC start=disabled
sc config W3SVC start=disabled
sc config "Zabbix Agent" start=disabled

pause

ECHO Step 3 - Show services status
ECHO Service: iisadmin 
sc query "iisadmin" | find "RUNNING" 
sc query "iisadmin" | find "STOPPED"
ECHO Service: ISC BIND
sc query "named" | find "RUNNING"
sc query named | find "STOPPED" 
ECHO Service: MEMTAS 
sc query "MEMTAS" | find "RUNNING" 
sc query "MEMTAS" | find "STOPPED"
ECHO Service: MELCS 
sc query "MELCS" | find "RUNNING" 
sc query "MELCS" | find "STOPPED"
ECHO Service: MEPOPS  
sc query "MEPOPS" | find "RUNNING" 
sc query "MEPOPS" | find "STOPPED"
ECHO Service: MEPOCS 
sc query "MEPOCS" | find "RUNNING" 
sc query "MEPOCS" | find "STOPPED"
ECHO Service: MESMTPCS 
sc query "MESMTPCS" | find "RUNNING" 
sc query "MESMTPCS" | find "STOPPED"
ECHO Service: SMTPSVC
sc query "SMTPSVC" | find "RUNNING" 
sc query "SMTPSVC" | find "STOPPED"
ECHO "Service: W3SVC" 
sc query "W3SVC" | find "RUNNING" 
sc query "W3SVC" | find "STOPPED"
ECHO Service: Zabbix 
sc query "Zabbix Agent" | find "RUNNING" 
sc query "Zabbix Agent" | find "STOPPED"
pause
