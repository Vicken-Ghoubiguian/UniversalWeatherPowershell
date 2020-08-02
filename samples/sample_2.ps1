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

# Adding 'ok' button
$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(600,800)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.BackColor = "green"
$okButton.ForeColor = "white"
$okButton.Text = 'OK'
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

#
$okButton.Add_Click({ [System.Windows.MessageBox]::Show("Congradulations, you can now play with weather.", "Validated...", "Ok", "Info") | Out-null })

# Adding 'cancel' button
$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(700,800)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.BackColor = "red"
$cancelButton.ForeColor = "white"
$cancelButton.Text = 'Cancel'
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

#
$cancelButton.Add_Click({ [System.Windows.MessageBox]::Show("Congradulations, you can now play with weather.", "Canceled...", "Ok", "Error") | Out-null })

# Displaying form
$form.ShowDialog() | Out-Null