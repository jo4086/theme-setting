$ResultLog = ""
$VScodeInstallSuccess = $false

try {
    Set-ExecutionPolicy Bypass -Scope Process -Force
} catch {}

try {
    .\install-powershell.ps1 -ResultLog ([ref]$ResultLog)
} catch {}

try {
    .\install-vscode.ps1 -ResultLog ([ref]$ResultLog)
    $VscodeInstallSuccess = $true # 설치 성공시 true 실패시 catch문으로 넘어감
} catch {}

try {
    .\install-nodejs.ps1 -ResultLog ([ref]$ResultLog)
} catch {}

# try {
#     .\install-gitbash.ps1 -ResultLog ([ref]$ResultLog)
# } catch {}

try {
    .\install-config.ps1
} catch {}

# ✅ VSCode 설치 성공했으면 바로 확장 설치 진행
if ($VscodeInstallSuccess) {
    try {
        Write-Host "📦 VSCode 확장 설치를 시작합니다..."
        Get-Content ./extensions-list.txt | ForEach-Object { code --install-extension $_ }
        Write-Host "✅ VSCode 확장 설치 완료"
    } catch {
        Write-Host "❌ VSCode 확장 설치 실패: $($_.Exception.Message)"
    }
} else {
    Write-Host "⚠️ VSCode가 설치되지 않아 확장 설치를 건너뜁니다."
}

Write-Host ""
Write-Host "📢 곧 Git Bash 창이 열립니다. 열린 후에는 git-setup.sh를 실행하세요."
Write-Host ""

Start-Process "C:\Program Files\Git\git-bash.exe"

# 결과 출력
Write-Host ""
Write-Host "========= 설치 결과 ========="
Write-Host $ResultLog
Write-Host "=============================="

