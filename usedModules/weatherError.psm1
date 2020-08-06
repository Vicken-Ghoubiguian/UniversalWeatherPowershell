# Definition of the weatherError Powershell class to manage dates and times together
class weatherError
{
    hidden [string]$type
    hidden [string]$message
    hidden [string]$stackTrace

    # weatherError class constructor with all needed parameters
    weatherError($type, $message, $stackTrace)
    {
        $this.type = $type
        $this.message = $message
        $this.stackTrace = $stackTrace
    }

    # 'type' attribute getter
    [string] getType()
    {
        return $this.type
    }

    # 'message' attribute getter
    [string] getMessage()
    {
        return $this.message
    }

    # 'stackTrace' attribute getter
    [string] getStackTrace()
    {
        return $this.stackTrace
    }
}