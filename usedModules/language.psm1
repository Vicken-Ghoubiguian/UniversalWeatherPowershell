# Definition of the languageCode Powershell enum to get the wished language
Enum languageCode {

    EN = 0
    FR = 1
    DE = 2
    DA = 3
}

# Array containing all the languages ​​used
$global:languagesArray = @("English", "Français", "Deutsch", "Dansk")

#
$global:fieldNamesArray = @(@("Coordonnées géographiques", "Geographic coordinates", "Geografische Koordinaten", "Geografiske koordinater"),
                            @("Temperature", "Température", "Temperatur", "Temperatur"),
                            @("Feeling temperature", "Température de ressenti", "Temperatur fühlen", "Følelse af temperatur"),
                            @("Maximum temperature", "Température maximale", "Maximale Temperatur", "Maksimal temperatur"),
                            @("Minimum temperature", "Température minimale", "Mindesttemperatur", "Minimumstemperatur"),
                            @("Atmospheric pressure", "Pression atmosphérique", "Luftdruck", "Atmosfærisk tryk"),
                            @("Sunrise", "Lever du soleil", "Sonnenaufgang", "Solopgang"),
                            @("Indice UltraViolet", "UV Index", "UV-Index", "UV-indeks"),
                            @("Risque UltraViolet", "UV Risk", "UV-Risiko", "UV-risiko"),
                            @("Sunset", "Coucher du soleil", "Sonnenuntergang", "Solnedgang"))

#
$global:monthsArray = @(@("Janvier", "January", "Januar", "Januar"),
                        @("Février", "February", "Februar", "Februar"),
                        @("Mars", "March", "März", "Marts"),
                        @("Avril", "April", "April", "April"),
                        @("Mai", "May", "Mai", "Maj"),
                        @("Juin", "June", "Juni", "Juni"),
                        @("Juillet", "July", "Juli", "Juli"),
                        @("Août", "August", "August", "August"),
                        @("Septembre", "September", "September", "September"),
                        @("Octobre", "October", "Oktober", "Oktober"),
                        @("Novembre", "November", "November", "November"),
                        @("Décembre","December", "Dezember", "December"))

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

    # language's index getter
    [int] getLanguageIndex()
    {
        return $this.choosenLanguage
    }

    # language's name getter
    [string] getLanguageName()
    {
        return $global:languagesArray[$this.choosenLanguage]
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