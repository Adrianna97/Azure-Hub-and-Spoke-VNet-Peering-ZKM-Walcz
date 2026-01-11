# ================================
# CONFIGURE NSG RULES
# ================================

$rg = "rg-hubspoke"
$location = "PolandCentral"

# Create NSG for Spoke
$nsgSpoke = New-AzNetworkSecurityGroup -Name "spoke-nsg" -ResourceGroupName $rg -Location $location

# Allow RDP to HUB VMs
Add-AzNetworkSecurityRuleConfig `
    -NetworkSecurityGroup $nsgSpoke `
    -Name "Allow-RDP-to-Hub" `
    -Protocol "Tcp" `
    -Direction "Outbound" `
    -Priority 100 `
    -SourceAddressPrefix "*" `
    -DestinationAddressPrefix "10.100.0.0/16" `
    -DestinationPortRange 3389 `
    -Access "Allow"

Set-AzNetworkSecurityGroup -NetworkSecurityGroup $nsgSpoke

# Assign NSG to Spoke subnets
$spokeAdmin = Get-AzVirtualNetwork -Name "vnet-spoke-admin" -ResourceGroupName $rg
Set-AzVirtualNetworkSubnetConfig -Name "spoke-admin" -VirtualNetwork $spokeAdmin -AddressPrefix "10.101.1.0/24" -NetworkSecurityGroup $nsgSpoke
Set-AzVirtualNetwork -VirtualNetwork $spokeAdmin
