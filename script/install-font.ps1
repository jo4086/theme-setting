$fontFolder = ".\font"
$windowsFontDir = "$env:SystemRoot\Fonts\"
$fontExtensions = "*.ttf","*.ttc","*.fon"
$fontsKey = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"

foreach ($ext in $fontExtensions) {
    Get-ChildItem -Path $fontFolder -Filter $ext | ForEach-Object {
        $fontName = $_.BaseName
        $fontFile = $_.Name
        $extName = $_.Extension.ToLower()
        $targetPath = Join-Path $windowsFontDir $fontFile

        try {
            # 폰트 복사
            Copy-Item $_.FullName -Destination $windowsFontDir -Force

            # 확장자별로 폰트 타입 결정
            $regSuffix = switch ($extName) {
                ".ttf" { "(TrueType)" }
                ".ttc" { "(TrueType Collection)" }
                ".fon" { "(Font)" }
                default { "(TrueType)" }
            }

            $regName = "$fontName $regSuffix"

            # 레지스트리 등록
            Set-ItemProperty -Path $fontsKey -Name $regName -Value $fontFile -Force

            Write-Host "✅ 설치 완료: $fontFile"
        } catch {
            Write-Host "❌ 설치 중 오류 발생: $fontFile - $($_.Exception.Message)"
        }
    }
}

Stop-Service FontCache -Force
Start-Sleep -Seconds 2
Start-Service FontCache