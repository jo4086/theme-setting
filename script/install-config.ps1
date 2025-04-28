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

# 폰트 폴더 경로
$fontFolder = ".\font"

# 폰트 설치 경로
$windowsFontDir = "$env:SystemRoot\Fonts\"

# 폰트 파일 확장자 종류
$fontExtensions = "*.ttf","*.ttc","*.fon"

foreach ($ext in $fontExtensions) {
    Get-ChildItem -Path $fontFolder -Filter $ext | ForEach-Object {
        $targetPath = Join-Path $windowsFontDir $_.Name

        if (!(Test-Path $targetPath)) {
            Copy-Item $_.FullName -Destination $windowsFontDir
            Write-Host "✅ 폰트 설치 완료: $($_.Name)"
        } else {
            Write-Host "⚠️ 이미 설치되어 있음: $($_.Name)"
        }
    }
}
