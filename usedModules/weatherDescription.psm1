# Definition of the weatherDescription Powershell class to encapsulate and manage weather datas
class weatherDescription {

    # Attributes for respectively the main description, the precised description and the URL Icon
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

    # 'mainDescription' attribute getter
    [string] getMainDescription()
    {
        return $this.mainDescription
    }

    # 'precisedDescription' attribute getter
    [string] getPrecisedDescription()
    {
        return $this.precisedDescription
    }

    # 'weatherURLIcon' attribute getter
    [string] getWeatherURLIcon()
    {
        return $this.weatherURLIcon
    }
}