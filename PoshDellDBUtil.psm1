function Invoke-PoshDDClean {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,Position=0)]
        [ValidateNotNullOrEmpty()]
        [String]$ComputerOU,
        [Parameter(Position=1)]
        [ValidateSet("Scan", "Scan&Clean")]
        [String]$PoshDDMode = "Scan"
    )

    $Computers = Get-ADComputer -Filter * -SearchBase "$($ComputerOU)" | Select-Object -Property Name | Sort-Object -Property Name

    foreach ($Computer in $Computers) {
        if (Test-Connection -ComputerName $Computer.Name -Quiet -Count 2 -ErrorAction SilentlyContinue) {

        } else {

        }
    }

}
