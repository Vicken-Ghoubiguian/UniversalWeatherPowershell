# Importation of the UniversalWeatherPowershell module
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell

# Definition of all parameters : '$city' for the wished city and '$apiKey' for the api key
param (
    [string]$city,
    [string]$apiKey
)

#
try 
{

    # Definition of a new object of type 'universalWeatherPowershell' with '$city' and '$apiKey' as arguments
    $a = New-Object -TypeName universalWeatherPowershell -ArgumentList $city, $apiKey

    ########
    # Displaying temperatures
    ########

    # New lines...
    echo ""
    echo ""

    # Displaying the wished city name...
    Write-Host -NoNewline "City : ", $a.cityName, ""

    # New line...
    echo ""

    # Displaying the country where is located the wished city as its specific code...
    Write-Host -NoNewline "Country : ", $a.countryCode, ""

    # New lines...
    echo ""
    echo ""

    # Displaying geographic coordinates of the wished city...
    Write-Host -NoNewline "Geographic coordinates: (", $a.coordinates.getLatitude(), ", ", $a.coordinates.getLongitude(), ")"

    # New lines...
    echo ""
    echo ""

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

} catch {

    # New lines...
    echo ""
    echo ""

    #
    Write-Host -NoNewline "ERROR : "

    # New lines...
    echo ""
    echo ""
}