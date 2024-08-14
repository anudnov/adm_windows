#### Show all disks properties: DriveLetter, File system, Allocation Unit Size, Capacity
```
Get-Volume | Select-Object DriveLetter, FileSystem, AllocationUnitSize, @{Name="Capacity(GB)";Expression={[math]::round($_.Size/1GB,2)}}

```

#### Show disks D: and E: properties: DriveLetter, File system, Allocation Unit Size, Capacity
```
Get-Volume | Where-Object { $_.DriveLetter -eq 'D' -or $_.DriveLetter -eq 'E' } | Select-Object DriveLetter, FileSystem, AllocationUnitSize, @{Name="Capacity(GB)";Expression={[math]::round($_.Size/1GB,2)}}
```
