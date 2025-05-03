    Write-Host "Installing nodejs(v22.14.0-x64)..."

    $InstallerPath = "$env:TEMP\nodejs-installer.msi"
    
    Invoke-WebRequest -Uri "https://nodejs.org/dist/v22.14.0/node-v22.14.0-x64.msi" -OutFile $InstallerPath

    Start-Process msiexec.exe -ArgumentList "/i", "`"$InstallerPath`"", "/quiet", "/norestart" -Wait
