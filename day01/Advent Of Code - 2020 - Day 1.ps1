#Advent Of Code - 2020 - Day 1
$file = Get-Content .\input.txt

#region Part 1
$file | ForEach-Object {
    $tmpNum1 = [int]$_
    $file | ForEach-Object {
        $tmpNum2 = [int]$_
        if (($tmpNum1 + $tmpNum2) -eq 2020) {
            Write-Output "Part 1: $($tmpNum1 * $tmpNum2)"
            break
        }
    }
}
#endregion

#region Part 2
$file | ForEach-Object {
    $tmpNum1 = [int]$_
    $file | ForEach-Object {
        $tmpNum2 = [int]$_
        $file | ForEach-Object {
            $tmpNum3 = [int]$_
            if (($tmpNum1 + $tmpNum2 + $tmpNum3) -eq 2020) {
                Write-Output "Part 2: $($tmpNum1 * $tmpNum2 * $tmpNum3)"
                break
            }
        }
    }
}
#endregion
