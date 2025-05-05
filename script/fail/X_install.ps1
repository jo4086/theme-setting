$ResultLog = ""
$VScodeInstallSuccess = $false

try {
    .\script\install-pwsh.ps1 -ResultLog ([ref]$ResultLog)
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
Write-Host "?�� �?Git Bash 창이 ?�립?�다. ?�린 ?�에??git-setup.sh�??�행?�세??"
Write-Host ""

Start-Process "C:\Program Files\Git\git-bash.exe"

# 결과 출력
Write-Host ""
Write-Host "========= ?�치 결과 ========="
Write-Host $ResultLog
Write-Host "=============================="

# ??VSCode ?�치 ?�공?�으�?바로 ?�장 ?�치 진행
if ($VscodeInstallSuccess) {
    try {
        .\script\install-vscode-extensions.ps1 -ResultLog ([ref]$ResultLog)
    } catch {}
} else {
    Write-Host "?�️ VSCode가 ?�치?��? ?�아 ?�장 ?�치�?건너?�니??"
}

reloadPath
