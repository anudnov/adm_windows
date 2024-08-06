#### Domain Controller Health Check Guide
```
repadmin /showrepl
```
```
repadmin /showrepl /errorsonly
```
```
$services = 'ntds', 'adws', 'dns', 'dnscache', 'kdc', 'w32time', 'netlogon' 
Get-Service $services | Select-Object MachineName, DisplayName, Status
```

