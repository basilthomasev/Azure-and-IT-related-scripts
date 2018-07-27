#Verify latest Probe IP Addresses at https://docs.microsoft.com/en-us/azure/traffic-manager/traffic-manager-faqs

$subscriptionId = "YourSubscriptionId"
$resourceGroupEast = "EastCoastResourceGroup"
$resourceGroupWest = "WestCostResourceGroup"
$nsgEast = "EastCoastNSG"
$nsgWest = "WestCoastNSG"
$probePort = 80 
$rulePriorityStart = 150
$rulePriority = $rulePriorityStart

$trafficManagerProbeIPs = @( "137.135.80.149", `
                             "137.135.82.249", `
                             "191.232.214.62", `
                             "13.75.152.253", `
                             "104.41.187.209",`
                             "104.41.190.203"  )

Login-AzureRmAccount

Set-AzureRmContext -SubscriptionId $subscriptionId

$groupEast = Get-AzureRMNetworkSecurityGroup -ResourceGroupName $resourceGroupEast `
     -Name $nsgEast
$groupWest = Get-AzureRMNetworkSecurityGroup -ResourceGroupName $resourceGroupWest `
     -Name $nsgWest


For($i=0; $i -lt $trafficManagerProbeIPs.Length; $i++) {
    $ruleName = "Inbound-TMProbe" + $i.ToString() + "-Https-Allow"

    $rulePriority = $rulePriorityStart + $i

    $groupEast | Add-AzureRmNetworkSecurityRuleConfig -Name $ruleName `
        -Description "Allow Traffic Manager Probe HTTPS" `
        -Access Allow -Protocol Tcp -Direction Inbound -Priority $rulePriority `
        -SourceAddressPrefix $trafficManagerProbeIPs[$i] -SourcePortRange * `
        -DestinationAddressPrefix * -DestinationPortRange $probePort

    $groupWest | Add-AzureRmNetworkSecurityRuleConfig -Name $ruleName `
        -Description "Allow Traffic Manager Probe HTTPS" `
        -Access Allow -Protocol Tcp -Direction Inbound -Priority $rulePriority `
        -SourceAddressPrefix $trafficManagerProbeIPs[$i] -SourcePortRange * `
        -DestinationAddressPrefix * -DestinationPortRange $probePort
}
$groupEast | Set-AzureRmNetworkSecurityGroup
$groupWest | Set-AzureRmNetworkSecurityGroup