# PowerShell 7 설치 스크립트 (install-powershell.ps1)

param([ref]$ResultLog)

try {
    Write-Host "🔵 Installing PowerShell 7.5.0 ..."

    $InstallerPath = "$env:TEMP\PowerShell-7.5.0-win-x64.msi"

    Invoke-WebRequest -Uri "https://github.com/PowerShell/PowerShell/releases/download/v7.5.0/PowerShell-7.5.0-win-x64.msi" -OutFile $InstallerPath

    Start-Process msiexec.exe -ArgumentList "/i", "`"$InstallerPath`"", "/quiet", "/norestart" -Wait

    $ResultLog.Value += "✅ PowerShell 7.5.0 설치 성공`n"
} catch {
    $ResultLog.Value += "❌ PowerShell 7.5.0 설치 실패: $($_.Exception.Message)`n"
}
