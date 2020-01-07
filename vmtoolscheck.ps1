<#
	This will quickly return all VMs that have VMware Tools out of date
    Along with the version that it is running
    .Example
    Check-Tools -VMs (Get-VM)
    .Example
    $SampleVMs = Get-VM "Mgmt*"
    Check-Tools -VMs $SampleVMs
#>
  
$VMs = Get-VM
foreach ($VM in $VMs) {
$OutofDate = $VMs | where {$_.ExtensionData.Guest.ToolsStatus -ne "toolsOk"}
$Result = @($OutofDate | select Name,@{Name="ToolsVersion";Expression={$_.ExtensionData.Guest.Toolsversion}})

}

$Result | Export-Csv C:\Test\ToolsCheck.csv -NoTypeInformation