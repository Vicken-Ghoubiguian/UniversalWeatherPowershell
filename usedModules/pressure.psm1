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

            $this.pressureValue = $this.pressureValue/100
            $this.pressureUnitId = [pressureMeasurementUnit]::hectopascal
            $this.pressureUnitSymbol = "hPa"

            # Message to display : "Pressure converted to HectoPascal (hPa) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::bar) {

            $this.pressureValue = $this.pressureValue * 1000
            $this.pressureUnitId = [pressureMeasurementUnit]::hectopascal
            $this.pressureUnitSymbol = "hPa"

            # Message to display : "Pressure converted to HectoPascal (hPa) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::atmosphere) {

            $this.pressureValue = $this.pressureValue * 1013.2501
            $this.pressureUnitId = [pressureMeasurementUnit]::hectopascal
            $this.pressureUnitSymbol = "hPa"

            # Message to display : "Pressure converted to HectoPascal (hPa) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::torr) {

            $this.pressureValue = $this.pressureValue * 1.333223684211
            $this.pressureUnitId = [pressureMeasurementUnit]::hectopascal
            $this.pressureUnitSymbol = "hPa"

            # Message to display : "Pressure converted to HectoPascal (hPa) successfully."

        } Else {

            # Message to display : "Pressure already in HectoPascal (hPa)."
        }
    }

    # set pressure to Pascal
    [void] setPressureAsPascal()
    {
        If($this.pressureUnitId -eq [pressureMeasurementUnit]::hectopascal) {

            $this.pressureValue = $this.pressureValue * 100
            $this.pressureUnitId = [pressureMeasurementUnit]::pascal
            $this.pressureUnitSymbol = "Pa"

            # Message to display : "Pressure converted to Pascal (Pa) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::bar) {

            $this.pressureValue = $this.pressureValue * 100000
            $this.pressureUnitId = [pressureMeasurementUnit]::pascal
            $this.pressureUnitSymbol = "Pa"

            # Message to display : "Pressure converted to Pascal (Pa) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::atmosphere) {

            $this.pressureValue = $this.pressureValue * 101325
            $this.pressureUnitId = [pressureMeasurementUnit]::pascal
            $this.pressureUnitSymbol = "Pa"

            # Message to display : "Pressure converted to Pascal (Pa) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::torr) {

            $this.pressureValue = $this.pressureValue * 133.3223684211
            $this.pressureUnitId = [pressureMeasurementUnit]::pascal
            $this.pressureUnitSymbol = "Pa"

            # Message to display : "Pressure converted to Pascal (Pa) successfully."

        } Else {

            # Message to display : "Pressure already in Pascal (Pa)."
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