$netstat = netstat -aon | Select-String -pattern "(TCP|UDP)"
$processList = Get-Process

foreach ($result in $netstat) {
   $splitArray = $result -split " "
   $procID = $splitArray[$splitArray.length – 1]
   $processName = $processList | Where-Object {$_.id -eq $procID} |    select processname
   $splitArray[$splitArray.length – 1] = $procID + " " +      $processName.processname
   $splitArray -join " "
}
