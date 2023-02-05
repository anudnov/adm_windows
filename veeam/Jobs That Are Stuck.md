How to Forcibly Stop Jobs That Are Stuck in ‘Stopping’ Status

#### Critical Details


```
  The following steps will forcibly terminate ALL active jobs/restores.
  Ensure that all tasks that can be stopped have stopped before proceeding.
  Jobs performing background tasks may simply appear stuck.
  If you are unsure, rather than terminating jobs with brute force, 
  collect logs and open a support case to ask a Veeam Support engineer to review and assess whether a background task is occurring.
```
1. Stop and Disable all other jobs.
This is done to ensure active jobs can finish their current tasks cleanly.
(Optional) Backup Jobs may be Gracefully stopped allowing them to complete their current tasks.
Backup Copy Jobs have no "Stop" option, instead Disabling the job will trigger it to begin stopping procedures.
Close the Veeam Backup & Replication console.
Stop all services that begin with the word Veeam.
Note: If other Veeam software is installed on the same server (e.g.,  Veeam ONE, Veeam Agent for Microsoft Windows, Veeam Backup for Microsoft 365) stopping their services will interupt their operations.

PowerShell:
Get-Service Veeam* | Stop-Service

PowerShell:
```
Get-Service Veeam* | Stop-Service
```

2. Open the Task Manager on the Veeam Server and kill all VeeamAgent.exe processes.
Note: Some VeeamAgent.exe processes will be located on Source Proxies and Windows Repositories that are not the Veeam Server.

PowerShell:
```
Stop-Process -Name VeeamAgent
```
Wait 5-10 minutes for the tasks to time out and fail. 
Remove snapshots from VM(s) that are part of the stuck jobs.

3. VMware Environments: If the Backup/Replication Jobs were using the Virtual Appliance (HOTADD) transport mode, before removing the snapshots make sure there are no stuck disks on the Veeam Backup server or one of the backup proxies. Otherwise, the snapshots can be orphaned. https://vee.am/kb1775
Start the services that were stopped in step 2.

PowerShell:
```
Get-Service Veeam* | Start-Service
```







Original text from [Veeam web site](https://www.veeam.com/kb1727)
