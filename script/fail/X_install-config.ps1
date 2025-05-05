# install-config.ps1

$source = ".\config\Git-Bash"
$target = $env:USERPROFILE
$sourceVS = ".\config\vsCode"

cp -Recurse "$source\bin\" "$target\bin\"
cp -Recurse "$source\.githooks\" "$target\.githooks\"
cp "$source\.vimrc" "$target\"
cp "$source\.bashrc" "$target\"
cp "$source\.minttyrc" "$target\"
cp "$sourceVS\keybindings.json" "$target\AppData\Roaming\Code\User\"
cp "$sourceVS\settings.json" "$target\AppData\Roaming\Code\User\"

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
            # ��Ʈ ����
            Copy-Item $_.FullName -Destination $windowsFontDir -Force

            # Ȯ���ں��� ��Ʈ Ÿ�� ����
            $regSuffix = switch ($extName) {
                ".ttf" { "(TrueType)" }
                ".ttc" { "(TrueType Collection)" }
                ".fon" { "(Font)" }
                default { "(TrueType)" }
            }

            $regName = "$fontName $regSuffix"

            # ������Ʈ�� ���
            Set-ItemProperty -Path $fontsKey -Name $regName -Value $fontFile -Force

            Write-Host " ��ġ �Ϸ�: $fontFile"
        } catch {
            Write-Host " ��ġ �� ���� �߻�: $fontFile - $($_.Exception.Message)"
        }
    }
}

Stop-Service FontCache -Force
Start-Sleep -Seconds 2
Start-Service FontCache