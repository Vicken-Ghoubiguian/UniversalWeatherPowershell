class universalWeatherPowershell 
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
       [string]$uvRisk

       # universalWeatherPowershell class constructor
       universalWeatherPowershell([string] $city, [string] $apiKey) 
       {
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

                    $uviURL = "http://api.openweathermap.org/data/2.5/uvi?appid=" + $apiKey + "&lat=48.866667&lon=2.333333"

                    $uviRequest = Invoke-WebRequest -Uri $uviURL -Method Get

                    $uviRequestsJSONContent = $uviRequest.Content

                    $uviRequestsHashTable = ConvertFrom-Json $uviRequestsJSONContent

                    # Allocating the value of the UV index in the attribute uvIndex
                    $this.uvIndex = [int][convert]::ToDouble($uviRequestsHashTable.value)

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

                    [System.Windows.MessageBox]::Show("Congradulations, you can now play with weather: " + $weatherRequestsResults.coord, "Success...", "Ok", "Info")

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