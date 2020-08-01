﻿# Importation of the UniversalWeatherPowershell module
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell

# Definition of all parameters : '$city' for the wished city and '$apiKey' for the api key
param (
    [string]$city,
    [string]$apiKey
)

#
Add-Type -AssemblyName PresentationFramework

# Definition of a new object of type 'universalWeatherPowershell' with '$city' and '$apiKey' as arguments
$a = New-Object -TypeName universalWeatherPowershell -ArgumentList $city, $apiKey

# if the weatherError attribute is not null (so if this attribute contains an occured error), then...
if($a.weatherError)
{
    # Displaying error message in a message box
    [System.Windows.MessageBox]::Show("Sorry but an error occured when executing request: " + $a.weatherError.stackTrace, "Error occured", "Ok", "Error") | Out-Null

# else...
} else {

    # Displaying success message in a message box
    [System.Windows.MessageBox]::Show("Congradulations, you can now play with weather.", "Success...", "Ok", "Info") | Out-null

    # New line...
    echo ""

    ########
    # Displaying country code and wished city name
    ########

    # Displaying wished city name
    Write-Host -NoNewline "City: ", $a.cityName

    # New line...
    echo ""

    # Displaying the country code where the wished city is localized
    Write-Host -NoNewline "Country code: ", $a.countryCode

    # New lines...
    echo ""
    echo ""

    ########
    # Displaying geographic coordinates
    ########

    # Displaying geographic coordinates of the wished city...
    Write-Host -NoNewline "Geographic coordinates: (", $a.coordinates.getLatitude(), ", ", $a.coordinates.getLongitude(), ")"

    # New lines...
    echo ""
    echo ""

    ########
    # Displaying temperatures
    ########

    # Displaying current temperature in kelvin
    Write-Host -NoNewLine "Temperature: ", $a.temperature.getTemperatureValue() $a.temperature.getTemperatureMeasurementUnitSymbol() " (" $a.temperature.getTemperatureMeasurementUnit() ")"

    # New line...
    echo ""

    # Displaying feeling like temperature in kelvin
    Write-Host -NoNewLine "Feeling temperature: ", $a.feelingLikeTemperature.getTemperatureValue() $a.feelingLikeTemperature.getTemperatureMeasurementUnitSymbol() " (" $a.feelingLikeTemperature.getTemperatureMeasurementUnit() ")"

    # New line...
    echo ""

    # Displaying wished maximum temperature in kelvin
    Write-Host -NoNewLine "Maximum temperature: ", $a.maxTemperature.getTemperatureValue() $a.maxTemperature.getTemperatureMeasurementUnitSymbol() " (" $a.maxTemperature.getTemperatureMeasurementUnit() ")"

    # New line...
    echo ""

    # Displaying wished minimum temperature in kelvin
    Write-Host -NoNewLine "Maximum temperature: ", $a.minTemperature.getTemperatureValue() $a.minTemperature.getTemperatureMeasurementUnitSymbol() " (" $a.minTemperature.getTemperatureMeasurementUnit() ")"

    # New lines...
    echo ""
    echo ""
}