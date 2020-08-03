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

# Adding 'ok' button
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(600,200)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.BackColor = "green"
$okButton.ForeColor = "white"
$okButton.Text = 'OK'
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

# Handler click of the 'ok' button
$okButton.Add_Click({ [System.Windows.MessageBox]::Show("Congradulations, you can now play with weather.", "Validated...", "Ok", "Info") | Out-null })

# Adding 'cancel' button
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(700,200)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.BackColor = "red"
$cancelButton.ForeColor = "white"
$cancelButton.Text = 'Cancel'
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

# Handler click of the 'cancel' button
$cancelButton.Add_Click({ [System.Windows.MessageBox]::Show("Congradulations, you can now play with weather.", "Canceled...", "Ok", "Error") | Out-null })

# Displaying form
$form.ShowDialog() | Out-Null