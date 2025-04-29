$ResultLog = ""
$VScodeInstallSuccess = $false

try {
    .\script\install-powershell.ps1 -ResultLog ([ref]$ResultLog)
} catch {}

reloadPath

try {
    .\script\install-vscode.ps1 -ResultLog ([ref]$ResultLog)
    $VscodeInstallSuccess = $true
} catch {}

reloadPath

try {
    .\script\install-nodejs.ps1 -ResultLog ([ref]$ResultLog)
} catch {}

reloadPath

# try {
#     .\install-gitbash.ps1 -ResultLog ([ref]$ResultLog)
# } catch {}


try {
    .\script\install-config.ps1
} catch {}

reloadPath

Write-Host ""
Write-Host "📢 곧 Git Bash 창이 열립니다. 열린 후에는 git-setup.sh를 실행하세요."
Write-Host ""

Start-Process "C:\Program Files\Git\git-bash.exe"

# 결과 출력
Write-Host ""
Write-Host "========= 설치 결과 ========="
Write-Host $ResultLog
Write-Host "=============================="

# ✅ VSCode 설치 성공했으면 바로 확장 설치 진행
if ($VscodeInstallSuccess) {
    try {
        .\script\install-vscode-extensions.ps1 -ResultLog ([ref]$ResultLog)
    } catch {}
} else {
    Write-Host "⚠️ VSCode가 설치되지 않아 확장 설치를 건너뜁니다."
}

reloadPath
