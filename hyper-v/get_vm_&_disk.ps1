Get-VM -ComputerName HYPERV-SERVER | ForEach-Object {
    $vm = $_
    Get-VMHardDiskDrive -VMName $vm.Name -ComputerName hyperv51 | ForEach-Object {
        $vhd = Get-VHD -Path $_.Path -ComputerName hyperv51
        [PSCustomObject]@{
            VMName     = $vm.Name
            State      = $vm.State
            DiskPath   = $vhd.Path
            DiskSizeGB = [math]::Round($vhd.Size / 1GB, 2)
        }
    }
}
