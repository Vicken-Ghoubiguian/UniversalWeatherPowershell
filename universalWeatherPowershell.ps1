# Definition of the temperatureMeasurementUnit Powershell enum to get the wished temperature measurement unit
Enum temperatureMeasurementUnit {
    
    Kelvin = 0
    Celsius = 1
    Fahrenheit = 2
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
       [float]$temperature
       [float]$feelingLikeTemperature
       [float]$minTemperature
       [float]$maxTemperature

       # Attributes for temperature measurement unit
       [temperatureMeasurementUnit]$temperatureMeasurementUnitId
       [string]$temperatureMeasurementUnitName
       [string]$temperatureMeasurementUnitSymbol

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
       [string]$uvRisk

       # universalWeatherPowershell class constructor
       universalWeatherPowershell([string] $city, [temperatureMeasurementUnit]$choosenTemperatureMeasurementUnit, [string] $apiKey) 
       {

            ###########################################################################
            # Extracting the UV index value and determine the UV risk...              #
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

                    # Allocating the values of longitude and latitude in the attributes longitude and latitude respectively
                    $this.temperature = [convert]::ToDouble($weatherRequestsResults.main.temp)
                    $this.feelingLikeTemperature = [convert]::ToDouble($weatherRequestsResults.main.feels_like)
                    $this.minTemperature = [convert]::ToDouble($weatherRequestsResults.main.temp_min)
                    $this.maxTemperature = [convert]::ToDouble($weatherRequestsResults.main.temp_max)

                    # 
                    $this.temperatureMeasurementUnitId = $choosenTemperatureMeasurementUnit

                    #
                    If($this.temperatureMeasurementUnitId -eq [temperatureMeasurementUnit]::Celsius) {

                        $this.temperatureMeasurementUnitName = "Celsius"
                        $this.temperatureMeasurementUnitSymbol = " °C"

                    } ElseIf($this.temperatureMeasurementUnitId -eq [temperatureMeasurementUnit]::Fahrenheit) {

                        $this.temperatureMeasurementUnitName = "Fahrenheit"
                        $this.temperatureMeasurementUnitSymbol = " °F"

                    } Else {
                        
                        $this.temperatureMeasurementUnitName = "Kelvin"
                        $this.temperatureMeasurementUnitSymbol = " K"

                    }

                    ###########################################################################
                    # Extracting the UV index value and determine the UV risk...              #
                    ###########################################################################

                    # 
                    $uviURL = "http://api.openweathermap.org/data/2.5/uvi?appid=" + $apiKey + "&lat=" + $this.latitude + "&lon=" + $this.longitude

                    $uviRequest = Invoke-WebRequest -Uri $uviURL -Method Get

                    $uviRequestsJSONContent = $uviRequest.Content

                    $uviRequestsHashTable = ConvertFrom-Json $uviRequestsJSONContent

                    # Allocating the value of the UV index in the attribute uvIndex
                    $this.uvIndex = [System.Math]::Floor([convert]::ToDouble($uviRequestsHashTable.value))

                    # Allocating the corresponding value of the UV risk in the attribute uvRisk
                    If($this.uvIndex -le 2) {

                        $this.uvRisk = "Low"

                    } ElseIf($this.uvIndex -ge 3 -And $this.uvIndex -le 5) {

                        $this.uvRisk = "Moderate"

                    } ElseIf($this.uvIndex -ge 6 -And $this.uvIndex -le 7) {

                        $this.uvRisk = "High"

                    } ElseIf($this.uvIndex -ge 8 -And $this.uvIndex -le 10) {

                        $this.uvRisk = "Very high"

                    } Else {

                        $this.uvRisk = "Extreme"

                    }

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