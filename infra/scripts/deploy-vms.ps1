# ================================
# DEPLOY HUB AND SPOKE VMs
# ================================

$rg = "rg-hubspoke"
$location = "PolandCentral"
$cred = Get-Credential -Message "Enter admin credentials for all VMs"

# HUB VMs
New-AzVM -ResourceGroupName $rg -Name "hub-appserver" -Location $location -VirtualNetworkName "vnet-hub" -SubnetName "subnet-app" -Credential $cred -Image "Win2019Datacenter"
New-AzVM -ResourceGroupName $rg -Name "hub-dc" -Location $location -VirtualNetworkName "vnet-hub" -SubnetName "subnet-dc" -Credential $cred -Image "Win2019Datacenter"
New-AzVM -ResourceGroupName $rg -Name "hub-backup" -Location $location -VirtualNetworkName "vnet-hub" -SubnetName "subnet-backup" -Credential $cred -Image "Win2019Datacenter"

# SPOKE VMs
New-AzVM -ResourceGroupName $rg -Name "admin-vm" -Location $location -VirtualNetworkName "vnet-spoke-admin" -SubnetName "spoke-admin" -Credential $cred -Image "Win2019Datacenter"
New-AzVM -ResourceGroupName $rg -Name "transport-vm" -Location $location -VirtualNetworkName "vnet-spoke-transport" -SubnetName "spoke-transport" -Credential $cred -Image "Win2019Datacenter"
New-AzVM -ResourceGroupName $rg -Name "finanse-vm" -Location $location -VirtualNetworkName "vnet-spoke-finanse" -SubnetName "spoke-finanse" -Credential $cred -Image "Win2019Datacenter"
