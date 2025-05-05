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
Write-Host "?“¢ ê³?Git Bash ì°½ì´ ?´ë¦½?ˆë‹¤. ?´ë¦° ?„ì—??git-setup.shë¥??¤í–‰?˜ì„¸??"
Write-Host ""

Start-Process "C:\Program Files\Git\git-bash.exe"

# ê²°ê³¼ ì¶œë ¥
Write-Host ""
Write-Host "========= ?¤ì¹˜ ê²°ê³¼ ========="
Write-Host $ResultLog
Write-Host "=============================="

# ??VSCode ?¤ì¹˜ ?±ê³µ?ˆìœ¼ë©?ë°”ë¡œ ?•ì¥ ?¤ì¹˜ ì§„í–‰
if ($VscodeInstallSuccess) {
    try {
        .\script\install-vscode-extensions.ps1 -ResultLog ([ref]$ResultLog)
    } catch {}
} else {
    Write-Host "? ï¸ VSCodeê°€ ?¤ì¹˜?˜ì? ?Šì•„ ?•ì¥ ?¤ì¹˜ë¥?ê±´ë„ˆ?ë‹ˆ??"
}

reloadPath
