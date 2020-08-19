<#
    
#>

Using module .\usedModules\ultraviolet.psm1
Using module .\usedModules\temperature.psm1
Using module .\usedModules\dateandtime.psm1
Using module .\usedModules\language.psm1
Using module .\usedModules\pressure.psm1
Using module .\usedModules\coordinates.psm1
Using module .\usedModules\weatherDescription.psm1
Using module .\usedModules\wind.psm1
Using module .\usedModules\weatherError.psm1

# Definition of the universalWeatherPowershell Powershell class to get and to do everything wanted with weather
class universalWeatherPowershell 
{

       # Attribute for the coordonates (longitude and latitude)
       hidden [coordinates]$coordinates

       # Attribute for the weather description
       hidden [weatherDescription]$weatherDescription

       # Attributes for all datas concerning temperature
       hidden [temperature]$temperature
       hidden [temperature]$feelingLikeTemperature
       hidden [temperature]$minTemperature
       hidden [temperature]$maxTemperature

       # Attribute for pressure
       hidden [pressure]$pressure

       # Attribute for humidity
       hidden [int]$humidity

       # Attribute for all datas concerning wind
       hidden [wind]$currentWind

       # Attributes for respectively sunrise and sunset dates and times
       hidden [dateAndTime]$sunrise
       hidden [dateAndTime]$sunset

       # Attributes for all datas concerning the wished location
       hidden [string]$countryCode
       hidden [string]$cityName

       # Attribute for all datas concerning the current language
       hidden [language]$currentLanguage

       # Attribute for all datas concerning UV
       hidden [ultraviolet]$uv

       # Attribute for occured error (in case) 
       hidden [weatherError]$weatherError

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

                    # Allocating the value of choosen language
                    $this.currentLanguage = [language]::new()

                    # Allocating the values of longitude and latitude in the attributes longitude and latitude respectively
                    $this.coordinates = [coordinates]::new([convert]::ToDouble($weatherRequestsResults.coord.lat),[convert]::ToDouble($weatherRequestsResults.coord.lon))

                    # Allocating the value of main description, precised description and icon to the weatherDescription attribute
                    $this.weatherDescription = [weatherDescription]::new($weatherRequestsResults.weather[0].main, $weatherRequestsResults.weather[0].description, $weatherRequestsResults.weather[0].icon)

                    # Allocating the value of countrycode and cityname in their respective class attributes
                    $this.countryCode = $weatherRequestsResults.sys.country
                    $this.cityName = $weatherRequestsResults.name

                    # Allocating the value of sunrise time and sunset time to the respectives class attributes
                    $this.sunrise = [dateAndTime]::new($weatherRequestsResults.sys.sunrise)
                    $this.sunset = [dateAndTime]::new($weatherRequestsResults.sys.sunset)

                    # Allocating the wind values as an object of the single PowerShell class wind in the currentWind class attribute
                    $this.currentWind = [wind]::new($weatherRequestsResults.wind.speed, $weatherRequestsResults.wind.deg, $weatherRequestsResults.wind.gust)

                    # Allocating the value of humidity to the respective class attribute
                    $this.humidity = $weatherRequestsResults.main.humidity

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

               # Bloc to execute if an System.Net.WebException is encountered (UV BLOC)
               } catch [System.Net.WebException] {

                  $errorType = $_.Exception.GetType().Name

                  $errorMessage = $_.Exception.Message

                  $errorStackTrace = $_.Exception.StackTrace

                  $this.weatherError = [weatherError]::new($errorType, $errorMessage, $errorStackTrace)
               }

            # Bloc to execute if an System.Net.WebException is encountered (WEATHER BLOC)
            } catch [System.Net.WebException] {

               $errorType = $_.Exception.GetType().Name

               $errorMessage = $_.Exception.Message

               $errorStackTrace = $_.Exception.StackTrace

               $this.weatherError = [weatherError]::new($errorType, $errorMessage, $errorStackTrace)
            }
       }

       # 'coordinates' attribute getter
       [coordinates] getCoordinates()
       {
            return $this.coordinates
       }

       # 'weatherDescription' attribute getter
       [weatherDescription] getWeatherDescription()
       {
            return $this.weatherDescription
       }

       # 'temperature' attribute getter
       [temperature] getTemperature()
       {
            return $this.temperature
       }

       # 'feelingLikeTemperature' attribute getter
       [temperature] getFeelingTemperature()
       {
            return $this.feelingLikeTemperature
       }

       # 'maxTemperature' attribute getter
       [temperature] getMaximumTemperature()
       {
            return $this.maxTemperature
       }

       # 'minTemperature' attribute getter
       [temperature] getMinimumTemperature()
       {
            return $this.minTemperature
       }

       # 'currentLanguage' attribute getter
       [language] getLanguage()
       {
            return $this.currentLanguage
       }

       # 'cityName' attribute getter
       [string] getCity()
       {
            return $this.cityName
       }

       # 'countryCode' attribute getter
       [string] getCountryCode()
       {
            return $this.countryCode
       }

       # 'uv' attribute getter
       [ultraviolet] getUltraViolet()
       {
            return $this.uv
       }

       # 'currentWind' attribute getter
       [wind] getWind()
       {
            return $this.currentWind
       }

       # 'pressure' attribute getter
       [pressure] getPressure()
       {
            return $this.pressure
       }

       # 'humidity' attribute getter
       [int] getHumidity()
       {
            return $this.humidity
       }

       # 'weatherError' attribute getter
       [weatherError] getWeatherError()
       {
            return $this.weatherError
       }
}