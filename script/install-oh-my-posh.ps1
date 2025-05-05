param([ref]$ResultLog)

function IsOhMyPoshInstalled {
    $omp = Get-Command oh-my-posh -ErrorAction SilentlyContinue
    return $omp -ne $null
}

if (IsOhMyPoshInstalled) {
    Write-Host "🟡 Oh My Posh가 이미 설치되어 있습니다. 설치를 건너뜁니다."
    $ResultLog.Value += "🔁 Oh My Posh 설치 생략 (이미 설치됨)`n"
    return
}

try {
    Write-Host "🔵 Installing Oh My Posh (v25.21.0)..."

    $InstallerPath = "$env:TEMP\oh-my-posh-install-x64.msi"
    $DownloadUrl = "https://github.com/JanDeDobbeleer/oh-my-posh/releases/download/v25.21.0/install-x64.msi"

    Invoke-WebRequest -Uri $DownloadUrl -OutFile $InstallerPath

    Start-Process msiexec.exe -ArgumentList "/i", "`"$InstallerPath`"", "/quiet", "/norestart" -Wait

    $ResultLog.Value += "✅ Oh My Posh(v25.21.0) 설치 성공`n"
    Write-Host "Oh My Posh 설치가 완료 아무 키를 입력"
} catch {
    $ResultLog.Value += "❌ Oh My Posh 설치 실패: $($_.Exception.Message)`n"
}
