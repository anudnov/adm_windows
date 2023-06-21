#### PowerShell install or uninstall aplication.
#### Example with "Wazuh Agent".
#### Local computer or remote. Connect to remote computer in domain: 
```
Enter-PSSession -ComputerName computer_name -Credential doamin_name\user_name
```

1.Check if exist:
```
Get-Process WazuhSvc 
```
2.Get service status:
```
Get-Service WazuhSvc
```
```
NET stop WazuhSvc
```
```
NET start WazuhSvc
```
