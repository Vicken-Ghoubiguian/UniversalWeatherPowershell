# Definition of the pressure Powershell class to manage pressure datas
class pressure
{
    # Attributes for respectively the pressure value and the pressure measurement unit
    hidden [float]$pressureValue
    hidden [string]$pressureUnit

    # First pressure class constructor with all needed parameters
    pressure($pressureValue)
    {
        $this.pressureValue = $pressureValue
        $this.pressureUnit = "hPa"
    }

    # Second pressure class constructor with all needed parameters
    pressure($pressureValue, $pressureUnit)
    {
        $this.pressureValue = $pressureValue
        $this.pressureUnit = $pressureUnit
    }

    #
    [float] getPressureValue()
    {
        return $this.pressureValue
    }

    #
    [string] getPressureUnit()
    {
        return $this.pressureUnit
    }
}