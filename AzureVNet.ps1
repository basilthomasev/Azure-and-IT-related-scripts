$value = 1
while ($value -lt 5)
{
 try
 {
    Login-AzureRmAccount
    $value = $value + 1
 }
  catch
 {
    echo "Error login to Azure account !!!" 
 }
}
New-AzureRmResourceGroup -Name ________ -Location ___________
New-AzureRmVirtualNetwork -ResourceGroupName vnetrg -Name TestVNet `-AddressPrefix 192.168.0.0/16 -Location centralus
$vnet = Get-AzureRmVirtualNetwork -ResourceGroupName TestRG -Name TestVNet
Add-AzureRmVirtualNetworkSubnetConfig -Name FrontEnd ` -VirtualNetwork $vnet -AddressPrefix 192.168.1.0/24
Set-AzureRmVirtualNetwork -VirtualNetwork $vnet

