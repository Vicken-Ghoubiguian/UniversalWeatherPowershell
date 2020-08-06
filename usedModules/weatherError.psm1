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
}