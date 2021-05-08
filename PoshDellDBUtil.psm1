function Invoke-PoshDDClean {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,Position=0)]
        [ValidateNotNullOrEmpty()]
        [String]$Computers,
        [Parameter(Position=1)]
        [ValidateSet("Scan", "Scan&Clean")]
        [String]$PoshDDMode = "Scan"
    )
}