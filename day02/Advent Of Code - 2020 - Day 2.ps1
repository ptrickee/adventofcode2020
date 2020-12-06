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
    $count = ($pwdArray | Where-Object { $_ -eq $letter }).Count
    if (($count -ge $lowerCount) -and ($count -le $upperCount)) {
        $finalCount++
    }
}
$finalCount
#endregion

#region part 2
$finalCount = 0
foreach ($item in $file) {
    $split = $item.split(" ")
    $quantity = $split[0]
    $lowerCount = [int]$quantity.split("-")[0]
    $upperCount = [int]$quantity.split("-")[1]
    $letter = $split[1].replace(":", "")
    $pass = $split[2]
    $pwdArray = $pass.ToCharArray()
    if (($pwdArray[$lowerCount - 1] -eq $letter) -xor ($pwdArray[$upperCount - 1] -eq $letter)) {
        $finalCount++
    }
}
$finalCount
#endregion