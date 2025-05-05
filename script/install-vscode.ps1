param([ref]$ResultLog)

function IsVSCodeInstalled {
    $code = Get-Command code -ErrorAction SilentlyContinue
    return $code -ne $null
}

if (IsVSCodeInstalled) {
    Write-Host "🟡 Visual Studio Code가 이미 설치되어 있습니다. 설치를 건너뜁니다."
    $ResultLog.Value += "🔁 Visual Studio Code 설치 생략 (이미 설치됨)`n"
    return
}

try {
    Write-Host "Installing Visual Studio Code (win32-x64)..."

    $InstallerPath = "$env:TEMP\vscode-installer.exe"

    Invoke-WebRequest -Uri "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64" -OutFile $InstallerPath

    # 직접 실행해서 설치 끝나면 자동 다음 줄로 이동
    & $InstallerPath "/VERYSILENT" "/NORESTART" "/MERGETASKS=desktopicon,addcontextmenufiles"

    $ResultLog.Value += "✅ Visual Studio Code(win32-x64) 설치 성공`n"
} catch {
    $ResultLog.Value += "❌ Visual Studio Code(win32-x64) 설치 실패: $($_.Exception.Message)`n"
}
