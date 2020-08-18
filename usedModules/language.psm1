# Definition of the languageCode Powershell enum to get the wished language
Enum languageCode {

    EN = 0
    FR = 1
    DE = 2
    DA = 3
}

# Array containing all the languages ​​used
$global:languageName = @("English", "Français", "Deutsch", "Dansk")

# Definition of the language Powershell class to manage current language datas
class language
{
    # Attribute for the language
    hidden [languageCode]$choosenLanguage

    # Default constructor of the language class
    language()
    {
        # Allocating the value of choosen language as member of the languageCode enum
        $this.choosenLanguage = [languageCode]::EN
    }

    # language attributes getter
    [string] getLanguage()
    {
        return $global:languageName[$this.choosenLanguage]
    }

    #
    [void] setLanguageAsEnglish()
    {
        If($this.choosenLanguage -eq [languageCode]::EN)
        {
            # Message to display : "Choosen language already in english."
        }
        Else
        {
            $this.choosenLanguage = [languageCode]::EN
        }
    }

    #
    [void] setLanguageAsFrench()
    {
        If($this.choosenLanguage -eq [languageCode]::FR)
        {
            # Message to display : "Choosen language already in french."
        }
        Else
        {
            $this.choosenLanguage = [languageCode]::FR
        }
    }

    #
    [void] setLanguageAsGerman()
    {
        If($this.choosenLanguage -eq [languageCode]::DE)
        {
            # Message to display : "Choosen language already in german."
        }
        Else
        {
            $this.choosenLanguage = [languageCode]::DE
        }
    }

    #
    [void] setLanguageAsDanish()
    {
        If($this.choosenLanguage -eq [languageCode]::DA)
        {
            # Message to display : "Choosen language already in danish."
        }
        Else
        {
            $this.choosenLanguage = [languageCode]::DA
        }
    }
}