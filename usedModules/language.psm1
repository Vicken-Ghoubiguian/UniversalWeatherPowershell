# Definition of the languageCode Powershell enum to get the wished language
Enum languageCode {

    EN = 0
    FR = 1
    DE = 2
    DA = 3
}

# Array containing all the languages ​​used
$global:languagesArray = @("English", "Français", "Deutsch", "Dansk")

# Array containing all the MessageBox possibles titles
$global:messageBoxTitlesArray = @(@("Success...", "Succès...", "Erfolg...", "Succes..."),
                                  @("Error occurred...", "Une erreur est survenue...", "Fehler aufgetreten...", "Fejl opstod..."),
                                  @("Warning occurred...", "Un avertissement s'est produit...", "Warnung aufgetreten...", "Advarsel opstod..."),
                                  @("Canceled...", "Annulé...", "Abgesagt...", "Annulleret..."))

# Array containing all fields names in all defined languages
$global:fieldNamesArray = @(@("Geographic coordinates", "Coordonnées géographiques", "Geografische Koordinaten", "Geografiske koordinater"),
                            @("Temperature", "Température", "Temperatur", "Temperatur"),
                            @("Feeling temperature", "Température de ressenti", "Temperatur fühlen", "Følelse af temperatur"),
                            @("Maximum temperature", "Température maximale", "Maximale Temperatur", "Maksimal temperatur"),
                            @("Minimum temperature", "Température minimale", "Mindesttemperatur", "Minimumstemperatur"),
                            @("Atmospheric pressure", "Pression atmosphérique", "Luftdruck", "Atmosfærisk tryk"),
                            @("Sunrise", "Lever du soleil", "Sonnenaufgang", "Solopgang"),
                            @("Sunset", "Coucher du soleil", "Sonnenuntergang", "Solnedgang"),
                            @("UV Index", "Indice UltraViolet", "UV-Index", "UV-indeks"),
                            @("UV Risk", "Risque UltraViolet", "UV-Risiko", "UV-risiko"),
                            @("Humidity", "Humidité", "Feuchtigkeit", "Fugtighed"),
                            @("City", "Ville", "Stadt", "By"),
                            @("Country's ISO 3166-1 alpha-2 code", "Code ISO 3166-1 alpha-2 du pays", "ISO 3166-1 Alpha-2-Code der Lande", "ISO 3166-1 Alpha-2 landekode"),
                            @("Main weather", "Météo principale", "Hauptwetter", "Hovedvejr"),
                            @("Describe weather", "Décrivez la météo", "Beschreibe das Wetter", "Beskriv vejret"),
                            @("Weather icon URL", "URL de l'icône météo", "Wetter Symbol URL", "Vejrs ikon URL"),
                            @("Speed", "Vitesse", "Geschwindigkeit", "Hastighed"),
                            @("Deg", "Deg", "Grad", "Grad"),
                            @("Gust", "Rafale", "Böe", "Vindstød"))

# Array containing all months names in all defined languages
$global:monthsArray = @(@("January", "Janvier", "Januar", "Januar"),
                        @("February", "Février", "Februar", "Februar"),
                        @("March", "Mars", "März", "Marts"),
                        @("April", "Avril", "April", "April"),
                        @("Mai", "May", "Mai", "Maj"),
                        @("June", "Juin", "Juni", "Juni"),
                        @("July", "Juillet", "Juli", "Juli"),
                        @("August", "Août", "August", "August"),
                        @("September", "Septembre", "September", "September"),
                        @("October", "Octobre", "Oktober", "Oktober"),
                        @("November", "Novembre", "November", "November"),
                        @("December", "Décembre", "Dezember", "December"))

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

    #
    [string] getWishedFieldName([int] $wishedFieldName)
    {
        return $global:fieldNamesArray[$wishedFieldName][$this.choosenLanguage]
    }

    #
    [string] getWishedMessageBoxTitle([int] $requestedMessageBox)
    {
        return $global:messageBoxTitlesArray[$requestedMessageBox][$this.choosenLanguage]
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