# Definition of the dateAndTimeFormat Powershell enum to get the wished date and time format
Enum dateAndTimeFormat {

    TimestampFormat = 0
    DMYHMSFormat = 1
    YMDHMSFormat = 2
    MDYHMSFormat = 3
}

# Definition of the dateAndTime Powershell class to manage dates and times together
class dateAndTime
{    
    hidden [string]$sunTimeInCurrentFormat
    hidden [dateAndTimeFormat]$currentFormat
    hidden [long]$asTimestamp

    # dateAndTime class constructor with all needed parameters
    dateAndTime([long]$dateAndTimeAsTimestamp)
    {
        # Allocating the others fundamentals attributes
        $this.sunTimeInCurrentFormat = $dateAndTimeAsTimestamp
        $this.currentFormat = [dateAndTimeFormat]::TimestampFormat
        $this.asTimestamp = $dateAndTimeAsTimestamp
    }

    # 'inCurrentFormat' attribute getter
    [string] getSunTimeInCurrentFormat()
    {
        return $this.sunTimeInCurrentFormat
    }

    # 'currentFormat' attribute getter
    [string] getCurrentFormat()
    {
        return "timestamp"
    }

    # 'asTimestamp' attribute getter
    [long] getTimestamp()
    {
        return $this.asTimestamp
    }
}