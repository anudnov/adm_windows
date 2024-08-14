#### Get Firmware Version and save to a File:
```
$firmwareOutput = Get-WmiObject -Query "SELECT * FROM Win32_DiskDrive" | Select-Object Model, SerialNumber, FirmwareRevision
$firmwareOutput | Out-File -FilePath "C:\temp\FirmwareVersion.txt"
```

#### Get Driver Version and save to a File:
```
$driverOutput = Get-PnpDevice -Class DiskDrive | ForEach-Object {
    $deviceId = $_.InstanceId
    $driverVersion = (Get-PnpDeviceProperty -InstanceId $deviceId -KeyName "DEVPKEY_Device_DriverVersion").Data
    [PSCustomObject]@{
        DeviceID       = $deviceId
        DeviceName     = $_.FriendlyName
        DriverVersion  = $driverVersion
    }
}
$driverOutput | Out-File -FilePath "C:\temp\DriverVersion.txt"

```
