$Computername =(Get-WmiObject -Class Win32_ComputerSystem -Property Name).Name
$AVGProc = Get-WmiObject -computername $Computername win32_processor |  
Measure-Object -property LoadPercentage -Average | Select Average 
$OS = gwmi -Class win32_operatingsystem -computername $Computername | 
Select-Object @{Name = "MemoryUsage"; Expression = {“{0:N2}” -f ((($_.TotalVisibleMemorySize - $_.FreePhysicalMemory)*100)/ $_.TotalVisibleMemorySize) }} 
$vol = Get-WmiObject -Class win32_Volume -ComputerName $Computername -Filter "DriveLetter = 'C:'" | 
Select-object @{Name = "C PercentFree"; Expression = {“{0:N2}” -f  (($_.FreeSpace / $_.Capacity)*100) } } 
Write-Host $Computername $AVGProc $OS  $vol

$info =  Get-CimInstance CIM_Processor
echo $info
$computerHDD = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID = 'C:'"
echo $computerHDD