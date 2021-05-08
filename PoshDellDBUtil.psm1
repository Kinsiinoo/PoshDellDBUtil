function Invoke-PoshDDClean {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,Position=0)]
        [ValidateNotNullOrEmpty()]
        [String]$ComputerOU,
        [Parameter(Mandatory=$false,Position=1)]
        [Switch]$Clean
    )

    $Computers = Get-ADComputer -Filter * -SearchBase "$($ComputerOU)" | Select-Object -Property Name | Sort-Object -Property Name

    foreach ($Computer in $Computers) {
        if (Test-Connection -ComputerName $Computer.Name -Quiet -Count 2 -ErrorAction SilentlyContinue) {
            Write-Host "$($Computer.Name):" -ForegroundColor White -BackgroundColor DarkGreen
            Invoke-Command -ComputerName $Computer.Name -ErrorAction SilentlyContinue -ScriptBlock {
                if(Test-Path -Path "C:\Windows\Temp\DBUtil_2_3.Sys" -PathType Leaf){
                    Write-Host "Windows->Temp folder: DBUtil_2_3.Sys found!" -ForegroundColor White -BackgroundColor DarkRed
                    if ($Clean) {
                        Write-Host "Removing DBUtil_2_3.Sys..." -ForegroundColor Yellow
                        Remove-Item -Path "C:\Windows\Temp\DBUtil_2_3.Sys"
                        if(!(Test-Path -Path "C:\Windows\Temp\DBUtil_2_3.Sys" -PathType Leaf)){
                            Write-Host "Deleted successfully!" -ForegroundColor White -BackgroundColor DarkGreen
                        } else {
                            Write-Host "Error!" -ForegroundColor White -BackgroundColor DarkRed
                        }
                    }
                } else {
                    Write-Host "DBUtil_2_3.Sys not found at Windows->Temp!" -ForegroundColor White -BackgroundColor DarkGreen
                }

                $Users = Get-ChildItem -Path "C:\Users" -Directory -Exclude Default,Public
                foreach($User in $Users){
                    if(Test-Path -Path "C:\Users\$($user.Name)\AppData\Local\Temp\DBUtil_2_3.Sys"){
                        Write-Host "$($user.Name)->Temp folder: DBUtil_2_3.Sys found!" -ForegroundColor White -BackgroundColor DarkRed
                        if ($Clean) {
                            Write-Host "Removing DBUtil_2_3.Sys..." -ForegroundColor Yellow
                            Remove-Item -Path (Get-ChildItem -Path "C:\Users\$($user.Name)\AppData\Local\Temp" -Filter DBUtil_2_3.Sys -Recurse -ErrorAction SilentlyContinue -Force).FullName
                            if(!(Test-Path -Path "C:\Users\$($user.Name)\AppData\Local\Temp\DBUtil_2_3.Sys")){
                                Write-Host "Deleted successfully!" -ForegroundColor White -BackgroundColor DarkGreen
                            } else {
                                Write-Host "Error!" -ForegroundColor White -BackgroundColor DarkRed
                            }
                        }
                    } else {
                        Write-Host "DBUtil_2_3.Sys not found at $($user.Name)->Temp!" -ForegroundColor White -BackgroundColor DarkGreen
                    }
                }
            }
        } else {
            Write-Host "$($Computer.Name) not reachable!" -ForegroundColor White -BackgroundColor DarkRed
        }
    }

}
