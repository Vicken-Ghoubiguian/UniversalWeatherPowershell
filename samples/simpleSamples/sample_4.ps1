# Importation of the UniversalWeatherPowershell module
Using module UniversalWeatherPowershell

# Definition of all parameters : '$city' for the wished city and '$apiKey' for the api key
param (
    [string]$city,
    [string]$countrysISOAlpha2Code,
    [string]$apiKey
)

# Import the Assembly 'PresentationFramework' to the current sample
Add-Type -AssemblyName PresentationFramework

# Definition of a new object of type 'universalWeatherPowershell' with '$city', '$countrysISOAlpha2Code' and '$apiKey' as arguments
$a = New-Object -TypeName universalWeatherPowershell -ArgumentList $city, $countrysISOAlpha2Code, $apiKey

# if the weatherError attribute is not null (so if this attribute contains an occured error), then...
if($a.weatherError)
{
    # Displaying error message in a message box
    [System.Windows.MessageBox]::Show($a.currentLanguage.getWishedMessageBoxContent(1) + $a.weatherError.stackTrace, $a.currentLanguage.getWishedMessageBoxTitle(1), "Ok", "Error") | Out-Null

# else...
} else {

    # Displaying success message in a message box
    [System.Windows.MessageBox]::Show($a.currentLanguage.getWishedMessageBoxContent(0), $a.currentLanguage.getWishedMessageBoxTitle(0), "Ok", "Info") | Out-null

    # New line...
    echo ""

    ########
    # Displaying country code and wished city name
    ########

    # Displaying wished city name
    Write-Host -NoNewline $a.currentLanguage.getWishedFieldName(11), ": ", $a.getGeographicLocation().getCityName()

    # New line...
    echo ""

    # Displaying the country code where the wished city is localized
    Write-Host -NoNewline $a.currentLanguage.getWishedFieldName(12), ": ", $a.getGeographicLocation().getCountryCode()

    # New lines...
    echo ""
    echo ""

    ########
    # Displaying geographic coordinates
    ########

    # Displaying geographic coordinates of the wished city...
    Write-Host -NoNewline $a.currentLanguage.getWishedFieldName(0), ": (", $a.coordinates.getLatitude(), ", ", $a.coordinates.getLongitude(), ")"

    # New lines...
    echo ""
    echo ""

    ########
    # Displaying weather
    ########

    # Displaying current main weather
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(13), ": ", $a.weatherDescription.getMainDescription()

    # New line...
    echo ""

    # Displaying current describe weather
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(14), ": ", $a.weatherDescription.getPrecisedDescription()

    # New line...
    echo ""

    # Displaying current weather icon URL
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(15), ": ", $a.weatherDescription.getWeatherURLIcon()

    # New lines...
    echo ""
    echo ""

    ########
    # Displaying temperatures
    ########

    # Displaying current temperature in kelvin
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(1), ": ", $a.temperature.getTemperatureValue() $a.temperature.getTemperatureMeasurementUnitSymbol() " (" $a.temperature.getTemperatureMeasurementUnit() ")"

    # New line...
    echo ""

    # Displaying feeling like temperature in kelvin
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(2), ": ", $a.feelingLikeTemperature.getTemperatureValue() $a.feelingLikeTemperature.getTemperatureMeasurementUnitSymbol() " (" $a.feelingLikeTemperature.getTemperatureMeasurementUnit() ")"

    # New line...
    echo ""

    # Displaying wished maximum temperature in kelvin
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(3), ": ", $a.maxTemperature.getTemperatureValue() $a.maxTemperature.getTemperatureMeasurementUnitSymbol() " (" $a.maxTemperature.getTemperatureMeasurementUnit() ")"

    # New line...
    echo ""

    # Displaying wished minimum temperature in kelvin
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(4), ": ", $a.minTemperature.getTemperatureValue() $a.minTemperature.getTemperatureMeasurementUnitSymbol() " (" $a.minTemperature.getTemperatureMeasurementUnit() ")"

    # New lines...
    echo ""
    echo ""

    ########
    # Displaying pressure
    ########

    # Displaying pressure in hectopascal (hPa)
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(5), ": ", $a.pressure.getPressureValue() $a.pressure.getPressureUnit()

    # New lines...
    echo ""
    echo ""

    ########
    # Displaying wind
    ########

    # Displaying wind speed
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(16), ": ", $a.currentWind.getWindSpeed()

    # New line...
    echo ""

    # Displaying wind deg
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(17), ": ", $a.currentWind.getWindDeg()

    # New line...
    echo ""

    # Displaying wind gust
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(18), ": ", $a.currentWind.getWindGust()

    # New lines...
    echo ""
    echo ""

    ########
    # Displaying humidity
    ########

    # Displaying humidity in per cent
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(10), ": ", $a.getHumidity() "%"

    # New lines...
    echo ""
    echo ""

    ########
    # Displaying uv
    ########

    # Displaying uv index
    Write-Host -NoNewline $a.currentLanguage.getWishedFieldName(8), ": ", $a.uv.GetIndex()

    # New line...
    echo ""

    # Displaying uv risk
    Write-Host -NoNewline $a.currentLanguage.getWishedFieldName(9), ": ", $a.uv.GetRisk()

    # New lines...
    echo ""
    echo ""    

    ########################################
    # Displaying sunrise and sunset times
    ########################################

    # Displaying sunrise time as timestamp
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(7), "(", $a.sunrise.getCurrentFormat(), "): ", $a.sunrise.getTimestamp()

    # New line...
    echo ""

    # Displaying sunset time as timestamp
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(6), "(", $a.sunset.getCurrentFormat(), "): ", $a.sunset.getTimestamp()

    # New lines...
    echo ""
    echo ""
}