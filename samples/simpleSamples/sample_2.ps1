# Importation of the UniversalWeatherPowershell module
Using module UniversalWeatherPowershell

# Import the Assemblies 'System.Windows.Forms' and 'PresentationFramework' to the current sample
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework

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
    $a = [universalWeatherPowershell]::new($cityTextBox.Text, $apiKeyTextBox.Text)

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
            [System.Windows.MessageBox]::Show("Warning: temperature scale already in Kelvin", $a.currentLanguage.getWishedMessageBoxTitle(2), "Ok", "Warning") | Out-Null
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
            [System.Windows.MessageBox]::Show("Warning: date and time format already as timestamp", $a.currentLanguage.getWishedMessageBoxTitle(2), "Ok", "Warning") | Out-Null
        }

        # Displaying all weather datas in the displayerbox
        $weatherDisplayerBox.Text = $a.currentLanguage.getWishedFieldName(11) + ": " + $a.cityName + "`n"
        $weatherDisplayerBox.Text += $a.currentLanguage.getWishedFieldName(12) + ": " + $a.countryCode + "`n"
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