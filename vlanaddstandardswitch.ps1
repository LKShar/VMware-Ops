<#
 Script name: CreateVLANonStandardSwitch.ps1
 Author: Laxmikant Sharma (LKShar)
 Description: Adds VLANs to an existing standard switch
 Dependencies: None known
 PowerCLI Version: VMware PowerCLI 6.5 Release 1 build 4624819
#>

$esxhost="HOSTNAME"
$vswitch="vSwitch0"
$vlanlist=10,20,30,40,50
Foreach ($vlan in $vlanlist) {
	$portgroupname="VLAN " + $vlan
	Get-VMHost $esxhost | Get-VirtualSwitch -name $vswitch | New-VirtualPortGroup -Name $portgroupname -VLanId $vlan
}
#The End