# Importation of the UniversalWeatherPowershell module
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell

# Definition of all parameters : '$city' for the wished city and '$apiKey' for the api key
param (
    [string]$city,
    [string]$apiKey
)

# Definition of a new object of type 'universalWeatherPowershell' with '$city' and '$apiKey' as arguments
$a = New-Object -TypeName universalWeatherPowershell -ArgumentList $city, $apiKey