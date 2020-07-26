#
param (
    [string]$city,
    [string]$apiKey
)

#
Import-Module C:\Users\ericg\Desktop\UniversalWeatherPowershell

#
$a = [universalWeatherPowershell]::new($city, $apiKey)