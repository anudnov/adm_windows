#### NIC Teaming - manual
#### Create teaming adn VLAN 1001:
```
New-VMSwitch -Name "VLAN1001" -NetAdapterName "ClusterNetwork - VLAN 1001" -AllowNetLbfoTeams $true -AllowManagementOS $true
Set-VMNetworkAdapterVlan -Access -ManagementOS -VlanId 1001 -VMNetworkAdapterName "VLAN1001"
```
