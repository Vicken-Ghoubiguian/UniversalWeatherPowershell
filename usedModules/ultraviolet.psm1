# Definition of the ultraviolet Powershell class to encapsulate uv datas
class ultraviolet {

    hidden [int]$index
    hidden [string]$risk

    # ultraviolet class constructor
    ultraviolet([int] $indexValue)
    {
        $this.index = $indexValue

        # Allocating the corresponding value of the UV risk in the attribute risk
        If($this.index -le 2) {

            $this.risk = "Low"

        } ElseIf($this.index -ge 3 -And $this.index -le 5) {

            $this.risk = "Moderate"

        } ElseIf($this.index -ge 6 -And $this.index -le 7) {

            $this.risk = "High"

        } ElseIf($this.index -ge 8 -And $this.index -le 10) {

            $this.risk = "Very high"

        } Else {

            $this.risk = "Extreme"

        }
    }

    # 'index' attribute getter
    [int] GetIndex()
    {
        return $this.index
    }

    # 'risk' attribute setter
    [string] GetRisk()
    {
        return $this.risk
    }
}