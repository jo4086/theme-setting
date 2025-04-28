# install-nodejs.ps1

param([ref]$ResultLog)

try {
    Write-Host "Installing nodejs(v22.14.0-x64)..."

    $InstallerPath = "$env:TEMP\nodejs-installer.msi"
    
    Invoke-WebRequest -Uri "https://nodejs.org/dist/v22.14.0/node-v22.14.0-x64.msi" -OutFile $InstallerPath

    Start-Process msiexec.exe -ArgumentList "/i", "`"$InstallerPath`"", "/quiet", "/norestart" -Wait

    $ResultLog.Value += "✅ nodejs(v22.14.0-x64) 설치 성공`n"
} catch {
    $ResultLog.Value += "❌ nodejs(v22.14.0-x64) 설치 실패: $($_.Exception.Message)`n"
}
