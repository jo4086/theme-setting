# PowerShell 7 설치 스크립트 (install-powershell.ps1)
param([ref]$ResultLog)

function IsPwshInstalled {
    $pwsh = Get-Command pwsh -ErrorAction SilentlyContinue
    return $pwsh -and $pwsh.Source -match "PowerShell"
}

if (IsPwshInstalled) {
    Write-Host "🟡 PowerShell 7.x가 이미 설치되어 있습니다. 설치를 건너뜁니다."
    $ResultLog.Value += "🔁 PowerShell 7.x 설치 생략 (이미 설치됨)`n"
    return
}

try {
    Write-Host "🔵 Installing PowerShell 7.5.0 ..."

    $InstallerPath = "$env:TEMP\PowerShell-7.5.0-win-x64.msi"

    Invoke-WebRequest -Uri "https://github.com/PowerShell/PowerShell/releases/download/v7.5.0/PowerShell-7.5.0-win-x64.msi" -OutFile $InstallerPath

    # ✅ Start-Process 제거 → &로 직접 실행하여 자동 흐름 유지
    & msiexec.exe /i "$InstallerPath" /quiet /norestart

    $ResultLog.Value += "✅ PowerShell 7.5.0 설치 성공`n"
} catch {
    $ResultLog.Value += "❌ PowerShell 7.5.0 설치 실패: $($_.Exception.Message)`n"
}

