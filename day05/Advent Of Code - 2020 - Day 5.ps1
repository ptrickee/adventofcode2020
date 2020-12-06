#day 05
$file = Get-Content .\input.txt

#region part 1
$seatIds = @()
foreach ($item in $file) {
    $rowStart = 0; $rowEnd = 127
    $item[0..6] | ForEach-Object {
        if ($_ -eq "F") {
            $rowEnd = (($rowEnd - $rowStart + 1) / 2) - 1 + $rowStart
        }
        elseif ($_ -eq "B" ) {
            $rowStart = (($rowStart + $rowEnd + 1) / 2)
        }
    }
    $columnStart = 0; $columnEnd = 7
    $item[7..9] | ForEach-Object {
        if ($_ -eq "L") {
            $columnEnd = (($columnEnd - $columnStart + 1) / 2) - 1 + $columnStart
        }
        elseif ($_ -eq "R" ) {
            $columnStart = (($columnStart + $columnEnd + 1) / 2)
        }
    }
    $seatIds += $($rowStart * 8 + $columnStart)
}
($seatIds | Sort-Object -Descending)[0]
#endregion

#region part 2
$sortedSeats = $seatIds | Sort-Object
for ($x = 0; $x -lt $sortedSeats.Count; $x++) {
    if ($sortedSeats[$x + 1] -eq ($sortedSeats[$x] + 2)) {
        $ans = $sortedSeats[$x] + 1
        break
    }
}
$ans
#endregion
