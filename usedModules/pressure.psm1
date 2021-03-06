﻿# Definition of the pressureMeasurementUnit Powershell enum to get the wished pressure measurement unit
Enum pressureMeasurementUnit {
    
    hectopascal = 0
    pascal = 1
    bar = 2
    atmosphere = 3
    torr = 4
    poundsPerSquareInc = 5
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

    # set pressure to HectoPascal (hPa)
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

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::poundsPerSquareInc) {

            $this.pressureValue = $this.pressureValue * 68.9475729318
            $this.pressureUnitId = [pressureMeasurementUnit]::hectopascal
            $this.pressureUnitSymbol = "hPa"

            # Message to display : "Pressure converted to HectoPascal (hPa) successfully."

        } Else {

            # Message to display : "Pressure already in HectoPascal (hPa)."
        }
    }

    # set pressure to Pascal (Pa)
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

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::poundsPerSquareInc) {

            $this.pressureValue = $this.pressureValue * 6894.7572931783
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

            $this.pressureValue = $this.pressureValue/1000
            $this.pressureUnitId = [pressureMeasurementUnit]::bar
            $this.pressureUnitSymbol = "bar"

            # Message to display : "Pressure converted to Bar (bar) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::pascal) {

            $this.pressureValue = $this.pressureValue/100000
            $this.pressureUnitId = [pressureMeasurementUnit]::bar
            $this.pressureUnitSymbol = "bar"

            # Message to display : "Pressure converted to Bar (bar) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::atmosphere) {

            $this.pressureValue = $this.pressureValue * 1.01325
            $this.pressureUnitId = [pressureMeasurementUnit]::bar
            $this.pressureUnitSymbol = "bar"

            # Message to display : "Pressure converted to Bar (bar) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::torr) {

            $this.pressureValue = $this.pressureValue/750.06375541921
            $this.pressureUnitId = [pressureMeasurementUnit]::bar
            $this.pressureUnitSymbol = "bar"

            # Message to display : "Pressure converted to Bar (bar) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::poundsPerSquareInc) {

            $this.pressureValue = $this.pressureValue/14,5037738
            $this.pressureUnitId = [pressureMeasurementUnit]::bar
            $this.pressureUnitSymbol = "bar"

            # Message to display : "Pressure converted to Bar (bar) successfully."

        } Else {

            # Message to display : "Pressure already in Bar (bar)."
        }
    }

    # set pressure to Atmosphere
    [void] setPressureAsAtmosphere()
    {
        If($this.pressureUnitId -eq [pressureMeasurementUnit]::hectopascal) {

            $this.pressureValue = $this.pressureValue/1013.25
            $this.pressureUnitId = [pressureMeasurementUnit]::atmosphere
            $this.pressureUnitSymbol = "atm"

            # Message to display : "Pressure converted to Atmosphere (atm) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::pascal) {

            $this.pressureValue = $this.pressureValue/101325
            $this.pressureUnitId = [pressureMeasurementUnit]::atmosphere
            $this.pressureUnitSymbol = "atm"

            # Message to display : "Pressure converted to Atmosphere (atm) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::bar) {

            $this.pressureValue = $this.pressureValue/1.01325
            $this.pressureUnitId = [pressureMeasurementUnit]::atmosphere
            $this.pressureUnitSymbol = "atm"

            # Message to display : "Pressure converted to Atmosphere (atm) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::torr) {

            $this.pressureValue = $this.pressureValue/760
            $this.pressureUnitId = [pressureMeasurementUnit]::atmosphere
            $this.pressureUnitSymbol = "atm"

            # Message to display : "Pressure converted to Atmosphere (atm) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::poundsPerSquareInc) {

            $this.pressureValue = $this.pressureValue/14,696
            $this.pressureUnitId = [pressureMeasurementUnit]::atmosphere
            $this.pressureUnitSymbol = "atm"

            # Message to display : "Pressure converted to Atmosphere (atm) successfully."

        } Else {

            # Message to display : "Pressure already in Atmosphere (atm)."
        }
    }

    # set pressure to Torr
    [void] setPressureAsTorr()
    {
        If($this.pressureUnitId -eq [pressureMeasurementUnit]::hectopascal) {

            $this.pressureValue = $this.pressureValue/1.3332236842
            $this.pressureUnitId = [pressureMeasurementUnit]::torr
            $this.pressureUnitSymbol = "torr"

            # Message to display : "Pressure converted to Toor (torr) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::pascal) {

            $this.pressureValue = $this.pressureValue/133.3223684211
            $this.pressureUnitId = [pressureMeasurementUnit]::torr
            $this.pressureUnitSymbol = "torr"

            # Message to display : "Pressure converted to Toor (torr) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::bar) {

            $this.pressureValue = $this.pressureValue * 750.061682704
            $this.pressureUnitId = [pressureMeasurementUnit]::torr
            $this.pressureUnitSymbol = "torr"

            # Message to display : "Pressure converted to Toor (torr) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::atmosphere) {

            $this.pressureValue = $this.pressureValue * 760
            $this.pressureUnitId = [pressureMeasurementUnit]::torr
            $this.pressureUnitSymbol = "torr"

            # Message to display : "Pressure converted to Toor (torr) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::poundsPerSquareInc) {

            $this.pressureValue = $this.pressureValue * 51,715
            $this.pressureUnitId = [pressureMeasurementUnit]::torr
            $this.pressureUnitSymbol = "torr"

            # Message to display : "Pressure converted to Toor (torr) successfully."

        } Else {

            # Message to display : "Pressure already in Atmosphere (atm)."
        }
    }

    # set pressure to Pounds per square inch (psi)
    [void] setPressureAsPoundsPerSquareInch()
    {
        If($this.pressureUnitId -eq [pressureMeasurementUnit]::hectopascal) {

            $this.pressureValue = $this.pressureValue/68.94757293168
            $this.pressureUnitId = [pressureMeasurementUnit]::poundsPerSquareInc
            $this.pressureUnitSymbol = "psi"

            # Message to display : "Pressure converted to Pounds per square inch (psi) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::pascal) {

            $this.pressureValue = $this.pressureValue/6894.757293168
            $this.pressureUnitId = [pressureMeasurementUnit]::poundsPerSquareInc
            $this.pressureUnitSymbol = "psi"

            # Message to display : "Pressure converted to Pounds per square inch (psi) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::bar) {

            $this.pressureValue = $this.pressureValue * 14.503773773022
            $this.pressureUnitId = [pressureMeasurementUnit]::poundsPerSquareInc
            $this.pressureUnitSymbol = "psi"

            # Message to display : "Pressure converted to Pounds per square inch (psi) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::atmosphere) {

            $this.pressureValue = $this.pressureValue * 14.695964
            $this.pressureUnitId = [pressureMeasurementUnit]::poundsPerSquareInc
            $this.pressureUnitSymbol = "psi"

            # Message to display : "Pressure converted to Pounds per square inch (psi) successfully."

        } ElseIf($this.pressureUnitId -eq [pressureMeasurementUnit]::torr) {
            
            $this.pressureValue = $this.pressureValue/51,715
            $this.pressureUnitId = [pressureMeasurementUnit]::poundsPerSquareInc
            $this.pressureUnitSymbol = "psi"

            # Message to display : "Pressure converted to Pounds per square inch (psi) successfully."

        } Else {

            # Message to display : "Pressure already in Pounds per square inch (psi)."
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