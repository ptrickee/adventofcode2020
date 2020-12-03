#day 02
$file = Get-Content .\input.txt

#region part 1
$finalCount = 0
foreach ($item in $file) {
    $count = 0
    $split = $item.split(" ")
    $quantity = $split[0]
    $lowerCount = $quantity.split("-")[0]
    $upperCount = $quantity.split("-")[1]
    $letter = $split[1].replace(":", "")
    $pass = $split[2]
    $pwdArray = $pass.ToCharArray()
    $pwdArray | ForEach-Object {
        if ($_ -eq $letter) {
            $count++
        }
    }
    if (($count -ge $lowerCount) -and ($count -le $upperCount)) {
        $finalCount++
    }
}
$finalCount
#endregion

#region part 2
$finalCount = 0
foreach ($item in $file) {
    $count = 0
    $matchAmount = 0
    $split = $item.split(" ")
    $quantity = $split[0]
    $lowerCount = $quantity.split("-")[0]
    $upperCount = $quantity.split("-")[1]
    $letter = $split[1].replace(":", "")
    $pass = $split[2]
    $pwdArray = $pass.ToCharArray()
    $pwdArray | ForEach-Object {
        $count++
        if ((($count -eq $lowerCount) -and ($_ -eq $letter)) -or (($count -eq $upperCount) -and ($_ -eq $letter))) {
            $matchAmount++
        }
    }
    if ($matchAmount -eq 1) {
        $finalCount++
    }
}
$finalCount
#endregion