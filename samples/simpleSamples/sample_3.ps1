# Importation of the UniversalWeatherPowershell module
Using module UniversalWeatherPowershell

# Definition of all parameters : '$city' for the wished city, '$apiKey' for the api key and '$temperatureScale' for the wished temperature scale
param (
    [string]$city,
    [string]$countrysISOAlpha2Code,
    [string]$apiKey,
    [string]$temperatureScale,
    [string]$dateAndTimeFormat
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

    ########
    # Configuring temperature scale
    ########

    # If the wished temperature scale is "Celsius"...
    If($temperatureScale -eq "celsius") {

        $a.temperature.setTemperatureAsCelsius()
        $a.feelingLikeTemperature.setTemperatureAsCelsius()
        $a.minTemperature.setTemperatureAsCelsius()
        $a.maxTemperature.setTemperatureAsCelsius()

    # If the wished temperature scale is "Fahrenheit"...
    } Elseif($temperatureScale -eq "fahrenheit") {

        $a.temperature.setTemperatureAsFahrenheit()
        $a.feelingLikeTemperature.setTemperatureAsFahrenheit()
        $a.minTemperature.setTemperatureAsFahrenheit()
        $a.maxTemperature.setTemperatureAsFahrenheit()

    # If the wished temperature scale is "Kelvin"...
    } Elseif($temperatureScale -eq "kelvin") {

        # Displaying warning message in a messagebox...
        [System.Windows.MessageBox]::Show("Warning: temperature scale already in Kelvin", $a.currentLanguage.getWishedMessageBoxTitle(2), "Ok", "Warning") | Out-Null

    # Else... 
    } Else {

        # Displaying error message in a messagebox...
        [System.Windows.MessageBox]::Show("Error: unknown temperature scale", $a.currentLanguage.getWishedMessageBoxTitle(1), "Ok", "Error") | Out-Null

        # Exiting the process with code 1 (an error occured)...
        exit 1
    }

    ########
    # Configuring date and time format
    ########

    # If the wished date and time format is "timestamp"...
    If($dateAndTimeFormat -eq "timestamp") {

        # Displaying warning message in a messagebox...
        [System.Windows.MessageBox]::Show("Warning: temperature scale already in Kelvin", $a.currentLanguage.getWishedMessageBoxTitle(2), "Ok", "Warning") | Out-Null

    # If the wished date and time format is "DMYHMS"...
    } Elseif($dateAndTimeFormat -eq "DMYHMS") {

        $a.sunrise.setCurrentFormatAsDMYHMS()
        $a.sunset.setCurrentFormatAsDMYHMS()

    # If the wished date and time format is "YMDHMS"...
    } Elseif($dateAndTimeFormat -eq "YMDHMS") {

        $a.sunrise.setCurrentFormatAsYMDHMS()
        $a.sunset.setCurrentFormatAsYMDHMS()

    # If the wished date and time format is "MDYHMS"...
    } Elseif($dateAndTimeFormat -eq "MDYHMS") {

        $a.sunrise.setCurrentFormatAsMDYHMS()
        $a.sunset.setCurrentFormatAsMDYHMS()

    # Else...
    } Else {

        # Displaying error message in a messagebox...
        [System.Windows.MessageBox]::Show("Error: unknown date and time format", $a.currentLanguage.getWishedMessageBoxTitle(1), "Ok", "Error") | Out-Null

        # Exiting the process with code 1 (an error occured)...
        exit 1
    }

    ########
    # Configuring success message: you can now play with weather
    ########

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
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(10), ": ", $a.humidity "%"

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
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(7), "(", $a.sunrise.getCurrentFormat(), "): ", $a.sunrise.getSunTimeInCurrentFormat()

    # New line...
    echo ""

    # Displaying sunset time as timestamp
    Write-Host -NoNewLine $a.currentLanguage.getWishedFieldName(6), "(", $a.sunset.getCurrentFormat(), "): ", $a.sunset.getSunTimeInCurrentFormat()

    # New lines...
    echo ""
    echo ""
}