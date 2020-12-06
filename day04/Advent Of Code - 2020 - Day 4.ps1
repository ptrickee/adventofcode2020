#day 04
$file = Get-Content .\input.txt -Delimiter "`r`n`r`n"


#region part 1
$requiredProps = @("byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid")
$finalCount = 0
foreach ($item in $file) {
    $fV = $true
    $requiredProps | ForEach-Object {
        $valid = $item -match "$($_):"
        if (-not $valid) {
            $fV = $false
        }
    }
    if ($fV) {
        $finalCount++
    }
}
$finalCount
#endregion

#region part 2
$requiredProps = @(@{
        "string"  = "byr:"
        "pattern" = "19[2-9][0-9]|20[0-0][0-2]"
    }, @{
        "string"  = "iyr:"
        "pattern" = "201[0-9]|2020"
    }, @{
        "string"  = "eyr:"
        "pattern" = "202[0-9]|2030"
    }, @{
        "string"  = "hgt:"
        "pattern" = "1[5-8][0-9]cm|19[0-3]cm|59in|6[0-9]in|7[0-6]in"
    }, @{
        "string"  = "hcl:"
        "pattern" = "^#\w{6}$"
    }, @{
        "string"  = "ecl:"
        "pattern" = "^amb$|^blu$|^brn$|^gry$|^grn$|^hzl$|^oth$"
    }, @{
        "string"  = "pid:"
        "pattern" = "^\d{9}$"
    })
$finalCount = 0
foreach ($item in $file) {
    $fV = $true
    $requiredProps | ForEach-Object {
        $value = [regex]::matches($item, "$($_.string)\S+").Value
        if ($value) {
            if ($value.Split(":")[1] -notmatch $_.pattern) {
                $fV = $false
            }
        }
        else {
            $fV = $false
        }
    }
    if ($fV) {
        $finalCount++
    }
}
$finalCount
#endregion
