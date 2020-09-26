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

    # 'humidityValue' attribute getter
    [int] getHumidityValue()
    {
        return $this.humidityValue
    }

    # 'humidityUnitScale' attribute getter
    [string] getHumidityUnitScale()
    {
        return $this.humidityUnitScale
    }
}