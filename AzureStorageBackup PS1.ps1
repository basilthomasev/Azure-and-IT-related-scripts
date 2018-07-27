#step 1 : Connect to Add-AzureRmAccount
  Connect-AzureRmAccount -SubscriptionId "fd11a438-56a5-4579-b78e-40fea45ada08"

#Step 2 : Read and input values from user
   $D_name = "gridv2"
   $Res_Grp_name = "Grid_Production"
   $Sto_Acc_name = "logibotb819"
   $Server_name  = "gridappserver"
   $Storage_Key_Type = "StorageAccessKey"
   $Storage_key  = "Fg9EDh3+CXmnpYNvUDqq7aEcFXHLaVKTSh1EphhIFjweDmnKyXNYktd3p/Pb6dRKqMPApTP/V+DDXwzMKTkZeA=="
$Serveradmin         = "gridappadmin"
   $ServerPass       = "passheaven@123"
   $securepass    =convertTo-SecureString -String $ServerPass -AsPlainText -Force
   $creds = New-Object -TypeName  System.Management.Automation.PSCredential -ArgumentList $Serveradmin, $SecurePass 
 
   write-host   "Database Name:" $D_name `n`
   write-host "ResourceGroup Name       :" $Res_Grp_name `n`
   write-host "Storage Account Name     :" $Sto_Acc_name `n`
   write-host  "Server Name              :" $Server_name `n`
   write-host  "Storage Key type         :" $Storage_Key_Type `n`
   write-host "Storage key              :" $Storage_key `n`



#Step 4:  Generate a unique filename for the BACPAC
    $bacpacFilename = $D_name + (Get-Date).ToString("yyyymmdd") + ".bacpac"

#Step 5 : Storage Account info for the bacpac
    $BaseStorageurl = "https://logibotb819.blob.core.windows.net/backupcontainer/"


#Step 6 : Uniquename
    $bacpacname = $BaseStorageurl + $bacpacFilename

#step 7 : Print values
    write-host $bacpacFilename
               $BaseStorageurl
               $bacpacname

#step 8 : Export
  $exportrequest = New-AzureRmSqlDatabaseExport -ResourcegroupName $Res_Grp_name -ServerName $Server_name -Databasename $D_name -Storagekey $Storage_key  -StorageUri $bacpacname -StorageKeyType $Storage_Key_Type -AdministratorLogin $creds.UserName -AdministratorLoginPassword $creds.Password 


#step 9 . Status

  $exportstatus= get-AzureRmSqlDatabaseImportExportstatus -OperationStatusLink $exportrequest.OperationStatusLink
 
Start-Sleep -Seconds 2000
  $exportstatus





