#
class weatherError
{
    hidden [string]$type
    hidden [string]$message
    hidden [string]$stackTrace

    #
    weatherError($type, $message, $stackTrace)
    {
        $this.type = $type
        $this.message = $message
        $this.stackTrace = $stackTrace
    }
}