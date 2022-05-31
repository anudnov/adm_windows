ECHO OFF

ECHO Step 1 - Enable the services.
sc config IISADMIN start=auto
sc config named start=auto
sc config MEMTAS start=auto
sc config MELCS start=auto
sc config MEPOPS start=auto
sc config MEPOCS start=auto
sc config MESMTPCS start=auto
sc config SMTPSVC start=auto
sc config W3SVC start=auto
sc config "Zabbix Agent" start=auto
pause

ECHO Step 2 - Stopping services.
net start IISADMIN /y
net start named /y
net start MEMTAS /y
net start MELCS /y
net start MEPOPS /y
net start MEPOCS /y
net start MESMTPCS /y
net start SMTPSVC /y
net start W3SVC /y
net start "Zabbix Agent" /y
pause 


ECHO Step 3 - Show services status
ECHO Service: iisadmin 
sc query "iisadmin" | find "RUNNING" 
sc query "iisadmin" | find "STOPPED"
ECHO Service: ISC BIND
sc query "named" | find "RUNNING"
sc query "named" | find "STOPPED" 
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
