# Definition of the pressureMeasurementUnit Powershell enum to get the wished pressure measurement unit
Enum pressureMeasurementUnit {
    
    hectopascal = 0
    pascal = 1
    bar = 2
    atmosphere = 3
    torr = 4
}

# Definition of the pressure Powershell class to manage pressure datas
class pressure
{
    # Attributes for respectively the pressure value and the pressure measurement unit
    hidden [float]$pressureValue
    hidden [pressureMeasurementUnit]$pressureUnitId
    hidden [string]$pressureUnitSymbol

    # pressure class constructor with all needed parameters
    pressure($pressureValue)
    {
        $this.pressureValue = $pressureValue
        $this.pressureUnitId = [pressureMeasurementUnit]::hectopascal
        $this.pressureUnitSymbol = "hPa"
    }

    # set pressure to HectoPascal
    [void] setPressureAsHectoPascal()
    {

    }

    # set pressure to Pascal
    [void] setPressureAsPascal()
    {

    }

    # set pressure to Bar
    [void] setPressureAsBar()
    {

    }

    # set pressure to Atmosphere
    [void] setPressureAsAtmosphere()
    {

    }

    # set pressure to Torr
    [void] setPressureAsTorr()
    {

    }

    # 'pressureValue' attribute getter
    [float] getPressureValue()
    {
        return $this.pressureValue
    }

    # 'pressureUnit' attribute getter
    [string] getPressureUnit()
    {
        return $this.pressureUnitSymbol
    }
}