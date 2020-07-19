# Definition of the temperatureMeasurementUnit Powershell enum to get the wished temperature measurement unit
Enum temperatureMeasurementUnit {
    
    Kelvin = 0
    Celsius = 1
    Fahrenheit = 2
}

# Definition of the temperature Powershell class to encapsulate temperature datas
class temperature {

    hidden [float]$temperatureValue
    hidden [temperatureMeasurementUnit]$temperatureMeasurementUnitId
    hidden [string]$temperatureMeasurementUnitSymbol

    # set temperature to Kelvin
    [void] setTemperatureAsKelvin()
    {

    }

    # set temperature to Celsius
    [void] setTemperatureAsCelsius()
    {

    }

    # set temperature to Fahrenheit
    [void] setTemperatureAsFahrenheit()
    {

    }

    # 'temperatureValue' attribute getter
    [float] getTemperatureValue()
    {
        return $this.temperatureValue
    }

    # 'temperatureMeasurementUnitId' attribute getter as string
    [string] getTemperatureMeasurementUnit()
    {
        return ""
    }

    # 'temperatureMeasurementUnitSymbol' attribute getter
    [string] getTemperatureMeasurementUnitSymbol()
    {
        return $this.temperatureMeasurementUnitSymbol
    }
}