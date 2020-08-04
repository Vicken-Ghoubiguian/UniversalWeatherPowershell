# Definition of the dateAndTimeFormat Powershell enum to get the wished date and time format
Enum dateAndTimeFormat {

    TimestampFormat = 0
    DMYHMSFormat = 1
    YMDHMSFormat = 2
    MDYHMSFormat = 3
}

# Formating function to display dates and times
function formatingNumberFunction{

    param(
        [int]$wishedNumber
    )

    [string]$intermVariable = ""

    If($wishedNumber -lt 10)
    {
        $intermVariable = "0" + $wishedNumber
    }
    Else
    {
        $intermVariable = $wishedNumber
    }

    return $intermVariable
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

    # set current format to MDYHMS
    [void] setCurrentFormatAsMDYHMS()
    {
        # if the current format is already MDYHMS
        If($this.currentFormat -ne [dateAndTimeFormat]::MDYHMSFormat) {

            #
            $unixEpochStart = new-object DateTime 1970,1,1,0,0,0,([DateTimeKind]::Utc)
            $gettinDate = Get-Date -Date $unixEpochStart.AddSeconds($this.asTimestamp)

            $this.sunTimeInCurrentFormat = $gettinDate.Month.ToString() + "/" + $gettinDate.Day.ToString() + "/" + $gettinDate.Year.ToString() + " " + $gettinDate.Hour.ToString() + ":" + $gettinDate.Minute.ToString() + ":" + $gettinDate.Second.ToString()
            $this.currentFormat = [dateAndTimeFormat]::DMYHMSFormat

            # Message to display : "suntime converted to MDYHMS format successfully."

        } Else {
            
            # Message to display : "suntime format already as MDYHMS."
        }
    }

    # set current format to DMYHMS
    [void] setCurrentFormatAsDMYHMS()
    {
        # if the current format is already DMYHMS
        If($this.currentFormat -ne [dateAndTimeFormat]::DMYHMSFormat) {

            #
            $unixEpochStart = new-object DateTime 1970,1,1,0,0,0,([DateTimeKind]::Utc)
            $gettinDate = Get-Date -Date $unixEpochStart.AddSeconds($this.asTimestamp)

            $this.sunTimeInCurrentFormat = $gettinDate.Day.ToString() + "/" + $gettinDate.Month.ToString() + "/" + $gettinDate.Year.ToString() + " " + $gettinDate.Hour.ToString() + ":" + $gettinDate.Minute.ToString() + ":" + $gettinDate.Second.ToString()
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

            #
            $unixEpochStart = new-object DateTime 1970,1,1,0,0,0,([DateTimeKind]::Utc)
            $gettinDate = Get-Date -Date $unixEpochStart.AddSeconds($this.asTimestamp)

            #
            $year = formatingNumberFunction($gettinDate.Year)
            $month = formatingNumberFunction($gettinDate.Month)
            $day = formatingNumberFunction($gettinDate.Day)
            $hour = formatingNumberFunction($gettinDate.Hour)
            $minute = formatingNumberFunction($gettinDate.Minute)
            $seconde = formatingNumberFunction($gettinDate.Second)

            $this.sunTimeInCurrentFormat = $year + "/" + $month + "/" + $day + " " + $hour + ":" + $minute + ":" + $seconde
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