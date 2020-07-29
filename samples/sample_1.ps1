#
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell\UniversalWeatherPowershell.psm1

#
param (
    [string]$city,
    [string]$apiKey
)

# 
$a = New-Object -TypeName universalWeatherPowershell -ArgumentList $city, $apiKey