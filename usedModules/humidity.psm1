# Definition of the humidity class to encapsulate all datas relatives to humidity
class humidity {

    hidden [int]$humidityValue
    hidden [string]$humidityUnitScale

    # humidity class constructor
    humidity([int] $humidityValue)
    {
        $this.humidityValue = $humidityValue
        $this.humidityUnitScale = "%"
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