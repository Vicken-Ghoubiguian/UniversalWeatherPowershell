<#
    
#>
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell\usedModules\ultraviolet.psm1
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell\usedModules\temperature.psm1
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell\usedModules\dateandtime.psm1
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell\usedModules\language.psm1
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell\usedModules\pressure.psm1
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell\usedModules\coordinates.psm1
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell\usedModules\weatherDescription.psm1
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell\usedModules\wind.psm1

# Definition of the universalWeatherPowershell Powershell class to get and to do everything wanted with weather
class universalWeatherPowershell 
{

       # Attribute for the coordonates (longitude and latitude)
       [coordinates]$coordinates

       # Attribute for the weather description
       [weatherDescription]$weatherDescription

       # Attributes for all datas concerning temperature
       [temperature]$temperature
       [temperature]$feelingLikeTemperature
       [temperature]$minTemperature
       [temperature]$maxTemperature

       # Attribute for pressure
       [pressure]$pressure

       # Attribute for humidity
       [float]$humidity

       # Attributes for all datas concerning wind
       [wind]$currentWind

       # Attributes for respectively sunrise and sunset dates and times
       [dateAndTime]$sunrise
       [dateAndTime]$sunset

       # Attributes for all datas concerning the wished location
       [string]$countryCode
       [string]$cityName

       # Attributes for all datas concerning the current language
       [language]$currentLanguage

       # Attributes for all datas concerning UV
       [ultraviolet]$uv

       # universalWeatherPowershell class constructor with all needed parameters
       universalWeatherPowershell([string] $city, [string] $apiKey) 
       {

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
                    $this.coordinates = [coordinates]::new([convert]::ToDouble($weatherRequestsResults.coord.lat),[convert]::ToDouble($weatherRequestsResults.coord.lon))

                    # Allocating the value of main description, precised description and icon to the weatherDescription attribute
                    $this.weatherDescription = [weatherDescription]::new($weatherRequestsResults.weather[0].main, $weatherRequestsResults.weather[0].description, $weatherRequestsResults.weather[0].icon)

                    #
                    $this.countryCode = $weatherRequestsResults.sys.country
                    $this.cityName = $weatherRequestsResults.name

                    # Allocating the value of sunrise time and sunset time to the respectives class attributes
                    $this.sunrise = [dateAndTime]::new($weatherRequestsResults.sys.sunrise)
                    $this.sunset = [dateAndTime]::new($weatherRequestsResults.sys.sunset)

                    #
                    $this.currentWind = [wind]::new($weatherRequestsResults.wind.speed, $weatherRequestsResults.wind.deg, $weatherRequestsResults.wind.gust)

                    # Allocating the value of pressure to the pressure attribute
                    $this.pressure = [pressure]::new($weatherRequestsResults.main.pressure)

                    # Allocating all temperatures to their respectives objects
                    $this.temperature = [temperature]::new([convert]::ToDouble($weatherRequestsResults.main.temp))
                    $this.feelingLikeTemperature = [temperature]::new([convert]::ToDouble($weatherRequestsResults.main.feels_like))
                    $this.minTemperature = [temperature]::new([convert]::ToDouble($weatherRequestsResults.main.temp_min))
                    $this.maxTemperature = [temperature]::new([convert]::ToDouble($weatherRequestsResults.main.temp_max))

                    ###########################################################################
                    # Extracting the UV index value and determine the UV risk...              #
                    ###########################################################################

                    # 
                    $uviURL = "http://api.openweathermap.org/data/2.5/uvi?appid=" + $apiKey + "&lat=" + $this.coordinates.getLatitude() + "&lon=" + $this.coordinates.getLongitude()

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