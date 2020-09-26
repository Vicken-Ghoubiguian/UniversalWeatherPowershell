# Definition of the geographicLocation class to encapsulate country and city names
class humidity {

    hidden [int]$humidityValue
    hidden [string]$humidityUnitScale

    # humidity class constructor
    humidity([int] $humidityValue)
    {
        $this.humidityValue = $humidityValue
        $this.humidityUnitScale = " %"
    }

    #
    [int] getHumidityValue()
    {
        return $this.humidityValue
    }

    #
    [string] getHumidityUnitScale()
    {
        return $this.humidityUnitScale
    }
}