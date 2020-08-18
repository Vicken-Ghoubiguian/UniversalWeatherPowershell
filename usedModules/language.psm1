# Definition of the languageCode Powershell enum to get the wished language
Enum languageCode {

    EN = 0
    FR = 1
    DE = 2
    DA = 3
}

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
}