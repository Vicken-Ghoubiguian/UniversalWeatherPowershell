Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell\usedModules\ultraviolet.psm1
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell\usedModules\temperature.psm1
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell\usedModules\dateandtime.psm1

# Definition of the languageCode Powershell enum to get the wished language
Enum languageCode {

    EN = 0
    FR = 1
    DE = 2
    DA = 3
}

# Definition of the universalWeatherPowershell Powershell class to get and to do everything wanted with weather
class universalWeatherPowershell 
{

       # Attributes for respectively longitude and latitude
       [float]$longitude
       [float]$latitude

       # Attributes for respectively main description and description with more precisions
       [string]$mainDescription
       [string]$precisedDescription

       # Attributes for all datas concerning temperature
       [temperature]$temperature
       [temperature]$feelingLikeTemperature
       [temperature]$minTemperature
       [temperature]$maxTemperature

       # Attributes for respectively pressure and humidity
       [float]$pressure
       [float]$humidity

       # Attributes for all datas concerning wind
       [float]$windSpeed
       [int]$windDeg
       [float]$windGust

       # Attributes for respectively sunrise and sunset dates and times
       [long]$sunrise
       [long]$sunset

       # Attributes for all datas concerning wished location
       [string]$countryCode
       [string]$cityName

       # Attributes for all datas concerning wished language
       [languageCode]$languageCodeId
       [string]$languageName

       # Attributes for all datas concerning UV
       [ultraviolet]$uv

       # universalWeatherPowershell class constructor with all needed parameters
       universalWeatherPowershell([string] $city, [string] $apiKey, [languageCode] $choosenLanguageCode) 
       {

            $p = 89 - 7

            ###########################################################################
            # Recovering all the weather datas values and extracting them all...      #
            ###########################################################################

            # Create an HTTP request to take the current weather, execute it and assign its value to the $weatherURL variable
            $weatherURL = "https://api.openweathermap.org/data/2.5/weather?q=" + $city + "&appid=" + $apiKey

            # Bloc we wish execute to get all informations about general weather datas (WEATHER BLOC)
            try {

               $weatherRequest = Invoke-WebRequest -Uri $weatherURL -Method Get

               $weatherRequestsContent = $weatherRequest.Content

               $weatherRequestsJSONContent = @"
               
$weatherRequestsContent

"@

               $weatherRequestsResults = ConvertFrom-Json -InputObject $weatherRequestsJSONContent

               # Bloc we wish execute to get all informations about uv index (UV BLOC)
               try {

                    # Allocating the values of longitude and latitude in the attributes longitude and latitude respectively
                    $this.longitude = [convert]::ToDouble($weatherRequestsResults.coord.lon)
                    $this.latitude = [convert]::ToDouble($weatherRequestsResults.coord.lat)

                    # Allocating the value of sunrise time and sunset time to the respectives class attributes
                    $this.sunrise = $weatherRequestsResults.sys.sunrise
                    $this.sunset = $weatherRequestsResults.sys.sunset

                    # Allocating all temperatures to their respectives objects
                    $this.temperature = [temperature]::new([convert]::ToDouble($weatherRequestsResults.main.temp))
                    $this.feelingLikeTemperature = [temperature]::new([convert]::ToDouble($weatherRequestsResults.main.feels_like))
                    $this.minTemperature = [temperature]::new([convert]::ToDouble($weatherRequestsResults.main.temp_min))
                    $this.maxTemperature = [temperature]::new([convert]::ToDouble($weatherRequestsResults.main.temp_max))

                    ###########################################################################
                    # Extracting the UV index value and determine the UV risk...              #
                    ###########################################################################

                    # 
                    $uviURL = "http://api.openweathermap.org/data/2.5/uvi?appid=" + $apiKey + "&lat=" + $this.latitude + "&lon=" + $this.longitude

                    $uviRequest = Invoke-WebRequest -Uri $uviURL -Method Get

                    $uviRequestsJSONContent = $uviRequest.Content

                    $uviRequestsHashTable = ConvertFrom-Json $uviRequestsJSONContent

                    # Allocating all ultraviolet datas in the attribute uv
                    $this.uv = [ultraviolet]::new([System.Math]::Floor([convert]::ToDouble($uviRequestsHashTable.value)))

                    [System.Windows.MessageBox]::Show("Congradulations, you can now play with weather: " + $weatherRequestsContent, "Success...", "Ok", "Info")

               # Bloc to execute if an System.Net.WebException is encountered (UV BLOC)
               } catch [System.Net.WebException] {

                  $errorType = $_.Exception.GetType().Name

                  $errorMessage = $_.Exception.Message

                  $errorStackTrace = $_.Exception.StackTrace

                  [System.Windows.MessageBox]::Show("Sorry but an error occured when executing request. " + $errorMessage, "Error occured", "Ok", "Error")

               }

            # Bloc to execute if an System.Net.WebException is encountered (WEATHER BLOC)
            } catch [System.Net.WebException] {

               $errorType = $_.Exception.GetType().Name

               $errorMessage = $_.Exception.Message

               $errorStackTrace = $_.Exception.StackTrace

               [System.Windows.MessageBox]::Show("Sorry but an error occured when executing request. " + $errorMessage, "Error occured", "Ok", "Error")

            }
       }
}