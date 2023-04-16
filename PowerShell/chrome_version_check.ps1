$machines = Get-content -Path C:\SCRIPT\machines.txt

ForEach($machine in $machines){
    $Version = (Get-Item (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\chrome.exe').'(Default)').VersionInfo
    "$machine - $Version"
}
