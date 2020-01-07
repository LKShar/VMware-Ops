$VMs = Get-VM
$Output = foreach ($VM in $VMs){
Get-VM $VM | select Name, @{N=”FolderName”;E={ $_.Folder.Name}}, NumCpu, MemoryGB, @{N=”CPUUsage”;E={ $_.ExtensionData.Summary.QuickStats.OverallCpuUsage}}, @{N=”MemoryUsage”;E={$_.ExtensionData.Summary.QuickStats.GuestMemoryUsage}}, ProvisionedSpaceGB, UsedSpaceGB, PowerState, VMHost, @{N=”Datastore”;E={$_.ExtensionData.Config.DatastoreUrl.Name}}, @{N=”Network”;E={$_.Guest.Nics[0]}}, @{N=”IPAddress”;E={$_.Guest.IPAddress[0]}}, @{N=”DNSName”;E={$_.ExtensionData.Guest.Hostname}}
}
$Output | Export-Csv C:\Test\Result.csv -NoTypeInformation