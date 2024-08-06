#### Time - windows
```
W32tm /resync /force
```
```
w32tm /resync
```
```
net start w32time
net stop w32time
```
#### or
```
stop-service w32time
start-service w32time
```
```
w32tm /stripchart /computer:time.windows.com /samples:4 /dataonly
w32tm /config /manualpeerlist: time.windows.com /syncfromflags:manual /reliable:yes /update
w32tm /query /status
w32tm /resync
```
