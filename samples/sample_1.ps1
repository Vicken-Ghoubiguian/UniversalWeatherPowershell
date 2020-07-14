Import-Module $PSScriptRoot\..\universalWeatherPowershell.ps1

$a = [universalWeatherPowershell]::new("Paris", [temperatureMeasurementUnit]::Kelvin, [dateAndTimeFormat]::TimestampFormat, "YOUR API KEY")