# Definition of the wind Powershell class to encapsulate and manage wind datas
class wind
{
    hidden [float]$windSpeed
    hidden [int]$windDeg
    hidden [float]$windGust

    # wind class constructor
    wind($speed, $deg, $gust)
    {
        $this.windSpeed = $speed
        $this.windDeg = $deg
        $this.windGust = $gust
    }

    # 'windSpeed' attribute getter
    [float] getWindSpeed()
    {
        return $this.windSpeed
    }

    # 'windDeg' attribute getter
    [int] getWindDeg()
    {
        return $this.windDeg
    }

    # 'windGust' attribute getter
    [float] getWindGust()
    {
        return $this.windGust
    }
}