# Definition of the temperatureMeasurementUnit Powershell enum to get the wished temperature measurement unit
Enum temperatureMeasurementUnit {
    
    Kelvin = 0
    Celsius = 1
    Fahrenheit = 2
}

# Definition of the dateAndTimeFormat Powershell enum to get the wished date and time format
Enum dateAndTimeFormat {

    TimestampFormat = 0
    DMYFormat = 1
    YMDFormat = 2
    MDYFormat = 3
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

       # Attribute for date and time format
       [dateAndTimeFormat]$dateAndTimeFormatId

       # Attributes for respectively sunrise and sunset dates and times
       [long]$sunrise
       [long]$sunset

       # Attributes for all datas concerning wished location
       [string]$countryCode
       [string]$cityName

       # Attributes for all datas concerning UV
       [int]$uvIndex
       [string]$uvRisk

       # universalWeatherPowershell class constructor
       universalWeatherPowershell([string] $city, [temperatureMeasurementUnit] $choosenTemperatureMeasurementUnit, [dateAndTimeFormat] $choosenDateAndTimeFormat, [string] $apiKey) 
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

                    # Allocating the value of sunrise time and sunset time to the respectives class attributes
                    $this.sunrise = $weatherRequestsResults.sys.sunrise
                    $this.sunset = $weatherRequestsResults.sys.sunset

                    # Allocating the value of the choosen temperature measurement unit to the temperatureMeasurementUnitId class attribute
                    $this.temperatureMeasurementUnitId = $choosenTemperatureMeasurementUnit

                    If($this.temperatureMeasurementUnitId -eq [temperatureMeasurementUnit]::Celsius) {

                        # Allocating all datas about the choosen temperature measurement unit to the respectives class attributes
                        $this.temperatureMeasurementUnitName = "Celsius"
                        $this.temperatureMeasurementUnitSymbol = " °C"

                        # Allocating all the values relative to temperature datas in their respectives values
                        $this.temperature = [convert]::ToDouble($weatherRequestsResults.main.temp) - 273.15
                        $this.feelingLikeTemperature = [convert]::ToDouble($weatherRequestsResults.main.feels_like) - 273.15
                        $this.minTemperature = [convert]::ToDouble($weatherRequestsResults.main.temp_min) - 273.15
                        $this.maxTemperature = [convert]::ToDouble($weatherRequestsResults.main.temp_max) - 273.15

                    } ElseIf($this.temperatureMeasurementUnitId -eq [temperatureMeasurementUnit]::Fahrenheit) {

                        # Allocating all datas about the choosen temperature measurement unit to the respectives class attributes
                        $this.temperatureMeasurementUnitName = "Fahrenheit"
                        $this.temperatureMeasurementUnitSymbol = " °F"

                        # Allocating all the values relative to temperature datas in their respectives values 
                        $this.temperature = [convert]::ToDouble($weatherRequestsResults.main.temp) * 1.8 - 459.67
                        $this.feelingLikeTemperature = [convert]::ToDouble($weatherRequestsResults.main.feels_like) * 1.8 - 459.67
                        $this.minTemperature = [convert]::ToDouble($weatherRequestsResults.main.temp_min) * 1.8 - 459.67
                        $this.maxTemperature = [convert]::ToDouble($weatherRequestsResults.main.temp_max) * 1.8 - 459.67

                    } Else {
                        
                        # Allocating all datas about the choosen temperature measurement unit to the respectives class attributes
                        $this.temperatureMeasurementUnitName = "Kelvin"
                        $this.temperatureMeasurementUnitSymbol = " K"

                        # Allocating all the values relative to temperature datas in their respectives values
                        $this.temperature = [convert]::ToDouble($weatherRequestsResults.main.temp)
                        $this.feelingLikeTemperature = [convert]::ToDouble($weatherRequestsResults.main.feels_like)
                        $this.minTemperature = [convert]::ToDouble($weatherRequestsResults.main.temp_min)
                        $this.maxTemperature = [convert]::ToDouble($weatherRequestsResults.main.temp_max)
                    }

                    # Allocating the value of the choosen date and time format to the dateAndTimeFormatId class attribute
                    $this.dateAndTimeFormatId = $choosenDateAndTimeFormat

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