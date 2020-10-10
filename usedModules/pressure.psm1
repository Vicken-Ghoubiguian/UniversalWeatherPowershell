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
        If($this.pressureUnitId -eq [pressureMeasurementUnit]::pascal) {

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::bar) {

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::atmosphere) {

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::torr) {

        } Else {

        }
    }

    # set pressure to Pascal
    [void] setPressureAsPascal()
    {
        If($this.pressureUnitId -eq [pressureMeasurementUnit]::hectopascal) {

            $this.pressureValue = $this.pressureValue * 100
            $this.pressureUnitId = [pressureMeasurementUnit]::pascal
            $this.pressureUnitSymbol = "Pa"

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::bar) {

            $this.pressureValue = $this.pressureValue * 100000
            $this.pressureUnitId = [pressureMeasurementUnit]::pascal
            $this.pressureUnitSymbol = "Pa"

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::atmosphere) {

            $this.pressureValue = $this.pressureValue/0.0000098692
            $this.pressureUnitId = [pressureMeasurementUnit]::pascal
            $this.pressureUnitSymbol = "Pa"

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::torr) {

            $this.pressureValue = $this.pressureValue/0.0075006375541921
            $this.pressureUnitId = [pressureMeasurementUnit]::pascal
            $this.pressureUnitSymbol = "Pa"

        } Else {

        }
    }

    # set pressure to Bar
    [void] setPressureAsBar()
    {
        If($this.pressureUnitId -eq [pressureMeasurementUnit]::hectopascal) {

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::pascal) {

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::atmosphere) {

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::torr) {

        } Else {

        }
    }

    # set pressure to Atmosphere
    [void] setPressureAsAtmosphere()
    {
        If($this.pressureUnitId -eq [pressureMeasurementUnit]::hectopascal) {

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::pascal) {

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::bar) {

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::torr) {

        } Else {

        }
    }

    # set pressure to Torr
    [void] setPressureAsTorr()
    {
        If($this.pressureUnitId -eq [pressureMeasurementUnit]::hectopascal) {

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::pascal) {

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::bar) {

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::atmosphere) {

        } Else {

        }
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