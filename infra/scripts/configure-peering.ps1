# ================================
# CONFIGURE HUB <-> SPOKE PEERING
# ================================

$rg = "rg-hubspoke"

$hub = Get-AzVirtualNetwork -Name "vnet-hub" -ResourceGroupName $rg
$admin = Get-AzVirtualNetwork -Name "vnet-spoke-admin" -ResourceGroupName $rg
$transport = Get-AzVirtualNetwork -Name "vnet-spoke-transport" -ResourceGroupName $rg
$finanse = Get-AzVirtualNetwork -Name "vnet-spoke-finanse" -ResourceGroupName $rg

# HUB <-> ADMIN
Add-AzVirtualNetworkPeering -Name "hub-to-admin" -VirtualNetwork $hub -RemoteVirtualNetworkId $admin.Id -AllowForwardedTraffic -AllowGatewayTransit
Add-AzVirtualNetworkPeering -Name "admin-to-hub" -VirtualNetwork $admin -RemoteVirtualNetworkId $hub.Id -AllowForwardedTraffic

# HUB <-> TRANSPORT
Add-AzVirtualNetworkPeering -Name "hub-to-transport" -VirtualNetwork $hub -RemoteVirtualNetworkId $transport.Id -AllowForwardedTraffic
Add-AzVirtualNetworkPeering -Name "transport-to-hub" -VirtualNetwork $transport -RemoteVirtualNetworkId $hub.Id -AllowForwardedTraffic

# HUB <-> FINANSE
Add-AzVirtualNetworkPeering -Name "hub-to-finanse" -VirtualNetwork $hub -RemoteVirtualNetworkId $finanse.Id -AllowForwardedTraffic
Add-AzVirtualNetworkPeering -Name "finanse-to-hub" -VirtualNetwork $finanse -RemoteVirtualNetworkId $hub.Id -AllowForwardedTraffic
