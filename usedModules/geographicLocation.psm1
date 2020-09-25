# Definition of the geographicLocation class to encapsulate country and city names
class geographicLocation {

    hidden [string]$countryCode
    hidden [string]$cityName

    # geographicLocation class constructor
    geographicLocation([string] $countryCode, [string] $cityName)
    {
        $this.countryCode = $countryCode
        $this.cityName = $cityName
    }

    # 'countryCode' attribute getter
    [string] getCountryCode()
    {
        return $this.countryCode
    }

    # 'cityName' attribute getter
    [string] getCityName()
    {
        return $this.cityName
    }
}