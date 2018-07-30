     
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"C:\Users\Babu\Google Drive\Git_Folder\ScriptToLimitDataUsageWindows.ps1`"" -Verb RunAs; exit }
  
    Clear-Host
    $srvName = "wuauserv"
    $servicePrior = Get-Service $srvName
    "$srvName is now " + $servicePrior.status
    Stop-Service $srvName
    Set-Service $srvName -startuptype Automatic
    Start-Service $srvName
    Start-Sleep -s 2
    Set-Service $srvName -startuptype Disabled
    Start-Service $srvName
    $serviceAfter = Get-Service $srvName
    "$srvName is now " + $serviceAfter.status