     #Command to retrieve each drive info
     $Drive_Letters = Get-WmiObject Win32_LogicalDisk
     $Drivers = $Drive_Letters.DeviceID

     #Condition to check all the drives
     Write-Host("Press Y to check custom drives and N to check all drives except the file mounted drive")
     $readValue = Read-Host
     if($readValue -eq "Y")
     {
        Write-Host("Please specify the name of the drives")
        $readInput = Read-Host 
     }else{
      if($Drivers -le 0)
         {
           echo "Oops! no drivers found"
         }
            else 
         {
           #Error check of each disk
           $i = 2
           foreach ($eachValue in 2)
           {
                echo "Volume is :" $Drivers[$i]
                chkdsk /f /x /r $Drivers[$i]
                echo "The " $Drivers[$i] " driver disk check and automatic error fix has started"    
                Start-Sleep -s 2
                echo "The process has completed"
                $i++
             }
             
           }
         }
           #Code to check the Memory Status
           Write-Host("Do you like to start a memory test ?Y for yes  N to exit")
           $memoryResult = Read-Host
           if($memoryResult -eq "Y")
           {
               Start-Process mdsched.exe 
           }
           else
           {
                exit(0)
           }