#day 06
$file = Get-Content .\input.txt -Delimiter "`r`n`r`n" #per group, that are separated by an empty line.

#region part 1
$groupCounts = @()
foreach ($item in $file) {
    $yesAlready = @()
    $item.Split("`r`n") | ForEach-Object {
        $_.ToCharArray() | ForEach-Object {
            if ($yesAlready -notcontains $_) {
                $yesAlready += $_
            }
        }
    }
    $groupCounts += $yesAlready.Count
}
$totalCount = 0
$groupCounts | ForEach-Object { $totalCount = $totalCount + $_ }
$totalCount
#endregion

#region part 2
$groupCounts = @()
foreach ($item in $file) {
    $compareString = $item.Split([Environment]::NewLine, [StringSplitOptions]::RemoveEmptyEntries)[0]
    $item.Split([Environment]::NewLine, [StringSplitOptions]::RemoveEmptyEntries) | ForEach-Object {
        $charArr = $_.ToCharArray()
        $remainingEntries = @()
        if (-not [string]::IsNullOrEmpty($compareString)) {
            $compareString.ToCharArray() | ForEach-Object {
                if ($_ -in $charArr) {
                    $remainingEntries += $_
                }
            }
        }
        $compareString = $remainingEntries -join ""
    }
    $groupCounts += $compareString.Length
}
$totalCount = 0
$groupCounts | ForEach-Object { $totalCount = $totalCount + $_ }
$totalCount
#endregion
