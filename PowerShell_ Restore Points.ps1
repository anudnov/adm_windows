# Enable-ComputerRestore -Drive "c:\"
Get-ComputerRestorePoint
# Checkpoint-Computer -Description "Restore_Point_created_23082020" -RestorePointType MODIFY_SETTINGS
Get-ComputerRestorePoint


# Restore-Coomputer -Restore 2
# Disable-ComputerRestore "c:\"



Enter-PSSession -ComputerName desktop
    Get-ComputerRestorePoint
    exit
#
Enter-PSSession -ComputerName
