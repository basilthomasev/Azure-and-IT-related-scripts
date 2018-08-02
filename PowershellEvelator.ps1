 
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"C:\Users\Babu\Google Drive\Git_Folder\ScriptToLimitDataUsageWindows.ps1`"" -Verb RunAs; exit }
  