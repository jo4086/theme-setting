$BashInstallSuccess = $false

if (Get-Command git -ErrorAction SilentlyContinue) {
  Write-Host "✅ Git 설치됨"
  Write-Host "📍 경로: $((Get-Command git).Source)"
  git --version
  $BashInstallSuccess = $true
  } else {
  Write-Host "❌ Git 설치 안됨, 설치 진행하세요."
}

if (!$BashInstallSuccess) {
  try {
    Write-Host "Installing Git (v2.49.0-64-bit)..."
    $InstallerPath = "$env:TEMP\gitbash-installer.exe"

    Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.49.0.windows.1/Git-2.49.0-64-bit.exe" -OutFile $InstallerPath

    Start-Process -FilePath $InstallerPath -ArgumentList "/VERYSILENT", "/NORESTART" -Wait

    Write-Host "✅ Git-Bash (v.2.49.0-64-bit) 설치 성공..."
    $BashInstallSuccess = $true
  } catch {
    Write-Host "❌ Git (v2.49.0-64-bit) 설치 실패"
  }
}

if ($BashInstallSuccess) {
   reloadPath
   git clone https://github.com/jo4086/theme-setting.git $env:USERPROFILE\Desktop\setup-flow
   cd $env:USERPROFILE\Desktop\setup-flow
}