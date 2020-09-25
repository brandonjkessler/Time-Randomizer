param(
    [bool]$Hour = $true,
    [bool]$Minute = $true,
    [bool]$Second = $true,
    [Bool]$Millisecond = $false
)


function Format-RandomTime(){
    Param(
        [string]$TimeUnit,
        [int32]$UnitCount
    )
    while ($TimeUnit.length -lt $UnitCount){
        $TimeUnit = "0$TimeUnit"        
    }
    Return $TimeUnit

}
## Create an array to hold the times
$TimeObj = [PSCustomObject]@{
    Hour = 00
    Minute = 00
    Second = 00
    Millisecond = 000
}

## Get Random Times for Each unit of Measurement
if($Hour){
    $RandoHr = Get-Random -Minimum 1 -Maximum 24
    $RandoHr = Format-RandomTime -TimeUnit $RandoHr -UnitCount 2
    Write-Host ("Hours are $RandoHr")
    $TimeObj.Hour = $RandoHr
}

if($Minute){
    $RandoMin = Get-Random -Minimum 1 -Maximum 60
    $RandoMin = Format-RandomTime -TimeUnit $RandoMin -UnitCount 2
    Write-Host ("Minutes are $RandoMin")
    $TimeObj.Minute = $RandoMin
}

if($Second){
    $RandoSec = Get-Random -Minimum 1 -Maximum 60
    $RandoSec = Format-RandomTime -TimeUnit $RandoSec -UnitCount 2
    Write-Host ("Seconds are $RandoSec")
    $TimeObj.Second = $RandoSec
}

if($Millisecond){
    $RandoMilli = Get-Random -Minimum 1 -Maximum 100
    $RandoMilli = Format-RandomTime -TimeUnit $RandoMilli -UnitCount 3
    Write-Host ("Milliseconds are $RandoMilli")
    $TimeObj.Millisecond = $RandoMilli
}

if(($Hour -eq $false) -and ($Minute -eq $false) -and ($Second -eq $false) -and ($Millisecond -eq $false)){
    Write-Error ("Very Funny. You intentionally didn't set any Time Units to randomize.")
    Exit 1
}


Return $TimeObj