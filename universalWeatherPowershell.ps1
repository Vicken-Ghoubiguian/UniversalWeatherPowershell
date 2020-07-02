﻿class universalWeatherPowershell 
{

       # Attributes for respectively longitude and latitude
       [int]$longitude
       [int]$latitude

       # Attributes for respectively main description and description with more precisions
       [string]$mainDescription
       [string]$precisedDescription

       # Attributes for all datas concerning temperature
       [float]$temperature
       [float]$feelingLikeTemperature
       [float]$minTemperature
       [float]$maxTemperature

       # Attributes for respectively pressure and humidity
       [float]$pressure
       [float]$humidity

       # Attributes for all datas concerning wind
       [float]$windSpeed
       [int]$windDeg
       [float]$windGust

       # Attributes for respectively sunrise and sunset times as timestamp
       [long]$sunrise
       [long]$sunset

       # Attributes for all datas concerning wished location
       [string]$countryCode
       [string]$cityName

       # Attributes for all datas concerning UV
       [int]$uvIndex
       [int]$uvRisk

       # universalWeatherPowershell class constructor
       universalWeatherPowershell([string] $city, [string] $apiKey) 
       {
            # Create an HTTP request to take the current weather, execute it and assign its value to the $weatherURL variable
            $weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=" + $city + "&appid=" + $apiKey

            #
            try {

               $weatherRequest = Invoke-WebRequest -Uri $weatherURL -Method Get

               $weatherRequestsJSONContent = $weatherRequest.Content

               [System.Windows.MessageBox]::Show("Congradulations, you can now play with weather: " + $weatherRequestsJSONContent, "Success...", "Ok", "Info")

            } catch [System.Net.WebException] {

               $errorType = $_.Exception.GetType().Name

               $errorMessage = $_.Exception.Message

               $errorStackTrace = $_.Exception.StackTrace

               [System.Windows.MessageBox]::Show("Sorry but an error occured when executing request. " + $errorMessage, "Error occured", "Ok", "Error")

            }
       }
}