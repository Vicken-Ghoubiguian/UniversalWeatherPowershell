class universalWeatherPowershell 
{

       [int]$longitude
       [int]$latitude

       [string]$mainDescription
       [string]$precisedDescription

       [float]$temperature
       [float]$feelingLikeTemperature
       [float]$minTemperature
       [float]$maxTemperature

       [float]$pressure
       [float]$humidity

       [float]$windSpeed
       [int]$windDeg
       [float]$windGust

       [long]$sunrise
       [long]$sunset

       [string]$countryCode
       [string]$cityName

       [int]$uvIndex
       [int]$uvRisk

       universalWeatherPowershell() 
       {

       }
}