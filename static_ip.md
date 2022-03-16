#################################################################################################
#### How to assign static IP address using Command Prompt
```
netsh interface ip show config
```
_ipconfig /all_
```
netsh interface ip set address name="Ethernet" static 10.1.0.17 255.255.255.0 10.1.0.254
netsh interface ip set dns name="Ethernet" static 1.1.1.1
netsh interface ip add dns name="Ethernet" 8.8.8.8 index=2
```
```
netsh interface ip set address "Ethernet" dhcp
netsh interface ip set dns "Ethernet" dhcp
```
#################################################################################################
#### How to assign static IP address using PowerShell
```
Get-NetIPConfiguration
```
```
New-NetIPAddress -InterfaceIndex 12 -IPAddress 10.1.0.17 -PrefixLength 24 -DefaultGateway 10.1.0.254
Set-DnsClientServerAddress -InterfaceIndex 12 -ServerAddresses 1.1.1.1, 8.8.8.8
```
```
Set-NetIPInterface -InterfaceIndex 12 -Dhcp Enable
Get-NetIPAddress -InterfaceIndex 12 | Remove-NetRoute
```
_Set-NetIPInterface -InterfaceAlias 'Ethernet 4' -Dhcp Enabled_

#################################################################################################
