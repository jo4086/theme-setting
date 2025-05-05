# install-vscode-extensions.ps1

param([ref]$ResultLog)

try {
    Write-Host "Installing Visual Studio Code Extentions ..."

    Get-Content .\extensions-list.txt | ForEach-Object { code --install-extension $_ }

    $ResultLog.Value += "✅ VsCode extentions 설치 완료`n"
} catch {
    $ResultLog.Value += "❌ VsCode extentions 설치 실패: $($_.Exception.Message)`n"
}