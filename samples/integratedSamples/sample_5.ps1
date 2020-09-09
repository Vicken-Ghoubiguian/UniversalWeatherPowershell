# Importation of the UniversalWeatherPowershell module
Using module .\..\..

# Import the Assemblies 'System.Windows.Forms' and 'PresentationFramework' to the current sample
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework

# Countries ISO 3166-1 alpha-2 code array
$global:countryISO31668_1Alpha_2CodeArray = @("AF", "AX", "AL", "DZ", "AS", "AD", "AO", "AI", "AQ", "AG", "AR", "AM", "AW", "AU", "AT", "AZ"
                                              "BS", "BH", "BD", "BB", "BY", "BE", "BZ", "BJ", "BM", "BT", "BO", "BQ", "BA", "BW", "BV", "BR", "IO", "BN", "BG", "BF", "BI",
                                              "CV", "KH", "CM", "CA", "KY", "CF", "TD", "CL", "CN", "CX", "CC", "CO", "KM", "CD", "CG", "CK", "CR", "HR", "CU", "CW", "CY", "CZ", "CI",
                                              "DK", "DJ", "DM", "DO",
                                              "EC", "EG", "SV", "GQ", "ER", "EE", "SZ", "ET",
                                              "FK", "FO", "FJ", "FI", "FR", "GF", "PF", "TF",
                                              "GA", "GM", "GE", "DE", "GH", "GI", "GR", "GL", "GD", "GP", "GU", "GT", "GG", "GN", "GW", "GY",
                                              "HT", "HM", "VA", "HN", "HK", "HU",
                                              "IS", "IN", "ID", "IR",  "IQ", "IE", "IM", "IL", "IT",
                                              "JM", "JP", "JE", "JO",
                                              "KZ", "KE", "KI", "KP", "KR", "KW", "KG",
                                              "LA", "LV", "LB", "LS", "LR", "LY", "LI", "LT", "LU",
                                              "MO", "MG", "MW", "MY", "MV", "ML", "MT", "MH", "MQ", "MR", "MU", "YT", "MX", "FM", "MD", "MC", "MN", "ME", "MS", "MA", "MZ", "MM"
                                              "NA", "NR", "NP", "NL", "NC", "NZ", "NI", "NE", "NG", "NU", "NF", "MP", "NO",
                                              "OM",
                                              "PK", "PW", "PS", "PA", "PG", "PY", "PE", "PH", "PN", "PL", "PT", "PR",
                                              "QA",
                                              "MK", "RO", "RU", "RW", "RE",
                                              "BL", "SH", "KN", "LC", "MF", "PM", "VC", "WS", "SM", "ST", "SA", "SN", "RS", "SC", "SL", "SG", "SX", "SK", "SI", "SB", "SO", "ZA", "GS", "SS", "ES", "LK", "SD", "SR", "SJ", "SE", "CH", "SY",
                                              "TW", "TJ", "TZ", "TH", "TL", "TG", "TK", "TO", "TT", "TN", "TR", "TM", "TC", "TV",
                                              "UG", "UA", "AE", "GB", "UM", "US", "UY", "UZ", 
                                              "VU", "VE", "VN", "VG", "VI",
                                              "WF", "EH",
                                              "YE",
                                              "ZM", "ZW"
                                            )

# Creation of the GUI
$form = New-Object Windows.Forms.Form

# Blocking the resizing of the form and remove the Minimize and Maximize icons
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Fixed3D
$form.MaximizeBox = $False
$form.MinimizeBox = $False

# Setting form title
$form.Text = "Weather form"

# Setting form size
$form.Size = New-Object System.Drawing.Size(1000,1000)

# Adding 'cityTextBox' to inquire wished city
$cityTextBox = New-Object System.Windows.Forms.TextBox
$cityTextBox.Text = "Wished city, please"
$cityTextBox.Location = New-Object System.Drawing.Point(350,50)
$cityTextBox.Size = New-Object System.Drawing.Size(550,100)
$form.Controls.Add($cityTextBox)

# Adding 'cityLabel' label to indicate the 'cityTextBox' textbox
$cityLabel = New-Object System.Windows.Forms.Label
$cityLabel.Location = New-Object System.Drawing.Point(200,50)
$cityLabel.Size = New-Object System.Drawing.Size(280,20)
$cityLabel.Text = 'Wished city:'
$form.Controls.Add($cityLabel)

# Adding 'apiKeyTextBox' to inquire OpenweatherMap api key
$apiKeyTextBox = New-Object System.Windows.Forms.TextBox
$apiKeyTextBox.Text = "OpenweatherMap API Key, please"
$apiKeyTextBox.Location = New-Object System.Drawing.Point(350,120)
$apiKeyTextBox.Size = New-Object System.Drawing.Size(550,120)
$form.Controls.Add($apiKeyTextBox)

# Adding 'cityLabel' label to indicate the 'cityTextBox' textbox
$apiKeyLabel = New-Object System.Windows.Forms.Label
$apiKeyLabel.Location = New-Object System.Drawing.Point(200,120)
$apiKeyLabel.Size = New-Object System.Drawing.Size(280,20)
$apiKeyLabel.Text = 'Api key:'
$form.Controls.Add($apiKeyLabel)

# Defining 'countryListBox' to inquire the wished city's current country
$countryListBox = New-Object System.Windows.Forms.ListBox
$countryListBox.Location = New-Object System.Drawing.Point(350,155)
$countryListBox.Size = New-Object System.Drawing.Size(260,50)
$countryListBox.Width = 550
$countryListBox.Height = 27

# 'A' countries
[void] $countryListBox.Items.Add('Afghanistan')
[void] $countryListBox.Items.Add('Åland Islands')
[void] $countryListBox.Items.Add('Albania')
[void] $countryListBox.Items.Add('Algeria')
[void] $countryListBox.Items.Add('American Samoa')
[void] $countryListBox.Items.Add('Andorra')
[void] $countryListBox.Items.Add('Angola')
[void] $countryListBox.Items.Add('Anguilla')
[void] $countryListBox.Items.Add('Antigua and Barbuda')
[void] $countryListBox.Items.Add('Argentina')
[void] $countryListBox.Items.Add('Armenia')
[void] $countryListBox.Items.Add('Aruba')
[void] $countryListBox.Items.Add('Australia')
[void] $countryListBox.Items.Add('Austria')
[void] $countryListBox.Items.Add('Azerbaijan')

# 'B' countries
[void] $countryListBox.Items.Add('Bahamas (the)')
[void] $countryListBox.Items.Add('Bahrain')
[void] $countryListBox.Items.Add('Bangladesh')
[void] $countryListBox.Items.Add('Barbados')
[void] $countryListBox.Items.Add('Belarus')
[void] $countryListBox.Items.Add('Belgium')
[void] $countryListBox.Items.Add('Belize')
[void] $countryListBox.Items.Add('Benin')
[void] $countryListBox.Items.Add('Bermuda')
[void] $countryListBox.Items.Add('Bhutan')
[void] $countryListBox.Items.Add('Bolivia (Plurinational State of)')
[void] $countryListBox.Items.Add('Bonaire, Sint Eustatius and Saba')
[void] $countryListBox.Items.Add('Bosnia and Herzegovina')
[void] $countryListBox.Items.Add('Botswana')
[void] $countryListBox.Items.Add('Bouvet Island')
[void] $countryListBox.Items.Add('Brazil')
[void] $countryListBox.Items.Add('British Indian Ocean Territory (the)')
[void] $countryListBox.Items.Add('Brunei Darussalam')
[void] $countryListBox.Items.Add('Bulgaria')
[void] $countryListBox.Items.Add('Burkina Faso')
[void] $countryListBox.Items.Add('Burundi')

# 'C' countries
[void] $countryListBox.Items.Add('Cabo Verde')
[void] $countryListBox.Items.Add('Cambodia')
[void] $countryListBox.Items.Add('Cameroon')
[void] $countryListBox.Items.Add('Canada')
[void] $countryListBox.Items.Add('Cayman Islands (the)')
[void] $countryListBox.Items.Add('Central African Republic (the)')
[void] $countryListBox.Items.Add('Chad')
[void] $countryListBox.Items.Add('Chile')
[void] $countryListBox.Items.Add('China')
[void] $countryListBox.Items.Add('Christmas Island')
[void] $countryListBox.Items.Add('Cocos (Keeling) Islands (the)')
[void] $countryListBox.Items.Add('Colombia')
[void] $countryListBox.Items.Add('Comoros (the)')
[void] $countryListBox.Items.Add('Congo (the Democratic Republic of the)')
[void] $countryListBox.Items.Add('Congo (the)')
[void] $countryListBox.Items.Add('Cook Islands (the)')
[void] $countryListBox.Items.Add('Comoros (the)')
[void] $countryListBox.Items.Add('Costa Rica')
[void] $countryListBox.Items.Add('Croatia')
[void] $countryListBox.Items.Add('Cuba')
[void] $countryListBox.Items.Add('Curaçao')
[void] $countryListBox.Items.Add('Cyprus')
[void] $countryListBox.Items.Add('Czechia')
[void] $countryListBox.Items.Add("Côte d'Ivoire")

# 'D' countries
[void] $countryListBox.Items.Add('Denmark')
[void] $countryListBox.Items.Add('Djibouti')
[void] $countryListBox.Items.Add('Dominica')
[void] $countryListBox.Items.Add('Dominican Republic (the)')

# 'E' countries
[void] $countryListBox.Items.Add('Ecuador')
[void] $countryListBox.Items.Add('Egypt')
[void] $countryListBox.Items.Add('El Salvador')
[void] $countryListBox.Items.Add('Equatorial Guinea')
[void] $countryListBox.Items.Add('Eritrea')
[void] $countryListBox.Items.Add('Estonia')
[void] $countryListBox.Items.Add('Eswatini')
[void] $countryListBox.Items.Add('Ethiopia')

# 'F' countries
[void] $countryListBox.Items.Add('Falkland Islands (the) [Malvinas]')
[void] $countryListBox.Items.Add('Faroe Islands (the)')
[void] $countryListBox.Items.Add('Fiji')
[void] $countryListBox.Items.Add('Finland')
[void] $countryListBox.Items.Add('France')
[void] $countryListBox.Items.Add('French Guiana')
[void] $countryListBox.Items.Add('French Polynesia')
[void] $countryListBox.Items.Add('French Southern Territories (the)')

# 'G' countries
[void] $countryListBox.Items.Add('Gabon')
[void] $countryListBox.Items.Add('Gambia (the)')
[void] $countryListBox.Items.Add('Georgia')
[void] $countryListBox.Items.Add('Germany')
[void] $countryListBox.Items.Add('Ghana')
[void] $countryListBox.Items.Add('Gibraltar')
[void] $countryListBox.Items.Add('Greece')
[void] $countryListBox.Items.Add('Greenland')
[void] $countryListBox.Items.Add('Grenada')
[void] $countryListBox.Items.Add('Guadeloupe')
[void] $countryListBox.Items.Add('Guam')
[void] $countryListBox.Items.Add('Guatemala')
[void] $countryListBox.Items.Add('Guernsey')
[void] $countryListBox.Items.Add('Guinea')
[void] $countryListBox.Items.Add('Guinea-Bissau')
[void] $countryListBox.Items.Add('Guyana')

# 'H' countries
[void] $countryListBox.Items.Add('Haiti')
[void] $countryListBox.Items.Add('Heard Island and McDonald Islands')
[void] $countryListBox.Items.Add('Holy See (the)')
[void] $countryListBox.Items.Add('Honduras')
[void] $countryListBox.Items.Add('Hong Kong')
[void] $countryListBox.Items.Add('Hungary')

# 'I' countries
[void] $countryListBox.Items.Add('Iceland')
[void] $countryListBox.Items.Add('India')
[void] $countryListBox.Items.Add('Indonesia')
[void] $countryListBox.Items.Add('Iran (Islamic Republic of)')
[void] $countryListBox.Items.Add('Iraq')
[void] $countryListBox.Items.Add('Ireland')
[void] $countryListBox.Items.Add('Isle of Man')
[void] $countryListBox.Items.Add('Israel')
[void] $countryListBox.Items.Add('Italy')

# 'J' countries
[void] $countryListBox.Items.Add('Jamaica')
[void] $countryListBox.Items.Add('Japan')
[void] $countryListBox.Items.Add('Jersey')
[void] $countryListBox.Items.Add('Jordan')

# 'K' countries
[void] $countryListBox.Items.Add('Kazakhstan')
[void] $countryListBox.Items.Add('Kenya')
[void] $countryListBox.Items.Add('Kiribati')
[void] $countryListBox.Items.Add("Korea (the Democratic People's Republic of)")
[void] $countryListBox.Items.Add('Korea (the Republic of)')
[void] $countryListBox.Items.Add('Kuwait')
[void] $countryListBox.Items.Add('Kyrgyzstan')

# 'L' countries
[void] $countryListBox.Items.Add("Lao People's Democratic Republic (the)")
[void] $countryListBox.Items.Add('Latvia')
[void] $countryListBox.Items.Add('Lebanon')
[void] $countryListBox.Items.Add("Lesotho")
[void] $countryListBox.Items.Add('Liberia')
[void] $countryListBox.Items.Add('Libya')
[void] $countryListBox.Items.Add('Liechtenstein')
[void] $countryListBox.Items.Add('Lithuania')
[void] $countryListBox.Items.Add('Luxembourg')

# 'M' countries
[void] $countryListBox.Items.Add('Macao')
[void] $countryListBox.Items.Add('Madagascar')
[void] $countryListBox.Items.Add('Malawi')
[void] $countryListBox.Items.Add('Malaysia')
[void] $countryListBox.Items.Add('Maldives')
[void] $countryListBox.Items.Add('Mali')
[void] $countryListBox.Items.Add('Malta')
[void] $countryListBox.Items.Add('Marshall Islands (the)')
[void] $countryListBox.Items.Add('Martinique')
[void] $countryListBox.Items.Add('Mauritania')
[void] $countryListBox.Items.Add('Mauritius')
[void] $countryListBox.Items.Add('Mayotte')
[void] $countryListBox.Items.Add('Mexico')
[void] $countryListBox.Items.Add('Micronesia (Federated States of)')
[void] $countryListBox.Items.Add('Moldova (the Republic of)')
[void] $countryListBox.Items.Add('Monaco')
[void] $countryListBox.Items.Add('Mongolia')
[void] $countryListBox.Items.Add('Montenegro')
[void] $countryListBox.Items.Add('Montserrat')
[void] $countryListBox.Items.Add('Morocco')
[void] $countryListBox.Items.Add('Mozambique')
[void] $countryListBox.Items.Add('Myanmar')

# 'N' countries
[void] $countryListBox.Items.Add('Namibia')
[void] $countryListBox.Items.Add('Nauru')
[void] $countryListBox.Items.Add('Nepal')
[void] $countryListBox.Items.Add('Netherlands (the)')
[void] $countryListBox.Items.Add('New Caledonia')
[void] $countryListBox.Items.Add('New Zealand')
[void] $countryListBox.Items.Add('Nicaragua')
[void] $countryListBox.Items.Add('Niger (the)')
[void] $countryListBox.Items.Add('Nigeria')
[void] $countryListBox.Items.Add('Niue')
[void] $countryListBox.Items.Add('Norfolk Island')
[void] $countryListBox.Items.Add('Northern Mariana Islands (the)')
[void] $countryListBox.Items.Add('Norway')

# 'O' countries
[void] $countryListBox.Items.Add('Oman')

# 'P' countries
[void] $countryListBox.Items.Add('Pakistan')
[void] $countryListBox.Items.Add('Palau')
[void] $countryListBox.Items.Add('Palestine, State of')
[void] $countryListBox.Items.Add('Panama')
[void] $countryListBox.Items.Add('Papua New Guinea')
[void] $countryListBox.Items.Add('Paraguay')
[void] $countryListBox.Items.Add('Peru')
[void] $countryListBox.Items.Add('Philippines (the)')
[void] $countryListBox.Items.Add('Pitcairn')
[void] $countryListBox.Items.Add('Poland')
[void] $countryListBox.Items.Add('Portugal')
[void] $countryListBox.Items.Add('Puerto Rico')

# 'Q' countries
[void] $countryListBox.Items.Add('Qatar')

# 'R' countries
[void] $countryListBox.Items.Add('Republic of North Macedonia')
[void] $countryListBox.Items.Add('Romania')
[void] $countryListBox.Items.Add('Russian Federation (the)')
[void] $countryListBox.Items.Add('Rwanda')
[void] $countryListBox.Items.Add('Réunion')

# 'S' countries
[void] $countryListBox.Items.Add('Saint Barthélemy')
[void] $countryListBox.Items.Add('Saint Helena, Ascension and Tristan da Cunha')
[void] $countryListBox.Items.Add('Saint Kitts and Nevis')
[void] $countryListBox.Items.Add('Saint Lucia')
[void] $countryListBox.Items.Add('Saint Martin (French part)')
[void] $countryListBox.Items.Add('Saint Pierre and Miquelon')
[void] $countryListBox.Items.Add('Saint Vincent and the Grenadines')
[void] $countryListBox.Items.Add('Samoa')
[void] $countryListBox.Items.Add('San Marino')
[void] $countryListBox.Items.Add('Sao Tome and Principe')
[void] $countryListBox.Items.Add('Saudi Arabia')
[void] $countryListBox.Items.Add('Senegal')
[void] $countryListBox.Items.Add('Serbia')
[void] $countryListBox.Items.Add('Seychelles')
[void] $countryListBox.Items.Add('Sierra Leone')
[void] $countryListBox.Items.Add('Singapore')
[void] $countryListBox.Items.Add('Sint Maarten (Dutch part)')
[void] $countryListBox.Items.Add('Slovakia')
[void] $countryListBox.Items.Add('Slovenia')
[void] $countryListBox.Items.Add('Solomon Islands')
[void] $countryListBox.Items.Add('Somalia')
[void] $countryListBox.Items.Add('South Africa')
[void] $countryListBox.Items.Add('South Georgia and the South Sandwich Islands')
[void] $countryListBox.Items.Add('South Sudan')
[void] $countryListBox.Items.Add('Spain')
[void] $countryListBox.Items.Add('Sri Lanka')
[void] $countryListBox.Items.Add('Sudan (the)')
[void] $countryListBox.Items.Add('Suriname')
[void] $countryListBox.Items.Add('Svalbard and Jan Mayen')
[void] $countryListBox.Items.Add('Sweden')
[void] $countryListBox.Items.Add('Switzerland')
[void] $countryListBox.Items.Add('Syrian Arab Republic')

# 'T' countries
[void] $countryListBox.Items.Add('Taiwan (Province of China)')
[void] $countryListBox.Items.Add('Tajikistan')
[void] $countryListBox.Items.Add('Tanzania, United Republic of')
[void] $countryListBox.Items.Add('Thailand')
[void] $countryListBox.Items.Add('Timor-Leste')
[void] $countryListBox.Items.Add('Togo')
[void] $countryListBox.Items.Add('Tokelau')
[void] $countryListBox.Items.Add('Tonga')
[void] $countryListBox.Items.Add('Trinidad and Tobago')
[void] $countryListBox.Items.Add('Tunisia')
[void] $countryListBox.Items.Add('Turkey')
[void] $countryListBox.Items.Add('Turkmenistan')
[void] $countryListBox.Items.Add('Turks and Caicos Islands (the)')
[void] $countryListBox.Items.Add('Tuvalu')

# 'U' countries
[void] $countryListBox.Items.Add('Uganda')
[void] $countryListBox.Items.Add('Ukraine')
[void] $countryListBox.Items.Add('United Arab Emirates (the)')
[void] $countryListBox.Items.Add('United Kingdom of Great Britain and Northern Ireland (the)')
[void] $countryListBox.Items.Add('United States Minor Outlying Islands (the)')
[void] $countryListBox.Items.Add('United States of America (the)')
[void] $countryListBox.Items.Add('Uruguay')
[void] $countryListBox.Items.Add('Uzbekistan')

# 'V' countries
[void] $countryListBox.Items.Add('Vanuatu')
[void] $countryListBox.Items.Add('Venezuela (Bolivarian Republic of)')
[void] $countryListBox.Items.Add('Viet Nam')
[void] $countryListBox.Items.Add('Virgin Islands (British)')
[void] $countryListBox.Items.Add('Virgin Islands (U.S.)')

# 'W' countries
[void] $countryListBox.Items.Add('Wallis and Futuna')
[void] $countryListBox.Items.Add('Western Sahara')

# 'Y' countries
[void] $countryListBox.Items.Add('Yemen')

# 'Z' countries
[void] $countryListBox.Items.Add('Zambia')
[void] $countryListBox.Items.Add('Zimbabwe')

# Set the default value at 'Afghanistan' (index 0)
$countryListBox.SelectedIndex = 0

# Adding 'countryListBox' to the current form
$form.Controls.Add($countryListBox)

# Adding 'countryLabel' label to indicate the 'countryListBox' textbox
$countryLabel = New-Object System.Windows.Forms.Label
$countryLabel.Location = New-Object System.Drawing.Point(200,155)
$countryLabel.Size = New-Object System.Drawing.Size(280,20)
$countryLabel.Text = "Country:"
$form.Controls.Add($countryLabel)

# Defining 'temperatureScaleListBox' to inquire wished temperature scale
$temperatureScaleListBox = New-Object System.Windows.Forms.ListBox
$temperatureScaleListBox.Location = New-Object System.Drawing.Point(350,185)
$temperatureScaleListBox.Size = New-Object System.Drawing.Size(260,50)
$temperatureScaleListBox.Width = 550
$temperatureScaleListBox.Height = 27

# Adding all temperature scale to the 'temperatureScaleListBox' listbox
[void] $temperatureScaleListBox.Items.Add('Kelvin')
[void] $temperatureScaleListBox.Items.Add('Celsius')
[void] $temperatureScaleListBox.Items.Add('Fahrenheit')

# Set the default value at 'Kelvin' (index 0)
$temperatureScaleListBox.SelectedIndex = 0

# Adding 'temperatureScaleListBox' to the current form
$form.Controls.Add($temperatureScaleListBox)

# Adding 'temperatureScaleLabel' label to indicate the 'temperatureScaleListBox' listbox
$temperatureScaleLabel = New-Object System.Windows.Forms.Label
$temperatureScaleLabel.Location = New-Object System.Drawing.Point(150,185)
$temperatureScaleLabel.Size = New-Object System.Drawing.Size(280,20)
$temperatureScaleLabel.Text = 'Temperature scale:'
$form.Controls.Add($temperatureScaleLabel)

# Defining 'dateAndTimeFormatListBox' to inquire wished date and time format
$dateAndTimeFormatListBox = New-Object System.Windows.Forms.ListBox
$dateAndTimeFormatListBox.Location = New-Object System.Drawing.Point(350,240)
$dateAndTimeFormatListBox.Size = New-Object System.Drawing.Size(260,50)
$dateAndTimeFormatListBox.Width = 550
$dateAndTimeFormatListBox.Height = 27

# Adding all date and time formats to the 'dateAndTimeFormatListBox' listbox
[void] $dateAndTimeFormatListBox.Items.Add('timestamp')
[void] $dateAndTimeFormatListBox.Items.Add('DMYHMS')
[void] $dateAndTimeFormatListBox.Items.Add('YMDHMS')
[void] $dateAndTimeFormatListBox.Items.Add('MDYHMS')

# Set the default value at 'timestamp' (index 0)
$dateAndTimeFormatListBox.SelectedIndex = 0

# Adding 'dateAndTimeFormatListBox' to the current form
$form.Controls.Add($dateAndTimeFormatListBox)

# Adding 'dateAndTimeFormatLabel' label to indicate the 'dateAndTimeFormatListBox' listbox
$dateAndTimeFormatLabel = New-Object System.Windows.Forms.Label
$dateAndTimeFormatLabel.Location = New-Object System.Drawing.Point(135,240)
$dateAndTimeFormatLabel.Size = New-Object System.Drawing.Size(280,20)
$dateAndTimeFormatLabel.Text = 'Date and time format:'
$form.Controls.Add($dateAndTimeFormatLabel)

# Adding 'weatherDisplayerBox' to display returned weather datas
$weatherDisplayerBox = New-Object System.Windows.Forms.RichTextBox
$weatherDisplayerBox.Location = New-Object System.Drawing.Size(25,350) 
$weatherDisplayerBox.Size = New-Object System.Drawing.Size(935,590)
$weatherDisplayerBox.Font = New-Object System.Drawing.Font("Consolas", 8 ,[System.Drawing.FontStyle]::Regular)
$weatherDisplayerBox.MultiLine = $True
$weatherDisplayerBox.Enabled = $False
$weatherDisplayerBox.ForeColor = "purple"
$weatherDisplayerBox.ScrollBars = "Vertical"
$weatherDisplayerBox.Text = "Welcome to your first Powershell GUI Tool - Type Domain Controller name and press one of the available buttons."
$form.Controls.Add($weatherDisplayerBox)

# Adding 'ok' button
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(700,290)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.BackColor = "green"
$okButton.ForeColor = "white"
$okButton.Text = 'OK'
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

# Handler click of the 'ok' button
$okButton.Add_Click({

    # Definition of a new object of type 'universalWeatherPowershell' with '$city' and '$apiKey' as arguments
    $a = [universalWeatherPowershell]::new($cityTextBox.Text, $countryISO31668_1Alpha_2CodeArray[$countryListBox.SelectedIndex], $apiKeyTextBox.Text)

    # if the weatherError attribute is not null (so if this attribute contains an occured error), then...
    If($a.weatherError) {

        # Displaying error message in a MessageBox
        [System.Windows.MessageBox]::Show($a.currentLanguage.getWishedMessageBoxContent(1) + $a.weatherError.stackTrace, $a.currentLanguage.getWishedMessageBoxTitle(1), "Ok", "Error") | Out-Null

    # else...
    } else {

        # If the selected temperature scale is 'Celsius' (index 1), then...
        If($temperatureScaleListBox.SelectedIndex -eq 1) {

            # Conversion of all temperatures to 'Celsius'...
            $a.temperature.setTemperatureAsCelsius()
            $a.feelingLikeTemperature.setTemperatureAsCelsius()
            $a.maxTemperature.setTemperatureAsCelsius()
            $a.minTemperature.setTemperatureAsCelsius()

        # Else if the selected temperature scale is 'Fahrenheit' (index 2), then...
        } Elseif($temperatureScaleListBox.SelectedIndex -eq 2) {

            # Conversion of all temperatures to 'Fahrenheit'...
            $a.temperature.setTemperatureAsFahrenheit()
            $a.feelingLikeTemperature.setTemperatureAsFahrenheit()
            $a.maxTemperature.setTemperatureAsFahrenheit()
            $a.minTemperature.setTemperatureAsFahrenheit()

        # Else, temperature scale remains 'Kelvin'...
        } Else {

            # Displaying warning message in a messagebox...
            [System.Windows.MessageBox]::Show($a.currentLanguage.getWishedMessageBoxContent(3), $a.currentLanguage.getWishedMessageBoxTitle(2), "Ok", "Warning") | Out-Null
        }

        # If the selected date and time format is 'DMYHMS' (index 1), then...
        If($dateAndTimeFormatListBox.SelectedIndex -eq 1) {

            $a.sunrise.setCurrentFormatAsDMYHMS()
            $a.sunset.setCurrentFormatAsDMYHMS()

        # Else if the selected date and time format is 'YMDHMS' (index 2), then...
        } Elseif($dateAndTimeFormatListBox.SelectedIndex -eq 2) {

            $a.sunrise.setCurrentFormatAsYMDHMS()
            $a.sunset.setCurrentFormatAsYMDHMS()

        # Else if the selected date and time format is 'MDYHMS' (index 3), then...
        } Elseif($dateAndTimeFormatListBox.SelectedIndex -eq 3) {

            $a.sunrise.setCurrentFormatAsMDYHMS()
            $a.sunset.setCurrentFormatAsMDYHMS()

        # Else, date and time format remains 'timestamp'...
        } Else {

            # Displaying warning message in a messagebox...
            [System.Windows.MessageBox]::Show($a.currentLanguage.getWishedMessageBoxContent(2), $a.currentLanguage.getWishedMessageBoxTitle(2), "Ok", "Warning") | Out-Null
        }

        # Displaying all weather datas in the displayerbox
        $weatherDisplayerBox.Text = $a.currentLanguage.getWishedFieldName(11) + ": " + $a.cityName + "`n"
        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(12) + ": " + $a.countryCode + " [" + $countryListBox.SelectedItem + "]" + "`n"
        $weatherDisplayerBox.Text += "`n"

        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(0) + ": (", $a.coordinates.getLatitude(), ", ", $a.coordinates.getLongitude(), ")" + "`n"
        $weatherDisplayerBox.Text += "`n"

        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(13) + ": ", $a.weatherDescription.getMainDescription() + "`n"
        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(14) + ": " + $a.weatherDescription.getPrecisedDescription() + "`n"
        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(15) + ": " + $a.weatherDescription.getWeatherURLIcon() + "`n"
        $weatherDisplayerBox.Text += "`n"

        # Continuing to display all weather datas in the displayerbox
        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(1) + ": " + $a.temperature.getTemperatureValue() + " " + $a.temperature.getTemperatureMeasurementUnitSymbol() + " (" + $a.temperature.getTemperatureMeasurementUnit() + ")" + "`n"
        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(2) + ": " + $a.feelingLikeTemperature.getTemperatureValue() + " " + $a.feelingLikeTemperature.getTemperatureMeasurementUnitSymbol() + " (" + $a.feelingLikeTemperature.getTemperatureMeasurementUnit() + ")" + "`n" 
        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(3) + ": " + $a.maxTemperature.getTemperatureValue() + " " + $a.maxTemperature.getTemperatureMeasurementUnitSymbol() + " (" + $a.maxTemperature.getTemperatureMeasurementUnit() + ")" + "`n"
        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(4) + ": " + $a.minTemperature.getTemperatureValue() + " " + $a.minTemperature.getTemperatureMeasurementUnitSymbol() + " (" + $a.minTemperature.getTemperatureMeasurementUnit() + ")" + "`n"
        $weatherDisplayerBox.Text += "`n"

        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(5) + ": " + $a.pressure.getPressureValue() + " " + $a.pressure.getPressureUnit() + "`n"
        $weatherDisplayerBox.Text += "`n"

        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(16) + ": " + $a.currentWind.getWindSpeed() + "`n"
        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(17) + ": " + $a.currentWind.getWindDeg() + "`n"
        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(18) + ": " + $a.currentWind.getWindGust() + "`n"
        $weatherDisplayerBox.Text += "`n"

        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(10) + ": " + $a.humidity + " %" + "`n"
        $weatherDisplayerBox.Text += "`n"

        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(8) + ": " + $a.uv.GetIndex() + "`n"
        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(9) + ": " + $a.uv.GetRisk() + "`n"
        $weatherDisplayerBox.Text += "`n"

        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(7) + " (" + $a.sunrise.getCurrentFormat() + "): " + $a.sunrise.getSunTimeInCurrentFormat() + "`n"
        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(6) + " (" + $a.sunset.getCurrentFormat() + "): " + $a.sunset.getSunTimeInCurrentFormat() + "`n"

        # Displaying success message in a MessageBox...
        [System.Windows.MessageBox]::Show($a.currentLanguage.getWishedMessageBoxContent(0), $a.currentLanguage.getWishedMessageBoxTitle(0), "Ok", "Info") | Out-null
    }
})

# Adding 'cancel' button
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(800,290)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.BackColor = "red"
$cancelButton.ForeColor = "white"
$cancelButton.Text = 'Cancel'
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

# Handler click of the 'cancel' button
$cancelButton.Add_Click({ 

    # Returning all widgets to default values
    $cityTextBox.Text = ""
    $apiKeyTextBox.Text = ""
    $temperatureScaleListBox.SelectedIndex = 0
    $weatherDisplayerBox.Text = ""

    # Displaying cancel message in a MessageBox...
    [System.Windows.MessageBox]::Show("Are you leaving us already? Ok, it was a pleasure meeting you.", $a.currentLanguage.getWishedMessageBoxTitle(3), "Ok", "Error") | Out-null 
    
})

# Displaying form
$form.ShowDialog() | Out-Null