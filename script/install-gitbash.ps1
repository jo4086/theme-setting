# install-gitbash.ps1

param([ref]$ResultLog)

try {
    Write-Host "Installing Git (v2.49.0-64-bit)..."

    $InstallerPath = "$env:TEMP\gitbash-installer.exe"

    Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.49.0.windows.1/Git-2.49.0-64-bit.exe" -OutFile $InstallerPath
    
    Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT", "/NORESTART" -Wait

    $ResultLog.Value += "✅ Git (v2.49.0-64-bit) 설치 성공`n"
} catch {
    $ResultLog.Value += "❌ Git (v2.49.0-64-bit) 설치 실패: $($_.Exception.Message)`n"
}
