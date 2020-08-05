# Importation of the UniversalWeatherPowershell module
Using module C:\Users\ericg\Desktop\UniversalWeatherPowershell

# 
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

#
$temperatureScaleLabel = New-Object System.Windows.Forms.Label
$temperatureScaleLabel.Location = New-Object System.Drawing.Point(150,185)
$temperatureScaleLabel.Size = New-Object System.Drawing.Size(280,20)
$temperatureScaleLabel.Text = 'Temperature scale:'
$form.Controls.Add($temperatureScaleLabel)

# Adding 'weatherDisplayerBox' to display returned weather datas
$weatherDisplayerBox = New-Object System.Windows.Forms.RichTextBox
$weatherDisplayerBox.Location = New-Object System.Drawing.Size(40,300) 
$weatherDisplayerBox.Size = New-Object System.Drawing.Size(920,640)
$weatherDisplayerBox.Font = New-Object System.Drawing.Font("Consolas", 8 ,[System.Drawing.FontStyle]::Regular)
$weatherDisplayerBox.MultiLine = $True
$weatherDisplayerBox.Enabled = $False
$weatherDisplayerBox.ForeColor = "purple"
$weatherDisplayerBox.ScrollBars = "Vertical"
$weatherDisplayerBox.Text = "Welcome to your first Powershell GUI Tool - Type Domain Controller name and press one of the available buttons."
$form.Controls.Add($weatherDisplayerBox)

# Adding 'ok' button
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(600,240)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.BackColor = "green"
$okButton.ForeColor = "white"
$okButton.Text = 'OK'
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

# Handler click of the 'ok' button
$okButton.Add_Click({

    $a = [universalWeatherPowershell]::new($cityTextBox.Text, $apiKeyTextBox.Text)

    # 
    If($a.weatherError) {

        # Displaying error message in a message box
        [System.Windows.MessageBox]::Show("Sorry but an error occured when executing request: " + $a.weatherError.stackTrace, "Error occured", "Ok", "Error") | Out-Null

    } else {

        $weatherDisplayerBox.Text = "City: " + $a.cityName + "`n"
        $weatherDisplayerBox.Text += "Country code: " + $a.countryCode + "`n"
        $weatherDisplayerBox.Text += "`n"

        $weatherDisplayerBox.Text += "Geographic coordinates: (", $a.coordinates.getLatitude(), ", ", $a.coordinates.getLongitude(), ")" + "`n"
        $weatherDisplayerBox.Text += "`n"

        $weatherDisplayerBox.Text += "Main weather: ", $a.weatherDescription.getMainDescription() + "`n"
        $weatherDisplayerBox.Text += "Describe weather: " + $a.weatherDescription.getPrecisedDescription() + "`n"
        $weatherDisplayerBox.Text += "Weather icon URL: " + $a.weatherDescription.getWeatherURLIcon() + "`n"
        $weatherDisplayerBox.Text += "`n"

        $weatherDisplayerBox.Text += "Temperature: " + $a.temperature.getTemperatureValue() + " " + $a.temperature.getTemperatureMeasurementUnitSymbol() + " (" + $a.temperature.getTemperatureMeasurementUnit() + ")" + "`n"
        $weatherDisplayerBox.Text += "Feeling temperature: " + $a.feelingLikeTemperature.getTemperatureValue() + " " + $a.feelingLikeTemperature.getTemperatureMeasurementUnitSymbol() + " (" + $a.feelingLikeTemperature.getTemperatureMeasurementUnit() + ")" + "`n" 
        $weatherDisplayerBox.Text += "Maximum temperature: " + $a.maxTemperature.getTemperatureValue() + " " + $a.maxTemperature.getTemperatureMeasurementUnitSymbol() + " (" + $a.maxTemperature.getTemperatureMeasurementUnit() + ")" + "`n"
        $weatherDisplayerBox.Text += "Minimum temperature: " + $a.minTemperature.getTemperatureValue() + " " + $a.minTemperature.getTemperatureMeasurementUnitSymbol() + " (" + $a.minTemperature.getTemperatureMeasurementUnit() + ")" + "`n"
        $weatherDisplayerBox.Text += "`n"

        $weatherDisplayerBox.Text += "UV index: " + $a.uv.GetIndex() + "`n"
        $weatherDisplayerBox.Text += "UV risk: " + $a.uv.GetRisk() + "`n"
        $weatherDisplayerBox.Text += "`n"

        $weatherDisplayerBox.Text += "Sunrise time (" + $a.sunrise.getCurrentFormat() + "): " + $a.sunrise.getTimestamp() + "`n"
        $weatherDisplayerBox.Text += "Sunset time (" + $a.sunset.getCurrentFormat() + "): " + $a.sunset.getTimestamp() + "`n"

        #
        [System.Windows.MessageBox]::Show("Congradulations, you can now play with weather.", "Validated...", "Ok", "Info") | Out-null 

    }
})

# Adding 'cancel' button
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(700,240)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.BackColor = "red"
$cancelButton.ForeColor = "white"
$cancelButton.Text = 'Cancel'
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

# Handler click of the 'cancel' button
$cancelButton.Add_Click({ 

    $cityTextBox.Text = ""
    $apiKeyTextBox.Text = ""
    [System.Windows.MessageBox]::Show("Congradulations, you can now play with weather.", "Canceled...", "Ok", "Error") | Out-null 
    
})

# Displaying form
$form.ShowDialog() | Out-Null