# ================================
# CREATE HUB AND SPOKE VNETS
# ================================

# Variables
$rg = "rg-hubspoke"
$location = "PolandCentral"

# Create Resource Group
New-AzResourceGroup -Name $rg -Location $location

# HUB VNet
New-AzVirtualNetwork `
    -Name "vnet-hub" `
    -ResourceGroupName $rg `
    -Location $location `
    -AddressPrefix "10.100.0.0/16" `
    -Subnet @(
        New-AzVirtualNetworkSubnetConfig -Name "subnet-app" -AddressPrefix "10.100.1.0/24",
        New-AzVirtualNetworkSubnetConfig -Name "subnet-dc" -AddressPrefix "10.100.2.0/24",
        New-AzVirtualNetworkSubnetConfig -Name "subnet-backup" -AddressPrefix "10.100.3.0/24"
    )

# SPOKE VNets
New-AzVirtualNetwork `
    -Name "vnet-spoke-admin" `
    -ResourceGroupName $rg `
    -Location $location `
    -AddressPrefix "10.101.0.0/16" `
    -Subnet (New-AzVirtualNetworkSubnetConfig -Name "spoke-admin" -AddressPrefix "10.101.1.0/24")

New-AzVirtualNetwork `
    -Name "vnet-spoke-transport" `
    -ResourceGroupName $rg `
    -Location $location `
    -AddressPrefix "10.102.0.0/16" `
    -Subnet (New-AzVirtualNetworkSubnetConfig -Name "spoke-transport" -AddressPrefix "10.102.1.0/24")

New-AzVirtualNetwork `
    -Name "vnet-spoke-finanse" `
    -ResourceGroupName $rg `
    -Location $location `
    -AddressPrefix "10.103.0.0/16" `
    -Subnet (New-AzVirtualNetworkSubnetConfig -Name "spoke-finanse" -AddressPrefix "10.103.1.0/24")
