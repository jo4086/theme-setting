# install-vscode.ps1

param([ref]$ResultLog)

try {
    Write-Host "Installing Visual Studio Code(win32-x64-user)..."

    $InstallerPath = "$env:TEMP\vscode-installer.exe"

    Invoke-WebRequest -Uri "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -OutFile $InstallerPath

    Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT", "/NORESTART", "/MERGETASKS=desktopicon,addcontextmenufiles" -Wait

    $ResultLog.Value += "✅ Visual Studio Code(win32-x64-user) 설치 성공`n"
} catch {
    $ResultLog.Value += "❌ Visual Studio Code(win32-x64-user) 설치 실패: $($_.Exception.Message)`n"
}
