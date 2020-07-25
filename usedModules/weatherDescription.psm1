# Definition of the weatherDescription Powershell class to manage weather datas
class weatherDescription {

    hidden [string]$mainDescription
    hidden [string]$precisedDescription
    hidden [string]$weatherURLIcon

    # weatherDescription class constructor with all needed parameters
    weatherDescription($mainDescription, $precisedDescription, $weatherIcon)
    {
        $this.mainDescription = $mainDescription
        $this.precisedDescription = $precisedDescription
        $this.weatherURLIcon = "https://openweathermap.org/img/wn/" + $weatherIcon + ".png"
    }
}