ECHO OFF
ECHO Step 1 - Stopping services.
net stop "FoxitReaderUpdateService" /y
pause 

ECHO Step 2 - Disable the services.
sc config "FoxitReaderUpdateService" start=disabled

pause

ECHO Step 3 - Show services status
ECHO Service: iisadmin 
sc query "FoxitReaderUpdateService" | find "RUNNING" 
sc query "FoxitReaderUpdateService" | find "STOPPED"
pause
