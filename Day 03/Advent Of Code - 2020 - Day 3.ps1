#day 03
$file = Get-Content .\input.txt
$inputLength = $file.Count
$stringLength = $file[0].Length

#region part 1
$finalCount = 0
$i = 0
for ($x = 0; $x -lt $inputLength; $x++) {
    if ($file[$x][$i] -eq "#") {
        $finalCount++
    }
    $i = $i + 3
    if ($i -gt $($stringLength - 1)) {
        $i = $i - $stringLength #loop around
    }
}
$finalCount
#endregion

#region part 2
$slopes = @(@{
        "right" = 1
        "down"  = 1
    }, @{
        "right" = 3
        "down"  = 1
    }, @{
        "right" = 5
        "down"  = 1
    }, @{
        "right" = 7
        "down"  = 1
    }, @{
        "right" = 1
        "down"  = 2
    })
$finalCounts = @()
foreach ($slope in $slopes) {
    $finalCount = 0
    $i = 0
    for ($x = 0; $x -lt $inputLength; $x = $x + $slope.down) {
        if ($file[$x][$i] -eq "#") {
            $finalCount++
        }
        $i = $i + $slope.right
        if ($i -gt $($stringLength - 1)) {
            $i = $i - $stringLength #loop around
        }
    }
    $finalCounts += $finalCount
}
$f = 1
for ($y = 0; $y -lt $finalCounts.Count; $y++) {
    $f = $f * $finalCounts[$y]
}
$f
#endregion
