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

       universalWeatherPowershell([string] $city, [string] $apiKey) 
       {
            $weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=" + $city + "&appid=" + $apiKey

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