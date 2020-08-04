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
        $usedFormat = ""

        if($this.currentFormat -eq 0)
        {
            $usedFormat = "timestamp"
        }
        elseif($this.currentFormat -eq 1)
        {
            $usedFormat = "D/M/Y - H:M:S"
        }
        elseif($this.currentFormat -eq 2)
        {
            $usedFormat = "Y/M/D - H:M:S"
        }
        else
        {
            $usedFormat = "M/D/Y - H:M:S"
        }

        return $usedFormat
    }

    # 'asTimestamp' attribute getter
    [long] getTimestamp()
    {
        return $this.asTimestamp
    }

    # set current format to DMYHMS
    [void] setCurrentFormatAsDMYHMS()
    {
        # if the current format is already DMYHMS
        If($this.currentFormat -ne [dateAndTimeFormat]::DMYHMSFormat) {

            $this.sunTimeInCurrentFormat = [datetime]::FromFileTime($this.asTimestamp).ToString('d/MM/yyyy H:m:s')
            $this.currentFormat = [dateAndTimeFormat]::DMYHMSFormat

            # Message to display : "suntime converted to DMYHMS format successfully."

        } Else {
            
            # Message to display : "suntime format already as DMYHMS."
        }
    }

    # set current format to YMDHMS
    [void] setCurrentFormatAsYMDHMS()
    {
        # if the current format is already YMDHMS
        If($this.currentFormat -ne [dateAndTimeFormat]::YMDHMSFormat) {

            $this.sunTimeInCurrentFormat = [datetime]::FromFileTime($this.asTimestamp).ToString('yyyy/MM/d H:m:s')
            $this.currentFormat = [dateAndTimeFormat]::YMDHMSFormat

            # Message to display : "suntime converted to YMDHMS format successfully."

        } Else {
            
            # Message to display : "suntime format already as YMDHMS."
        }
    }

    # set current format to timestamp
    [void] setCurrentFormatAsTimestamp()
    {
        # if the current format is already timestamp
        If($this.currentFormat -ne [dateAndTimeFormat]::TimestampFormat) {

            $this.sunTimeInCurrentFormat = $this.asTimestamp
            $this.currentFormat = [dateAndTimeFormat]::TimestampFormat

            # Message to display : "suntime converted to timestamp successfully."

        } Else {

            # Message to display : "suntime format already as timestamp."
        }
    }    
}