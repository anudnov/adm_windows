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
2. If application exist, remove:
```
Get-WmiObject -Class Win32_Product | Select-Object Name
```
Find needed application: "Wazuh Agent"
Remove:
```
NET stop WazuhSvc
Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq 'Wazuh Agent' } | ForEach-Object { $_.Uninstall() }
Get-Service WazuhSvc
```

3.Install:
```
Invoke-WebRequest -Uri https://packages.wazuh.com/4.x/windows/wazuh-agent-4.3.11-1.msi -OutFile ${env:tmp}\wazuh-agent-4.3.11.msi; msiexec.exe /i ${env:tmp}\wazuh-agent-4.3.11.msi /q WAZUH_MANAGER='wazyhsrv' WAZUH_REGISTRATION_SERVER='10.0.0.133' WAZUH_AGENT_GROUP='Office-Workstation' 
Get-Service WazuhSvc
NET start WazuhSvc
```
```
Get-Service WazuhSvc
```
