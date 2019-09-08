$ie = New-Object -ComObject InternetExplorer.Application
$ie.Visible = $true
$ie.Navigate("www.portal.azure.com")
$ie.FullScreen = $true
while($ie.busy){
Start-Sleep -Seconds 10
}
Add-Type -AssemblyName System.Drawing
$bitmap = New-Object -TypeName System.Drawing.Bitmap -ArgumentList $ie.Width, $ie.Height
$graphics = [System.Drawing.Graphics]::FromImage($bitmap)
$graphics.CopyFromScreen($ie.Left, $ie.Top, 0, 0, $bitmap.Size)
$ie.Quit()
$bitmap.Save("D:\temp\urlshots\capt.png")