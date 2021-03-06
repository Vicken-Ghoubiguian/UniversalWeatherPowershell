﻿# Definition of the languageCode Powershell enum to get the wished language
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

# Array containing all the MessageBox possibles contents
$global:messageBoxContentsArray = @(@("Congratulations, you can now play with weather.", "Félicitations, vous pouvez maintenant jouer avec la météo.", "Herzlichen Glückwunsch, Sie können jetzt mit dem Wetter spielen.", "Tillykke, du kan nu lege med vejret."),
                                    @("Sorry but an error occurred when executing request: ", "Désolé mais une erreur s'est produite lors de l'exécution de la requête: ", "Leider ist beim Ausführen der Anforderung ein Fehler aufgetreten: ", "Beklager, men der opstod en fejl under udførelse af anmodning: "),
                                    @("Warning: date and time format already as timestamp", "Attention: format de la date et de l'heure déjà comme timestamp", "Warnung: Datums- und Uhrzeitformat bereits als timestamp", "Advarsel: dato- og tidsformat allerede som timestamp"),
                                    @("Warning: temperature scale already in Kelvin", "Attention: unité de température déjà en Kelvin", "Warnung: Temperaturskala bereits in Kelvin", "Advarsel: temperaturskala allerede i Kelvin"),
                                    @("Warning: pressure scale already in HectoPascal (hPa)", "Attention: unité de pression déjà en HectoPascal (hPa)", "Warnung: Druckskala bereits in HectoPascal (hPa)", "Advarsel: trykskala allerede i HectoPascal (hPa)"))

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

# Array containing all weekdays names in all defined languages
$global:weekdaysArray = @(@("Sunday", "Dimanche", "Sonntag", "Søndag"),
                          @("Monday", "Lundi", "Montag", "Mandag"),
                          @("Tuesday", "Mardi", "Dienstag", "Tirsdag"),
                          @("Wednesday", "Mercredi", "Mittwoch", "Onsdag"),
                          @("Thursday", "Jeudi", "Donnerstag", "Torsdag"),
                          @("Friday", "Vendredi", "Freitag", "Fredag"),
                          @("Saturday", "Samedi", "Samstag", "Lørdag"))

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

    # Wished field name getter
    [string] getWishedFieldName([int] $wishedFieldName)
    {
        return $global:fieldNamesArray[$wishedFieldName][$this.choosenLanguage]
    }

    # Wished MessageBox title getter
    [string] getWishedMessageBoxTitle([int] $requestedMessageBoxTitle)
    {
        return $global:messageBoxTitlesArray[$requestedMessageBoxTitle][$this.choosenLanguage]
    }

    # Wished MessageBox content getter
    [string] getWishedMessageBoxContent([int] $requestedMessageBoxContent)
    {
        return $global:messageBoxContentsArray[$requestedMessageBoxContent][$this.choosenLanguage]
    }

    # Wished month getter
    [string] getWishedMonth([int] $requestedMonthNumber)
    {
        If(($requestedMonthNumber -gt 0) -and ($requestedMonthNumber -le 12))
        {
            return $global:monthsArray[$requestedMonthNumber][$this.choosenLanguage]
        }
        Else
        {
            return ""
        }
    }

    # Wished week day getter
    [string] getWishedWeekDay([int] $requestedWeekDayNumber)
    {
        If(($requestedWeekDayNumber -gt -1) -and ($requestedWeekDayNumber -le 6))
        {
            return $global:weekdaysArray[$requestedWeekDayNumber][$this.choosenLanguage]
        }
        Else
        {
            return ""
        }
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

    # Set the current language to English
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

    # Set the current language to French
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

    # Set the current language to German
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

    # Set the current language to Danish
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