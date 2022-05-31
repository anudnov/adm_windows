ECHO OFF
ECHO Service: iisadmin 
sc query "iisadmin" | find "RUNNING" 
sc query "iisadmin" | find "STOPPED"
ECHO Service: ISC BIND
sc query named | find "STOPPED" 
sc query "named" | find "RUNNING"
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
