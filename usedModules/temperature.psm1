# Definition of the temperatureMeasurementUnit Powershell enum to get the wished temperature measurement unit
Enum temperatureMeasurementUnit {
    
    Kelvin = 0
    Celsius = 1
    Fahrenheit = 2
}

# Definition of the temperature Powershell class to encapsulate and manage temperature datas
class temperature {

    hidden [float]$temperatureValue
    hidden [temperatureMeasurementUnit]$temperatureMeasurementUnitId
    hidden [string]$temperatureMeasurementUnitSymbol

    # temperature class constructor
    temperature([float] $definedValue)
    {
        $this.temperatureValue = $definedValue
        $this.temperatureMeasurementUnitId = [temperatureMeasurementUnit]::Kelvin
        $this.temperatureMeasurementUnitSymbol = "K"
    }

    # set temperature to Kelvin
    [void] setTemperatureAsKelvin()
    {
        If($this.temperatureMeasurementUnitId -eq [temperatureMeasurementUnit]::Celsius) {

            $this.temperatureMeasurementUnitId = [temperatureMeasurementUnit]::Kelvin
            $this.temperatureMeasurementUnitSymbol = "K"
            $this.temperatureValue = $this.temperatureValue + 273.15

            # Message to display : "Temperature converted to Kelvin (K) successfully."

        } ElseIf($this.temperatureMeasurementUnitId -eq [temperatureMeasurementUnit]::Fahrenheit) {

            $this.temperatureMeasurementUnitId = [temperatureMeasurementUnit]::Kelvin
            $this.temperatureMeasurementUnitSymbol = "K"
            $this.temperatureValue = ($this.temperatureValue - 32) * (5/9) + 273.15

            # Message to display : "Temperature converted to Kelvin (K) successfully."

        } Else {

            # Message to display : "Temperature already in Kelvin (K)."
        }
    }

    # set temperature to Celsius
    [void] setTemperatureAsCelsius()
    {
        If($this.temperatureMeasurementUnitId -eq [temperatureMeasurementUnit]::Kelvin) {

            $this.temperatureMeasurementUnitId = [temperatureMeasurementUnit]::Celsius
            $this.temperatureMeasurementUnitSymbol = "°C"
            $this.temperatureValue = $this.temperatureValue - 273.15

            # Message to display : "Temperature converted to Celsius (°C) successfully."

        } ElseIf($this.temperatureMeasurementUnitId -eq [temperatureMeasurementUnit]::Fahrenheit) {

            $this.temperatureMeasurementUnitId = [temperatureMeasurementUnit]::Celsius
            $this.temperatureMeasurementUnitSymbol = "°C"
            $this.temperatureValue = ($this.temperatureValue - 32) * (5/9)

            # Message to display : "Temperature converted to Celsius (°C) successfully."

        } Else {

            # Message to display : "Temperature already in Celsius (°C)."
        }
    }

    # set temperature to Fahrenheit
    [void] setTemperatureAsFahrenheit()
    {
        If($this.temperatureMeasurementUnitId -eq [temperatureMeasurementUnit]::Kelvin) {

            $this.temperatureMeasurementUnitId = [temperatureMeasurementUnit]::Fahrenheit
            $this.temperatureMeasurementUnitSymbol = "°F"
            $this.temperatureValue = ($this.temperatureValue - 273.15) * (9/5) + 32

            # Message to display : "Temperature converted to Fahrenheit (°F) successfully."

        } ElseIf($this.temperatureMeasurementUnitId -eq [temperatureMeasurementUnit]::Celsius) {

            $this.temperatureMeasurementUnitId = [temperatureMeasurementUnit]::Fahrenheit
            $this.temperatureMeasurementUnitSymbol = "°F"
            $this.temperatureValue = ($this.temperatureValue * (9/5)) + 32

            # Message to display : "Temperature converted to Fahrenheit (°F) successfully."
         
        } Else {

            # Message to display : "Temperature already in Fahrenheit (°F)."
        }
    }

    # 'temperatureValue' attribute getter
    [float] getTemperatureValue()
    {
        return $this.temperatureValue
    }

    # 'temperatureMeasurementUnitId' attribute getter as string
    [string] getTemperatureMeasurementUnit()
    {
        $usedTemperatureMeasurementUnit = ""

        If($this.temperatureMeasurementUnitId -eq [temperatureMeasurementUnit]::Celsius) {

            $usedTemperatureMeasurementUnit = "Celsius"

        } ElseIf($this.temperatureMeasurementUnitId -eq [temperatureMeasurementUnit]::Fahrenheit) {

            $usedTemperatureMeasurementUnit = "Fahrenheit"

        } Else {
            
            $usedTemperatureMeasurementUnit = "Kelvin"

        }

        return $usedTemperatureMeasurementUnit
    }

    # 'temperatureMeasurementUnitSymbol' attribute getter
    [string] getTemperatureMeasurementUnitSymbol()
    {
        return $this.temperatureMeasurementUnitSymbol
    }
}