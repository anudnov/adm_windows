ECHO OFF
ECHO Step 1 - Stopping services.
net stop "Spooler" /y
pause 

ECHO Step 2 - Disable the services.
sc config "Spooler" start=disabled

pause

ECHO Step 3 - Show services status
ECHO Service: iisadmin 
sc query "Spooler" | find "RUNNING" 
sc query "Spooler" | find "STOPPED"
pause
