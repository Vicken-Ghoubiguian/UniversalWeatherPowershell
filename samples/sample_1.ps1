#
param (
    [string]$city,
    [string]$apiKey
)

#
Add-Type -AssemblyName PresentationFramework

#
Import-Module C:\Users\ericg\Desktop\UniversalWeatherPowershell\UniversalWeatherPowershell.ps1

#
$a = [universalWeatherPowershell]::new($city, $apiKey)