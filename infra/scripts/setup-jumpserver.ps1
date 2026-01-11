# ================================
# DEPLOY JUMP SERVER WITH PUBLIC IP
# ================================

$rg = "rg-hubspoke"
$location = "PolandCentral"
$cred = Get-Credential

# Public IP
$pubip = New-AzPublicIpAddress -Name "jumpserver-ip" -ResourceGroupName $rg -Location $location -AllocationMethod Static

# NIC
$nic = New-AzNetworkInterface -Name "jumpserver-nic" -ResourceGroupName $rg -Location $location `
    -SubnetId (Get-AzVirtualNetwork -Name "vnet-spoke-admin" -ResourceGroupName $rg).Subnets[0].Id `
    -PublicIpAddress $pubip

# VM
New-AzVM -ResourceGroupName $rg -Name "jumpserver" -Location $location -Credential $cred -Image "Win2019Datacenter" -NetworkInterface $nic
