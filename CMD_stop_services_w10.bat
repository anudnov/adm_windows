ECHO OFF
ECHO Step 1 - Stopping services.
net stop IISADMIN /y
pause 

ECHO Step 2 - Disable the services.
sc config IISADMIN start=disabled

pause

ECHO Step 3 - Show services status
ECHO Service: iisadmin 
sc query "iisadmin" | find "RUNNING" 
sc query "iisadmin" | find "STOPPED"
pause
