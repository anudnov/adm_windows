#### How to Forcibly Stop Jobs That Are Stuck in ‘Stopping’ Status

- Original post: [Veeam Support Knowledge Base](https://www.veeam.com/kb1727)

![This is an image](https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Veeam_logo_topaz_2019.png/120px-Veeam_logo_topaz_2019.png)


### Critical Details

```
  The following steps will forcibly terminate ALL active jobs/restores. 
  Ensure that all tasks that can be stopped have stopped before proceeding. 
  Jobs performing background tasks may simply appear stuck. 
  If you are unsure, rather than terminating jobs with brute force, collect logs and open a support case to ask a Veeam Support engineer to review and assess whether a background task is occurring.
```

#### 1. 
_Stop and Disable all other jobs.
This is done to ensure active jobs can finish their current tasks cleanly.
(Optional) Backup Jobs may be Gracefully stopped allowing them to complete their current tasks.
Backup Copy Jobs have no "Stop" option, instead Disabling the job will trigger it to begin stopping procedures.
Close the Veeam Backup & Replication console.
Stop all services that begin with the word Veeam._

PowerShell:
Get-Service Veeam* | Stop-Service

PowerShell:
```
Get-Service Veeam* | Stop-Service
```

#### 2. 
_Open the Task Manager on the Veeam Server and kill all VeeamAgent.exe processes.
Note: Some VeeamAgent.exe processes will be located on Source Proxies and Windows Repositories that are not the Veeam Server._

PowerShell:
```
Stop-Process -Name VeeamAgent
```
- Wait 5-10 minutes for the tasks to time out and fail. 
  Remove snapshots from VM(s) that are part of the stuck jobs.

#### 3. 
Start services.
PowerShell:
```
Get-Service Veeam* | Start-Service
```
