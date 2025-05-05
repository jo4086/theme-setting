# install-nodejs.ps1

param([ref]$ResultLog)

function IsNodeInstalled {
    $node = Get-Command node -ErrorAction SilentlyContinue
    if ($node) {
        $version = node -v
        return $version -match "^v22\.14\.0"
    }
    return $false
}

if (IsNodeInstalled) {
    Write-Host "🟡 Node.js v22.14.0이 이미 설치되어 있습니다. 설치를 건너뜁니다."
    $ResultLog.Value += "🔁 Node.js v22.14.0 설치 생략 (이미 설치됨)`n"
    return
}

try {
    Write-Host "Installing nodejs(v22.14.0-x64)..."

    $InstallerPath = "$env:TEMP\nodejs-installer.msi"
    
    Invoke-WebRequest -Uri "https://nodejs.org/dist/v22.14.0/node-v22.14.0-x64.msi" -OutFile $InstallerPath

    Start-Process msiexec.exe -ArgumentList "/i", "`"$InstallerPath`"", "/quiet", "/norestart"
 
    $ResultLog.Value += "✅ nodejs(v22.14.0-x64) 설치 성공`n"
} catch {
    $ResultLog.Value += "❌ nodejs(v22.14.0-x64) 설치 실패: $($_.Exception.Message)`n"
}
