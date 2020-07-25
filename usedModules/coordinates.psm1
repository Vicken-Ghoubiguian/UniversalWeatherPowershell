# Definition of the temperature Powershell class to encapsulate coordinates datas (latitude and longitude)
class coordinates
{
    
    # Attributes for respectively longitude and latitude
    hidden [float]$longitude
    hidden [float]$latitude

    # coordinates class constructor with all needed parameters
    coordinates([float]$latitude, [float]$longitude)
    {
        # Allocating the values of latitude in its specific class attribute
        $this.latitude = $latitude

        # Allocating the values of longitude in its specific class attribute
        $this.longitude = $longitude
    }

    # 'longitude' attribute getter
    [float] getLongitude()
    {
        return $this.longitude
    }

    # 'latitude' attribute getter
    [float] getLatitude()
    {
        return $this.latitude
    }
}